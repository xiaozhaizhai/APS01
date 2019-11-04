	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415772266801')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_product_productCost_productCostList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_productCost_productCostList_queryForm" exportUrl="/MESBasic/product/productCost/productCostList-query.action">
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1471523790726')}_${getText('MESBasic.viewtitle.randon1471525993688')}.xls" />
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
		<div id="ec_MESBasic_product_productCost_productCostList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_product_productCost_productCostList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_product_productCostList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_product_productCostList" formId="ec_MESBasic_product_productCost_productCostList_queryForm" dataTableId="ec_MESBasic_product_productCost_productCostList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_product_productCost_productCostList_queryForm" isExpandAll=true formId="ec_MESBasic_product_productCost_productCostList_queryForm" idprefix="ec_MESBasic_product_productCost_productCostList" expandType="all"  fieldcodes="MESBasic_1_product_ProductCost_inputTime_inputTime:MESBasic.propertydisplayName.randon1471523968472" > 
							<#assign inputTime_defaultValue  = ''>
									<#assign inputTime_defaultValue  = ''>
								<#if (inputTime_defaultValue)?? &&(inputTime_defaultValue)?has_content>
									<#assign inputTime_defaultValue  = getDefaultDateTime(inputTime_defaultValue!)?date>
								</#if>
							<@queryfield formId="ec_MESBasic_product_productCost_productCostList_queryForm" code="MESBasic_1_product_ProductCost_inputTime" showFormat="YMD" defaultValue=inputTime_defaultValue  divCode="MESBasic_1_product_ProductCost_inputTime_inputTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker yearChangeMonthLink="01" cssClass="cui-noborder-input" type="date" name="inputTime_start" id="inputTime_start" exp="gequal"   formid="ec_MESBasic_product_productCost_productCostList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker yearChangeMonthLink="12" cssClass="cui-noborder-input" type="date" name="inputTime_end" id="inputTime_end" exp="lequal"   formid="ec_MESBasic_product_productCost_productCostList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_product_productCost_productCostList_queryForm" type="adv" onclick="MESBasic.product.productCost.productCostList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.product.productCost.productCostList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_product_productCost_productCostList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_product_productCost_productCostList_quickquery_info={};
