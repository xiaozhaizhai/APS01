	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_formula_formulaProcess_formulaProcessRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" exportUrl="/RM/formula/formulaProcess/formulaProcessRef-query.action">
		<input type="hidden" reset="false" name="RM_formula_formulaProcess_formulaProcessRef_condition" id="RM_formula_formulaProcess_formulaProcessRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487140927408')}_${getText('RM.viewtitle.randon1540176284921')}.xls" />
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
		<div id="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_formula_formulaProcessRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_formula_formulaProcessRef" formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" dataTableId="ec_RM_formula_formulaProcess_formulaProcessRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" isExpandAll=true formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" idprefix="ec_RM_formula_formulaProcess_formulaProcessRef" expandType="all"  fieldcodes="RM_7.5.0.0_formula_Formula_code_formulaId_code:RM.propertydisplayName.randon1488246312092201810221103002||RM_7.5.0.0_formula_Formula_batchFormulaCode_formulaId_batchFormulaCode:RM.propertydisplayName.randon1508738820280||RM_7.5.0.0_formula_FormulaProcess_name_name:RM.propertydisplayName.randon1487295011793" > 
							<#assign formulaId_code_defaultValue  = ''>
									<#assign formulaId_code_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formulaId_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formulaId_code" isCustomize=true style="" > 
										<input type="hidden" id="formulaId.id" name="formulaId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_code_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1540261622176')}"  conditionfunc="RM.formula.formulaProcess.formulaProcessRef._querycustomFunc('formulaId_code')" name="formulaId.code" id="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm_formulaId_code" displayFieldName="code" type="other" exp="equal" classStyle="cui-noborder-input" url="/RM/formula/formula/formulaForProcessRef.action"   refViewCode="RM_7.5.0.0_formula_formulaForProcessRef"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" searchClick="RM.formula.formulaProcess.formulaProcessRef.commonQuery('query')"   />
							</@queryfield>
							<#assign formulaId_batchFormulaCode_defaultValue  = ''>
									<#assign formulaId_batchFormulaCode_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" code="RM_7.5.0.0_formula_Formula_batchFormulaCode" showFormat="SELECTCOMP" defaultValue=formulaId_batchFormulaCode_defaultValue  divCode="RM_7.5.0.0_formula_Formula_batchFormulaCode_formulaId_batchFormulaCode" isCustomize=true style="" > 
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_batchFormulaCode_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1514372721087')}"  conditionfunc="RM.formula.formulaProcess.formulaProcessRef._querycustomFunc('formulaId_batchFormulaCode')" name="formulaId.batchFormulaCode" id="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm_formulaId_batchFormulaCode" displayFieldName="batchFormulaCode" type="other" exp="like" classStyle="cui-noborder-input" url="/RM/formula/formula/formulaForSuitLine.action"   refViewCode="RM_7.5.0.0_formula_formulaForSuitLine"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" searchClick="RM.formula.formulaProcess.formulaProcessRef.commonQuery('query')"   />
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" code="RM_7.5.0.0_formula_FormulaProcess_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcess_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" type="adv" onclick="RM.formula.formulaProcess.formulaProcessRef.commonQuery('query')" onadvancedclick="advQuery('RM.formula.formulaProcess.formulaProcessRef.advquery')" /> 
						 		<@querybutton formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info={};
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["MainTableName"]="RM_FORMULA_PROCESSES";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.code"]={};
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.code"].dbColumnType="BAPCODE";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.code"].layRec="RM_FORMULAS,ID,RM_FORMULA_PROCESSES,FORMULA_ID-code";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.code"].columnName="CODE";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.id"]={};
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.id"].dbColumnType="LONG";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.id"].layRec="RM_FORMULAS,ID,RM_FORMULA_PROCESSES,FORMULA_ID-code";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.id"].columnName="ID";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.batchFormulaCode"]={};
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.batchFormulaCode"].dbColumnType="TEXT";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.batchFormulaCode"].layRec="RM_FORMULAS,ID,RM_FORMULA_PROCESSES,FORMULA_ID-batchFormulaCode";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["formulaId.batchFormulaCode"].columnName="BATCH_FORMULA_CODE";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["name"]={};
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["name"].layRec="name";
ec_RM_formula_formulaProcess_formulaProcessRef_quickquery_info["name"].columnName="NAME";
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
 	var advRemainDialog = $('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.formula.formulaProcess.formulaProcessRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formulaProcess_formulaProcessRef_adv_queryForm" exportUrl="/RM/formula/formulaProcess/formulaProcessRef-query.action">
							<#assign formulaId_code_defaultValue  = ''>
									<#assign formulaId_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formulaProcess_formulaProcessRef_adv_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formulaId_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formulaId_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="RM_FORMULAS,ID,RM_FORMULA_PROCESSES,FORMULA_ID-code" columnname="CODE" columntype="BAPCODE" name="formulaId.code" fieldType="SELECTCOMP" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配方编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<input type="hidden" id="adv_formulaId.id" name="formulaId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_formulaId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_code_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1540261622176')}"  conditionfunc="RM.formula.formulaProcess.formulaProcessRef._querycustomFunc('formulaId_code')" name="formulaId.code" id="adv_ec_RM_formula_formulaProcess_formulaProcessRef_queryForm_formulaId_code" displayFieldName="code" type="other" exp="equal"  classStyle="cui-noborder-input" url="/RM/formula/formula/formulaForProcessRef.action"   refViewCode="RM_7.5.0.0_formula_formulaForProcessRef"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formulaProcess_formulaProcessRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign formulaId_batchFormulaCode_defaultValue  = ''>
									<#assign formulaId_batchFormulaCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formulaProcess_formulaProcessRef_adv_queryForm" code="RM_7.5.0.0_formula_Formula_batchFormulaCode" showFormat="SELECTCOMP" defaultValue=formulaId_batchFormulaCode_defaultValue  divCode="RM_7.5.0.0_formula_Formula_batchFormulaCode_formulaId_batchFormulaCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="RM_FORMULAS,ID,RM_FORMULA_PROCESSES,FORMULA_ID-batchFormulaCode" columnname="BATCH_FORMULA_CODE" columntype="TEXT" name="formulaId.batchFormulaCode" fieldType="SELECTCOMP" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										批控配方编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
												<@mneclient iframe=true mneenable=false advresume="adv_formulaId.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${formulaId_batchFormulaCode_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1514372721087')}"  conditionfunc="RM.formula.formulaProcess.formulaProcessRef._querycustomFunc('formulaId_batchFormulaCode')" name="formulaId.batchFormulaCode" id="adv_ec_RM_formula_formulaProcess_formulaProcessRef_queryForm_formulaId_batchFormulaCode" displayFieldName="batchFormulaCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/RM/formula/formula/formulaForSuitLine.action"   refViewCode="RM_7.5.0.0_formula_formulaForSuitLine"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formulaProcess_formulaProcessRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formulaProcess_formulaProcessRef_adv_queryForm" code="RM_7.5.0.0_formula_FormulaProcess_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_formula_FormulaProcess_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_FormulaProcess" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="RM_FORMULA_PROCESSES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										工序名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_FormulaProcess" />
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
			viewCode: 'RM_7.5.0.0_formula_formulaProcessRef',
			modelCode: 'RM_7.5.0.0_formula_FormulaProcess',
			modelName: 'FormulaProcess',
			formId: 'ec_RM_formula_formulaProcess_formulaProcessRef_queryForm',
			olddiv: 'RM.formula.formulaProcess.formulaProcessRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.formula.formulaProcess.formulaProcessRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_formulaProcessRef'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.formula.formulaProcess.formulaProcessRef.advquery'] #customquContent").html(html);
		 	$("[id='RM.formula.formulaProcess.formulaProcessRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.formula.formulaProcess.formulaProcessRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_formulaProcessRef'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.formula.formulaProcess.formulaProcessRef.advquery'] #customquContent").html(html);
			 $("[id='RM.formula.formulaProcess.formulaProcessRef.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.formula.formulaProcess.formulaProcessRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.formula.formulaProcess.formulaProcessRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcess/formulaProcessRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaProcess.formulaProcessRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcess/formulaProcessRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_formula_formulaProcess_formulaProcessRef_query" renderOverEvent="ec_RM_formula_formulaProcess_formulaProcessRef_RenderOverEvent" pageInitMethod="ec_RM_formula_formulaProcess_formulaProcessRef_PageInitMethod" modelCode="RM_7.5.0.0_formula_FormulaProcess" noPermissionKeys="formulaId.batchFormulaCode,formulaId.code,formulaId.edition,name,processType.name,isFirstProcess,isLastProcess,longTime,meno,processTableId,formulaId.tableNo,batchUnitID" hidekeyPrefix="ec_RM_formula_formulaProcess_formulaProcessRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formulaProcess_formulaProcessRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.formula.formulaProcess.formulaProcessRef.sendBackformulaProcessRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','formulaId.id','processType.id','id','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.formula.formulaProcess.formulaProcessRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign formulaId_batchFormulaCode_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_FORMULA_CODE"    showFormat="TEXT" defaultDisplay="${formulaId_batchFormulaCode_displayDefaultType!}"  key="formulaId.batchFormulaCode"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1508738820280')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${formulaId_code_displayDefaultType!}"  key="formulaId.code"   label="${getText('RM.propertydisplayName.randon1488246312092201810221003001')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_edition_displayDefaultType  = ''>
			<@datacolumn columnName="EDITION"    showFormat="TEXT" defaultDisplay="${formulaId_edition_displayDefaultType!}"  key="formulaId.edition"   label="${getText('RM.propertydisplayName.randon1487139592239')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487295011793')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign processType_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${processType_name_displayDefaultType!}"  key="processType.name"   label="${getText('RM.propertydisplayName.randon1487074387497201810221104001')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign isFirstProcess_displayDefaultType  = ''>
			<@datacolumn columnName="IS_FIRST_PROCESS"    showFormat="SELECT" defaultDisplay="${isFirstProcess_displayDefaultType!}"  key="isFirstProcess"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1540176861060')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign isLastProcess_displayDefaultType  = ''>
			<@datacolumn columnName="IS_LAST_PROCESS"    showFormat="SELECT" defaultDisplay="${isLastProcess_displayDefaultType!}"  key="isLastProcess"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1497849146067')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign longTime_displayDefaultType  = ''>
			<@datacolumn columnName="LONG_TIME"    showFormat="TEXT" defaultDisplay="${longTime_displayDefaultType!}"  key="longTime"   label="${getText('RM.propertydisplayName.randon1487292241411')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign meno_displayDefaultType  = ''>
			<@datacolumn columnName="MENO"    showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('RM.propertydisplayName.randon1487292273721')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign processTableId_displayDefaultType  = ''>
			<@datacolumn columnName="PROCESS_TABLE_ID"    showFormat="TEXT" defaultDisplay="${processTableId_displayDefaultType!}"  key="processTableId"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1487297416937')}" textalign="right"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${formulaId_tableNo_displayDefaultType!}"  key="formulaId.tableNo"  hiddenCol=true label="${getText('ec.common.tableNo')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchUnitID_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_UNITID"    showFormat="TEXT" defaultDisplay="${batchUnitID_displayDefaultType!}"  key="batchUnitID"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1493729983867')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formulaProcess_formulaProcessRef_RenderOverEvent(){
var widget = ec_RM_formula_formulaProcess_formulaProcessRef_queryWidget;
for(var i=0;i<widget.getRowLength();i++){
	var text = $('#ec_RM_formula_formulaProcess_formulaProcessRef_query_tbody [name="ec_RM_formula_formulaProcess_formulaProcessRef_queryname"]').children('div').eq(i).html();
	//给每一行的工序名称绑定链接到工序活动
	$('#ec_RM_formula_formulaProcess_formulaProcessRef_query_tbody [name="ec_RM_formula_formulaProcess_formulaProcessRef_queryname"]').children('div').eq(i).html("<a href='javascript:void(0)' onclick='processNameOnclick("+i+")' style='text-decoration: underline; cursor: pointer;'>"+text+"</a>");

}
}
function ec_RM_formula_formulaProcess_formulaProcessRef_PageInitMethod(){
$('#layout-south').hide();
}
	
	
	
	
	
	
	
	
	
	
	
	
</script>