	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" exportUrl="/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action">
		<input type="hidden" reset="false" name="WOM_produceTask_taskBeforeProcess_beforeProcess_condition" id="WOM_produceTask_taskBeforeProcess_beforeProcess_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489733511072')}_${getText('WOM.viewtitle.randon1489735212863')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_produceTask_beforeProcess')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_produceTask_beforeProcess" formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" dataTableId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" isExpandAll=true formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" idprefix="ec_WOM_produceTask_taskBeforeProcess_beforeProcess" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name_processId_name:WOM.propertydisplayName.randon1489720649125" > 
							<#assign processId_name_defaultValue  = ''>
									<#assign processId_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name" showFormat="SELECTCOMP" defaultValue=processId_name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskProcess_name_processId_name" isCustomize=true > 
										<input type="hidden" id="processId.id" name="processId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="processId.name" id="processId.name" value="${processId_name_defaultValue!}" deValue="${processId_name_defaultValue!}"   exp="like"/>
												</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" type="search" onclick="WOM.produceTask.taskBeforeProcess.beforeProcess.commonQuery('query')" /> 
						 		<@querybutton formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info={};
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["MainTableName"]="WOM_TASK_BEFORE_PROCESSES";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.name"]={};
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.name"].dbColumnType="TEXT";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.name"].layRec="WOM_PRODUCE_TASK_PROCESSES,ID,WOM_TASK_BEFORE_PROCESSES,PROCESS_ID-name";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.name"].columnName="NAME";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.id"]={};
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.id"].dbColumnType="LONG";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.id"].layRec="WOM_PRODUCE_TASK_PROCESSES,ID,WOM_TASK_BEFORE_PROCESSES,PROCESS_ID-name";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.id"].columnName="ID";
generateChainCond=function(cond,layarr,field){
	if(layarr.length>1){
		var subconds=cond.subconds;
		for(var i=0;i<subconds.length;i++){
			if(subconds[i].type=="2"&&subconds[i].joinInfo==layarr[0]){
				generateChainCond(subconds[i],layarr.splice(1),field);
				return;
			}
		}
		var chain={};
		chain.type="2";
		chain.joinInfo=layarr[0];
		chain.subconds=[];
		cond.subconds.push(chain);
		generateChainCond(chain,layarr.splice(1),field);
	}else{
		cond.subconds.push(field)
	}
}
</script>
<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
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
<#assign datatable_firstLoad = true>
<#if view?? && view.type?? && view.type != "REFERENCE">
<#assign datatable_queryFunc = "WOM.produceTask.taskBeforeProcess.beforeProcess.query('query')">
</#if>
<#assign datatable_dataUrl = "/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.taskBeforeProcess.beforeProcess.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query" renderOverEvent="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_RenderOverEvent" pageInitMethod="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_PageInitMethod" modelCode="WOM_7.5.0.0_produceTask_TaskBeforeProcess" noPermissionKeys="processId.name,processId.longTime,processId.remark" hidekeyPrefix="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.produceTask.taskBeforeProcess.beforeProcess.sendBackbeforeProcess" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','processId.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.produceTask.taskBeforeProcess.beforeProcess.showErrorMsg">
					<#if flowBulkFlag?? && flowBulkFlag==true>
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign processId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${processId_name_displayDefaultType!}"  key="processId.name"   label="${getText('WOM.propertydisplayName.randon1489720649125')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign processId_longTime_displayDefaultType  = ''>
			<@datacolumn columnName="LONG_TIME"    showFormat="TEXT" defaultDisplay="${processId_longTime_displayDefaultType!}"  key="processId.longTime"   label="${getText('WOM.propertydisplayName.randon1489720689233')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc=""/>
			<#assign processId_remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${processId_remark_displayDefaultType!}"  key="processId.remark"   label="${getText('WOM.propertydisplayName.randon1489720730887')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_produceTask_taskBeforeProcess_beforeProcess_RenderOverEvent(){
}
function ec_WOM_produceTask_taskBeforeProcess_beforeProcess_PageInitMethod(){
}
	
	
	
</script>