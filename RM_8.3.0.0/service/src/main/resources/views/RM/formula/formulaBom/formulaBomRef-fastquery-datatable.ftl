	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_formula_formulaBom_formulaBomRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formulaBom_formulaBomRef_queryForm" exportUrl="/RM/formula/formulaBom/formulaBomRef-query.action">
		<input type="hidden" reset="false" name="RM_formula_formulaBom_formulaBomRef_condition" id="RM_formula_formulaBom_formulaBomRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487243065955')}_${getText('RM.viewtitle.randon1505786231333')}.xls" />
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
		<div id="ec_RM_formula_formulaBom_formulaBomRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_formula_formulaBom_formulaBomRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_formula_formulaBomRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_formula_formulaBomRef" formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" dataTableId="ec_RM_formula_formulaBom_formulaBomRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_formula_formulaBom_formulaBomRef_queryForm" isExpandAll=true formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" idprefix="ec_RM_formula_formulaBom_formulaBomRef" expandType="all"  fieldcodes="RM_7.5.0.0_formula_Formula_code_formulaId_code:RM.formula.randon1488246312092||MESBasic_1_product_Product_productCode_productId_productCode:RM.propertydisplayName.radion14157726448331||MESBasic_1_product_Product_productName_productId_productName:RM.propertydisplayName.radion14157727407371" > 
							<#assign formulaId_code_defaultValue  = ''>
									<#assign formulaId_code_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formulaId_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formulaId_code" isCustomize=true style="" > 
										<input type="hidden" id="formulaId.id" name="formulaId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="formulaId.code" id="formulaId.code" value="${formulaId_code_defaultValue!}" deValue="${formulaId_code_defaultValue!}"   exp="equal"/>
												</div>
							</@queryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="productId.productCode" id="productId.productCode" value="${productId_productCode_defaultValue!}" deValue="${productId_productCode_defaultValue!}"   exp="like"/>
												</div>
							</@queryfield>
							<#assign productId_productName_defaultValue  = ''>
									<#assign productId_productName_defaultValue  = ''>
							<@queryfield formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productId_productName" isCustomize=true style="" > 
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="productId.productName" id="productId.productName" value="${productId_productName_defaultValue!}" deValue="${productId_productName_defaultValue!}"   exp="like"/>
												</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" type="adv" onclick="RM.formula.formulaBom.formulaBomRef.commonQuery('query')" onadvancedclick="advQuery('RM.formula.formulaBom.formulaBomRef.advquery')" /> 
						 		<@querybutton formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["MainTableName"]="RM_FORMULA_BOMS";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.code"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.code"].dbColumnType="BAPCODE";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.code"].layRec="RM_FORMULAS,ID,RM_FORMULA_BOMS,FORMULA_ID-code";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.code"].columnName="CODE";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.id"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.id"].dbColumnType="LONG";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.id"].layRec="RM_FORMULAS,ID,RM_FORMULA_BOMS,FORMULA_ID-code";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.id"].columnName="ID";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productCode"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULA_BOMS,PRODUCT_ID-productCode";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULA_BOMS,PRODUCT_ID-productCode";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productName"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productName"].dbColumnType="TEXT";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULA_BOMS,PRODUCT_ID-productName";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productName"].columnName="PRODUCT_NAME";
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
 	var advRemainDialog = $('[id="RM.formula.formulaBom.formulaBomRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.formula.formulaBom.formulaBomRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formula_formulaBom_formulaBomRef_adv_queryForm" exportUrl="/RM/formula/formulaBom/formulaBomRef-query.action">
							<#assign formulaId_code_defaultValue  = ''>
									<#assign formulaId_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formulaBom_formulaBomRef_adv_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formulaId_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formulaId_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="RM_FORMULAS,ID,RM_FORMULA_BOMS,FORMULA_ID-code" columnname="CODE" columntype="BAPCODE" name="formulaId.code" fieldType="SELECTCOMP" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配方编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<input type="hidden" id="adv_formulaId.id" name="formulaId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="formulaId.code" id="adv_formulaId.code" value="${formulaId_code_defaultValue!}" deValue="${formulaId_code_defaultValue!}"   exp="equal" />
												</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formulaBom_formulaBomRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULA_BOMS,PRODUCT_ID-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="productId.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="productId.productCode" id="adv_productId.productCode" value="${productId_productCode_defaultValue!}" deValue="${productId_productCode_defaultValue!}"   exp="like" />
												</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productName_defaultValue  = ''>
									<#assign productId_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formula_formulaBom_formulaBomRef_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productId_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULA_BOMS,PRODUCT_ID-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="productId.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="productId.productName" id="adv_productId.productName" value="${productId_productName_defaultValue!}" deValue="${productId_productName_defaultValue!}"   exp="like" />
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
			viewCode: 'RM_7.5.0.0_formula_formulaBomRef',
			modelCode: 'RM_7.5.0.0_formula_FormulaBom',
			modelName: 'FormulaBom',
			formId: 'ec_RM_formula_formulaBom_formulaBomRef_queryForm',
			olddiv: 'RM.formula.formulaBom.formulaBomRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.formula.formulaBom.formulaBomRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_formulaBomRef'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.formula.formulaBom.formulaBomRef.advquery'] #customquContent").html(html);
		 	$("[id='RM.formula.formulaBom.formulaBomRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.formula.formulaBom.formulaBomRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formula_formulaBomRef'+"&entity.code="+'RM_7.5.0.0_formula';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.formula.formulaBom.formulaBomRef.advquery'] #customquContent").html(html);
			 $("[id='RM.formula.formulaBom.formulaBomRef.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.formula.formulaBom.formulaBomRef.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.formula.formulaBom.formulaBomRef.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.formula.formulaBom.formulaBomRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.formula.formulaBom.formulaBomRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.formula.formulaBom.formulaBomRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.formula.formulaBom.formulaBomRef.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.formula.formulaBom.formulaBomRef.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.formula.formulaBom.formulaBomRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.formula.formulaBom.formulaBomRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.formula.formulaBom.formulaBomRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.formula.formulaBom.formulaBomRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaBom/formulaBomRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaBom.formulaBomRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaBom/formulaBomRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_formula_formulaBom_formulaBomRef_query" renderOverEvent="ec_RM_formula_formulaBom_formulaBomRef_RenderOverEvent" pageInitMethod="ec_RM_formula_formulaBom_formulaBomRef_PageInitMethod" modelCode="RM_7.5.0.0_formula_FormulaBom" noPermissionKeys="formulaId.code,productId.productCode,productId.productName,property,unitQuality,productId.productBaseUnit.name,isMixQuality,phase,sequence,needWeigh,minQuality,maxQuality,lossRate,meno" hidekeyPrefix="ec_RM_formula_formulaBom_formulaBomRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.formula.formulaBom.formulaBomRef.sendBackformulaBomRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','property.id','formulaId.id','productId.id','productId.productBaseUnit.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.formula.formulaBom.formulaBomRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign formulaId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${formulaId_code_displayDefaultType!}"  key="formulaId.code"  hiddenCol=true label="${getText('RM.formula.randon1488246312092')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('RM.propertydisplayName.radion14157726448331')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('RM.propertydisplayName.radion14157727407371')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign property_displayDefaultType  = ''>
			<@datacolumn columnName="PROPERTY"    showFormat="SELECTCOMP" defaultDisplay="${property_displayDefaultType!}"  key="property.value"   label="${getText('RM.propertydisplayName.randon1490010423584')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign unitQuality_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_QUALITY"    showFormat="TEXT" defaultDisplay="${unitQuality_displayDefaultType!}"  key="unitQuality"   label="${getText('RM.propertydisplayName.randon14872431390911')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign productId_productBaseUnit_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productBaseUnit_name_displayDefaultType!}"  key="productId.productBaseUnit.name"   label="${getText('RM.propertydisplayName.radion139823564048323')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign isMixQuality_displayDefaultType  = ''>
			<@datacolumn columnName="IS_MIX_QUALITY"    showFormat="SELECT" defaultDisplay="${isMixQuality_displayDefaultType!}"  key="isMixQuality"   label="${getText('RM.propertydisplayName.randon1488852241781')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign phase_displayDefaultType  = ''>
			<@datacolumn columnName="PHASE"    showFormat="TEXT" defaultDisplay="${phase_displayDefaultType!}"  key="phase"   label="${getText('RM.propertydisplayName.randon1503477430704')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign sequence_displayDefaultType  = ''>
			<@datacolumn columnName="SEQUENCE"    showFormat="TEXT" defaultDisplay="${sequence_displayDefaultType!}"  key="sequence"   label="${getText('RM.propertydisplayName.randon1503477288458')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign needWeigh_displayDefaultType  = ''>
			<@datacolumn columnName="NEED_WEIGH"    showFormat="SELECT" defaultDisplay="${needWeigh_displayDefaultType!}"  key="needWeigh"   label="${getText('RM.propertydisplayName.randon150347726245811123123')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign minQuality_displayDefaultType  = ''>
			<@datacolumn columnName="MIN_QUALITY"    showFormat="TEXT" defaultDisplay="${minQuality_displayDefaultType!}"  key="minQuality"   label="${getText('RM.propertydisplayName.randon1488852437576')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign maxQuality_displayDefaultType  = ''>
			<@datacolumn columnName="MAX_QUALITY"    showFormat="TEXT" defaultDisplay="${maxQuality_displayDefaultType!}"  key="maxQuality"   label="${getText('RM.propertydisplayName.randon1488852460357')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign lossRate_displayDefaultType  = ''>
			<@datacolumn columnName="LOSS_RATE"    showFormat="TEXT" defaultDisplay="${lossRate_displayDefaultType!}"  key="lossRate"   label="${getText('RM.propertydisplayName.randon1491544403180')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("RM_7.5.0.0_formula_FormulaBom", "RM_7.5.0.0_formula_formulaBomRef", "LIST", "formulaBom")>
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
			<@datacolumn columnName="MENO"    showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('RM.propertydisplayName.randon1488852483896')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formulaBom_formulaBomRef_RenderOverEvent(){
}
function ec_RM_formula_formulaBom_formulaBomRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>