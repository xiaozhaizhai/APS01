	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1490773007304')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm" exportUrl="/MESBasic/batchInfo/batchDealInfo/batchDealList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="dealDept" bak_value="dealDept"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1490774952864')}_${getText('MESBasic.viewtitle.randon1492152115499')}.xls" />
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
		<div id="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_batchInfo_batchDealList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_batchInfo_batchDealList" formId="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm" dataTableId="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm" isExpandAll=true formId="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm" idprefix="ec_MESBasic_batchInfo_batchDealInfo_batchDealList" expandType="all"  fieldcodes="MESBasic_1_batchInfo_BatchDealInfo_batchNum_batchNum:MESBasic.propertydisplayName.randon1490775120800" > 
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm" code="MESBasic_1_batchInfo_BatchDealInfo_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="MESBasic_1_batchInfo_BatchDealInfo_batchNum_batchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm" type="adv" onclick="MESBasic.batchInfo.batchDealInfo.batchDealList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.batchInfo.batchDealInfo.batchDealList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info={};
ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info["MainTableName"]="BATCH_DEALINFO";
ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info["batchNum"]={};
ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info["batchNum"].dbColumnType="TEXT";
ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info["batchNum"].layRec="batchNum";
ec_MESBasic_batchInfo_batchDealInfo_batchDealList_quickquery_info["batchNum"].columnName="BATCH_NUM";
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
 	var advRemainDialog = $('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_adv_queryForm" exportUrl="/MESBasic/batchInfo/batchDealInfo/batchDealList-query.action">
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_adv_queryForm" code="MESBasic_1_batchInfo_BatchDealInfo_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="MESBasic_1_batchInfo_BatchDealInfo_batchNum_batchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_batchInfo_BatchDealInfo" layRec="batchNum" columnname="BATCH_NUM" columntype="TEXT" name="batchNum" fieldType="TEXTFIELD" tableName="BATCH_DEALINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_batchInfo_BatchDealInfo" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="adv_batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like" />
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
			viewCode: 'MESBasic_1_batchInfo_batchDealList',
			modelCode: 'MESBasic_1_batchInfo_BatchDealInfo',
			modelName: 'BatchDealInfo',
			formId: 'ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm',
			olddiv: 'MESBasic.batchInfo.batchDealInfo.batchDealList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.batchInfo.batchDealInfo.batchDealList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_batchInfo_batchDealList'+"&entity.code="+'MESBasic_1_batchInfo';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.batchInfo.batchDealInfo.batchDealList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.batchInfo.batchDealInfo.batchDealList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.batchInfo.batchDealInfo.batchDealList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_batchInfo_batchDealList'+"&entity.code="+'MESBasic_1_batchInfo';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.batchInfo.batchDealInfo.batchDealList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.batchInfo.batchDealInfo.batchDealList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.batchInfo.batchDealInfo.batchDealList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.batchInfo.batchDealInfo.batchDealList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/batchInfo/batchDealInfo/batchDealList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query" renderOverEvent="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_RenderOverEvent" pageInitMethod="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_PageInitMethod" modelCode="MESBasic_1_batchInfo_BatchDealInfo" noPermissionKeys="batchNum,sourceBatch,amount,dealType,dealStaff.name,dealDept.name,dealFromID,dealTableNo,workOrderID,processID,activeID" hidekeyPrefix="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_batchInfo_batchDealInfo_batchDealList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.batchInfo.batchDealInfo.batchDealList.dbClickViewbatchDealList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','dealType.id','dealStaff.id','dealDept.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.batchInfo.batchDealInfo.batchDealList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('MESBasic.propertydisplayName.randon1490775120800')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign sourceBatch_displayDefaultType  = ''>
			<@datacolumn columnName="SOURCE_BATCH"    showFormat="TEXT" defaultDisplay="${sourceBatch_displayDefaultType!}"  key="sourceBatch"   label="${getText('MESBasic.propertydisplayName.randon1490775137187')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign amount_displayDefaultType  = ''>
			<@datacolumn columnName="AMOUNT"    showFormat="TEXT" defaultDisplay="${amount_displayDefaultType!}"  key="amount"   label="${getText('MESBasic.propertydisplayName.randon1490775217283')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign dealType_displayDefaultType  = ''>
			<@datacolumn columnName="DEAL_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${dealType_displayDefaultType!}"  key="dealType.value"   label="${getText('MESBasic.propertydisplayName.randon1490775239593')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign dealStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${dealStaff_name_displayDefaultType!}"  key="dealStaff.name"   label="${getText('MESBasic.staff.dimissionStaff_xls.staffName4343')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign dealDept_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${dealDept_name_displayDefaultType!}"  key="dealDept.name"   label="${getText('MESBasic.propertydisplayName.randon1490775175784')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign dealFromID_displayDefaultType  = ''>
			<@datacolumn columnName="DEAL_FROMID"    showFormat="TEXT" defaultDisplay="${dealFromID_displayDefaultType!}"  key="dealFromID"   label="${getText('MESBasic.propertydisplayName.randon1490775271111')}" textalign="right"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign dealTableNo_displayDefaultType  = ''>
			<@datacolumn columnName="DEAL_TABLE_NO"    showFormat="TEXT" defaultDisplay="${dealTableNo_displayDefaultType!}"  key="dealTableNo"   label="${getText('MESBasic.propertydisplayName.randon1490775377605')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign workOrderID_displayDefaultType  = ''>
			<@datacolumn columnName="WORK_ORDERID"    showFormat="TEXT" defaultDisplay="${workOrderID_displayDefaultType!}"  key="workOrderID"   label="${getText('MESBasic.propertydisplayName.randon1490775427260')}" textalign="right"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign processID_displayDefaultType  = ''>
			<@datacolumn columnName="PROCESSID"    showFormat="TEXT" defaultDisplay="${processID_displayDefaultType!}"  key="processID"   label="${getText('MESBasic.propertydisplayName.randon1490775392241')}" textalign="right"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign activeID_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVEID"    showFormat="TEXT" defaultDisplay="${activeID_displayDefaultType!}"  key="activeID"   label="${getText('MESBasic.propertydisplayName.randon1490775411513')}" textalign="right"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_batchInfo_batchDealInfo_batchDealList_RenderOverEvent(){
}
function ec_MESBasic_batchInfo_batchDealInfo_batchDealList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
</script>