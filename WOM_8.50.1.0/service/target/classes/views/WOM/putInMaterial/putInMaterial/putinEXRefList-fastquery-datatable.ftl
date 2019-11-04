	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490604762072')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" exportUrl="/WOM/putInMaterial/putInMaterial/putinEXRefList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="WOM_putInMaterial_putInMaterial_putinEXRefList_condition" id="WOM_putInMaterial_putInMaterial_putinEXRefList_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490604832447')}_${getText('WOM.viewtitle.randon1499688003143')}.xls" />
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
		<div id="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_putInMaterial_putinEXRefList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_putInMaterial_putinEXRefList" formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" dataTableId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" isExpandAll=true formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" idprefix="ec_WOM_putInMaterial_putInMaterial_putinEXRefList" expandType="all"  fieldcodes="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo_tableNo:ec.common.tableNo||WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.modelname.randon1489657901718||base_staff_name_putinStaff_name:WOM.staff.dimissionStaff_xls.staffName43566" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.putInMaterial.putInMaterial.putinEXRefList._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" searchClick="WOM.putInMaterial.putInMaterial.putinEXRefList.commonQuery('query')"   />
							</@queryfield>
							<#assign putinStaff_name_defaultValue  = ''>
									<#assign putinStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=putinStaff_name_defaultValue  divCode="base_staff_name_putinStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="putinStaff.id" name="putinStaff.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${putinStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.putInMaterial.putInMaterial.putinEXRefList._querycustomFunc('putinStaff_name')" name="putinStaff.name" id="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm_putinStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" searchClick="WOM.putInMaterial.putInMaterial.putinEXRefList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" type="adv" onclick="WOM.putInMaterial.putInMaterial.putinEXRefList.commonQuery('query')" onadvancedclick="advQuery('WOM.putInMaterial.putInMaterial.putinEXRefList.advquery')" /> 
						 		<@querybutton formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info={};
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["MainTableName"]="WOM_PUT_IN_MATERIALS";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["tableNo"]={};
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["taskID.tableNo"]={};
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-tableNo";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["taskID.id"]={};
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-tableNo";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["putinStaff.name"]={};
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["putinStaff.name"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["putinStaff.name"].layRec="base_staff,ID,WOM_PUT_IN_MATERIALS,PUTIN_STAFF-name";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["putinStaff.name"].columnName="NAME";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["putinStaff.id"]={};
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["putinStaff.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["putinStaff.id"].layRec="base_staff,ID,WOM_PUT_IN_MATERIALS,PUTIN_STAFF-name";
ec_WOM_putInMaterial_putInMaterial_putinEXRefList_quickquery_info["putinStaff.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_adv_queryForm" exportUrl="/WOM/putInMaterial/putInMaterial/putinEXRefList-query.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_adv_queryForm" code="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_putInMaterial_PutInMaterial_tableNo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_putInMaterial_PutInMaterial" layRec="tableNo" columnname="TABLE_NO" columntype="TEXT" name="tableNo" fieldType="TEXTFIELD" tableName="WOM_PUT_IN_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_putInMaterial_PutInMaterial" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="adv_tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="taskID.tableNo" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产指令单
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
										<input type="hidden" id="adv_taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_taskID.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.putInMaterial.putInMaterial.putinEXRefList._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="adv_ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_putInMaterial_putinEXRefList',
			modelCode: 'WOM_7.5.0.0_putInMaterial_PutInMaterial',
			modelName: 'PutInMaterial',
			formId: 'ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm',
			olddiv: 'WOM.putInMaterial.putInMaterial.putinEXRefList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.putInMaterial.putInMaterial.putinEXRefList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_putInMaterial_putinEXRefList'+"&entity.code="+'WOM_7.5.0.0_putInMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.putInMaterial.putInMaterial.putinEXRefList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.putInMaterial.putInMaterial.putinEXRefList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.putInMaterial.putInMaterial.putinEXRefList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_putInMaterial_putinEXRefList'+"&entity.code="+'WOM_7.5.0.0_putInMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.putInMaterial.putInMaterial.putinEXRefList.advquery'] #customquContent").html(html);
			 $("[id='WOM.putInMaterial.putInMaterial.putinEXRefList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.putInMaterial.putInMaterial.putinEXRefList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterial.putinEXRefList.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterial/putinEXRefList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterial.putinEXRefList.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterial/putinEXRefList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_query" renderOverEvent="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_RenderOverEvent" pageInitMethod="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_PageInitMethod" modelCode="WOM_7.5.0.0_putInMaterial_PutInMaterial" noPermissionKeys="tableNo,taskID.tableNo,taskID.productId.productCode,taskID.productId.productName,taskID.productBatchNum,putinStaff.name,remark" hidekeyPrefix="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_putInMaterial_putInMaterial_putinEXRefList_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.putInMaterial.putInMaterial.putinEXRefList.sendBackputinEXRefList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','taskID.id','taskID.productId.id','putinStaff.id','tableNo','tableNo','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.putInMaterial.putInMaterial.putinEXRefList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=190   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.menuInfoname.randon1489670907556')}" textalign="center"  width=190   type="textfield"    click="function(cell){WOM.putInMaterial.putInMaterial.putinEXRefList.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign taskID_productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${taskID_productId_productCode_displayDefaultType!}"  key="taskID.productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448334334')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskID_productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${taskID_productId_productName_displayDefaultType!}"  key="taskID.productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737333344')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskID_productBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${taskID_productBatchNum_displayDefaultType!}"  key="taskID.productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign putinStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${putinStaff_name_displayDefaultType!}"  key="putinStaff.name"   label="${getText('WOM.staff.dimissionStaff_xls.staffName43566')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_putInMaterial_PutInMaterial", "WOM_7.5.0.0_putInMaterial_putinEXRefList", "LIST", "putInMaterial")>
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
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1490604919519')}" textalign="left"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_putInMaterial_putInMaterial_putinEXRefList_RenderOverEvent(){
}
function ec_WOM_putInMaterial_putInMaterial_putinEXRefList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
</script>