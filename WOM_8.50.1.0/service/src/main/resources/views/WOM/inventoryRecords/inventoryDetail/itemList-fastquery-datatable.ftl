	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1566887979029')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" exportUrl="/WOM/inventoryRecords/inventoryDetail/itemList-query.action">
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1566888284025')}_${getText('WOM.viewtitle.randon1566809576776')}.xls" />
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
		<div id="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_inventoryRecords_itemList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_inventoryRecords_itemList" formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" dataTableId="ec_WOM_inventoryRecords_inventoryDetail_itemList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" isExpandAll=true formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" idprefix="ec_WOM_inventoryRecords_inventoryDetail_itemList" expandType="all"  fieldcodes="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrder_manulOrderNum:WOM.propertydisplayName.randon1563193157341||MESBasic_1_product_Product_productName_material_productName:MESBasic.propertydisplayName.radion1415772740737" > 
							<#assign manulOrder_manulOrderNum_defaultValue  = ''>
									<#assign manulOrder_manulOrderNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum" showFormat="SELECTCOMP" defaultValue=manulOrder_manulOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrder_manulOrderNum" isCustomize=true style="" > 
										<input type="hidden" id="manulOrder.id" name="manulOrder.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${manulOrder_manulOrderNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1563350015905')}"  conditionfunc="WOM.inventoryRecords.inventoryDetail.itemList._querycustomFunc('manulOrder_manulOrderNum')" name="manulOrder.manulOrderNum" id="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm_manulOrder_manulOrderNum" displayFieldName="manulOrderNum" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/manulOrder/manulOrderMain/manulOrdersRef.action"   refViewCode="WOM_7.5.0.0_manulOrder_manulOrdersRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" searchClick="WOM.inventoryRecords.inventoryDetail.itemList.commonQuery('query')"   />
							</@queryfield>
							<#assign material_productName_defaultValue  = ''>
									<#assign material_productName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=material_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_material_productName" isCustomize=true style="" > 
										<input type="hidden" id="material.id" name="material.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${material_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.inventoryRecords.inventoryDetail.itemList._querycustomFunc('material_productName')" name="material.productName" id="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm_material_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" searchClick="WOM.inventoryRecords.inventoryDetail.itemList.commonQuery('query')"   />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" type="adv" onclick="WOM.inventoryRecords.inventoryDetail.itemList.commonQuery('query')" onadvancedclick="advQuery('WOM.inventoryRecords.inventoryDetail.itemList.advquery')" /> 
						 		<@querybutton formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info={};
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["MainTableName"]="WOM_INVENTORY_DETAILS";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["manulOrder.manulOrderNum"]={};
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["manulOrder.manulOrderNum"].dbColumnType="TEXT";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["manulOrder.manulOrderNum"].layRec="WOM_MENUL_ORDER_MAIN,ID,WOM_INVENTORY_DETAILS,MANUL_ORDER-manulOrderNum";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["manulOrder.manulOrderNum"].columnName="MANUL_ORDER_NUM";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["manulOrder.id"]={};
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["manulOrder.id"].dbColumnType="LONG";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["manulOrder.id"].layRec="WOM_MENUL_ORDER_MAIN,ID,WOM_INVENTORY_DETAILS,MANUL_ORDER-manulOrderNum";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["manulOrder.id"].columnName="ID";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["material.productName"]={};
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["material.productName"].dbColumnType="TEXT";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["material.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_INVENTORY_DETAILS,MATERIAL-productName";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["material.productName"].columnName="PRODUCT_NAME";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["material.id"]={};
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["material.id"].dbColumnType="LONG";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["material.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_INVENTORY_DETAILS,MATERIAL-productName";
ec_WOM_inventoryRecords_inventoryDetail_itemList_quickquery_info["material.id"].columnName="PRODUCT_ID";
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
 	var advRemainDialog = $('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.inventoryRecords.inventoryDetail.itemList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_inventoryRecords_inventoryDetail_itemList_adv_queryForm" exportUrl="/WOM/inventoryRecords/inventoryDetail/itemList-query.action">
							<#assign manulOrder_manulOrderNum_defaultValue  = ''>
									<#assign manulOrder_manulOrderNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_adv_queryForm" code="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum" showFormat="SELECTCOMP" defaultValue=manulOrder_manulOrderNum_defaultValue  divCode="WOM_7.5.0.0_manulOrder_ManulOrderMain_manulOrderNum_manulOrder_manulOrderNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" layRec="WOM_MENUL_ORDER_MAIN,ID,WOM_INVENTORY_DETAILS,MANUL_ORDER-manulOrderNum" columnname="MANUL_ORDER_NUM" columntype="TEXT" name="manulOrder.manulOrderNum" fieldType="SELECTCOMP" tableName="WOM_MENUL_ORDER_MAIN"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产订单号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_manulOrder_ManulOrderMain" />
										<input type="hidden" id="adv_manulOrder.id" name="manulOrder.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_manulOrder.id"  isPrecise=true deValue="${manulOrder_manulOrderNum_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1563350015905')}"  conditionfunc="WOM.inventoryRecords.inventoryDetail.itemList._querycustomFunc('manulOrder_manulOrderNum')" name="manulOrder.manulOrderNum" id="adv_ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm_manulOrder_manulOrderNum" displayFieldName="manulOrderNum" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/manulOrder/manulOrderMain/manulOrdersRef.action"   refViewCode="WOM_7.5.0.0_manulOrder_manulOrdersRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign material_productName_defaultValue  = ''>
									<#assign material_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=material_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_material_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_INVENTORY_DETAILS,MATERIAL-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="material.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_material.id" name="material.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_material.id"  isPrecise=true deValue="${material_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  conditionfunc="WOM.inventoryRecords.inventoryDetail.itemList._querycustomFunc('material_productName')" name="material.productName" id="adv_ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm_material_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/customRef.action"   refViewCode="MESBasic_1_product_customRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_adv_queryForm"   />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_inventoryRecords_itemList',
			modelCode: 'WOM_7.5.0.0_inventoryRecords_InventoryDetail',
			modelName: 'InventoryDetail',
			formId: 'ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm',
			olddiv: 'WOM.inventoryRecords.inventoryDetail.itemList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.inventoryRecords.inventoryDetail.itemList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_inventoryRecords_itemList'+"&entity.code="+'WOM_7.5.0.0_inventoryRecords';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.inventoryRecords.inventoryDetail.itemList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.inventoryRecords.inventoryDetail.itemList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.inventoryRecords.inventoryDetail.itemList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_inventoryRecords_itemList'+"&entity.code="+'WOM_7.5.0.0_inventoryRecords';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.inventoryRecords.inventoryDetail.itemList.advquery'] #customquContent").html(html);
			 $("[id='WOM.inventoryRecords.inventoryDetail.itemList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.inventoryRecords.inventoryDetail.itemList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.inventoryRecords.inventoryDetail.itemList.query('query')">
<#assign datatable_dataUrl = "/WOM/inventoryRecords/inventoryDetail/itemList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_inventoryRecords_inventoryDetail_itemList_query" renderOverEvent="ec_WOM_inventoryRecords_inventoryDetail_itemList_RenderOverEvent" pageInitMethod="ec_WOM_inventoryRecords_inventoryDetail_itemList_PageInitMethod" modelCode="WOM_7.5.0.0_inventoryRecords_InventoryDetail" noPermissionKeys="manulOrder.manulOrderNum,material.productName,material.productCode,batchText,wareID.wareName,onhand,material.storeUnit.name" hidekeyPrefix="ec_WOM_inventoryRecords_inventoryDetail_itemList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_inventoryRecords_inventoryDetail_itemList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.inventoryRecords.inventoryDetail.itemList.dbClickViewitemList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','manulOrder.id','material.id','wareID.id','material.storeUnit.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.inventoryRecords.inventoryDetail.itemList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign manulOrder_manulOrderNum_displayDefaultType  = ''>
			<@datacolumn columnName="MANUL_ORDER_NUM"    showFormat="TEXT" defaultDisplay="${manulOrder_manulOrderNum_displayDefaultType!}"  key="manulOrder.manulOrderNum"   label="${getText('WOM.propertydisplayName.randon1563193157341')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign material_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${material_productName_displayDefaultType!}"  key="material.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign material_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${material_productCode_displayDefaultType!}"  key="material.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchText_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_TEXT"    showFormat="TEXT" defaultDisplay="${batchText_displayDefaultType!}"  key="batchText"   label="${getText('WOM.propertyshowName.randon1566867607924.flag')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('WOM.propertyshowName.randon1566867588172.flag')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign onhand_displayDefaultType  = ''>
			<@datacolumn columnName="ONHAND"    showFormat="TEXT" defaultDisplay="${onhand_displayDefaultType!}"  key="onhand"   label="${getText('WOM.propertydisplayName.randon1566803719573')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign material_storeUnit_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${material_storeUnit_name_displayDefaultType!}"  key="material.storeUnit.name"   label="${getText('WOM.propertyshowName.randon1566809784054.flag')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_inventoryRecords_inventoryDetail_itemList_RenderOverEvent(){
}
function ec_WOM_inventoryRecords_inventoryDetail_itemList_PageInitMethod(){
}
	
	
	
	
	
	
	
</script>