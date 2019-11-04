	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1495533983333')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_activeExelog_activeExelog_activeExelogList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" exportUrl="/WOM/activeExelog/activeExelog/activeExelogList-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1495537253157')}_${getText('WOM.viewtitle.randon1495608200525')}.xls" />
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
		<div id="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_activeExelog_activeExelogList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_activeExelog_activeExelogList" formId="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" dataTableId="ec_WOM_activeExelog_activeExelog_activeExelogList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" isExpandAll=true formId="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" idprefix="ec_WOM_activeExelog_activeExelog_activeExelogList" expandType="all"  fieldcodes="WOM_7.5.0.0_activeExelog_ActiveExelog_tableNo_tableNo:ec.common.tableNo||WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.sczl.common.tableNo" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" code="WOM_7.5.0.0_activeExelog_ActiveExelog_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_activeExelog_ActiveExelog_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.activeExelog.activeExelog.activeExelogList._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" searchClick="WOM.activeExelog.activeExelog.activeExelogList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" type="adv" onclick="WOM.activeExelog.activeExelog.activeExelogList.commonQuery('query')" onadvancedclick="advQuery('WOM.activeExelog.activeExelog.activeExelogList.advquery')" /> 
						       							       	<@querybutton formId="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" type="pending" onclick="WOM.activeExelog.activeExelog.activeExelogList.commonQuery('pending')" />
						 		<@querybutton formId="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info={};
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["MainTableName"]="WOM_ACTIVE_EXELOGS";
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["tableNo"]={};
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["taskID.tableNo"]={};
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_ACTIVE_EXELOGS,TASKID-tableNo";
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["taskID.id"]={};
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_ACTIVE_EXELOGS,TASKID-tableNo";
ec_WOM_activeExelog_activeExelog_activeExelogList_quickquery_info["taskID.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.activeExelog.activeExelog.activeExelogList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_activeExelog_activeExelog_activeExelogList_adv_queryForm" exportUrl="/WOM/activeExelog/activeExelog/activeExelogList-pending.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_activeExelog_activeExelog_activeExelogList_adv_queryForm" code="WOM_7.5.0.0_activeExelog_ActiveExelog_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_activeExelog_ActiveExelog_tableNo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_activeExelog_ActiveExelog" layRec="tableNo" columnname="TABLE_NO" columntype="TEXT" name="tableNo" fieldType="TEXTFIELD" tableName="WOM_ACTIVE_EXELOGS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_activeExelog_ActiveExelog" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="adv_tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like" />
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
			viewCode: 'WOM_7.5.0.0_activeExelog_activeExelogList',
			modelCode: 'WOM_7.5.0.0_activeExelog_ActiveExelog',
			modelName: 'ActiveExelog',
			formId: 'ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm',
			olddiv: 'WOM.activeExelog.activeExelog.activeExelogList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.activeExelog.activeExelog.activeExelogList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_activeExelog_activeExelogList'+"&entity.code="+'WOM_7.5.0.0_activeExelog';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.activeExelog.activeExelog.activeExelogList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.activeExelog.activeExelog.activeExelogList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.activeExelog.activeExelog.activeExelogList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_activeExelog_activeExelogList'+"&entity.code="+'WOM_7.5.0.0_activeExelog';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.activeExelog.activeExelog.activeExelogList.advquery'] #customquContent").html(html);
			 $("[id='WOM.activeExelog.activeExelog.activeExelogList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.activeExelog.activeExelog.activeExelogList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.activeExelog.activeExelog.activeExelogList.query('goList')">
<#assign datatable_dataUrl = "/WOM/activeExelog/activeExelog/activeExelogList-pending.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.activeExelog.activeExelog.activeExelogList.query('query')">
<#assign datatable_dataUrl = "/WOM/activeExelog/activeExelog/activeExelogList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_activeExelog_activeExelog_activeExelogList_query" renderOverEvent="ec_WOM_activeExelog_activeExelog_activeExelogList_RenderOverEvent" pageInitMethod="ec_WOM_activeExelog_activeExelog_activeExelogList_PageInitMethod" modelCode="WOM_7.5.0.0_activeExelog_ActiveExelog" noPermissionKeys="tableNo,taskID.tableNo,taskID.productId.productName,taskID.productId.productCode,taskID.productBatchNum,taskProcessID.name,taskProcessID.formulaId.code,taskProcessID.formulaId.name,factoryId.name,taskID.factoryId.name,taskActiveID.name,startTime,endTime,staffID.name,exeState,remark" hidekeyPrefix="ec_WOM_activeExelog_activeExelog_activeExelogList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_activeExelog_activeExelog_activeExelogList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.activeExelog.activeExelog.activeExelogList.rowDblClick" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','pending.id','pending.deploymentId','pending.activityName','pending.bulkDealFlag','pending.processDescription','pending.processKey','pending.processVersion','pending.activityType','pending.processId','pending.openUrl','pending.userId','tableInfoId','status','exeState.id','taskID.id','taskID.productId.id','taskProcessID.id','taskProcessID.formulaId.id','factoryId.id','taskID.factoryId.id','taskActiveID.id','staffID.id']" postData="&pending-beginDate=${pendingBeginDate!''}&pending-endDate=${pendingEndDate!''}&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.activeExelog.activeExelog.activeExelogList.showErrorMsg"   >
		<#if isContainsWorkflow('WOM_7.5.0.0_activeExelog_activeExelogList')==true>
			<@operatebar operateType="FLOW" menuCode="${workFlowMenuCode!}" entityCode="WOM_7.5.0.0_activeExelog" businessParam="${businessParam!}" resultType="JSON" >
			</@operatebar>
		</#if>
		<#if flowBulkFlag?? && flowBulkFlag==true>
			<@operatebar operateType="noPower" menuCode="approval" operates="
			code:${buttonPerfix!}WOM_7.5.0.0_activeExelog_approval||name:${getText('ec.list.batchApproval')}||iconcls:modify||useInMore:false||onclick:
				WOM.activeExelog.activeExelog.activeExelogList.approval()
    			"  resultType="json"></@operatebar>
    	</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}activeExelogList_executeRecord_none_WOM_7.5.0.0_activeExelog_activeExelogList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1495783219595')}||iconcls:none||useInMore:false||onclick:
					start()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="WOM_7.5.0.0_activeExelog_activeExelogList_BUTTON_executeRecord"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}activeExelogList_executeRecord_none_WOM_7.5.0.0_activeExelog_activeExelogList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1495783219595')}||iconcls:none||useInMore:false||onclick:
					start()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=200   type="textfield"  click="function(cell){WOM.activeExelog.activeExelog.activeExelogList.rowDblClick(null,cell);}"   showFormatFunc="" cssstyle="" />
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.sczl.common.tableNo')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskID_productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${taskID_productId_productName_displayDefaultType!}"  key="taskID.productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737333344')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskID_productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${taskID_productId_productCode_displayDefaultType!}"  key="taskID.productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448334334')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskID_productBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${taskID_productBatchNum_displayDefaultType!}"  key="taskID.productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskProcessID_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${taskProcessID_name_displayDefaultType!}"  key="taskProcessID.name"   label="${getText('WOM.propertydisplayName.randon1489720649125')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskProcessID_formulaId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${taskProcessID_formulaId_code_displayDefaultType!}"  key="taskProcessID.formulaId.code"   label="${getText('WOM.propertydisplayName.randon1488246312092')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskProcessID_formulaId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${taskProcessID_formulaId_name_displayDefaultType!}"  key="taskProcessID.formulaId.name"   label="${getText('WOM.propertydisplayName.randon1487075823790')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('WOM.propertydisplayName.randon1495765785738')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskID_factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${taskID_factoryId_name_displayDefaultType!}"  key="taskID.factoryId.name"   label="${getText('WOM.propertydisplayName.radion1419232393782efe')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskActiveID_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${taskActiveID_name_displayDefaultType!}"  key="taskActiveID.name"   label="${getText('WOM.propertydisplayName.randon1490683872072')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn columnName="START_TIME"    showFormat="YMD_HMS" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"   label="${getText('WOM.propertydisplayName.randon1495537900705')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn columnName="END_TIME"    showFormat="YMD_HMS" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"   label="${getText('WOM.propertydisplayName.randon1495537941473')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign staffID_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${staffID_name_displayDefaultType!}"  key="staffID.name"   label="${getText('WOM.propertydisplayName.randon1495778802161')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign exeState_displayDefaultType  = ''>
			<@datacolumn columnName="EXE_STATE"    showFormat="SELECTCOMP" defaultDisplay="${exeState_displayDefaultType!}"  key="exeState.value"   label="${getText('WOM.propertydisplayName.randon1495538316491')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1495538348499')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
		<@datacolumn key="pending.taskDescription" sortable=false label="${getText('ec.list.taskDescription')}"  width=120/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_activeExelog_activeExelog_activeExelogList_RenderOverEvent(){
}
function ec_WOM_activeExelog_activeExelog_activeExelogList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>