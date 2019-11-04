	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_formula_formula_formulaProdRepList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formula_formulaProdRepList_queryForm" exportUrl="/RM/formula/formula/formulaProdRepList-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="RM_7_5_0_0_formulaType_FormulaType" value="formulaType" bak_value="formulaType"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="RM_7_5_0_0_pickSite_PickSite" value="pickSite" bak_value="pickSite"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487075762209')}_${getText('RM.viewtitle.randon1540368329038')}.xls" />
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
		<div id="ec_RM_formula_formula_formulaProdRepList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_formula_formula_formulaProdRepList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_formula_formulaProdRepList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_formula_formulaProdRepList" formId="ec_RM_formula_formula_formulaProdRepList_queryForm" dataTableId="ec_RM_formula_formula_formulaProdRepList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_formula_formula_formulaProdRepList_queryForm" isExpandAll=true formId="ec_RM_formula_formula_formulaProdRepList_queryForm" idprefix="ec_RM_formula_formula_formulaProdRepList" expandType="all"  fieldcodes="MESBasic_1_product_Product_productName_mainMetarial_productName:MESBasic.propertydisplayName.radion1415772740737||RM_7.5.0.0_formula_Formula_code_code:RM.propertydisplayName.randon1488246312092" > 
							<#assign mainMetarial_productName_defaultValue  = ''>
									<#assign mainMetarial_productName_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formula_formulaProdRepList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=mainMetarial_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_mainMetarial_productName" isCustomize=true style="" > 
										<input type="hidden" id="mainMetarial.id" name="mainMetarial.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${mainMetarial_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="RM.formula.formula.formulaProdRepList._querycustomFunc('mainMetarial_productName')" name="mainMetarial.productName" id="ec_RM_formula_formula_formulaProdRepList_queryForm_mainMetarial_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formula_formulaProdRepList_queryForm" searchClick="RM.formula.formula.formulaProdRepList.commonQuery('query')"   />
							</@queryfield>
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formula_formulaProdRepList_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaProdRepList_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="RM.formula.formula.formulaProdRepList._querycustomFunc('code')" name="code" id="ec_RM_formula_formula_formulaProdRepList_queryForm_code" displayFieldName="code" exp="equal" caseSensitive="false" classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaProdRepList.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaProdRepList_queryForm"  isPrecise=true  conditionfunc="RM.formula.formula.formulaProdRepList._querycustomFunc('code')" name="code" id="ec_RM_formula_formula_formulaProdRepList_queryForm_code" displayFieldName="code" exp="equal" caseSensitive="false" classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaProdRepList.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_formula_formula_formulaProdRepList_queryForm" type="adv" onclick="RM.formula.formula.formulaProdRepList.commonQuery('query')" onadvancedclick="advQuery('RM.formula.formula.formulaProdRepList.advquery')" /> 
						       							       	<@querybutton formId="ec_RM_formula_formula_formulaProdRepList_queryForm" type="pending" onclick="RM.formula.formula.formulaProdRepList.commonQuery('pending')" />
						 		<@querybutton formId="ec_RM_formula_formula_formulaProdRepList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_formula_formula_formulaProdRepList_quickquery_info={};
