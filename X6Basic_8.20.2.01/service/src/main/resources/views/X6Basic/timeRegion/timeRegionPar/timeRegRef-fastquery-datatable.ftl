	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.randon1459213899397')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" exportUrl="/X6Basic/timeRegion/timeRegionPar/timeRegRef-query.action">
		<input type="hidden" reset="false" name="X6Basic_timeRegion_timeRegionPar_timeRegRef_condition" id="X6Basic_timeRegion_timeRegionPar_timeRegRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.randon1459214032452')}_${getText('X6Basic.viewtitle.randon1459216588402')}.xls" />
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
		<div id="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('X6Basic_1.0_timeRegion_timeRegRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_timeRegion_timeRegRef" formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" dataTableId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" isExpandAll=true formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" idprefix="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef" expandType="all"  fieldcodes="X6Basic_1.0_timeRegion_TimeRegionPar_name_name:X6Basic.propertydisplayName.randon1459215074302||X6Basic_1.0_timeRegion_TimeRegionPar_year_year:X6Basic.propertydisplayName.randon1459215254357||X6Basic_1.0_timeRegion_TimeRegionPar_month_month:X6Basic.propertydisplayName.randon1459215052167" > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" code="X6Basic_1.0_timeRegion_TimeRegionPar_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegionPar_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign year_defaultValue  = ''>
									<#assign year_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" code="X6Basic_1.0_timeRegion_TimeRegionPar_year" showFormat="TEXT" defaultValue=year_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegionPar_year_year" isCustomize=true style="" > 
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="year_start" id="year_start" value="${year_defaultValue!}" deValue="${year_defaultValue!}"   exp="equal"/>
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="year_end" id="year_end" value="${year_defaultValue!}" deValue="${year_defaultValue!}"   exp="equal"/>
									  		</div></div>
									  		</div>
								  		</div>								  		
							</@queryfield>
							<#assign month_defaultValue  = ''>
									<#assign month_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" code="X6Basic_1.0_timeRegion_TimeRegionPar_month" showFormat="TEXT" defaultValue=month_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegionPar_month_month" isCustomize=true style="" > 
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="month_start" id="month_start" value="${month_defaultValue!}" deValue="${month_defaultValue!}"   exp="equal"/>
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="month_end" id="month_end" value="${month_defaultValue!}" deValue="${month_defaultValue!}"   exp="equal"/>
									  		</div></div>
									  		</div>
								  		</div>								  		
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" type="adv" onclick="X6Basic.timeRegion.timeRegionPar.timeRegRef.commonQuery('query')" onadvancedclick="advQuery('X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery')" /> 
						 		<@querybutton formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info={};
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["MainTableName"]="X6BASIC_TIME_REGION_PARS";
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["name"]={};
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["name"].dbColumnType="TEXT";
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["name"].layRec="name";
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["name"].columnName="NAME";
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["year"]={};
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["year"].dbColumnType="INTEGER";
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["year"].layRec="year";
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["year"].columnName="YEAR";
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["month"]={};
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["month"].dbColumnType="INTEGER";
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["month"].layRec="month";
ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_quickquery_info["month"].columnName="MONTH";
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
 	var advRemainDialog = $('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_adv_queryForm" exportUrl="/X6Basic/timeRegion/timeRegionPar/timeRegRef-query.action">
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_adv_queryForm" code="X6Basic_1.0_timeRegion_TimeRegionPar_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegionPar_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_timeRegion_TimeRegionPar" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="X6BASIC_TIME_REGION_PARS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										区间名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_timeRegion_TimeRegionPar" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="adv_name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign year_defaultValue  = ''>
									<#assign year_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_adv_queryForm" code="X6Basic_1.0_timeRegion_TimeRegionPar_year" showFormat="TEXT" defaultValue=year_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegionPar_year_year" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_timeRegion_TimeRegionPar" layRec="year" columnname="YEAR" columntype="INTEGER" name="year" fieldType="TEXTFIELD" tableName="X6BASIC_TIME_REGION_PARS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										年
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_timeRegion_TimeRegionPar" />
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="year_start" id="adv_year_start" value="${year_defaultValue!}" deValue="${year_defaultValue!}"   exp="equal"   />
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="year_end" id="adv_year_end" value="${year_defaultValue!}" deValue="${year_defaultValue!}"   exp="equal"  />
									  		</div></div>
									  		</div>
								  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign month_defaultValue  = ''>
									<#assign month_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_adv_queryForm" code="X6Basic_1.0_timeRegion_TimeRegionPar_month" showFormat="TEXT" defaultValue=month_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegionPar_month_month" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_timeRegion_TimeRegionPar" layRec="month" columnname="MONTH" columntype="INTEGER" name="month" fieldType="TEXTFIELD" tableName="X6BASIC_TIME_REGION_PARS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										月
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_timeRegion_TimeRegionPar" />
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="month_start" id="adv_month_start" value="${month_defaultValue!}" deValue="${month_defaultValue!}"   exp="equal"   />
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="month_end" id="adv_month_end" value="${month_defaultValue!}" deValue="${month_defaultValue!}"   exp="equal"  />
									  		</div></div>
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
			viewCode: 'X6Basic_1.0_timeRegion_timeRegRef',
			modelCode: 'X6Basic_1.0_timeRegion_TimeRegionPar',
			modelName: 'TimeRegionPar',
			formId: 'ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm',
			olddiv: 'X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_timeRegion_timeRegRef'+"&entity.code="+'X6Basic_1.0_timeRegion';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery'] #customquContent").html(html);
		 	$("[id='X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_timeRegion_timeRegRef'+"&entity.code="+'X6Basic_1.0_timeRegion';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery'] #customquContent").html(html);
			 $("[id='X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery'] #advQueryLoading").hide();
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
		$('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] div.customqu-content').css('display','none');
		$('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] div.move-grade').css('display','none');
		// $('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] div.customqu-content').css('display','block');
		$('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] div.move-grade').css('display','block');
		// $('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="X6Basic.timeRegion.timeRegionPar.timeRegRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "X6Basic.timeRegion.timeRegionPar.timeRegRef.query('query')">
<#assign datatable_dataUrl = "/X6Basic/timeRegion/timeRegionPar/timeRegRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_query" renderOverEvent="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_RenderOverEvent" pageInitMethod="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_PageInitMethod" modelCode="X6Basic_1.0_timeRegion_TimeRegionPar" noPermissionKeys="name,year,quarter,month,week,startDate,endDate" hidekeyPrefix="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="X6Basic.timeRegion.timeRegionPar.timeRegRef.sendBacktimeRegRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','id','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="X6Basic.timeRegion.timeRegionPar.timeRegRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.randon1459215074302')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign year_displayDefaultType  = ''>
			<@datacolumn columnName="YEAR"    showFormat="TEXT" defaultDisplay="${year_displayDefaultType!}"  key="year"   label="${getText('X6Basic.propertydisplayName.randon1459215254357')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign quarter_displayDefaultType  = ''>
			<@datacolumn columnName="QUARTER"    showFormat="TEXT" defaultDisplay="${quarter_displayDefaultType!}"  key="quarter"   label="${getText('X6Basic.propertydisplayName.randon1459215116732')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign month_displayDefaultType  = ''>
			<@datacolumn columnName="MONTH"    showFormat="TEXT" defaultDisplay="${month_displayDefaultType!}"  key="month"   label="${getText('X6Basic.propertydisplayName.randon1459215052167')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign week_displayDefaultType  = ''>
			<@datacolumn columnName="WEEK"    showFormat="TEXT" defaultDisplay="${week_displayDefaultType!}"  key="week"   label="${getText('X6Basic.propertydisplayName.randon1459215239844')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign startDate_displayDefaultType  = ''>
			<@datacolumn columnName="START_DATE"    showFormat="YMD" defaultDisplay="${startDate_displayDefaultType!}"  key="startDate"   label="${getText('X6Basic.propertydisplayName.randon1459215181902')}" textalign="center"  width=100   type="date"    showFormatFunc="" cssstyle="" />
			<#assign endDate_displayDefaultType  = ''>
			<@datacolumn columnName="END_DATE"    showFormat="YMD" defaultDisplay="${endDate_displayDefaultType!}"  key="endDate"   label="${getText('X6Basic.propertydisplayName.randon1459215032319')}" textalign="center"  width=100   type="date"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_RenderOverEvent(){
}
function ec_X6Basic_timeRegion_timeRegionPar_timeRegRef_PageInitMethod(){
}
	
	
	
	
	
	
	
</script>