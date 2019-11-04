	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415772266801')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_product_prodDealInfo_modifyList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_prodDealInfo_modifyList_queryForm" exportUrl="/MESBasic/product/prodDealInfo/modifyList-query.action">
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1470380231866')}_${getText('MESBasic.viewtitle.randon1471525552594')}.xls" />
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
		<div id="ec_MESBasic_product_prodDealInfo_modifyList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_product_prodDealInfo_modifyList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_product_modifyList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_product_modifyList" formId="ec_MESBasic_product_prodDealInfo_modifyList_queryForm" dataTableId="ec_MESBasic_product_prodDealInfo_modifyList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_product_prodDealInfo_modifyList_queryForm" isExpandAll=true formId="ec_MESBasic_product_prodDealInfo_modifyList_queryForm" idprefix="ec_MESBasic_product_prodDealInfo_modifyList" expandType="all"  fieldcodes="MESBasic_1_product_ProdDealInfo_dealTime_dealTime:MESBasic.propertydisplayName.randon1470380397891" > 
							<#assign dealTime_defaultValue  = ''>
									<#assign dealTime_defaultValue  = ''>
								<#if (dealTime_defaultValue)?? &&(dealTime_defaultValue)?has_content>
									<#assign dealTime_defaultValue  = getDefaultDateTime(dealTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_MESBasic_product_prodDealInfo_modifyList_queryForm" code="MESBasic_1_product_ProdDealInfo_dealTime" showFormat="YMD_HMS" defaultValue=dealTime_defaultValue  divCode="MESBasic_1_product_ProdDealInfo_dealTime_dealTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="dealTime_start" id="dealTime_start" exp="gequal"   formid="ec_MESBasic_product_prodDealInfo_modifyList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="dealTime_end" id="dealTime_end" exp="lequal"   formid="ec_MESBasic_product_prodDealInfo_modifyList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_product_prodDealInfo_modifyList_queryForm" type="adv" onclick="MESBasic.product.prodDealInfo.modifyList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.product.prodDealInfo.modifyList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_product_prodDealInfo_modifyList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_product_prodDealInfo_modifyList_quickquery_info={};
ec_MESBasic_product_prodDealInfo_modifyList_quickquery_info["MainTableName"]="S2BASE_PRODDEALINFO";
ec_MESBasic_product_prodDealInfo_modifyList_quickquery_info["dealTime"]={};
ec_MESBasic_product_prodDealInfo_modifyList_quickquery_info["dealTime"].dbColumnType="DATETIME";
ec_MESBasic_product_prodDealInfo_modifyList_quickquery_info["dealTime"].layRec="dealTime";
ec_MESBasic_product_prodDealInfo_modifyList_quickquery_info["dealTime"].columnName="PDI_DEALTIME";
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
 	var advRemainDialog = $('[id="MESBasic.product.prodDealInfo.modifyList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.product.prodDealInfo.modifyList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_product_prodDealInfo_modifyList_adv_queryForm" exportUrl="/MESBasic/product/prodDealInfo/modifyList-query.action">
							<#assign dealTime_defaultValue  = ''>
									<#assign dealTime_defaultValue  = ''>
								<#if (dealTime_defaultValue)?? &&(dealTime_defaultValue)?has_content>
									<#assign dealTime_defaultValue  = getDefaultDateTime(dealTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_MESBasic_product_prodDealInfo_modifyList_adv_queryForm" code="MESBasic_1_product_ProdDealInfo_dealTime" showFormat="YMD_HMS" defaultValue=dealTime_defaultValue  divCode="MESBasic_1_product_ProdDealInfo_dealTime_dealTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_ProdDealInfo" layRec="dealTime" columnname="PDI_DEALTIME" columntype="DATETIME" name="dealTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="S2BASE_PRODDEALINFO"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										维护时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_ProdDealInfo" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${dealTime_defaultValue!}" deValue="${dealTime_defaultValue!}"  name="dealTime_start" id="adv_dealTime_start" exp="gequal"    formid="ec_MESBasic_product_prodDealInfo_modifyList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${dealTime_defaultValue!}" deValue="${dealTime_defaultValue!}"  name="dealTime_end" id="adv_dealTime_end" exp="lequal"    formid="ec_MESBasic_product_prodDealInfo_modifyList_adv_queryForm" />
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
			viewCode: 'MESBasic_1_product_modifyList',
			modelCode: 'MESBasic_1_product_ProdDealInfo',
			modelName: 'ProdDealInfo',
			formId: 'ec_MESBasic_product_prodDealInfo_modifyList_queryForm',
			olddiv: 'MESBasic.product.prodDealInfo.modifyList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.product.prodDealInfo.modifyList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_product_modifyList'+"&entity.code="+'MESBasic_1_product';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.product.prodDealInfo.modifyList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.product.prodDealInfo.modifyList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.product.prodDealInfo.modifyList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_product_modifyList'+"&entity.code="+'MESBasic_1_product';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.product.prodDealInfo.modifyList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.product.prodDealInfo.modifyList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.product.prodDealInfo.modifyList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.product.prodDealInfo.modifyList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/product/prodDealInfo/modifyList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_product_prodDealInfo_modifyList_query" renderOverEvent="ec_MESBasic_product_prodDealInfo_modifyList_RenderOverEvent" pageInitMethod="ec_MESBasic_product_prodDealInfo_modifyList_PageInitMethod" modelCode="MESBasic_1_product_ProdDealInfo" noPermissionKeys="content,dealerID.name,dealTime" hidekeyPrefix="ec_MESBasic_product_prodDealInfo_modifyList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_product_prodDealInfo_modifyList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.product.prodDealInfo.modifyList.dbClickViewmodifyList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','dealerID.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.product.prodDealInfo.modifyList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign content_displayDefaultType  = ''>
			<@datacolumn columnName="PDI_CONTENT"    showFormat="TEXT" defaultDisplay="${content_displayDefaultType!}"  key="content"   label="${getText('MESBasic.propertydisplayName.randon1470380337116')}" textalign="left"  width=300   type="textarea"    showFormatFunc="" cssstyle="" />
			<#assign dealerID_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${dealerID_name_displayDefaultType!}"  key="dealerID.name"   label="${getText('MESBasic.staff.dimissionStaff_xls.staffName07')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign dealTime_displayDefaultType  = ''>
			<@datacolumn columnName="PDI_DEALTIME"    showFormat="YMD_HMS" defaultDisplay="${dealTime_displayDefaultType!}"  key="dealTime"   label="${getText('MESBasic.propertydisplayName.randon1470380397891')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_product_prodDealInfo_modifyList_RenderOverEvent(){
}
function ec_MESBasic_product_prodDealInfo_modifyList_PageInitMethod(){
}
	
	
	
</script>