ec_RM_formula_formula_formulaProdRepList_quickquery_info["MainTableName"]="RM_FORMULAS";
ec_RM_formula_formula_formulaProdRepList_quickquery_info["mainMetarial.productName"]={};
ec_RM_formula_formula_formulaProdRepList_quickquery_info["mainMetarial.productName"].dbColumnType="TEXT";
ec_RM_formula_formula_formulaProdRepList_quickquery_info["mainMetarial.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULAS,MAIN_METARIAL-productName";
ec_RM_formula_formula_formulaProdRepList_quickquery_info["mainMetarial.productName"].columnName="PRODUCT_NAME";
ec_RM_formula_formula_formulaProdRepList_quickquery_info["mainMetarial.id"]={};
ec_RM_formula_formula_formulaProdRepList_quickquery_info["mainMetarial.id"].dbColumnType="LONG";
ec_RM_formula_formula_formulaProdRepList_quickquery_info["mainMetarial.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULAS,MAIN_METARIAL-productName";
ec_RM_formula_formula_formulaProdRepList_quickquery_info["mainMetarial.id"].columnName="PRODUCT_ID";
ec_RM_formula_formula_formulaProdRepList_quickquery_info["code"]={};
ec_RM_formula_formula_formulaProdRepList_quickquery_info["code"].dbColumnType="BAPCODE";
ec_RM_formula_formula_formulaProdRepList_quickquery_info["code"].layRec="code";
ec_RM_formula_formula_formulaProdRepList_quickquery_info["code"].columnName="CODE";
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
 	var advRemainDialog = $('[id="RM.formula.formula.formulaProdRepList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.formula.formula.formulaProdRepList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formula_formulaProdRepList_adv_queryForm" exportUrl="/RM/formula/formula/formulaProdRepList-pending.action">
							<#assign mainMetarial_productName_defaultValue  = ''>
									<#assign mainMetarial_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaProdRepList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=mainMetarial_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_mainMetarial_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULAS,MAIN_METARIAL-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="mainMetarial.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_mainMetarial.id" name="mainMetarial.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_mainMetarial.id"  isPrecise=true deValue="${mainMetarial_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="RM.formula.formula.formulaProdRepList._querycustomFunc('mainMetarial_productName')" name="mainMetarial.productName" id="adv_ec_RM_formula_formula_formulaProdRepList_queryForm_mainMetarial_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formula_formulaProdRepList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaProdRepList_adv_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="code" columnname="CODE" columntype="BAPCODE" name="code" fieldType="TEXTFIELD" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配方编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaProdRepList_adv_queryForm"  isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="RM.formula.formula.formulaProdRepList._querycustomFunc('code')" name="code" id="adv_ec_RM_formula_formula_formulaProdRepList_queryForm_code" displayFieldName="code" exp="equal"  classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260   currentViewCode="RM_7.5.0.0_formula_formulaProdRepList"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_RM_formula_formula_formulaProdRepList_adv_queryForm"  isPrecise=true  conditionfunc="RM.formula.formula.formulaProdRepList._querycustomFunc('code')" name="code" id="adv_ec_RM_formula_formula_formulaProdRepList_queryForm_code" displayFieldName="code" exp="equal"  classStyle="cui-noborder-input"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260  currentViewCode="RM_7.5.0.0_formula_formulaProdRepList"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign advanceCharge_defaultValue  = ''>
									<#assign advanceCharge_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formula_formulaProdRepList_adv_queryForm" code="RM_7.5.0.0_formula_Formula_advanceCharge" showFormat="SELECT" defaultValue=advanceCharge_defaultValue  divCode="RM_7.5.0.0_formula_Formula_advanceCharge_advanceCharge" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="advanceCharge" columnname="ADVANCE_CHARGE" columntype="BOOLEAN" name="advanceCharge" fieldType="SELECT" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										允许提前放料
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${advanceCharge_defaultValue!}" name="advanceCharge" id="adv_advanceCharge" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (advanceCharge_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (advanceCharge_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
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
			viewCode: 'RM_7.5.0.0_formula_formulaProdRepList',
			modelCode: 'RM_7.5.0.0_formula_Formula',
			modelName: 'Formula',
			formId: 'ec_RM_formula_formula_formulaProdRepList_queryForm',
			olddiv: 'RM.formula.formula.formulaProdRepList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.formula.formula.formulaProdRepList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_formulaProdRepList'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.formula.formula.formulaProdRepList.advquery'] #customquContent").html(html);
		 	$("[id='RM.formula.formula.formulaProdRepList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.formula.formula.formulaProdRepList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_formulaProdRepList'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.formula.formula.formulaProdRepList.advquery'] #customquContent").html(html);
			 $("[id='RM.formula.formula.formulaProdRepList.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.formula.formula.formulaProdRepList.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.formula.formula.formulaProdRepList.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.formula.formula.formulaProdRepList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.formula.formula.formulaProdRepList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.formula.formula.formulaProdRepList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.formula.formula.formulaProdRepList.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.formula.formula.formulaProdRepList.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.formula.formula.formulaProdRepList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.formula.formula.formulaProdRepList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.formula.formula.formulaProdRepList.advquery"] div.advConContent').css('height','130px');
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

<#assign datatable_firstLoad = false>
<#assign datatable_queryFunc = "RM.formula.formula.formulaProdRepList.query('goList')">
<#assign datatable_dataUrl = "/RM/formula/formula/formulaProdRepList-pending.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formula.formulaProdRepList.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formula/formulaProdRepList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_RM_formula_formula_formulaProdRepList_query" renderOverEvent="ec_RM_formula_formula_formulaProdRepList_RenderOverEvent" pageInitMethod="ec_RM_formula_formula_formulaProdRepList_PageInitMethod" modelCode="RM_7.5.0.0_formula_Formula" noPermissionKeys="tableNo,code,name,edition,product.productCode,product.productName,produceType,formulaType.name,usedFor,isForProduct,batchContral,batchFormulaCode,batchOverOnFinish,autoReportOnFinish,advanceCharge,feedCondition,state,startTime,endTime,isDafault,description" hidekeyPrefix="ec_RM_formula_formula_formulaProdRepList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formula_formulaProdRepList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="RM.formula.formula.formulaProdRepList.rowDblClick" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','pending.id','pending.deploymentId','pending.activityName','pending.bulkDealFlag','pending.processDescription','pending.processKey','pending.processVersion','pending.activityType','pending.processId','pending.openUrl','pending.userId','tableInfoId','status','produceType.id','usedFor.id','autoReportOnFinish.id','state.id','product.id','formulaType.id']" postData="&pending-beginDate=${pendingBeginDate!''}&pending-endDate=${pendingEndDate!''}&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="RM.formula.formula.formulaProdRepList.showErrorMsg"   >
		<#if isContainsWorkflow('RM_7.5.0.0_formula_formulaProdRepList')==true>
			<@operatebar operateType="FLOW" menuCode="${workFlowMenuCode!}" entityCode="RM_7.5.0.0_formula" businessParam="${businessParam!}" resultType="JSON" >
			</@operatebar>
		</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}formulaProdRepList_prodReplace_modify_RM_7.5.0.0_formula_formulaProdRepList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1540368363210')}||iconcls:modify||useInMore:false||onclick:
					productReplace()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="RM_7.5.0.0_formula_formulaProdRepList_BUTTON_prodReplace"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}formulaProdRepList_prodReplace_modify_RM_7.5.0.0_formula_formulaProdRepList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1540368363210')}||iconcls:modify||useInMore:false||onclick:
					productReplace()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
				
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
				
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=200   type="textfield"  click="function(cell){RM.formula.formula.formulaProdRepList.rowDblClick(null,cell);}"   showFormatFunc="" cssstyle="" />
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('RM.propertydisplayName.randon1488246312092')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487075823790')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign edition_displayDefaultType  = ''>
			<@datacolumn columnName="EDITION"    showFormat="TEXT" defaultDisplay="${edition_displayDefaultType!}"  key="edition"   label="${getText('RM.propertydisplayName.randon1487139592239')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign product_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${product_productCode_displayDefaultType!}"  key="product.productCode"   label="${getText('RM.propertydisplayName.radion201810241608001')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('RM.propertydisplayName.radion201810241608002')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign produceType_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCE_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${produceType_displayDefaultType!}"  key="produceType.value"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1487076555894')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign formulaType_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${formulaType_name_displayDefaultType!}"  key="formulaType.name"  hiddenCol=true label="${getText('RM.propertydisplayName.randon201810241612001')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign usedFor_displayDefaultType  = ''>
			<@datacolumn columnName="USED_FOR"    showFormat="SELECTCOMP" defaultDisplay="${usedFor_displayDefaultType!}"  key="usedFor.value"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1487076506987')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign isForProduct_displayDefaultType  = ''>
			<@datacolumn columnName="IS_FOR_PRODUCT"    showFormat="SELECT" defaultDisplay="${isForProduct_displayDefaultType!}"  key="isForProduct"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1487076528539')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign batchContral_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_CONTRAL"    showFormat="SELECT" defaultDisplay="${batchContral_displayDefaultType!}"  key="batchContral"   label="${getText('RM.propertydisplayName.randon1487076619868')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign batchFormulaCode_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_FORMULA_CODE"    showFormat="TEXT" defaultDisplay="${batchFormulaCode_displayDefaultType!}"  key="batchFormulaCode"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1508738820280')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchOverOnFinish_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_OVER_ON_FINISH"    showFormat="SELECT" defaultDisplay="${batchOverOnFinish_displayDefaultType!}"  key="batchOverOnFinish"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1539746774380')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign autoReportOnFinish_displayDefaultType  = ''>
			<@datacolumn columnName="AUTO_REPORT_ON_FINISH"    showFormat="SELECTCOMP" defaultDisplay="${autoReportOnFinish_displayDefaultType!}"  key="autoReportOnFinish.value"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1539745697761')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign advanceCharge_displayDefaultType  = ''>
			<@datacolumn columnName="ADVANCE_CHARGE"    showFormat="SELECT" defaultDisplay="${advanceCharge_displayDefaultType!}"  key="advanceCharge"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1539745679956')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign feedCondition_displayDefaultType  = ''>
			<@datacolumn columnName="FEED_CONDITION"    showFormat="TEXT" defaultDisplay="${feedCondition_displayDefaultType!}"  key="feedCondition"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1539745761905')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign state_displayDefaultType  = ''>
			<@datacolumn columnName="STATE"    showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1490010654922')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn columnName="START_TIME"    showFormat="YMD_HM" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1489480645731')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn columnName="END_TIME"    showFormat="YMD_HM" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1489480749505')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign isDafault_displayDefaultType  = ''>
			<@datacolumn columnName="IS_DAFAULT"    showFormat="CHECKBOX" defaultDisplay="${isDafault_displayDefaultType!}"  key="isDafault"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1487076833537')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("RM_7.5.0.0_formula_Formula", "RM_7.5.0.0_formula_formulaProdRepList", "LIST", "formula")>
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
			<#assign description_displayDefaultType  = ''>
			<@datacolumn columnName="DESCRIPTION"    showFormat="TEXT" defaultDisplay="${description_displayDefaultType!}"  key="description"   label="${getText('RM.propertydisplayName.randon1487076858348')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
		<@datacolumn key="pending.taskDescription" sortable=false label="${getText('ec.list.taskDescription')}"  width=120/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formula_formulaProdRepList_RenderOverEvent(){
//ec_RM_formula_formula_formulaProdRepList_queryWidget._sortSet(true,false);
//完整配方根据状态进行演示区分
var tableObj = document.getElementById("ec_RM_formula_formula_formulaProdRepList_query_tbody");
										

//数据颜色
for (var i = 0; i < tableObj.rows.length; i++) { 
	//未启用
	if(ec_RM_formula_formula_formulaProdRepList_queryWidget.getAllRows()[i].state.id=="RMstate/state1"){
		$("#ec_RM_formula_formula_formulaProdRepList_query_tbody td[name='ec_RM_formula_formula_formulaProdRepList_querystate.value']").eq(i).attr('style','background-color: #ffd861');
	}
	//已启用
	if(ec_RM_formula_formula_formulaProdRepList_queryWidget.getAllRows()[i].state.id=="RMstate/state2"){
		$("#ec_RM_formula_formula_formulaProdRepList_query_tbody td[name='ec_RM_formula_formula_formulaProdRepList_querystate.value']").eq(i).attr('style','background-color: #c4e7ff');
	}
	//已停用
	if(ec_RM_formula_formula_formulaProdRepList_queryWidget.getAllRows()[i].state.id=="RMstate/state3"){
		$("#ec_RM_formula_formula_formulaProdRepList_query_tbody td[name='ec_RM_formula_formula_formulaProdRepList_querystate.value']").eq(i).attr('style','background-color: #ff6b6b');
	}
}

var rowLength = ec_RM_formula_formula_formulaProdRepList_queryWidget.getRowLength()
for(var i = 0; i<rowLength; i++){
	//console.log(i);
	var querystatus = $("input[name='ec_RM_formula_formula_formulaProdRepList_querystatus']").eq(i).val();
	//console.log(querystatus);
	var activityName = $("input[name='ec_RM_formula_formula_formulaProdRepList_querypending.activityName']").eq(i).val();
	//console.log(activityName);
	if(querystatus == '88'){
		if(activityName == 'task345'){
			ec_RM_formula_formula_formulaProdRepList_queryWidget.setCellValue(i,"pending.taskDescription","编辑");
		}else{
			ec_RM_formula_formula_formulaProdRepList_queryWidget.setCellValue(i,"pending.taskDescription","批准");
		}	
	}else{
		ec_RM_formula_formula_formulaProdRepList_queryWidget.setCellValue(i,"pending.taskDescription","生效");
	}	
}
}
function ec_RM_formula_formula_formulaProdRepList_PageInitMethod(){
RM.formula.formula.formulaProdRepList.commonQuery('query')
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>