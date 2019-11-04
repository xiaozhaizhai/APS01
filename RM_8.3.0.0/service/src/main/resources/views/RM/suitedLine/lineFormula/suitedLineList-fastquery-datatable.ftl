	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487926386366')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_suitedLine_lineFormula_suitedLineList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" exportUrl="/RM/suitedLine/lineFormula/suitedLineList-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="lineId" bak_value="lineId"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487926409771')}_${getText('RM.viewtitle.randon1487989802087')}.xls" />
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
		<div id="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_suitedLine_suitedLineList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_suitedLine_suitedLineList" formId="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" dataTableId="ec_RM_suitedLine_lineFormula_suitedLineList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" isExpandAll=true formId="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" idprefix="ec_RM_suitedLine_lineFormula_suitedLineList" expandType="all"  fieldcodes="RM_7.5.0.0_formula_Formula_code_formulaId_code:RM.propertydisplayName.randon1487927788421||MESBasic_1_factoryModel_FactoryModel_name_lineId_name:RM.propertydisplayName.randon1487927739693" > 
							<#assign formulaId_code_defaultValue  = ''>
									<#assign formulaId_code_defaultValue  = ''>
							<@queryfield formId="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formulaId_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formulaId_code" isCustomize=true style="" > 
										<input type="hidden" id="formulaId.id" name="formulaId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${formulaId_code_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1488246963795')}"  conditionfunc="RM.suitedLine.lineFormula.suitedLineList._querycustomFunc('formulaId_code')" name="formulaId.code" id="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm_formulaId_code" displayFieldName="code" type="other" exp="equal" classStyle="cui-noborder-input" url="/RM/formula/formula/formulaRef.action"   refViewCode="RM_7.5.0.0_formula_formulaRef"  clicked=true multiple=false mnewidth=260 formId="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" searchClick="RM.suitedLine.lineFormula.suitedLineList.commonQuery('query')"   />
							</@queryfield>
							<#assign lineId_name_defaultValue  = ''>
									<#assign lineId_name_defaultValue  = ''>
							<@queryfield formId="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=lineId_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_lineId_name" isCustomize=true style="" > 
										<input type="hidden" id="lineId.id" name="lineId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${lineId_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="RM.suitedLine.lineFormula.suitedLineList._querycustomFunc('lineId_name')" name="lineId.name" id="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm_lineId_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" searchClick="RM.suitedLine.lineFormula.suitedLineList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" type="adv" onclick="RM.suitedLine.lineFormula.suitedLineList.commonQuery('query')" onadvancedclick="advQuery('RM.suitedLine.lineFormula.suitedLineList.advquery')" /> 
						 		<@querybutton formId="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info={};
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["MainTableName"]="RM_LINE_FORMULAS";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["formulaId.code"]={};
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["formulaId.code"].dbColumnType="BAPCODE";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["formulaId.code"].layRec="RM_FORMULAS,ID,RM_LINE_FORMULAS,FORMULA_ID-code";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["formulaId.code"].columnName="CODE";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["formulaId.id"]={};
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["formulaId.id"].dbColumnType="LONG";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["formulaId.id"].layRec="RM_FORMULAS,ID,RM_LINE_FORMULAS,FORMULA_ID-code";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["formulaId.id"].columnName="ID";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["lineId.name"]={};
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["lineId.name"].dbColumnType="TEXT";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["lineId.name"].layRec="factory_tbcompanystructure,ID,RM_LINE_FORMULAS,LINE_ID-name";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["lineId.name"].columnName="NODENAME";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["lineId.id"]={};
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["lineId.id"].dbColumnType="LONG";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["lineId.id"].layRec="factory_tbcompanystructure,ID,RM_LINE_FORMULAS,LINE_ID-name";
ec_RM_suitedLine_lineFormula_suitedLineList_quickquery_info["lineId.id"].columnName="ID";
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
 	var advRemainDialog = $('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.suitedLine.lineFormula.suitedLineList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_suitedLine_lineFormula_suitedLineList_adv_queryForm" exportUrl="/RM/suitedLine/lineFormula/suitedLineList-query.action">
							<#assign formulaId_code_defaultValue  = ''>
									<#assign formulaId_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_suitedLine_lineFormula_suitedLineList_adv_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formulaId_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formulaId_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="RM_FORMULAS,ID,RM_LINE_FORMULAS,FORMULA_ID-code" columnname="CODE" columntype="BAPCODE" name="formulaId.code" fieldType="SELECTCOMP" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配方
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<input type="hidden" id="adv_formulaId.id" name="formulaId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_formulaId.id"  isPrecise=true deValue="${formulaId_code_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1488246963795')}"  conditionfunc="RM.suitedLine.lineFormula.suitedLineList._querycustomFunc('formulaId_code')" name="formulaId.code" id="adv_ec_RM_suitedLine_lineFormula_suitedLineList_queryForm_formulaId_code" displayFieldName="code" type="other" exp="equal"  classStyle="cui-noborder-input" url="/RM/formula/formula/formulaRef.action"   refViewCode="RM_7.5.0.0_formula_formulaRef"  clicked=true multiple=false mnewidth=260 formId="ec_RM_suitedLine_lineFormula_suitedLineList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign lineId_name_defaultValue  = ''>
									<#assign lineId_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_suitedLine_lineFormula_suitedLineList_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=lineId_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_lineId_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="factory_tbcompanystructure,ID,RM_LINE_FORMULAS,LINE_ID-name" columnname="NODENAME" columntype="TEXT" name="lineId.name" fieldType="SELECTCOMP" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产线
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<input type="hidden" id="adv_lineId.id" name="lineId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_lineId.id"  isPrecise=true deValue="${lineId_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="RM.suitedLine.lineFormula.suitedLineList._querycustomFunc('lineId_name')" name="lineId.name" id="adv_ec_RM_suitedLine_lineFormula_suitedLineList_queryForm_lineId_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_RM_suitedLine_lineFormula_suitedLineList_adv_queryForm"   />
								
                                	
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
			viewCode: 'RM_7.5.0.0_suitedLine_suitedLineList',
			modelCode: 'RM_7.5.0.0_suitedLine_LineFormula',
			modelName: 'LineFormula',
			formId: 'ec_RM_suitedLine_lineFormula_suitedLineList_queryForm',
			olddiv: 'RM.suitedLine.lineFormula.suitedLineList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.suitedLine.lineFormula.suitedLineList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_suitedLine_suitedLineList'+"&entity.code="+'RM_7.5.0.0_suitedLine';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.suitedLine.lineFormula.suitedLineList.advquery'] #customquContent").html(html);
		 	$("[id='RM.suitedLine.lineFormula.suitedLineList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.suitedLine.lineFormula.suitedLineList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_suitedLine_suitedLineList'+"&entity.code="+'RM_7.5.0.0_suitedLine';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.suitedLine.lineFormula.suitedLineList.advquery'] #customquContent").html(html);
			 $("[id='RM.suitedLine.lineFormula.suitedLineList.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.suitedLine.lineFormula.suitedLineList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.suitedLine.lineFormula.suitedLineList.query('query')">
<#assign datatable_dataUrl = "/RM/suitedLine/lineFormula/suitedLineList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_RM_suitedLine_lineFormula_suitedLineList_query" renderOverEvent="ec_RM_suitedLine_lineFormula_suitedLineList_RenderOverEvent" pageInitMethod="ec_RM_suitedLine_lineFormula_suitedLineList_PageInitMethod" modelCode="RM_7.5.0.0_suitedLine_LineFormula" noPermissionKeys="formulaId.code,formulaId.name,formulaId.edition,formulaId.produceType,lineId.name,longTime,theoreYield,maxCapacity,autoReportOnFinish,meno" hidekeyPrefix="ec_RM_suitedLine_lineFormula_suitedLineList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_suitedLine_lineFormula_suitedLineList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="RM.suitedLine.lineFormula.suitedLineList.dbmodifysuitedLineList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','formulaId.produceType.id','autoReportOnFinish.id','formulaId.id','lineId.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="RM.suitedLine.lineFormula.suitedLineList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}suitedLineList_add_add_RM_7.5.0.0_suitedLine_suitedLineList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1487992058939232')}||iconcls:add||useInMore:false||onclick:
				RM.suitedLine.lineFormula.suitedLineList.addsuitedLineList()
		" 
		resultType="json" 
		buttonCode="RM_7.5.0.0_suitedLine_suitedLineList_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}suitedLineList_add_add_RM_7.5.0.0_suitedLine_suitedLineList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1487992058939232')}||iconcls:add||useInMore:false||onclick:
				RM.suitedLine.lineFormula.suitedLineList.addsuitedLineList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}suitedLineList_update_modify_RM_7.5.0.0_suitedLine_suitedLineList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1487992079291')}||iconcls:modify||useInMore:false||onclick:
				RM.suitedLine.lineFormula.suitedLineList.modifysuitedLineList()
		" 
		resultType="json" 
		buttonCode="RM_7.5.0.0_suitedLine_suitedLineList_BUTTON_update"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}suitedLineList_update_modify_RM_7.5.0.0_suitedLine_suitedLineList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1487992079291')}||iconcls:modify||useInMore:false||onclick:
				RM.suitedLine.lineFormula.suitedLineList.modifysuitedLineList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}suitedLineList_delete_del_RM_7.5.0.0_suitedLine_suitedLineList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1487992095394')}||iconcls:del||useInMore:false||onclick:
				RM.suitedLine.lineFormula.suitedLineList.delsuitedLineList()
		" 
		resultType="json" 
		buttonCode="RM_7.5.0.0_suitedLine_suitedLineList_BUTTON_delete"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}suitedLineList_delete_del_RM_7.5.0.0_suitedLine_suitedLineList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1487992095394')}||iconcls:del||useInMore:false||onclick:
				RM.suitedLine.lineFormula.suitedLineList.delsuitedLineList()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign formulaId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${formulaId_code_displayDefaultType!}"  key="formulaId.code"   label="${getText('RM.propertydisplayName.randon1487140953580')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${formulaId_name_displayDefaultType!}"  key="formulaId.name"   label="${getText('RM.propertydisplayName.randon1487075823790')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_edition_displayDefaultType  = ''>
			<@datacolumn columnName="EDITION"    showFormat="TEXT" defaultDisplay="${formulaId_edition_displayDefaultType!}"  key="formulaId.edition"   label="${getText('RM.propertydisplayName.randon1487139592239')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_produceType_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCE_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${formulaId_produceType_displayDefaultType!}"  key="formulaId.produceType.value"   label="${getText('RM.propertydisplayName.randon1487076555894')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign lineId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${lineId_name_displayDefaultType!}"  key="lineId.name"   label="${getText('RM.propertydisplayName.randon1487927739693')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign longTime_displayDefaultType  = ''>
			<@datacolumn columnName="LONG_TIME"    showFormat="TEXT" defaultDisplay="${longTime_displayDefaultType!}"  key="longTime"   label="${getText('RM.propertydisplayName.randon1487927827167')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign theoreYield_displayDefaultType  = ''>
			<@datacolumn columnName="THEORE_YIELD"    showFormat="TEXT" defaultDisplay="${theoreYield_displayDefaultType!}"  key="theoreYield"   label="${getText('RM.propertydisplayName.randon1487927965341')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign maxCapacity_displayDefaultType  = ''>
			<@datacolumn columnName="MAX_CAPACITY"    showFormat="TEXT" defaultDisplay="${maxCapacity_displayDefaultType!}"  key="maxCapacity"   label="${getText('RM.propertydisplayName.randon1487927891234')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign autoReportOnFinish_displayDefaultType  = ''>
			<@datacolumn columnName="AUTO_REPORT_ON_FINISH"    showFormat="SELECTCOMP" defaultDisplay="${autoReportOnFinish_displayDefaultType!}"  key="autoReportOnFinish.value"   label="${getText('RM.propertydisplayName.randon1554975104606')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("RM_7.5.0.0_suitedLine_LineFormula", "RM_7.5.0.0_suitedLine_suitedLineList", "LIST", "lineFormula")>
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
			<#assign meno_displayDefaultType  = ''>
			<@datacolumn columnName="MENO"    showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('RM.propertydisplayName.randon1487927995051')}" textalign="left"  width=150   type="textarea"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_suitedLine_lineFormula_suitedLineList_RenderOverEvent(){
}
function ec_RM_suitedLine_lineFormula_suitedLineList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
</script>