	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1541146558377')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_produceRecords_materialsOutput_outputList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceRecords_materialsOutput_outputList_queryForm" exportUrl="/WOM/produceRecords/materialsOutput/outputList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="placeSet" bak_value="placeSet"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1541146599059')}_${getText('WOM.viewtitle.randon1541147673729')}.xls" />
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
		<div id="ec_WOM_produceRecords_materialsOutput_outputList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_produceRecords_materialsOutput_outputList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_produceRecords_outputList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_produceRecords_outputList" formId="ec_WOM_produceRecords_materialsOutput_outputList_queryForm" dataTableId="ec_WOM_produceRecords_materialsOutput_outputList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_produceRecords_materialsOutput_outputList_queryForm" isExpandAll=true formId="ec_WOM_produceRecords_materialsOutput_outputList_queryForm" idprefix="ec_WOM_produceRecords_materialsOutput_outputList" expandType="all"  fieldcodes="WOM_7.5.0.0_produceRecords_MaterialsOutput_batch_batch:WOM.propertydisplayName.randon1541146730158||WOM_7.5.0.0_produceTask_ProduceTaskActive_name_activeID_name:WOM.propertydisplayName.randon1490683872072" > 
							<#assign batch_defaultValue  = ''>
									<#assign batch_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceRecords_materialsOutput_outputList_queryForm" code="WOM_7.5.0.0_produceRecords_MaterialsOutput_batch" showFormat="TEXT" defaultValue=batch_defaultValue  divCode="WOM_7.5.0.0_produceRecords_MaterialsOutput_batch_batch" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batch" id="batch" value="${batch_defaultValue!}" deValue="${batch_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign activeID_name_defaultValue  = ''>
									<#assign activeID_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceRecords_materialsOutput_outputList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskActive_name" showFormat="SELECTCOMP" defaultValue=activeID_name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskActive_name_activeID_name" isCustomize=true style="" > 
										<input type="hidden" id="activeID.id" name="activeID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${activeID_name_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1495626855536')}"  conditionfunc="WOM.produceRecords.materialsOutput.outputList._querycustomFunc('activeID_name')" name="activeID.name" id="ec_WOM_produceRecords_materialsOutput_outputList_queryForm_activeID_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTaskActive/taskActiveExelogRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskActiveExelogRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceRecords_materialsOutput_outputList_queryForm" searchClick="WOM.produceRecords.materialsOutput.outputList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_produceRecords_materialsOutput_outputList_queryForm" type="adv" onclick="WOM.produceRecords.materialsOutput.outputList.commonQuery('query')" onadvancedclick="advQuery('WOM.produceRecords.materialsOutput.outputList.advquery')" /> 
						 		<@querybutton formId="ec_WOM_produceRecords_materialsOutput_outputList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info={};
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["MainTableName"]="WOM_MATERIALS_OUTPUTS";
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["batch"]={};
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["batch"].dbColumnType="TEXT";
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["batch"].layRec="batch";
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["batch"].columnName="BATCH";
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["activeID.name"]={};
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["activeID.name"].dbColumnType="TEXT";
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["activeID.name"].layRec="WOM_PRODUCE_TASK_ACTIVES,ID,WOM_MATERIALS_OUTPUTS,ACTIVEID-name";
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["activeID.name"].columnName="NAME";
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["activeID.id"]={};
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["activeID.id"].dbColumnType="LONG";
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["activeID.id"].layRec="WOM_PRODUCE_TASK_ACTIVES,ID,WOM_MATERIALS_OUTPUTS,ACTIVEID-name";
ec_WOM_produceRecords_materialsOutput_outputList_quickquery_info["activeID.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="WOM.produceRecords.materialsOutput.outputList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.produceRecords.materialsOutput.outputList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceRecords_materialsOutput_outputList_adv_queryForm" exportUrl="/WOM/produceRecords/materialsOutput/outputList-query.action">
							<#assign batch_defaultValue  = ''>
									<#assign batch_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceRecords_materialsOutput_outputList_adv_queryForm" code="WOM_7.5.0.0_produceRecords_MaterialsOutput_batch" showFormat="TEXT" defaultValue=batch_defaultValue  divCode="WOM_7.5.0.0_produceRecords_MaterialsOutput_batch_batch" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceRecords_MaterialsOutput" layRec="batch" columnname="BATCH" columntype="TEXT" name="batch" fieldType="TEXTFIELD" tableName="WOM_MATERIALS_OUTPUTS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceRecords_MaterialsOutput" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batch" id="adv_batch" value="${batch_defaultValue!}" deValue="${batch_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign activeID_name_defaultValue  = ''>
									<#assign activeID_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceRecords_materialsOutput_outputList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTaskActive_name" showFormat="SELECTCOMP" defaultValue=activeID_name_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTaskActive_name_activeID_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskActive" layRec="WOM_PRODUCE_TASK_ACTIVES,ID,WOM_MATERIALS_OUTPUTS,ACTIVEID-name" columnname="NAME" columntype="TEXT" name="activeID.name" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASK_ACTIVES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										活动名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTaskActive" />
										<input type="hidden" id="adv_activeID.id" name="activeID.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_activeID.id"  isPrecise=true deValue="${activeID_name_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1495626855536')}"  conditionfunc="WOM.produceRecords.materialsOutput.outputList._querycustomFunc('activeID_name')" name="activeID.name" id="adv_ec_WOM_produceRecords_materialsOutput_outputList_queryForm_activeID_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTaskActive/taskActiveExelogRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskActiveExelogRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceRecords_materialsOutput_outputList_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_produceRecords_outputList',
			modelCode: 'WOM_7.5.0.0_produceRecords_MaterialsOutput',
			modelName: 'MaterialsOutput',
			formId: 'ec_WOM_produceRecords_materialsOutput_outputList_queryForm',
			olddiv: 'WOM.produceRecords.materialsOutput.outputList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.produceRecords.materialsOutput.outputList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceRecords_outputList'+"&entity.code="+'WOM_7.5.0.0_produceRecords';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.produceRecords.materialsOutput.outputList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.produceRecords.materialsOutput.outputList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.produceRecords.materialsOutput.outputList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceRecords_outputList'+"&entity.code="+'WOM_7.5.0.0_produceRecords';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.produceRecords.materialsOutput.outputList.advquery'] #customquContent").html(html);
			 $("[id='WOM.produceRecords.materialsOutput.outputList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.produceRecords.materialsOutput.outputList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.produceRecords.materialsOutput.outputList.query('query')">
<#assign datatable_dataUrl = "/WOM/produceRecords/materialsOutput/outputList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_produceRecords_materialsOutput_outputList_query" renderOverEvent="ec_WOM_produceRecords_materialsOutput_outputList_RenderOverEvent" pageInitMethod="ec_WOM_produceRecords_materialsOutput_outputList_PageInitMethod" modelCode="WOM_7.5.0.0_produceRecords_MaterialsOutput" noPermissionKeys="activeID.activeId.name,batch,produceNum" hidekeyPrefix="ec_WOM_produceRecords_materialsOutput_outputList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceRecords_materialsOutput_outputList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.produceRecords.materialsOutput.outputList.dbClickViewoutputList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','activeID.activeId.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.produceRecords.materialsOutput.outputList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}outputList_addOuput_add_WOM_7.5.0.0_produceRecords_outputList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1490410006132')}||iconcls:add||useInMore:false||onclick:
				WOM.produceRecords.materialsOutput.outputList.addoutputList()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceRecords_outputList_BUTTON_addOuput"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}outputList_addOuput_add_WOM_7.5.0.0_produceRecords_outputList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1490410006132')}||iconcls:add||useInMore:false||onclick:
				WOM.produceRecords.materialsOutput.outputList.addoutputList()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign activeID_activeId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${activeID_activeId_name_displayDefaultType!}"  key="activeID.activeId.name"   label="${getText('RM.propertydisplayName.randon1487330156499')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batch_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH"    showFormat="TEXT" defaultDisplay="${batch_displayDefaultType!}"  key="batch"   label="${getText('WOM.propertydisplayName.randon1541146730158')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign produceNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCE_NUM"    showFormat="TEXT" defaultDisplay="${produceNum_displayDefaultType!}"  key="produceNum"   label="${getText('WOM.propertydisplayName.randon1541146740613')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_produceRecords_materialsOutput_outputList_RenderOverEvent(){
}
function ec_WOM_produceRecords_materialsOutput_outputList_PageInitMethod(){
}
	
	
	
	
</script>