	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_formula_formulaProcessActive_activeRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formulaProcessActive_activeRef_queryForm" exportUrl="/RM/formula/formulaProcessActive/activeRef-query.action">
		<input type="hidden" id="RM_7_5_0_0_pickSite_PickSite" value="pickSite" bak_value="pickSite"/>
		<input type="hidden" reset="false" name="RM_formula_formulaProcessActive_activeRef_condition" id="RM_formula_formulaProcessActive_activeRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487330059541')}_${getText('RM.viewtitle.randon1489564694469')}.xls" />
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
		<div id="ec_RM_formula_formulaProcessActive_activeRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_formula_formulaProcessActive_activeRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_formula_activeRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_formula_activeRef" formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" dataTableId="ec_RM_formula_formulaProcessActive_activeRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_formula_formulaProcessActive_activeRef_queryForm" isExpandAll=true formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" idprefix="ec_RM_formula_formulaProcessActive_activeRef" expandType="all"  fieldcodes="RM_7.5.0.0_formula_FormulaProcessActive_activeType_activeType:RM.propertydisplayName.randon1487330759313||RM_7.5.0.0_formula_FormulaProcessActive_occurTurn_occurTurn:RM.propertydisplayName.randon1487330199423" > 
							<#assign activeType_defaultValue  = ''>
									<#assign activeType_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" code="RM_7.5.0.0_formula_FormulaProcessActive_activeType" showFormat="SELECTCOMP" defaultValue=activeType_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcessActive_activeType_activeType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${activeType_defaultValue}"   name="activeType" code="activeType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign occurTurn_defaultValue  = ''>
									<#assign occurTurn_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" code="RM_7.5.0.0_formula_FormulaProcessActive_occurTurn" showFormat="SELECTCOMP" defaultValue=occurTurn_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcessActive_occurTurn_occurTurn" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${occurTurn_defaultValue}"   name="occurTurn" code="occurTurn" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" type="adv" onclick="RM.formula.formulaProcessActive.activeRef.commonQuery('query')" onadvancedclick="advQuery('RM.formula.formulaProcessActive.activeRef.advquery')" /> 
						 		<@querybutton formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info={};
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["MainTableName"]="RM_FORMULA_PROCESS_ACTIVES";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["activeType"]={};
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["activeType"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["activeType"].layRec="activeType";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["activeType"].columnName="ACTIVE_TYPE";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["occurTurn"]={};
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["occurTurn"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["occurTurn"].layRec="occurTurn";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["occurTurn"].columnName="OCCUR_TURN";
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
 	var advRemainDialog = $('[id="RM.formula.formulaProcessActive.activeRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.formula.formulaProcessActive.activeRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formulaProcessActive_activeRef_adv_queryForm" exportUrl="/RM/formula/formulaProcessActive/activeRef-query.action">
							<#assign activeType_defaultValue  = ''>
									<#assign activeType_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formulaProcessActive_activeRef_adv_queryForm" code="RM_7.5.0.0_formula_FormulaProcessActive_activeType" showFormat="SELECTCOMP" defaultValue=activeType_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcessActive_activeType_activeType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_FormulaProcessActive" layRec="activeType" columnname="ACTIVE_TYPE" columntype="SYSTEMCODE" name="activeType" fieldType="SELECTCOMP" tableName="RM_FORMULA_PROCESS_ACTIVES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_FormulaProcessActive" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${activeType_defaultValue}"   name="activeType" code="activeType" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign occurTurn_defaultValue  = ''>
									<#assign occurTurn_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formulaProcessActive_activeRef_adv_queryForm" code="RM_7.5.0.0_formula_FormulaProcessActive_occurTurn" showFormat="SELECTCOMP" defaultValue=occurTurn_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcessActive_occurTurn_occurTurn" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_FormulaProcessActive" layRec="occurTurn" columnname="OCCUR_TURN" columntype="SYSTEMCODE" name="occurTurn" fieldType="SELECTCOMP" tableName="RM_FORMULA_PROCESS_ACTIVES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										发生于
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_FormulaProcessActive" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${occurTurn_defaultValue}"   name="occurTurn" code="occurTurn" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'RM_7.5.0.0_formula_activeRef',
			modelCode: 'RM_7.5.0.0_formula_FormulaProcessActive',
			modelName: 'FormulaProcessActive',
			formId: 'ec_RM_formula_formulaProcessActive_activeRef_queryForm',
			olddiv: 'RM.formula.formulaProcessActive.activeRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.formula.formulaProcessActive.activeRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_activeRef'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.formula.formulaProcessActive.activeRef.advquery'] #customquContent").html(html);
		 	$("[id='RM.formula.formulaProcessActive.activeRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.formula.formulaProcessActive.activeRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_activeRef'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.formula.formulaProcessActive.activeRef.advquery'] #customquContent").html(html);
			 $("[id='RM.formula.formulaProcessActive.activeRef.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.formula.formulaProcessActive.activeRef.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.formula.formulaProcessActive.activeRef.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.formula.formulaProcessActive.activeRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.formula.formulaProcessActive.activeRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.formula.formulaProcessActive.activeRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.formula.formulaProcessActive.activeRef.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.formula.formulaProcessActive.activeRef.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.formula.formulaProcessActive.activeRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.formula.formulaProcessActive.activeRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.formula.formulaProcessActive.activeRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.formula.formulaProcessActive.activeRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcessActive/activeRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaProcessActive.activeRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcessActive/activeRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_formula_formulaProcessActive_activeRef_query" renderOverEvent="ec_RM_formula_formulaProcessActive_activeRef_RenderOverEvent" pageInitMethod="ec_RM_formula_formulaProcessActive_activeRef_PageInitMethod" modelCode="RM_7.5.0.0_formula_FormulaProcessActive" noPermissionKeys="name,occurTurn,activeType" hidekeyPrefix="ec_RM_formula_formulaProcessActive_activeRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.formula.formulaProcessActive.activeRef.sendBackactiveRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','occurTurn.id','activeType.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.formula.formulaProcessActive.activeRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487330156499')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign occurTurn_displayDefaultType  = ''>
			<@datacolumn columnName="OCCUR_TURN"    showFormat="SELECTCOMP" defaultDisplay="${occurTurn_displayDefaultType!}"  key="occurTurn.value"   label="${getText('RM.propertydisplayName.randon1487330199423')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign activeType_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${activeType_displayDefaultType!}"  key="activeType.value"   label="${getText('RM.propertydisplayName.randon1487330759313')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formulaProcessActive_activeRef_RenderOverEvent(){
}
function ec_RM_formula_formulaProcessActive_activeRef_PageInitMethod(){
}
	
	
	
</script>