ec_MESBasic_product_productCost_productCostList_quickquery_info["MainTableName"]="S2BASE_PRODUCTCOST";
ec_MESBasic_product_productCost_productCostList_quickquery_info["inputTime"]={};
ec_MESBasic_product_productCost_productCostList_quickquery_info["inputTime"].dbColumnType="DATE";
ec_MESBasic_product_productCost_productCostList_quickquery_info["inputTime"].layRec="inputTime";
ec_MESBasic_product_productCost_productCostList_quickquery_info["inputTime"].columnName="PC_INPUTTIME";
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
 	var advRemainDialog = $('[id="MESBasic.product.productCost.productCostList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.product.productCost.productCostList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_productCost_productCostList_adv_queryForm" exportUrl="/MESBasic/product/productCost/productCostList-query.action">
							<#assign inputTime_defaultValue  = ''>
									<#assign inputTime_defaultValue  = ''>
								<#if (inputTime_defaultValue)?? &&(inputTime_defaultValue)?has_content>
									<#assign inputTime_defaultValue  = getDefaultDateTime(inputTime_defaultValue!)?date>
								</#if>
								<@advsqueryfield formId="ec_MESBasic_product_productCost_productCostList_adv_queryForm" code="MESBasic_1_product_ProductCost_inputTime" showFormat="YMD" defaultValue=inputTime_defaultValue  divCode="MESBasic_1_product_ProductCost_inputTime_inputTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_ProductCost" layRec="inputTime" columnname="PC_INPUTTIME" columntype="DATE" name="inputTime" fieldType="DATE" showFormat="YMD" tableName="S2BASE_PRODUCTCOST"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										更新时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_ProductCost" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${inputTime_defaultValue!}" deValue="${inputTime_defaultValue!}"  name="inputTime_start" id="adv_inputTime_start" exp="gequal"    formid="ec_MESBasic_product_productCost_productCostList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${inputTime_defaultValue!}" deValue="${inputTime_defaultValue!}"  name="inputTime_end" id="adv_inputTime_end" exp="lequal"    formid="ec_MESBasic_product_productCost_productCostList_adv_queryForm" />
							  		</div>
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
			viewCode: 'MESBasic_1_product_productCostList',
			modelCode: 'MESBasic_1_product_ProductCost',
			modelName: 'ProductCost',
			formId: 'ec_MESBasic_product_productCost_productCostList_queryForm',
			olddiv: 'MESBasic.product.productCost.productCostList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.product.productCost.productCostList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_product_productCostList'+"&entity.code="+'MESBasic_1_product';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.product.productCost.productCostList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.product.productCost.productCostList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.product.productCost.productCostList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_product_productCostList'+"&entity.code="+'MESBasic_1_product';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.product.productCost.productCostList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.product.productCost.productCostList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.product.productCost.productCostList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.product.productCost.productCostList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.product.productCost.productCostList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.product.productCost.productCostList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.product.productCost.productCostList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.product.productCost.productCostList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.product.productCost.productCostList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.product.productCost.productCostList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.product.productCost.productCostList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.product.productCost.productCostList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.product.productCost.productCostList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/product/productCost/productCostList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_product_productCost_productCostList_query" renderOverEvent="ec_MESBasic_product_productCost_productCostList_RenderOverEvent" pageInitMethod="ec_MESBasic_product_productCost_productCostList_PageInitMethod" modelCode="MESBasic_1_product_ProductCost" noPermissionKeys="baptype,cost,inputTime,inputStaffID.name,cmemo,typeS2" hidekeyPrefix="ec_MESBasic_product_productCost_productCostList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_product_productCost_productCostList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.product.productCost.productCostList.dbClickViewproductCostList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','baptype.id','inputStaffID.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.product.productCost.productCostList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign baptype_displayDefaultType  = ''>
			<@datacolumn columnName="PC_BAPTYPE"    showFormat="SELECTCOMP" defaultDisplay="${baptype_displayDefaultType!}"  key="baptype.value"   label="${getText('MESBasic.propertydisplayName.randon1471524402974')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign cost_displayDefaultType  = ''>
			<@datacolumn columnName="PC_COST"    showFormat="TEXT" defaultDisplay="${cost_displayDefaultType!}"  key="cost"   label="${getText('MESBasic.propertydisplayName.randon1471524021446')}" textalign="right" decimal="4" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign inputTime_displayDefaultType  = ''>
			<@datacolumn columnName="PC_INPUTTIME"    showFormat="YMD" defaultDisplay="${inputTime_displayDefaultType!}"  key="inputTime"   label="${getText('MESBasic.propertydisplayName.randon1471523968472')}" textalign="center"  width=150   type="date"    showFormatFunc="" cssstyle="" />
			<#assign inputStaffID_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${inputStaffID_name_displayDefaultType!}"  key="inputStaffID.name"   label="${getText('MESBasic.staff.dimissionStaff_xls.staffName09')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign cmemo_displayDefaultType  = ''>
			<@datacolumn columnName="PC_MEMO"    showFormat="TEXT" defaultDisplay="${cmemo_displayDefaultType!}"  key="cmemo" order=false  label="${getText('MESBasic.propertydisplayName.randon1471524127027')}" textalign="left"  width=300   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign typeS2_displayDefaultType  = ''>
			<@datacolumn columnName="PC_TYPE"    showFormat="TEXT" defaultDisplay="${typeS2_displayDefaultType!}"  key="typeS2"   label="${getText('MESBasic.propertydisplayName.randon1471524475224')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_product_productCost_productCostList_RenderOverEvent(){
}
function ec_MESBasic_product_productCost_productCostList_PageInitMethod(){
}
	
	
	
	
	
	
</script>