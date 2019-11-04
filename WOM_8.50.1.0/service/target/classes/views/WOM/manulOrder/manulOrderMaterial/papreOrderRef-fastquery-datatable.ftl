	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1563192160390')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" exportUrl="/WOM/manulOrder/manulOrderMaterial/papreOrderRef-query.action">
		<input type="hidden" reset="false" name="WOM_manulOrder_manulOrderMaterial_papreOrderRef_condition" id="WOM_manulOrder_manulOrderMaterial_papreOrderRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1563193064716')}_${getText('WOM.viewtitle.randon1564121344676')}.xls" />
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
		<div id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_manulOrder_papreOrderRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_manulOrder_papreOrderRef" formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" dataTableId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" isExpandAll=true formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" idprefix="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef" expandType="all"  fieldcodes="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum_materialBatchNum:WOM.propertydisplayName.randon1563254620511||MESBasic_1_wareMan_Ware_wareCode_ware_wareCode:MESBasic.propertydisplayName.randon1484031239866||MESBasic_1_product_Product_productCode_material_productCode:MESBasic.propertydisplayName.radion1415772644833" > 
							<#assign materialBatchNum_defaultValue  = ''>
									<#assign materialBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum" showFormat="TEXT" defaultValue=materialBatchNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum_materialBatchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="materialBatchNum" id="materialBatchNum" value="${materialBatchNum_defaultValue!}" deValue="${materialBatchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign ware_wareCode_defaultValue  = ''>
									<#assign ware_wareCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=ware_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_ware_wareCode" isCustomize=true style="" > 
										<input type="hidden" id="ware.id" name="ware.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${ware_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.manulOrder.manulOrderMaterial.papreOrderRef._querycustomFunc('ware_wareCode')" name="ware.wareCode" id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm_ware_wareCode" displayFieldName="wareCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" searchClick="WOM.manulOrder.manulOrderMaterial.papreOrderRef.commonQuery('query')"   />
							</@queryfield>
							<#assign material_productCode_defaultValue  = ''>
									<#assign material_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=material_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_material_productCode" isCustomize=true style="" > 
										<input type="hidden" id="material.id" name="material.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${material_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.manulOrder.manulOrderMaterial.papreOrderRef._querycustomFunc('material_productCode')" name="material.productCode" id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm_material_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" searchClick="WOM.manulOrder.manulOrderMaterial.papreOrderRef.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" type="adv" onclick="WOM.manulOrder.manulOrderMaterial.papreOrderRef.commonQuery('query')" onadvancedclick="advQuery('WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info={};
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["MainTableName"]="WOM_MENUL_ORDER_MATERIAL";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["materialBatchNum"]={};
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["materialBatchNum"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["materialBatchNum"].layRec="materialBatchNum";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["materialBatchNum"].columnName="MATERIAL_BATCH_NUM";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["ware.wareCode"]={};
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["ware.wareCode"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["ware.wareCode"].layRec="MATERIAL_WARES,ID,WOM_MENUL_ORDER_MATERIAL,WARE-wareCode";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["ware.wareCode"].columnName="WARE_CODE";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["ware.id"]={};
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["ware.id"].dbColumnType="LONG";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["ware.id"].layRec="MATERIAL_WARES,ID,WOM_MENUL_ORDER_MATERIAL,WARE-wareCode";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["ware.id"].columnName="ID";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["material.productCode"]={};
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["material.productCode"].dbColumnType="TEXT";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["material.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MENUL_ORDER_MATERIAL,MATERIAL-productCode";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["material.productCode"].columnName="PRODUCT_CODE";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["material.id"]={};
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["material.id"].dbColumnType="LONG";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["material.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MENUL_ORDER_MATERIAL,MATERIAL-productCode";
ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_quickquery_info["material.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_adv_queryForm" exportUrl="/WOM/manulOrder/manulOrderMaterial/papreOrderRef-query.action">
							<#assign ware_wareCode_defaultValue  = ''>
									<#assign ware_wareCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="SELECTCOMP" defaultValue=ware_wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_ware_wareCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="MATERIAL_WARES,ID,WOM_MENUL_ORDER_MATERIAL,WARE-wareCode" columnname="WARE_CODE" columntype="TEXT" name="ware.wareCode" fieldType="SELECTCOMP" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										仓库编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
										<input type="hidden" id="adv_ware.id" name="ware.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_ware.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${ware_wareCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="WOM.manulOrder.manulOrderMaterial.papreOrderRef._querycustomFunc('ware_wareCode')" name="ware.wareCode" id="adv_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm_ware_wareCode" displayFieldName="wareCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/wareMan/ware/wareRef.action"   refViewCode="MESBasic_1_wareMan_wareRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign material_productCode_defaultValue  = ''>
									<#assign material_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=material_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_material_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_MENUL_ORDER_MATERIAL,MATERIAL-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="material.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_material.id" name="material.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_material.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${material_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.manulOrder.manulOrderMaterial.papreOrderRef._querycustomFunc('material_productCode')" name="material.productCode" id="adv_ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm_material_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign materialBatchNum_defaultValue  = ''>
									<#assign materialBatchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum" showFormat="TEXT" defaultValue=materialBatchNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial_materialBatchNum_materialBatchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" layRec="materialBatchNum" columnname="MATERIAL_BATCH_NUM" columntype="TEXT" name="materialBatchNum" fieldType="TEXTFIELD" tableName="WOM_MENUL_ORDER_MATERIAL"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										原料批次
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="materialBatchNum" id="adv_materialBatchNum" value="${materialBatchNum_defaultValue!}" deValue="${materialBatchNum_defaultValue!}"   exp="like" />
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
			viewCode: 'WOM_7.5.0.0_manulOrder_papreOrderRef',
			modelCode: 'WOM_7.5.0.0_manulOrder_ManulOrderMaterial',
			modelName: 'ManulOrderMaterial',
			formId: 'ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm',
			olddiv: 'WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_manulOrder_papreOrderRef'+"&entity.code="+'WOM_7.5.0.0_manulOrder';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_manulOrder_papreOrderRef'+"&entity.code="+'WOM_7.5.0.0_manulOrder';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.manulOrder.manulOrderMaterial.papreOrderRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.manulOrder.manulOrderMaterial.papreOrderRef.query('query')">
<#assign datatable_dataUrl = "/WOM/manulOrder/manulOrderMaterial/papreOrderRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query" renderOverEvent="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_RenderOverEvent" pageInitMethod="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_PageInitMethod" modelCode="WOM_7.5.0.0_manulOrder_ManulOrderMaterial" noPermissionKeys="material.productCode,material.productName,material.unit,ware.wareCode,materialBatchNum" hidekeyPrefix="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.manulOrder.manulOrderMaterial.papreOrderRef.sendBackpapreOrderRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','material.id','ware.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.manulOrder.manulOrderMaterial.papreOrderRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign material_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${material_productCode_displayDefaultType!}"  key="material.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign material_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${material_productName_displayDefaultType!}"  key="material.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign material_unit_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT"    showFormat="TEXT" defaultDisplay="${material_unit_displayDefaultType!}"  key="material.unit"   label="${getText('MESBasic.propertydisplayName.radion1416221204854')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign ware_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${ware_wareCode_displayDefaultType!}"  key="ware.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign materialBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="MATERIAL_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${materialBatchNum_displayDefaultType!}"  key="materialBatchNum"   label="${getText('WOM.propertydisplayName.randon1563254620511')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_RenderOverEvent(){
}
function ec_WOM_manulOrder_manulOrderMaterial_papreOrderRef_PageInitMethod(){
}
	
	
	
	
	
</script>