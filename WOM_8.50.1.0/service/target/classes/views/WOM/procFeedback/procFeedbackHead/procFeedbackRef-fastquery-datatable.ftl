	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1540952358311')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" exportUrl="/WOM/procFeedback/procFeedbackHead/procFeedbackRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="WOM_procFeedback_procFeedbackHead_procFeedbackRef_condition" id="WOM_procFeedback_procFeedbackHead_procFeedbackRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1540952404135')}_${getText('WOM.viewtitle.randon1541036230940')}.xls" />
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
		<div id="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_procFeedback_procFeedbackRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_procFeedback_procFeedbackRef" formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" dataTableId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" isExpandAll=true formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" idprefix="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_taskId_productBatchNum:WOM.propertydisplayName.randon1489668325364||WOM_7.5.0.0_produceTask_ProduceTaskActive_name_processActive_name:WOM.propertydisplayName.randon1490683872072" > 
							<#assign taskId_productBatchNum_defaultValue  = ''>
									<#assign taskId_productBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="SELECTCOMP" defaultValue=taskId_productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_taskId_productBatchNum" isCustomize=true style="" > 
										<input type="hidden" id="taskId.id" name="taskId.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${taskId_productBatchNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1490145723075')}"  conditionfunc="WOM.procFeedback.procFeedbackHead.procFeedbackRef._querycustomFunc('taskId_productBatchNum')" name="taskId.productBatchNum" id="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm_taskId_productBatchNum" displayFieldName="productBatchNum" type="other" exp="equal" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/maketaskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_maketaskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" searchClick="WOM.procFeedback.procFeedbackHead.procFeedbackRef.commonQuery('query')"   />
							</@queryfield>
							<#assign processActive_name_defaultValue  = ''>
									<#assign processActive_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskActive_name" showFormat="SELECTCOMP" defaultValue=processActive_name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskActive_name_processActive_name" isCustomize=true style="" > 
										<input type="hidden" id="processActive.id" name="processActive.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${processActive_name_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1495626855536')}"  conditionfunc="WOM.procFeedback.procFeedbackHead.procFeedbackRef._querycustomFunc('processActive_name')" name="processActive.name" id="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm_processActive_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTaskActive/taskActiveExelogRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskActiveExelogRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" searchClick="WOM.procFeedback.procFeedbackHead.procFeedbackRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" type="adv" onclick="WOM.procFeedback.procFeedbackHead.procFeedbackRef.commonQuery('query')" onadvancedclick="advQuery('WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info={};
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["MainTableName"]="WOM_PROC_FEEDBACK_HEADS";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["taskId.productBatchNum"]={};
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["taskId.productBatchNum"].dbColumnType="BAPCODE";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["taskId.productBatchNum"].layRec="WOM_PRODUCE_TASKS,ID,WOM_PROC_FEEDBACK_HEADS,TASK_ID-productBatchNum";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["taskId.productBatchNum"].columnName="PRODUCT_BATCH_NUM";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["taskId.id"]={};
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["taskId.id"].dbColumnType="LONG";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["taskId.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_PROC_FEEDBACK_HEADS,TASK_ID-productBatchNum";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["taskId.id"].columnName="ID";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["processActive.name"]={};
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["processActive.name"].dbColumnType="TEXT";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["processActive.name"].layRec="WOM_PRODUCE_TASK_ACTIVES,ID,WOM_PROC_FEEDBACK_HEADS,PROCESS_ACTIVE-name";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["processActive.name"].columnName="NAME";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["processActive.id"]={};
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["processActive.id"].dbColumnType="LONG";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["processActive.id"].layRec="WOM_PRODUCE_TASK_ACTIVES,ID,WOM_PROC_FEEDBACK_HEADS,PROCESS_ACTIVE-name";
ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_quickquery_info["processActive.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_adv_queryForm" exportUrl="/WOM/procFeedback/procFeedbackHead/procFeedbackRef-query.action">
							<#assign taskId_productBatchNum_defaultValue  = ''>
									<#assign taskId_productBatchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="SELECTCOMP" defaultValue=taskId_productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_taskId_productBatchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="WOM_PRODUCE_TASKS,ID,WOM_PROC_FEEDBACK_HEADS,TASK_ID-productBatchNum" columnname="PRODUCT_BATCH_NUM" columntype="BAPCODE" name="taskId.productBatchNum" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
										<input type="hidden" id="adv_taskId.id" name="taskId.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_taskId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${taskId_productBatchNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1490145723075')}"  conditionfunc="WOM.procFeedback.procFeedbackHead.procFeedbackRef._querycustomFunc('taskId_productBatchNum')" name="taskId.productBatchNum" id="adv_ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm_taskId_productBatchNum" displayFieldName="productBatchNum" type="other" exp="equal"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/maketaskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_maketaskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign processActive_name_defaultValue  = ''>
									<#assign processActive_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskActive_name" showFormat="SELECTCOMP" defaultValue=processActive_name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskActive_name_processActive_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskActive" layRec="WOM_PRODUCE_TASK_ACTIVES,ID,WOM_PROC_FEEDBACK_HEADS,PROCESS_ACTIVE-name" columnname="NAME" columntype="TEXT" name="processActive.name" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASK_ACTIVES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										活动名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskActive" />
										<input type="hidden" id="adv_processActive.id" name="processActive.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_processActive.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${processActive_name_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1495626855536')}"  conditionfunc="WOM.procFeedback.procFeedbackHead.procFeedbackRef._querycustomFunc('processActive_name')" name="processActive.name" id="adv_ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm_processActive_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTaskActive/taskActiveExelogRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskActiveExelogRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_procFeedback_procFeedbackRef',
			modelCode: 'WOM_7.5.0.0_procFeedback_ProcFeedbackHead',
			modelName: 'ProcFeedbackHead',
			formId: 'ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm',
			olddiv: 'WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_procFeedback_procFeedbackRef'+"&entity.code="+'WOM_7.5.0.0_procFeedback';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_procFeedback_procFeedbackRef'+"&entity.code="+'WOM_7.5.0.0_procFeedback';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.procFeedback.procFeedbackHead.procFeedbackRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.procFeedback.procFeedbackHead.procFeedbackRef.query('query')">
<#assign datatable_dataUrl = "/WOM/procFeedback/procFeedbackHead/procFeedbackRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_query" renderOverEvent="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_RenderOverEvent" pageInitMethod="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_PageInitMethod" modelCode="WOM_7.5.0.0_procFeedback_ProcFeedbackHead" noPermissionKeys="taskId.productBatchNum,processActive.processId.name,processActive.name,processActive.startTime,processActive.endTime" hidekeyPrefix="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.procFeedback.procFeedbackHead.procFeedbackRef.sendBackprocFeedbackRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','taskId.id','processActive.processId.id','processActive.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.procFeedback.procFeedbackHead.procFeedbackRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign taskId_productBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${taskId_productBatchNum_displayDefaultType!}"  key="taskId.productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign processActive_processId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${processActive_processId_name_displayDefaultType!}"  key="processActive.processId.name"   label="${getText('RM.propertydisplayName.randon1487295011793')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign processActive_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${processActive_name_displayDefaultType!}"  key="processActive.name"   label="${getText('WOM.propertydisplayName.randon1490683872072')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign processActive_startTime_displayDefaultType  = ''>
			<@datacolumn columnName="START_TIME"    showFormat="YMD_HMS" defaultDisplay="${processActive_startTime_displayDefaultType!}"  key="processActive.startTime"   label="${getText('WOM.propertydisplayName.randon1540953385761')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign processActive_endTime_displayDefaultType  = ''>
			<@datacolumn columnName="END_TIME"    showFormat="YMD_HMS" defaultDisplay="${processActive_endTime_displayDefaultType!}"  key="processActive.endTime"   label="${getText('WOM.propertydisplayName.randon1540953443908')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_RenderOverEvent(){
}
function ec_WOM_procFeedback_procFeedbackHead_procFeedbackRef_PageInitMethod(){
}
	
	
	
	
	
</script>