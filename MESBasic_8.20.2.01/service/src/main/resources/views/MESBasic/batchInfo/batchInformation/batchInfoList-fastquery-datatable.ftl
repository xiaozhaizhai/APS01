	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1490773007304')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm" exportUrl="/MESBasic/batchInfo/batchInformation/batchInfoList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1490773101098')}_${getText('MESBasic.viewtitle.randon1492151757128')}.xls" />
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
		<div id="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_batchInfo_batchInfoList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_batchInfo_batchInfoList" formId="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm" dataTableId="ec_MESBasic_batchInfo_batchInformation_batchInfoList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm" isExpandAll=true formId="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm" idprefix="ec_MESBasic_batchInfo_batchInformation_batchInfoList" expandType="all"  fieldcodes="MESBasic_1_batchInfo_BatchInformation_batchNum_batchNum:MESBasic.propertydisplayName.randon1490773188432" > 
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm" code="MESBasic_1_batchInfo_BatchInformation_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="MESBasic_1_batchInfo_BatchInformation_batchNum_batchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm" type="adv" onclick="MESBasic.batchInfo.batchInformation.batchInfoList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.batchInfo.batchInformation.batchInfoList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info={};
ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info["MainTableName"]="BATCH_INFORMATION";
ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info["batchNum"]={};
ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info["batchNum"].dbColumnType="TEXT";
ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info["batchNum"].layRec="batchNum";
ec_MESBasic_batchInfo_batchInformation_batchInfoList_quickquery_info["batchNum"].columnName="BATCH_NUM";
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
 	var advRemainDialog = $('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_batchInfo_batchInformation_batchInfoList_adv_queryForm" exportUrl="/MESBasic/batchInfo/batchInformation/batchInfoList-query.action">
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_batchInfo_batchInformation_batchInfoList_adv_queryForm" code="MESBasic_1_batchInfo_BatchInformation_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="MESBasic_1_batchInfo_BatchInformation_batchNum_batchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_batchInfo_BatchInformation" layRec="batchNum" columnname="BATCH_NUM" columntype="TEXT" name="batchNum" fieldType="TEXTFIELD" tableName="BATCH_INFORMATION"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_batchInfo_BatchInformation" />
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
			viewCode: 'MESBasic_1_batchInfo_batchInfoList',
			modelCode: 'MESBasic_1_batchInfo_BatchInformation',
			modelName: 'BatchInformation',
			formId: 'ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm',
			olddiv: 'MESBasic.batchInfo.batchInformation.batchInfoList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.batchInfo.batchInformation.batchInfoList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_batchInfo_batchInfoList'+"&entity.code="+'MESBasic_1_batchInfo';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.batchInfo.batchInformation.batchInfoList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.batchInfo.batchInformation.batchInfoList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.batchInfo.batchInformation.batchInfoList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_batchInfo_batchInfoList'+"&entity.code="+'MESBasic_1_batchInfo';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.batchInfo.batchInformation.batchInfoList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.batchInfo.batchInformation.batchInfoList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.batchInfo.batchInformation.batchInfoList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.batchInfo.batchInformation.batchInfoList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/batchInfo/batchInformation/batchInfoList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_batchInfo_batchInformation_batchInfoList_query" renderOverEvent="ec_MESBasic_batchInfo_batchInformation_batchInfoList_RenderOverEvent" pageInitMethod="ec_MESBasic_batchInfo_batchInformation_batchInfoList_PageInitMethod" modelCode="MESBasic_1_batchInfo_BatchInformation" noPermissionKeys="batchNum,product.productCode,product.productName,sourceType,productionDate,validDate,recheckDate,checkDate,reNotify,manufacture,provider,supplierBatch,purchaseDate,arriveDate,checkState,passState,isAvailable" hidekeyPrefix="ec_MESBasic_batchInfo_batchInformation_batchInfoList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_batchInfo_batchInformation_batchInfoList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.batchInfo.batchInformation.batchInfoList.dbClickViewbatchInfoList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','sourceType.id','checkState.id','passState.id','product.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.batchInfo.batchInformation.batchInfoList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('MESBasic.propertydisplayName.randon1490773188432')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${product_productCode_displayDefaultType!}"  key="product.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign sourceType_displayDefaultType  = ''>
			<@datacolumn columnName="SOURCE_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${sourceType_displayDefaultType!}"  key="sourceType.value"   label="${getText('MESBasic.propertydisplayName.randon1490774258755')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign productionDate_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCTION_DATE"    showFormat="YMD_HMS" defaultDisplay="${productionDate_displayDefaultType!}"  key="productionDate"   label="${getText('MESBasic.propertydisplayName.randon1490774301082')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign validDate_displayDefaultType  = ''>
			<@datacolumn columnName="VALID_DATE"    showFormat="YMD_HMS" defaultDisplay="${validDate_displayDefaultType!}"  key="validDate"   label="${getText('MESBasic.propertydisplayName.randon1490774324503')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign recheckDate_displayDefaultType  = ''>
			<@datacolumn columnName="RECHECK_DATE"    showFormat="YMD_HMS" defaultDisplay="${recheckDate_displayDefaultType!}"  key="recheckDate"   label="${getText('MESBasic.propertydisplayName.randon1490774338805')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign checkDate_displayDefaultType  = ''>
			<@datacolumn columnName="CHECK_DATE"    showFormat="YMD_HMS" defaultDisplay="${checkDate_displayDefaultType!}"  key="checkDate"   label="${getText('MESBasic.propertydisplayName.randon1490774382679')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign reNotify_displayDefaultType  = ''>
			<@datacolumn columnName="RE_NOTIFY"    showFormat="TEXT" defaultDisplay="${reNotify_displayDefaultType!}"  key="reNotify"   label="${getText('MESBasic.propertydisplayName.randon1490774557360')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign manufacture_displayDefaultType  = ''>
			<@datacolumn columnName="MANUFACTURE"    showFormat="TEXT" defaultDisplay="${manufacture_displayDefaultType!}"  key="manufacture"   label="${getText('MESBasic.propertydisplayName.randon1490774685739')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign provider_displayDefaultType  = ''>
			<@datacolumn columnName="PROVIDER"    showFormat="TEXT" defaultDisplay="${provider_displayDefaultType!}"  key="provider"   label="${getText('MESBasic.propertydisplayName.randon1490774672386')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign supplierBatch_displayDefaultType  = ''>
			<@datacolumn columnName="SUPPLIER_BATCH"    showFormat="TEXT" defaultDisplay="${supplierBatch_displayDefaultType!}"  key="supplierBatch"   label="${getText('MESBasic.propertydisplayName.randon1490774698062')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign purchaseDate_displayDefaultType  = ''>
			<@datacolumn columnName="PURCHASE_DATE"    showFormat="YMD_HMS" defaultDisplay="${purchaseDate_displayDefaultType!}"  key="purchaseDate"   label="${getText('MESBasic.propertydisplayName.randon1490774606203')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign arriveDate_displayDefaultType  = ''>
			<@datacolumn columnName="ARRIVE_DATE"    showFormat="YMD_HMS" defaultDisplay="${arriveDate_displayDefaultType!}"  key="arriveDate"   label="${getText('MESBasic.propertydisplayName.randon1490774658492')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign checkState_displayDefaultType  = ''>
			<@datacolumn columnName="CHECK_STATE"    showFormat="SELECTCOMP" defaultDisplay="${checkState_displayDefaultType!}"  key="checkState.value"   label="${getText('MESBasic.propertydisplayName.randon1490774744883')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign passState_displayDefaultType  = ''>
			<@datacolumn columnName="PASS_STATE"    showFormat="SELECTCOMP" defaultDisplay="${passState_displayDefaultType!}"  key="passState.value"   label="${getText('MESBasic.propertydisplayName.randon1490774784342')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign isAvailable_displayDefaultType  = ''>
			<@datacolumn columnName="IS_AVAILABLE"    showFormat="SELECT" defaultDisplay="${isAvailable_displayDefaultType!}"  key="isAvailable"   label="${getText('MESBasic.propertydisplayName.randon1490774713037')}" textalign="left"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_batchInfo_batchInformation_batchInfoList_RenderOverEvent(){
}
function ec_MESBasic_batchInfo_batchInformation_batchInfoList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>