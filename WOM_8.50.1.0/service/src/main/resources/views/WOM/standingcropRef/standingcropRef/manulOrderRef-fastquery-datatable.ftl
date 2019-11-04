	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490063991944')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm" exportUrl="/WOM/standingcropRef/standingcropRef/manulOrderRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="placeSet" bak_value="placeSet"/>
		<input type="hidden" reset="false" name="WOM_standingcropRef_standingcropRef_manulOrderRef_condition" id="WOM_standingcropRef_standingcropRef_manulOrderRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490064355590')}_${getText('WOM.viewtitle.randon1564130461575')}.xls" />
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
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_standingcropRef_manulOrderRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_standingcropRef_manulOrderRef" formId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm" dataTableId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm"  formId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm" idprefix="ec_WOM_standingcropRef_standingcropRef_manulOrderRef" expandType="single"  fieldcodes="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText_batchText:WOM.propertydisplayName.randon1490064501469" > 
							<#assign batchText_defaultValue  = ''>
									<#assign batchText_defaultValue  = ''>
							<@queryfield formId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm" code="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText" showFormat="TEXT" defaultValue=batchText_defaultValue  divCode="WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText_batchText" isCustomize=true style="" > 
										<#if (batchText_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${batchText_defaultValue!}" deValue="${batchText_defaultValue!}"   conditionfunc="WOM.standingcropRef.standingcropRef.manulOrderRef._querycustomFunc('batchText')" name="batchText" id="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm_batchText" displayFieldName="batchText" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.standingcropRef.standingcropRef.manulOrderRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="WOM.standingcropRef.standingcropRef.manulOrderRef._querycustomFunc('batchText')" name="batchText" id="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm_batchText" displayFieldName="batchText" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.standingcropRef.standingcropRef.manulOrderRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm" type="adv" onclick="WOM.standingcropRef.standingcropRef.manulOrderRef.commonQuery('query')" onadvancedclick="advQuery('WOM.standingcropRef.standingcropRef.manulOrderRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_standingcropRef_standingcropRef_manulOrderRef_quickquery_info={};
ec_WOM_standingcropRef_standingcropRef_manulOrderRef_quickquery_info["MainTableName"]="MATERIAL_STANDINGCROPS";
ec_WOM_standingcropRef_standingcropRef_manulOrderRef_quickquery_info["batchText"]={};
ec_WOM_standingcropRef_standingcropRef_manulOrderRef_quickquery_info["batchText"].dbColumnType="TEXT";
ec_WOM_standingcropRef_standingcropRef_manulOrderRef_quickquery_info["batchText"].layRec="batchText";
ec_WOM_standingcropRef_standingcropRef_manulOrderRef_quickquery_info["batchText"].columnName="BATCH_TEXT";
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
 	var advRemainDialog = $('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_adv_queryForm" exportUrl="/WOM/standingcropRef/standingcropRef/manulOrderRef-query.action">
							<#assign availiQuantity_defaultValue  = ''>
									<#assign availiQuantity_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_adv_queryForm" code="WOM_7.5.0.0_standingcropRef_StandingcropRef_availiQuantity" showFormat="TEXT" defaultValue=availiQuantity_defaultValue  divCode="WOM_7.5.0.0_standingcropRef_StandingcropRef_availiQuantity_availiQuantity" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_standingcropRef_StandingcropRef" layRec="availiQuantity" columnname="AVAILI_QUANTITY" columntype="DECIMAL" name="availiQuantity" fieldType="TEXTFIELD" tableName="MATERIAL_STANDINGCROPS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										可用量
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_standingcropRef_StandingcropRef" />
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="availiQuantity_start" id="adv_availiQuantity_start" value="${availiQuantity_defaultValue!}" deValue="${availiQuantity_defaultValue!}"   exp="equal"   />
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="availiQuantity_end" id="adv_availiQuantity_end" value="${availiQuantity_defaultValue!}" deValue="${availiQuantity_defaultValue!}"   exp="equal"  />
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
			viewCode: 'WOM_7.5.0.0_standingcropRef_manulOrderRef',
			modelCode: 'WOM_7.5.0.0_standingcropRef_StandingcropRef',
			modelName: 'StandingcropRef',
			formId: 'ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm',
			olddiv: 'WOM.standingcropRef.standingcropRef.manulOrderRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.standingcropRef.standingcropRef.manulOrderRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_standingcropRef_manulOrderRef'+"&entity.code="+'WOM_7.5.0.0_standingcropRef';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.standingcropRef.standingcropRef.manulOrderRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.standingcropRef.standingcropRef.manulOrderRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.standingcropRef.standingcropRef.manulOrderRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_standingcropRef_manulOrderRef'+"&entity.code="+'WOM_7.5.0.0_standingcropRef';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.standingcropRef.standingcropRef.manulOrderRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.standingcropRef.standingcropRef.manulOrderRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.standingcropRef.standingcropRef.manulOrderRef.advquery"] div.advConContent').css('height','130px');
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

