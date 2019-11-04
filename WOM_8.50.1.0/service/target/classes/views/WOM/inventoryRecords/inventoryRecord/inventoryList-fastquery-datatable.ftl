	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1566887979029')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" exportUrl="/WOM/inventoryRecords/inventoryRecord/inventoryList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1566888253801')}_${getText('WOM.viewtitle.randon1566888749846')}.xls" />
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
		<div id="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_inventoryRecords_inventoryList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_inventoryRecords_inventoryList" formId="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" dataTableId="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" isExpandAll=true formId="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" idprefix="ec_WOM_inventoryRecords_inventoryRecord_inventoryList" expandType="all"  fieldcodes="WOM_7.5.0.0_inventoryRecords_InventoryRecord_inventoryDate_inventoryDate:WOM.propertydisplayName.randon1566888295198" > 
							<#assign inventoryDate_defaultValue  = ''>
									<#assign inventoryDate_defaultValue  = ''>
								<#if (inventoryDate_defaultValue)?? &&(inventoryDate_defaultValue)?has_content>
									<#assign inventoryDate_defaultValue  = getDefaultDateTime(inventoryDate_defaultValue!)?date>
								</#if>
							<@queryfield formId="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" code="WOM_7.5.0.0_inventoryRecords_InventoryRecord_inventoryDate" showFormat="YM" defaultValue=inventoryDate_defaultValue  divCode="WOM_7.5.0.0_inventoryRecords_InventoryRecord_inventoryDate_inventoryDate" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker yearChangeMonthLink="01" cssClass="cui-noborder-input" type="yearMonth" name="inventoryDate_start" id="inventoryDate_start" exp="gequal"   formid="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker yearChangeMonthLink="12" cssClass="cui-noborder-input" type="yearMonth" name="inventoryDate_end" id="inventoryDate_end" exp="lequal"   formid="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" type="adv" onclick="WOM.inventoryRecords.inventoryRecord.inventoryList.commonQuery('query')" onadvancedclick="advQuery('WOM.inventoryRecords.inventoryRecord.inventoryList.advquery')" /> 
						 		<@querybutton formId="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info={};
ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info["MainTableName"]="WOM_INVENTORY_RECORDS";
ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info["inventoryDate"]={};
ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info["inventoryDate"].dbColumnType="DATE";
ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info["inventoryDate"].layRec="inventoryDate";
ec_WOM_inventoryRecords_inventoryRecord_inventoryList_quickquery_info["inventoryDate"].columnName="INVENTORY_DATE";
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
 	var advRemainDialog = $('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_adv_queryForm" exportUrl="/WOM/inventoryRecords/inventoryRecord/inventoryList-query.action">
							<#assign inventoryDate_defaultValue  = ''>
									<#assign inventoryDate_defaultValue  = ''>
								<#if (inventoryDate_defaultValue)?? &&(inventoryDate_defaultValue)?has_content>
									<#assign inventoryDate_defaultValue  = getDefaultDateTime(inventoryDate_defaultValue!)?date>
								</#if>
								<@advsqueryfield formId="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_adv_queryForm" code="WOM_7.5.0.0_inventoryRecords_InventoryRecord_inventoryDate" showFormat="YMD" defaultValue=inventoryDate_defaultValue  divCode="WOM_7.5.0.0_inventoryRecords_InventoryRecord_inventoryDate_inventoryDate" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_inventoryRecords_InventoryRecord" layRec="inventoryDate" columnname="INVENTORY_DATE" columntype="DATE" name="inventoryDate" fieldType="DATE" showFormat="YMD" tableName="WOM_INVENTORY_RECORDS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										盘库日期
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_inventoryRecords_InventoryRecord" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${inventoryDate_defaultValue!}" deValue="${inventoryDate_defaultValue!}"  name="inventoryDate_start" id="adv_inventoryDate_start" exp="gequal"    formid="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker cssClass="cui-noborder-input" type="date" value="${inventoryDate_defaultValue!}" deValue="${inventoryDate_defaultValue!}"  name="inventoryDate_end" id="adv_inventoryDate_end" exp="lequal"    formid="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_adv_queryForm" />
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
			viewCode: 'WOM_7.5.0.0_inventoryRecords_inventoryList',
			modelCode: 'WOM_7.5.0.0_inventoryRecords_InventoryRecord',
			modelName: 'InventoryRecord',
			formId: 'ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm',
			olddiv: 'WOM.inventoryRecords.inventoryRecord.inventoryList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.inventoryRecords.inventoryRecord.inventoryList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_inventoryRecords_inventoryList'+"&entity.code="+'WOM_7.5.0.0_inventoryRecords';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.inventoryRecords.inventoryRecord.inventoryList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.inventoryRecords.inventoryRecord.inventoryList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.inventoryRecords.inventoryRecord.inventoryList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_inventoryRecords_inventoryList'+"&entity.code="+'WOM_7.5.0.0_inventoryRecords';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.inventoryRecords.inventoryRecord.inventoryList.advquery'] #customquContent").html(html);
			 $("[id='WOM.inventoryRecords.inventoryRecord.inventoryList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.inventoryRecords.inventoryRecord.inventoryList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.inventoryRecords.inventoryRecord.inventoryList.query('query')">
<#assign datatable_dataUrl = "/WOM/inventoryRecords/inventoryRecord/inventoryList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query" renderOverEvent="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_RenderOverEvent" pageInitMethod="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_PageInitMethod" modelCode="WOM_7.5.0.0_inventoryRecords_InventoryRecord" noPermissionKeys="inventoryDate,inFlag,outFlag" hidekeyPrefix="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_inventoryRecords_inventoryRecord_inventoryList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.inventoryRecords.inventoryRecord.inventoryList.dbClickViewinventoryList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.inventoryRecords.inventoryRecord.inventoryList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}inventoryList_inButton_add_WOM_7.5.0.0_inventoryRecords_inventoryList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.randon1566888810048.flag')}||iconcls:add||useInMore:false||onclick:
					inButton(event)
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="WOM_7.5.0.0_inventoryRecords_inventoryList_BUTTON_inButton"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}inventoryList_inButton_add_WOM_7.5.0.0_inventoryRecords_inventoryList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.randon1566888810048.flag')}||iconcls:add||useInMore:false||onclick:
					inButton(event)
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}inventoryList_outButton_add_WOM_7.5.0.0_inventoryRecords_inventoryList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.randon1566888829881.flag')}||iconcls:add||useInMore:false||onclick:
					outButton(event)
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="WOM_7.5.0.0_inventoryRecords_inventoryList_BUTTON_outButton"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}inventoryList_outButton_add_WOM_7.5.0.0_inventoryRecords_inventoryList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.randon1566888829881.flag')}||iconcls:add||useInMore:false||onclick:
					outButton(event)
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign inventoryDate_displayDefaultType  = ''>
			<@datacolumn columnName="INVENTORY_DATE"    showFormat="YM" defaultDisplay="${inventoryDate_displayDefaultType!}"  key="inventoryDate"   label="${getText('WOM.propertydisplayName.randon1566888295198')}" textalign="center"  width=100   type="date"    showFormatFunc="" cssstyle="" />
			<#assign inFlag_displayDefaultType  = ''>
			<@datacolumn columnName="IN_FLAG"    showFormat="SELECT" defaultDisplay="${inFlag_displayDefaultType!}"  key="inFlag"   label="${getText('WOM.propertyshowName.randon1566888875982.flag')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign outFlag_displayDefaultType  = ''>
			<@datacolumn columnName="OUT_FLAG"    showFormat="SELECT" defaultDisplay="${outFlag_displayDefaultType!}"  key="outFlag"   label="${getText('WOM.propertyshowName.randon1566888883594.flag')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_inventoryRecords_inventoryRecord_inventoryList_RenderOverEvent(){
}
function ec_WOM_inventoryRecords_inventoryRecord_inventoryList_PageInitMethod(){
}
	
	
	
</script>