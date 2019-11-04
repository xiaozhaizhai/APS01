	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415336450425')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_routine_config_configRefForBatch_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_routine_config_configRefForBatch_queryForm" exportUrl="/MESBasic/routine/config/configRefForBatch-query.action">
		<input type="hidden" reset="false" name="MESBasic_routine_config_configRefForBatch_condition" id="MESBasic_routine_config_configRefForBatch_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415337833221')}_${getText('MESBasic.viewtitle.randon1429854464284')}.xls" />
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
		<div id="ec_MESBasic_routine_config_configRefForBatch_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_routine_config_configRefForBatch_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_routine_configRefForBatch')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_routine_configRefForBatch" formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" dataTableId="ec_MESBasic_routine_config_configRefForBatch_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_routine_config_configRefForBatch_queryForm" isExpandAll=true formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" idprefix="ec_MESBasic_routine_config_configRefForBatch" expandType="all"  fieldcodes="MESBasic_1_routine_Routine_name_routine_name:MESBasic.propertydisplayName.radion1415336597801||MESBasic_1_routine_Routine_code_routine_code:MESBasic.propertydisplayName.radion1415336575756||MESBasic_1_routine_Config_name_name:MESBasic.propertydisplayName.radion1416558524615" > 
							<#assign routine_name_defaultValue  = ''>
									<#assign routine_name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" code="MESBasic_1_routine_Routine_name" showFormat="SELECTCOMP" defaultValue=routine_name_defaultValue  divCode="MESBasic_1_routine_Routine_name_routine_name" isCustomize=true style="" > 
										<input type="hidden" id="routine.id" name="routine.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${routine_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1415338782604')}"  conditionfunc="MESBasic.routine.config.configRefForBatch._querycustomFunc('routine_name')" name="routine.name" id="ec_MESBasic_routine_config_configRefForBatch_queryForm_routine_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/routine/routine/routineRef.action"   refViewCode="MESBasic_1_routine_routineRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" searchClick="MESBasic.routine.config.configRefForBatch.commonQuery('query')"   />
							</@queryfield>
							<#assign routine_code_defaultValue  = ''>
									<#assign routine_code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" code="MESBasic_1_routine_Routine_code" showFormat="SELECTCOMP" defaultValue=routine_code_defaultValue  divCode="MESBasic_1_routine_Routine_code_routine_code" isCustomize=true style="" > 
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${routine_code_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1415338782604')}"  conditionfunc="MESBasic.routine.config.configRefForBatch._querycustomFunc('routine_code')" name="routine.code" id="ec_MESBasic_routine_config_configRefForBatch_queryForm_routine_code" displayFieldName="code" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/routine/routine/routineRef.action"   refViewCode="MESBasic_1_routine_routineRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" searchClick="MESBasic.routine.config.configRefForBatch.commonQuery('query')"   />
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" code="MESBasic_1_routine_Config_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_routine_Config_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" type="adv" onclick="MESBasic.routine.config.configRefForBatch.commonQuery('query')" onadvancedclick="advQuery('MESBasic.routine.config.configRefForBatch.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_routine_config_configRefForBatch_quickquery_info={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["MainTableName"]="MESBASIC_CONFIGS";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.name"]={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.name"].dbColumnType="TEXT";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.name"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-name";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.name"].columnName="NAME";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"]={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"].dbColumnType="LONG";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-name";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"].columnName="ID";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.code"]={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.code"].dbColumnType="TEXT";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.code"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-code";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.code"].columnName="CODE";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["name"]={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["name"].layRec="name";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["name"].columnName="NAME";
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
 	var advRemainDialog = $('[id="MESBasic.routine.config.configRefForBatch.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.routine.config.configRefForBatch.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_routine_config_configRefForBatch_adv_queryForm" exportUrl="/MESBasic/routine/config/configRefForBatch-query.action">
							<#assign routine_name_defaultValue  = ''>
									<#assign routine_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_config_configRefForBatch_adv_queryForm" code="MESBasic_1_routine_Routine_name" showFormat="SELECTCOMP" defaultValue=routine_name_defaultValue  divCode="MESBasic_1_routine_Routine_name_routine_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_routine_Routine" layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-name" columnname="NAME" columntype="TEXT" name="routine.name" fieldType="SELECTCOMP" tableName="MESBASIC_ROUTINES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										路径名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_routine_Routine" />
										<input type="hidden" id="adv_routine.id" name="routine.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_routine.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${routine_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1415338782604')}"  conditionfunc="MESBasic.routine.config.configRefForBatch._querycustomFunc('routine_name')" name="routine.name" id="adv_ec_MESBasic_routine_config_configRefForBatch_queryForm_routine_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/routine/routine/routineRef.action"   refViewCode="MESBasic_1_routine_routineRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_config_configRefForBatch_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign routine_code_defaultValue  = ''>
									<#assign routine_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_config_configRefForBatch_adv_queryForm" code="MESBasic_1_routine_Routine_code" showFormat="SELECTCOMP" defaultValue=routine_code_defaultValue  divCode="MESBasic_1_routine_Routine_code_routine_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_routine_Routine" layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-code" columnname="CODE" columntype="TEXT" name="routine.code" fieldType="SELECTCOMP" tableName="MESBASIC_ROUTINES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										路径编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_routine_Routine" />
												<@mneclient iframe=true mneenable=false advresume="adv_routine.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${routine_code_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1415338782604')}"  conditionfunc="MESBasic.routine.config.configRefForBatch._querycustomFunc('routine_code')" name="routine.code" id="adv_ec_MESBasic_routine_config_configRefForBatch_queryForm_routine_code" displayFieldName="code" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/routine/routine/routineRef.action"   refViewCode="MESBasic_1_routine_routineRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_config_configRefForBatch_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_routine_config_configRefForBatch_adv_queryForm" code="MESBasic_1_routine_Config_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_routine_Config_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_routine_Config" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="MESBASIC_CONFIGS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_routine_Config" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="adv_name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like" />
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
			viewCode: 'MESBasic_1_routine_configRefForBatch',
			modelCode: 'MESBasic_1_routine_Config',
			modelName: 'Config',
			formId: 'ec_MESBasic_routine_config_configRefForBatch_queryForm',
			olddiv: 'MESBasic.routine.config.configRefForBatch.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.routine.config.configRefForBatch.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_routine_configRefForBatch'+"&entity.code="+'MESBasic_1_routine';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.routine.config.configRefForBatch.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.routine.config.configRefForBatch.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.routine.config.configRefForBatch.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_routine_configRefForBatch'+"&entity.code="+'MESBasic_1_routine';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.routine.config.configRefForBatch.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.routine.config.configRefForBatch.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.routine.config.configRefForBatch.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.routine.config.configRefForBatch.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.routine.config.configRefForBatch.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.routine.config.configRefForBatch.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.routine.config.configRefForBatch.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.routine.config.configRefForBatch.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.routine.config.configRefForBatch.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.routine.config.configRefForBatch.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.routine.config.configRefForBatch.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.routine.config.configRefForBatch.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.routine.config.configRefForBatch.query('query')">
<#assign datatable_dataUrl = "/MESBasic/routine/config/configRefForBatch-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_routine_config_configRefForBatch_query" renderOverEvent="ec_MESBasic_routine_config_configRefForBatch_RenderOverEvent" pageInitMethod="ec_MESBasic_routine_config_configRefForBatch_PageInitMethod" modelCode="MESBasic_1_routine_Config" noPermissionKeys="routine.code,routine.name,name,formula" hidekeyPrefix="ec_MESBasic_routine_config_configRefForBatch_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.routine.config.configRefForBatch.sendBackconfigRefForBatch" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','routine.id','id','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.routine.config.configRefForBatch.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign routine_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${routine_code_displayDefaultType!}"  key="routine.code"   label="${getText('MESBasic.propertydisplayName.radion1415336575756')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign routine_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${routine_name_displayDefaultType!}"  key="routine.name"   label="${getText('MESBasic.propertydisplayName.radion1415336597801')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1416558524615')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formula_displayDefaultType  = ''>
			<@datacolumn columnName="FORMULA"    showFormat="TEXT" defaultDisplay="${formula_displayDefaultType!}"  key="formula"   label="${getText('MESBasic.propertydisplayName.randon1426644791679')}" textalign="left"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_routine_config_configRefForBatch_RenderOverEvent(){
}
function ec_MESBasic_routine_config_configRefForBatch_PageInitMethod(){
}
	
	
	
	
</script>