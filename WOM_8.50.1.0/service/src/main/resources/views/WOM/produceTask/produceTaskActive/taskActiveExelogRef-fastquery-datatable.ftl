	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" exportUrl="/WOM/produceTask/produceTaskActive/taskActiveExelogRef-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" reset="false" name="WOM_produceTask_produceTaskActive_taskActiveExelogRef_condition" id="WOM_produceTask_produceTaskActive_taskActiveExelogRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489671093316')}_${getText('WOM.viewtitle.randon1495626855536')}.xls" />
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
		<div id="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_produceTask_taskActiveExelogRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_produceTask_taskActiveExelogRef" formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" dataTableId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" isExpandAll=true formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" idprefix="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name_orderProcessId_name:WOM.propertydisplayName.randon1489720649125||WOM_7.5.0.0_produceTask_ProduceTaskActive_name_name:WOM.propertydisplayName.randon1490683872072||WOM_7.5.0.0_produceTask_ProduceTaskActive_activeType_activeType:WOM.propertydisplayName.randon1489726359628" > 
							<#assign orderProcessId_name_defaultValue  = ''>
									<#assign orderProcessId_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name" showFormat="SELECTCOMP" defaultValue=orderProcessId_name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name_orderProcessId_name" isCustomize=true style="" > 
										<input type="hidden" id="orderProcessId.id" name="orderProcessId.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${orderProcessId_name_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1490685207348')}"  conditionfunc="WOM.produceTask.produceTaskActive.taskActiveExelogRef._querycustomFunc('orderProcessId_name')" name="orderProcessId.name" id="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm_orderProcessId_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTaskProcess/taskProcessRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskProcessRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" searchClick="WOM.produceTask.produceTaskActive.taskActiveExelogRef.commonQuery('query')"   />
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskActive_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskActive_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign activeType_defaultValue  = ''>
									<#assign activeType_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskActive_activeType" showFormat="SELECTCOMP" defaultValue=activeType_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskActive_activeType_activeType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${activeType_defaultValue}"   name="activeType" code="activeType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" type="adv" onclick="WOM.produceTask.produceTaskActive.taskActiveExelogRef.commonQuery('query')" onadvancedclick="advQuery('WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info={};
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["MainTableName"]="WOM_PRODUCE_TASK_ACTIVES";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["orderProcessId.name"]={};
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["orderProcessId.name"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["orderProcessId.name"].layRec="WOM_PRODUCE_TASK_PROCESSES,ID,WOM_PRODUCE_TASK_ACTIVES,ORDER_PROCESS_ID-name";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["orderProcessId.name"].columnName="NAME";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["orderProcessId.id"]={};
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["orderProcessId.id"].dbColumnType="LONG";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["orderProcessId.id"].layRec="WOM_PRODUCE_TASK_PROCESSES,ID,WOM_PRODUCE_TASK_ACTIVES,ORDER_PROCESS_ID-name";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["orderProcessId.id"].columnName="ID";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["name"]={};
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["name"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["name"].layRec="name";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["name"].columnName="NAME";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["activeType"]={};
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["activeType"].dbColumnType="SYSTEMCODE";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["activeType"].layRec="activeType";
ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_quickquery_info["activeType"].columnName="ACTIVE_TYPE";
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
 	var advRemainDialog = $('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_adv_queryForm" exportUrl="/WOM/produceTask/produceTaskActive/taskActiveExelogRef-query.action">
							<#assign orderProcessId_name_defaultValue  = ''>
									<#assign orderProcessId_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name" showFormat="SELECTCOMP" defaultValue=orderProcessId_name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name_orderProcessId_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskProcess" layRec="WOM_PRODUCE_TASK_PROCESSES,ID,WOM_PRODUCE_TASK_ACTIVES,ORDER_PROCESS_ID-name" columnname="NAME" columntype="TEXT" name="orderProcessId.name" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASK_PROCESSES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										工序名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskProcess" />
										<input type="hidden" id="adv_orderProcessId.id" name="orderProcessId.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_orderProcessId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${orderProcessId_name_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1490685207348')}"  conditionfunc="WOM.produceTask.produceTaskActive.taskActiveExelogRef._querycustomFunc('orderProcessId_name')" name="orderProcessId.name" id="adv_ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm_orderProcessId_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTaskProcess/taskProcessRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskProcessRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskActive_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskActive_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskActive" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="WOM_PRODUCE_TASK_ACTIVES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										活动名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskActive" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="adv_name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign activeType_defaultValue  = ''>
									<#assign activeType_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskActive_activeType" showFormat="SELECTCOMP" defaultValue=activeType_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskActive_activeType_activeType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskActive" layRec="activeType" columnname="ACTIVE_TYPE" columntype="SYSTEMCODE" name="activeType" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASK_ACTIVES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										活动类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskActive" />
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
			viewCode: 'WOM_7.5.0.0_produceTask_taskActiveExelogRef',
			modelCode: 'WOM_7.5.0.0_produceTask_ProduceTaskActive',
			modelName: 'ProduceTaskActive',
			formId: 'ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm',
			olddiv: 'WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_taskActiveExelogRef'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_taskActiveExelogRef'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.produceTask.produceTaskActive.taskActiveExelogRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.produceTask.produceTaskActive.taskActiveExelogRef.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTaskActive/taskActiveExelogRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.produceTaskActive.taskActiveExelogRef.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTaskActive/taskActiveExelogRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_query" renderOverEvent="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_RenderOverEvent" pageInitMethod="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_PageInitMethod" modelCode="WOM_7.5.0.0_produceTask_ProduceTaskActive" noPermissionKeys="headID.tableNo,orderProcessId.name,name,activeType,headID.factoryId.name,headID.productId.productName,headID.productId.productCode,isReplace,isMixQuality,minQuality,maxQuality,standardNum,planNum" hidekeyPrefix="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.produceTask.produceTaskActive.taskActiveExelogRef.sendBacktaskActiveExelogRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','activeType.id','headID.id','orderProcessId.id','headID.factoryId.id','headID.productId.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.produceTask.produceTaskActive.taskActiveExelogRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign headID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${headID_tableNo_displayDefaultType!}"  key="headID.tableNo"   label="${getText('WOM.zldh.tableNohdcz')}" textalign="center"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign orderProcessId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${orderProcessId_name_displayDefaultType!}"  key="orderProcessId.name"   label="${getText('WOM.propertydisplayName.randon1489720649125')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('WOM.propertydisplayName.randon1490683872072')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign activeType_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${activeType_displayDefaultType!}"  key="activeType.value"   label="${getText('WOM.propertydisplayName.randon1489726359628')}" textalign="left"  width=40   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign headID_factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${headID_factoryId_name_displayDefaultType!}"  key="headID.factoryId.name"   label="${getText('WOM.propertydisplayName.randon1495765785738')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign headID_productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${headID_productId_productName_displayDefaultType!}"  key="headID.productId.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign headID_productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${headID_productId_productCode_displayDefaultType!}"  key="headID.productId.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign isReplace_displayDefaultType  = ''>
			<@datacolumn columnName="IS_REPLACE"    showFormat="SELECT" defaultDisplay="${isReplace_displayDefaultType!}"  key="isReplace"   label="${getText('WOM.propertydisplayName.randon1489726453862')}" textalign="center"  width=40   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign isMixQuality_displayDefaultType  = ''>
			<@datacolumn columnName="IS_MIX_QUALITY"    showFormat="SELECT" defaultDisplay="${isMixQuality_displayDefaultType!}"  key="isMixQuality"   label="${getText('WOM.propertydisplayName.randon1489729935738')}" textalign="center"  width=40   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign minQuality_displayDefaultType  = ''>
			<@datacolumn columnName="MIN_QUALITY"    showFormat="TEXT" defaultDisplay="${minQuality_displayDefaultType!}"  key="minQuality"   label="${getText('WOM.propertydisplayName.randon1489729953842')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign maxQuality_displayDefaultType  = ''>
			<@datacolumn columnName="MAX_QUALITY"    showFormat="TEXT" defaultDisplay="${maxQuality_displayDefaultType!}"  key="maxQuality"   label="${getText('WOM.propertydisplayName.randon1489729974625')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign standardNum_displayDefaultType  = ''>
			<@datacolumn columnName="STANDARD_NUM"    showFormat="TEXT" defaultDisplay="${standardNum_displayDefaultType!}"  key="standardNum"   label="${getText('WOM.propertydisplayName.randon1489730105405')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign planNum_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_NUM"    showFormat="TEXT" defaultDisplay="${planNum_displayDefaultType!}"  key="planNum"   label="${getText('WOM.propertydisplayName.randon1489730174515')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTaskActive", "WOM_7.5.0.0_produceTask_taskActiveExelogRef", "LIST", "produceTaskActive")>
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
function ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_RenderOverEvent(){
}
function ec_WOM_produceTask_produceTaskActive_taskActiveExelogRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>