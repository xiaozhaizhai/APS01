	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1495089852928')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" exportUrl="/WOM/batchProduceTask/batchProduceTask/batchTaskList-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1495089898131')}_${getText('WOM.viewtitle.randon1495091382020')}.xls" />
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
		<div id="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_batchProduceTask_batchTaskList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_batchProduceTask_batchTaskList" formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" dataTableId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" isExpandAll=true formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" idprefix="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList" expandType="all"  fieldcodes="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_tableNo_tableNo:ec.common.tableNo||base_staff_name_staffID_name:WOM.propertydisplayName.randon1495090009466||WOM_7.5.0.0_batchProduceTask_BatchProduceTask_makeTime_makeTime:WOM.propertydisplayName.randon1495090040714||WOM_7.5.0.0_batchProduceTask_BatchProduceTask_taskType_taskType:WOM.propertydisplayName.randon1503904068848" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" code="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign staffID_name_defaultValue  = ''>
									<#assign staffID_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=staffID_name_defaultValue  divCode="base_staff_name_staffID_name" isCustomize=true style="" > 
										<input type="hidden" id="staffID.id" name="staffID.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${staffID_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchProduceTask.batchProduceTask.batchTaskList._querycustomFunc('staffID_name')" name="staffID.name" id="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm_staffID_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" searchClick="WOM.batchProduceTask.batchProduceTask.batchTaskList.commonQuery('query')"   />
							</@queryfield>
							<#assign makeTime_defaultValue  = ''>
									<#assign makeTime_defaultValue  = ''>
								<#if (makeTime_defaultValue)?? &&(makeTime_defaultValue)?has_content>
									<#assign makeTime_defaultValue  = getDefaultDateTime(makeTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" code="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_makeTime" showFormat="YMD_HMS" defaultValue=makeTime_defaultValue  divCode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_makeTime_makeTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="makeTime_start" id="makeTime_start" exp="gequal"   formid="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="makeTime_end" id="makeTime_end" exp="lequal"   formid="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign taskType_defaultValue  = ''>
									<#assign taskType_defaultValue  = ''>
							<@queryfield formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" code="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_taskType" showFormat="SELECTCOMP" defaultValue=taskType_defaultValue  divCode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_taskType_taskType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${taskType_defaultValue}"   name="taskType" code="womTaskType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" type="adv" onclick="WOM.batchProduceTask.batchProduceTask.batchTaskList.commonQuery('query')" onadvancedclick="advQuery('WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery')" /> 
						       							       	<@querybutton formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" type="pending" onclick="WOM.batchProduceTask.batchProduceTask.batchTaskList.commonQuery('pending')" />
						 		<@querybutton formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info={};
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["MainTableName"]="WOM_BATCH_PRODUCE_TASKS";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["tableNo"]={};
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["staffID.name"]={};
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["staffID.name"].dbColumnType="TEXT";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["staffID.name"].layRec="base_staff,ID,WOM_BATCH_PRODUCE_TASKS,STAFFID-name";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["staffID.name"].columnName="NAME";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["staffID.id"]={};
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["staffID.id"].dbColumnType="LONG";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["staffID.id"].layRec="base_staff,ID,WOM_BATCH_PRODUCE_TASKS,STAFFID-name";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["staffID.id"].columnName="ID";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["makeTime"]={};
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["makeTime"].dbColumnType="DATETIME";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["makeTime"].layRec="makeTime";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["makeTime"].columnName="MAKE_TIME";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["taskType"]={};
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["taskType"].dbColumnType="SYSTEMCODE";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["taskType"].layRec="taskType";
ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_quickquery_info["taskType"].columnName="TASK_TYPE";
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
 	var advRemainDialog = $('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_adv_queryForm" exportUrl="/WOM/batchProduceTask/batchProduceTask/batchTaskList-pending.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_adv_queryForm" code="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_tableNo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask" layRec="tableNo" columnname="TABLE_NO" columntype="TEXT" name="tableNo" fieldType="TEXTFIELD" tableName="WOM_BATCH_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="adv_tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign staffID_name_defaultValue  = ''>
									<#assign staffID_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=staffID_name_defaultValue  divCode="base_staff_name_staffID_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="base_staff,ID,WOM_BATCH_PRODUCE_TASKS,STAFFID-name" columnname="NAME" columntype="TEXT" name="staffID.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										制单人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_staffID.id" name="staffID.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_staffID.id"  isPrecise=true deValue="${staffID_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchProduceTask.batchProduceTask.batchTaskList._querycustomFunc('staffID_name')" name="staffID.name" id="adv_ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm_staffID_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign makeTime_defaultValue  = ''>
									<#assign makeTime_defaultValue  = ''>
								<#if (makeTime_defaultValue)?? &&(makeTime_defaultValue)?has_content>
									<#assign makeTime_defaultValue  = getDefaultDateTime(makeTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_adv_queryForm" code="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_makeTime" showFormat="YMD_HMS" defaultValue=makeTime_defaultValue  divCode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_makeTime_makeTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask" layRec="makeTime" columnname="MAKE_TIME" columntype="DATETIME" name="makeTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="WOM_BATCH_PRODUCE_TASKS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										制单时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${makeTime_defaultValue!}" deValue="${makeTime_defaultValue!}"  name="makeTime_start" id="adv_makeTime_start" exp="gequal"    formid="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${makeTime_defaultValue!}" deValue="${makeTime_defaultValue!}"  name="makeTime_end" id="adv_makeTime_end" exp="lequal"    formid="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign taskType_defaultValue  = ''>
									<#assign taskType_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_adv_queryForm" code="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_taskType" showFormat="SELECTCOMP" defaultValue=taskType_defaultValue  divCode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask_taskType_taskType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask" layRec="taskType" columnname="TASK_TYPE" columntype="SYSTEMCODE" name="taskType" fieldType="SELECTCOMP" tableName="WOM_BATCH_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										指令单类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${taskType_defaultValue}"   name="taskType" code="womTaskType" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_batchProduceTask_batchTaskList',
			modelCode: 'WOM_7.5.0.0_batchProduceTask_BatchProduceTask',
			modelName: 'BatchProduceTask',
			formId: 'ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm',
			olddiv: 'WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchProduceTask_batchTaskList'+"&entity.code="+'WOM_7.5.0.0_batchProduceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_batchProduceTask_batchTaskList'+"&entity.code="+'WOM_7.5.0.0_batchProduceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery'] #customquContent").html(html);
			 $("[id='WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.batchProduceTask.batchProduceTask.batchTaskList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.batchProduceTask.batchProduceTask.batchTaskList.query('goList')">
<#assign datatable_dataUrl = "/WOM/batchProduceTask/batchProduceTask/batchTaskList-pending.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.batchProduceTask.batchProduceTask.batchTaskList.query('query')">
<#assign datatable_dataUrl = "/WOM/batchProduceTask/batchProduceTask/batchTaskList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_query" renderOverEvent="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_RenderOverEvent" pageInitMethod="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_PageInitMethod" modelCode="WOM_7.5.0.0_batchProduceTask_BatchProduceTask" noPermissionKeys="tableNo,staffID.name,makeTime,taskType,remark" hidekeyPrefix="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.batchProduceTask.batchProduceTask.batchTaskList.rowDblClick" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','pending.id','pending.deploymentId','pending.activityName','pending.bulkDealFlag','pending.processDescription','pending.processKey','pending.processVersion','pending.activityType','pending.processId','pending.openUrl','pending.userId','tableInfoId','status','taskType.id','staffID.id']" postData="&pending-beginDate=${pendingBeginDate!''}&pending-endDate=${pendingEndDate!''}&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.batchProduceTask.batchProduceTask.batchTaskList.showErrorMsg"   >
		<#if isContainsWorkflow('WOM_7.5.0.0_batchProduceTask_batchTaskList')==true>
			<@operatebar operateType="FLOW" menuCode="${workFlowMenuCode!}" entityCode="WOM_7.5.0.0_batchProduceTask" businessParam="${businessParam!}" resultType="JSON" >
			</@operatebar>
		</#if>
		<#if flowBulkFlag?? && flowBulkFlag==true>
			<@operatebar operateType="noPower" menuCode="approval" operates="
			code:${buttonPerfix!}WOM_7.5.0.0_batchProduceTask_approval||name:${getText('ec.list.batchApproval')}||iconcls:modify||useInMore:false||onclick:
				WOM.batchProduceTask.batchProduceTask.batchTaskList.approval()
    			"  resultType="json"></@operatebar>
    	</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=230   type="textfield"  click="function(cell){WOM.batchProduceTask.batchProduceTask.batchTaskList.rowDblClick(null,cell);}"   showFormatFunc="" cssstyle="" />
			<#assign staffID_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${staffID_name_displayDefaultType!}"  key="staffID.name"   label="${getText('WOM.propertydisplayName.randon1495090009466')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign makeTime_displayDefaultType  = ''>
			<@datacolumn columnName="MAKE_TIME"    showFormat="YMD_HMS" defaultDisplay="${makeTime_displayDefaultType!}"  key="makeTime"   label="${getText('WOM.propertydisplayName.randon1495090040714')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign taskType_displayDefaultType  = ''>
			<@datacolumn columnName="TASK_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${taskType_displayDefaultType!}"  key="taskType.value"   label="${getText('WOM.propertydisplayName.randon1503904068848')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchProduceTask_BatchProduceTask", "WOM_7.5.0.0_batchProduceTask_batchTaskList", "LIST", "batchProduceTask")>
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
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1495090125387')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
		<@datacolumn key="pending.taskDescription" sortable=false label="${getText('ec.list.taskDescription')}"  width=120/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_RenderOverEvent(){
$("#ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm_allContainer select option[value='womTaskType/type3']").remove();
$("#ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm_allContainer select option[value='womTaskType/type4']").remove();
$("#ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm_allContainer select option[value='womTaskType/type5']").remove();
$("#ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm_allContainer select option[value='womTaskType/type6']").remove();
$("#ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_queryForm_allContainer select option[value='womTaskType/type7']").remove();
}
function ec_WOM_batchProduceTask_batchProduceTask_batchTaskList_PageInitMethod(){
}
	
	
	
	
	
	
</script>