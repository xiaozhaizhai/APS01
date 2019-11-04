	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490063991944')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" exportUrl="/WOM/standingcropRef/standingcropRef/batchNumPutInMaRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="placeSet" bak_value="placeSet"/>
		<input type="hidden" reset="false" name="WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_condition" id="WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490064355590')}_${getText('WOM.viewtitle.randon1511422482223')}.xls" />
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
		<div id="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_standingcropRef_batchNumPutInMaRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_standingcropRef_batchNumPutInMaRef" formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" dataTableId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" isExpandAll=true formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" idprefix="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef" expandType="all"  fieldcodes="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText_batchText:WOM.propertydisplayName.randon1490064501469" > 
							<#assign batchText_defaultValue  = ''>
									<#assign batchText_defaultValue  = ''>
							<@queryfield formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" code="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText" showFormat="TEXT" defaultValue=batchText_defaultValue  divCode="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText_batchText" isCustomize=true style="" > 
										<#if (batchText_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${batchText_defaultValue!}" deValue="${batchText_defaultValue!}"   conditionfunc="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef._querycustomFunc('batchText')" name="batchText" id="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm_batchText" displayFieldName="batchText" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef._querycustomFunc('batchText')" name="batchText" id="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm_batchText" displayFieldName="batchText" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" type="adv" onclick="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.commonQuery('query')" onadvancedclick="advQuery('WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_quickquery_info={};
ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_quickquery_info["MainTableName"]="MATERIAL_STANDINGCROPS";
ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_quickquery_info["batchText"]={};
ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_quickquery_info["batchText"].dbColumnType="TEXT";
ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_quickquery_info["batchText"].layRec="batchText";
ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_quickquery_info["batchText"].columnName="BATCH_TEXT";
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
 	var advRemainDialog = $('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_adv_queryForm" exportUrl="/WOM/standingcropRef/standingcropRef/batchNumPutInMaRef-query.action">
							<#assign batchText_defaultValue  = ''>
									<#assign batchText_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_adv_queryForm" code="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText" showFormat="TEXT" defaultValue=batchText_defaultValue  divCode="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText_batchText" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_standingcropRef_StandingcropRef" layRec="batchText" columnname="BATCH_TEXT" columntype="TEXT" name="batchText" fieldType="TEXTFIELD" tableName="MATERIAL_STANDINGCROPS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物料批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_standingcropRef_StandingcropRef" />
										<#if (batchText_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${batchText_defaultValue!}" deValue="${batchText_defaultValue!}"   conditionfunc="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef._querycustomFunc('batchText')" name="batchText" id="adv_ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm_batchText" displayFieldName="batchText" exp="like"  classStyle="cui-noborder-input"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260   currentViewCode="WOM_7.5.0.0_standingcropRef_batchNumPutInMaRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef._querycustomFunc('batchText')" name="batchText" id="adv_ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm_batchText" displayFieldName="batchText" exp="like"  classStyle="cui-noborder-input"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260  currentViewCode="WOM_7.5.0.0_standingcropRef_batchNumPutInMaRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
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
			viewCode: 'WOM_7.5.0.0_standingcropRef_batchNumPutInMaRef',
			modelCode: 'WOM_7.5.0.0_standingcropRef_StandingcropRef',
			modelName: 'StandingcropRef',
			formId: 'ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm',
			olddiv: 'WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_standingcropRef_batchNumPutInMaRef'+"&entity.code="+'WOM_7.5.0.0_standingcropRef';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_standingcropRef_batchNumPutInMaRef'+"&entity.code="+'WOM_7.5.0.0_standingcropRef';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.query('query')">
<#assign datatable_dataUrl = "/WOM/standingcropRef/standingcropRef/batchNumPutInMaRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_query" renderOverEvent="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_RenderOverEvent" pageInitMethod="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_PageInitMethod" modelCode="WOM_7.5.0.0_standingcropRef_StandingcropRef" noPermissionKeys="batchText,good.productCode,good.productName,wareID.wareCode,wareID.wareName,wareID.cargoStatue,placeSet.placeSetCode,placeSet.placeSetName,onhand,frozenQuantity,availiQuantity" hidekeyPrefix="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.sendBackbatchNumPutInMaRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','wareID.cargoStatue.id','good.id','wareID.id','placeSet.id','id','batchText']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.standingcropRef.standingcropRef.batchNumPutInMaRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign batchText_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_TEXT"    showFormat="TEXT" defaultDisplay="${batchText_displayDefaultType!}"  key="batchText"   label="${getText('WOM.propertydisplayName.randon1490064501469')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign good_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${good_productCode_displayDefaultType!}"  key="good.productCode"   label="${getText('WOM.propertydisplayName.randon1502677102798')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign good_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${good_productName_displayDefaultType!}"  key="good.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737455')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_cargoStatue_displayDefaultType  = ''>
			<@datacolumn columnName="CARGO_STATUE"    showFormat="SELECTCOMP" defaultDisplay="${wareID_cargoStatue_displayDefaultType!}"  key="wareID.cargoStatue.value"   label="${getText('MESBasic.propertydisplayName.randon1484031944240')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign placeSet_placeSetCode_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_CODE"    showFormat="TEXT" defaultDisplay="${placeSet_placeSetCode_displayDefaultType!}"  key="placeSet.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign placeSet_placeSetName_displayDefaultType  = ''>
			<@datacolumn columnName="PLACE_SET_NAME"    showFormat="TEXT" defaultDisplay="${placeSet_placeSetName_displayDefaultType!}"  key="placeSet.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign onhand_displayDefaultType  = ''>
			<@datacolumn columnName="ONHAND"    showFormat="TEXT" defaultDisplay="${onhand_displayDefaultType!}"  key="onhand"   label="${getText('WOM.propertydisplayName.randon1490064713692')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign frozenQuantity_displayDefaultType  = ''>
			<@datacolumn columnName="FROZEN_QUANTITY"    showFormat="TEXT" defaultDisplay="${frozenQuantity_displayDefaultType!}"  key="frozenQuantity"   label="${getText('WOM.propertydisplayName.randon1490064544582')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign availiQuantity_displayDefaultType  = ''>
			<@datacolumn columnName="AVAILI_QUANTITY"    showFormat="TEXT" defaultDisplay="${availiQuantity_displayDefaultType!}"  key="availiQuantity"   label="${getText('WOM.propertydisplayName.randon1490064478475')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_RenderOverEvent(){
}
function ec_WOM_standingcropRef_standingcropRef_batchNumPutInMaRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
</script>