<#assign datatable_firstLoad = false>
<#assign datatable_queryFunc = "WOM.standingcropRef.standingcropRef.manulOrderRef.query('query')">
<#assign datatable_dataUrl = "/WOM/standingcropRef/standingcropRef/manulOrderRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_query" renderOverEvent="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_RenderOverEvent" pageInitMethod="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_PageInitMethod" modelCode="WOM_7.5.0.0_standingcropRef_StandingcropRef" noPermissionKeys="good.productCode,batchText,wareID.wareCode,availiQuantity" hidekeyPrefix="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_standingcropRef_standingcropRef_manulOrderRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.standingcropRef.standingcropRef.manulOrderRef.sendBackmanulOrderRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','good.id','wareID.id','id','batchText']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.standingcropRef.standingcropRef.manulOrderRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign good_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${good_productCode_displayDefaultType!}"  key="good.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchText_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_TEXT"    showFormat="TEXT" defaultDisplay="${batchText_displayDefaultType!}"  key="batchText"   label="${getText('WOM.propertydisplayName.randon1490064501469')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign availiQuantity_displayDefaultType  = ''>
			<@datacolumn columnName="AVAILI_QUANTITY"    showFormat="TEXT" defaultDisplay="${availiQuantity_displayDefaultType!}"  key="availiQuantity"   label="${getText('WOM.propertyshowName.randon1564138356335.flag')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_standingcropRef_standingcropRef_manulOrderRef_RenderOverEvent(){
}
function ec_WOM_standingcropRef_standingcropRef_manulOrderRef_PageInitMethod(){
// console.log("-- 获取选中行的物料编码，物料批次，仓库编码---");
 var nRow = PrepareMaterialPart_dg1489977909385Widget.getSelectedRow();
 var dataPost = "?";
 // 物料编码 TODO: 暂时改成2000000016 PrepareMaterialPart_dg1489977909385Widget.getCellValue(nRow, 'productId.productCode')
 var materialCode = PrepareMaterialPart_dg1489977909385Widget.getCellValue(nRow, 'productId.productCode');
 // 物料批次
 var batchNum = PrepareMaterialPart_dg1489977909385Widget.getCellValue(nRow, 'batchNum');
 // 仓库编码
 var wareCode = PrepareMaterialPart_dg1489977909385Widget.getCellValue(nRow, 'ware.wareCode');
 dataPost += "&materialCode=" + (materialCode == undefined ? "" : materialCode);
 // dataPost += "&batchNum=" + (batchNum == undefined ? "" : batchNum);
 // dataPost += "&wareCode=" + (wareCode == undefined ? "" : wareCode);
 // console.log("-- 获取数据并填充表格---", dataPost);
 datatable_ec_WOM_standingcropRef_standingcropRef_manulOrderRef_query.setRequestDataUrl("/WOM/standingcropRef/standingcropRef/getStockInfo.action" + dataPost);
}
	
	
	
	
</script>