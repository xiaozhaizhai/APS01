	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm" exportUrl="/WOM/produceTask/adjustOrTempRecords/adjustActiveRef-query.action">
		<input type="hidden" reset="false" name="WOM_produceTask_adjustOrTempRecords_adjustActiveRef_condition" id="WOM_produceTask_adjustOrTempRecords_adjustActiveRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1542097599573')}_${getText('WOM.viewtitle.randon1542192090052')}.xls" />
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
		<div id="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_produceTask_adjustActiveRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_produceTask_adjustActiveRef" formId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm" dataTableId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm" isExpandAll=true formId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm" idprefix="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_AdjustOrTempRecords_acticeName_acticeName:WOM.propertydisplayName.randon1542181804390||WOM_7.5.0.0_produceTask_AdjustOrTempRecords_processName_processName:WOM.propertydisplayName.randon1542192019742" > 
							<#assign acticeName_defaultValue  = ''>
									<#assign acticeName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm" code="WOM_7.5.0.0_produceTask_AdjustOrTempRecords_acticeName" showFormat="TEXT" defaultValue=acticeName_defaultValue  divCode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords_acticeName_acticeName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="acticeName" id="acticeName" value="${acticeName_defaultValue!}" deValue="${acticeName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign processName_defaultValue  = ''>
									<#assign processName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm" code="WOM_7.5.0.0_produceTask_AdjustOrTempRecords_processName" showFormat="TEXT" defaultValue=processName_defaultValue  divCode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords_processName_processName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="processName" id="processName" value="${processName_defaultValue!}" deValue="${processName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm" type="adv" onclick="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.commonQuery('query')" onadvancedclick="advQuery('WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info={};
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info["MainTableName"]="WOM_ADJUST_OR_TEMP_RECORDS";
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info["acticeName"]={};
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info["acticeName"].dbColumnType="TEXT";
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info["acticeName"].layRec="acticeName";
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info["acticeName"].columnName="ACTICE_NAME";
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info["processName"]={};
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info["processName"].dbColumnType="TEXT";
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info["processName"].layRec="processName";
ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_quickquery_info["processName"].columnName="PROCESS_NAME";
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
 	var advRemainDialog = $('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_adv_queryForm" exportUrl="/WOM/produceTask/adjustOrTempRecords/adjustActiveRef-query.action">
							<#assign acticeName_defaultValue  = ''>
									<#assign acticeName_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_AdjustOrTempRecords_acticeName" showFormat="TEXT" defaultValue=acticeName_defaultValue  divCode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords_acticeName_acticeName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords" layRec="acticeName" columnname="ACTICE_NAME" columntype="TEXT" name="acticeName" fieldType="TEXTFIELD" tableName="WOM_ADJUST_OR_TEMP_RECORDS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										活动名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="acticeName" id="adv_acticeName" value="${acticeName_defaultValue!}" deValue="${acticeName_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign processName_defaultValue  = ''>
									<#assign processName_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_AdjustOrTempRecords_processName" showFormat="TEXT" defaultValue=processName_defaultValue  divCode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords_processName_processName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords" layRec="processName" columnname="PROCESS_NAME" columntype="TEXT" name="processName" fieldType="TEXTFIELD" tableName="WOM_ADJUST_OR_TEMP_RECORDS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										工序名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="processName" id="adv_processName" value="${processName_defaultValue!}" deValue="${processName_defaultValue!}"   exp="like" />
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
			viewCode: 'WOM_7.5.0.0_produceTask_adjustActiveRef',
			modelCode: 'WOM_7.5.0.0_produceTask_AdjustOrTempRecords',
			modelName: 'AdjustOrTempRecords',
			formId: 'ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm',
			olddiv: 'WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_adjustActiveRef'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_adjustActiveRef'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.produceTask.adjustOrTempRecords.adjustActiveRef.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/adjustOrTempRecords/adjustActiveRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.adjustOrTempRecords.adjustActiveRef.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/adjustOrTempRecords/adjustActiveRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_query" renderOverEvent="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_RenderOverEvent" pageInitMethod="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_PageInitMethod" modelCode="WOM_7.5.0.0_produceTask_AdjustOrTempRecords" noPermissionKeys="processName,acticeName,activeType,activeRecordState,actualUse,startTime,endTime,remark" hidekeyPrefix="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.sendBackadjustActiveRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','activeType.id','activeRecordState.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.produceTask.adjustOrTempRecords.adjustActiveRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign processName_displayDefaultType  = ''>
			<@datacolumn columnName="PROCESS_NAME"    showFormat="TEXT" defaultDisplay="${processName_displayDefaultType!}"  key="processName"   label="${getText('WOM.propertydisplayName.randon1542192019742')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign acticeName_displayDefaultType  = ''>
			<@datacolumn columnName="ACTICE_NAME"    showFormat="TEXT" defaultDisplay="${acticeName_displayDefaultType!}"  key="acticeName"   label="${getText('WOM.propertydisplayName.randon1542181804390')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign activeType_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${activeType_displayDefaultType!}"  key="activeType.value"   label="${getText('WOM.propertydisplayName.randon1542182374652')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign activeRecordState_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE_RECORD_STATE"    showFormat="SELECTCOMP" defaultDisplay="${activeRecordState_displayDefaultType!}"  key="activeRecordState.value"   label="${getText('WOM.propertydisplayName.randon1542181818133')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign actualUse_displayDefaultType  = ''>
			<@datacolumn columnName="ACTUAL_USE"    showFormat="TEXT" defaultDisplay="${actualUse_displayDefaultType!}"  key="actualUse"   label="${getText('WOM.propertydisplayName.randon1542179773992')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn columnName="START_TIME"    showFormat="YMD_HMS" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"   label="${getText('WOM.propertydisplayName.randon1542098129762')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn columnName="END_TIME"    showFormat="YMD_HMS" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"   label="${getText('WOM.propertydisplayName.randon1542098149042')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1542098160250')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_RenderOverEvent(){
}
function ec_WOM_produceTask_adjustOrTempRecords_adjustActiveRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
</script>