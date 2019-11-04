<script>
 $(function(){
 	var advRemainDialog = $('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery">
    <@errorbar id="adv_query_edit_column_2bar"></@errorbar>
    <div class="advConContent">
    <div <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_adv_queryForm" exportUrl="/WOM/inventoryRecords/inventoryRecord/itemEdit-query.action">
							<#assign batchText_defaultValue  = ''>
									<#assign batchText_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_adv_queryForm" code="WOM_7.5.0.0_inventoryRecords_InventoryDetail_batchText" showFormat="TEXT" defaultValue=batchText_defaultValue  divCode="WOM_7.5.0.0_inventoryRecords_InventoryDetail_batchText_batchText" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_inventoryRecords_InventoryDetail" layRec="batchText" columnname="BATCH_TEXT" columntype="TEXT" name="batchText" fieldType="TEXTFIELD" tableName="WOM_INVENTORY_DETAILS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_inventoryRecords_InventoryDetail" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchText" id="adv_batchText" value="${batchText_defaultValue!}" deValue="${batchText_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							
					   
	</div>
	</div>
	<div class="view-custom" style="border-top: 1px solid #E1E1E1;height:25px;">
	<div class="view-custom-div" style="float:left;margin-top:5px;cursor: pointer;" onclick="column_2changeCustomQuery();"><span class="view-custom-span" style="margin-left:5px;font-weight:bold;color:#0f78bc;">${getText('foundation.common.custom')}</span></div>
		<div class="move-grade" style="display:none;float:left;margin-top:5px;">
			<span class="custombtn downgrade" onclick="ec.advQuery.querycolumn_2._upgrade()"> ${getText('foundation.common.upgrade')}</span>
			<span class="custombtn upgrade" onclick="ec.advQuery.querycolumn_2._downgrade()">${getText('foundation.common.downgrade')}</span>
			<span class="custombtn upmove" onclick="ec.advQuery.querycolumn_2._moveUp()">${getText('foundation.common.up')}</span>
			<span class="custombtn downmove" onclick="ec.advQuery.querycolumn_2._moveDown()">${getText('foundation.common.down')}</span>
		</div>			
		<div style="float:right;margin-top:5px;"><span class="customQuery" onclick="column_2changeCustomQuery();"></span></div>
	</div>
	<div style=""><table id="advQueryLoading" style="width:100%;height:240px;text-align:center;"><tr><td><label class="advQuery-loading">${getText('foundation.common.data.waiting')}</label></td></tr></table></div>
	<div style="clear:both;display:none;" id="customquContent" class="customqu-content">		
	</div>	
</div>
<script type="text/javascript" language="javascript">
CUI.ns("ec.view.newAdvQuerycolumn_2");
ec.view.newAdvQuerycolumn_2._initNewAdvQuery=function(values){
		ec.advQuery.querycolumn_2 = new CUI.NewAdvQuery({
			elementId: 'advQueryContainer',
			env: 'runtime',
			viewCode: 'WOM_7.5.0.0_inventoryRecords_itemEdit',
			modelCode: 'WOM_7.5.0.0_inventoryRecords_InventoryDetail',
			modelName: 'InventoryDetail',
			formId: 'ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm',
			olddiv: 'WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery',
			values: values,
			dialogId:'dialog_WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery',
			layoutName: 'column_2'
		});
}

ec.view.newAdvQuerycolumn_2._customQuery= function(){
	$("[id='dialog_WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_inventoryRecords_itemEdit'+"&entity.code="+'WOM_7.5.0.0_inventoryRecords' + "&layoutName=" + 'column_2' +"&targetModel.code=" + 'WOM_7.5.0.0_inventoryRecords_InventoryDetail';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='dialog_WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery'] #customquContent").html(html);
		 	$("[id='dialog_WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuerycolumn_2._renderOverFlag=true;
}
function column_2customQuery(){
	$("[id='dialog_WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_inventoryRecords_itemEdit'+"&entity.code="+'WOM_7.5.0.0_inventoryRecords' + "&layoutName=" + 'column_2' +"&targetModel.code=" + 'WOM_7.5.0.0_inventoryRecords_InventoryDetail' + "&dialogId=" + 'dialog_WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='dialog_WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery'] #customquContent").html(html);
			 $("[id='dialog_WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery'] #advQueryLoading").hide();
		 }
	});
	ec.advQuerycolumn_2._renderOverFlag=true;
}
var column_2showType = "down";
var column_2onceOpen = false;		//标识自定义查询是否加载过，避免重复加载
var column_2showType_result = "down";
//点击自定义查询按钮后，展示自定义 查询or隐藏自定义查询
function column_2changeCustomQuery(){
	if(column_2showType == "up"){
		$('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] div.advConContent').css('height','400px');		
		column_2showType = "down";
	}else{
		$('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery"] div.advConContent').css('height','130px');
		if(!column_2onceOpen){
			column_2customQuery();
			column_2onceOpen = true;
		}
		column_2showType = "up";
	}
}
//点击预览方案按钮后，展示预览方案or隐藏预览方案
function column_2changeCustomQueryResult(){
	if(column_2showType_result == "down"){
		$('div.customquery_column').css('display','none');
		// $('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -185px no-repeat');
		$('span.customQuery_preview_result').removeClass("customQuery_preview_result_up").addClass("customQuery_preview_result_down");
		$('div.customQuery_cond').css('display','block');
		ec.advQuery.querycolumn_2.getViewResult();
		column_2showType_result = "up";
	}else{			
		$('div.customquery_column').css('display','block');
		$('div.customquery_column').css('height','240px');
		// $('span.customQuery_preview_result').css('background','url("/bap/struts/css/icon_adv.png") 0 -204px no-repeat');
		$('span.customQuery_preview_result').removeClass("customQuery_preview_result_down").addClass("customQuery_preview_result_up");				
		$('div.customQuery_cond').css('display','none');
		column_2showType_result = "down";
	}
}
function column_2changeObject(obj){		
	if($(obj).parent().next().css('display')=='block'){
		$(obj).css('background','url("/bap/struts/css/icon_adv.png") 0 -124px no-repeat');
		$(obj).parent().next().css('display','none');
	}else{
		$(obj).css('background','url("/bap/struts/css/icon_adv.png") 0 -40px no-repeat');
		$(obj).parent().next().css('display','block');
	}			
}
</script> 	
	<@newAdvQueryJs viewCode='WOM_7.5.0.0_inventoryRecords_itemEdit' idprefix='ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2' queryUrl='' queryFunc="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2commonQuery" ns="WOM.inventoryRecords.inventoryRecord.itemEdit" layoutName="column_2" />
