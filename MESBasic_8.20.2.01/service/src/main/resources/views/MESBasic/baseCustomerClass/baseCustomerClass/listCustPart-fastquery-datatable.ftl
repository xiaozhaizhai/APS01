	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1449628164766')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm" exportUrl="/MESBasic/baseCustomerClass/baseCustomerClass/listCustPart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1449628207713')}_${getText('MESBasic.viewtitle.randon1449632271935')}.xls" />
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
		<div id="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_baseCustomerClass_listCustPart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_baseCustomerClass_listCustPart" formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm" dataTableId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm" isExpandAll=true formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm" idprefix="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart" expandType="all"  fieldcodes="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccCode_ccCode:MESBasic.propertydisplayName.randon1449628448449||MESBasic_1_baseCustomerClass_BaseCustomerClass_ccName_ccName:MESBasic.propertydisplayName.randon1449628587988" > 
							<#assign ccCode_defaultValue  = ''>
									<#assign ccCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm" code="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccCode" showFormat="TEXT" defaultValue=ccCode_defaultValue  divCode="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccCode_ccCode" isCustomize=true style="" > 
										<#if (ccCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm"  isPrecise=true value="${ccCode_defaultValue!}" deValue="${ccCode_defaultValue!}"   conditionfunc="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart._querycustomFunc('ccCode')" name="ccCode" id="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_ccCode" displayFieldName="ccCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseCustomerClass/baseCustomerClass/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart._querycustomFunc('ccCode')" name="ccCode" id="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_ccCode" displayFieldName="ccCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseCustomerClass/baseCustomerClass/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign ccName_defaultValue  = ''>
									<#assign ccName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm" code="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccName" showFormat="TEXT" defaultValue=ccName_defaultValue  divCode="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccName_ccName" isCustomize=true style="" > 
										<#if (ccName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm"  isPrecise=true value="${ccName_defaultValue!}" deValue="${ccName_defaultValue!}"   conditionfunc="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart._querycustomFunc('ccName')" name="ccName" id="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_ccName" displayFieldName="ccName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseCustomerClass/baseCustomerClass/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart._querycustomFunc('ccName')" name="ccName" id="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_ccName" displayFieldName="ccName" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseCustomerClass/baseCustomerClass/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm" type="adv" onclick="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info={};
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info["MainTableName"]="S2BASE_CUSTOMERCLASS";
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info["ccCode"]={};
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info["ccCode"].dbColumnType="TEXT";
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info["ccCode"].layRec="ccCode";
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info["ccCode"].columnName="CC_CODE";
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info["ccName"]={};
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info["ccName"].dbColumnType="TEXT";
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info["ccName"].layRec="ccName";
ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_quickquery_info["ccName"].columnName="CC_NAME";
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
 	var advRemainDialog = $('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_adv_queryForm" exportUrl="/MESBasic/baseCustomerClass/baseCustomerClass/listCustPart-query.action">
							<#assign ccCode_defaultValue  = ''>
									<#assign ccCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_adv_queryForm" code="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccCode" showFormat="TEXT" defaultValue=ccCode_defaultValue  divCode="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccCode_ccCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomerClass_BaseCustomerClass" layRec="ccCode" columnname="CC_CODE" columntype="TEXT" name="ccCode" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMERCLASS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										分类编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomerClass_BaseCustomerClass" />
										<#if (ccCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_adv_queryForm"  isPrecise=true value="${ccCode_defaultValue!}" deValue="${ccCode_defaultValue!}"   conditionfunc="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart._querycustomFunc('ccCode')" name="ccCode" id="adv_ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_ccCode" displayFieldName="ccCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseCustomerClass/baseCustomerClass/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseCustomerClass_listCustPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart._querycustomFunc('ccCode')" name="ccCode" id="adv_ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_ccCode" displayFieldName="ccCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseCustomerClass/baseCustomerClass/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseCustomerClass_listCustPart"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign ccName_defaultValue  = ''>
									<#assign ccName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_adv_queryForm" code="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccName" showFormat="TEXT" defaultValue=ccName_defaultValue  divCode="MESBasic_1_baseCustomerClass_BaseCustomerClass_ccName_ccName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseCustomerClass_BaseCustomerClass" layRec="ccName" columnname="CC_NAME" columntype="TEXT" name="ccName" fieldType="TEXTFIELD" tableName="S2BASE_CUSTOMERCLASS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										分类名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseCustomerClass_BaseCustomerClass" />
										<#if (ccName_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_adv_queryForm"  isPrecise=true value="${ccName_defaultValue!}" deValue="${ccName_defaultValue!}"   conditionfunc="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart._querycustomFunc('ccName')" name="ccName" id="adv_ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_ccName" displayFieldName="ccName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseCustomerClass/baseCustomerClass/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseCustomerClass_listCustPart"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_adv_queryForm"  isPrecise=true  conditionfunc="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart._querycustomFunc('ccName')" name="ccName" id="adv_ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm_ccName" displayFieldName="ccName" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseCustomerClass/baseCustomerClass/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseCustomerClass_listCustPart"  realPermissionCode="${permissionCode!}"   />
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
			viewCode: 'MESBasic_1_baseCustomerClass_listCustPart',
			modelCode: 'MESBasic_1_baseCustomerClass_BaseCustomerClass',
			modelName: 'BaseCustomerClass',
			formId: 'ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm',
			olddiv: 'MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseCustomerClass_listCustPart'+"&entity.code="+'MESBasic_1_baseCustomerClass';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseCustomerClass_listCustPart'+"&entity.code="+'MESBasic_1_baseCustomerClass';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseCustomerClass/baseCustomerClass/listCustPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_query" renderOverEvent="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_RenderOverEvent" pageInitMethod="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_PageInitMethod" modelCode="MESBasic_1_baseCustomerClass_BaseCustomerClass" noPermissionKeys="ccCode,ccName,ccMemo" hidekeyPrefix="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.dbmodifylistCustPart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}listCustPart_add_add_MESBasic_1_baseCustomerClass_listCustPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449632387077')}||iconcls:add||useInMore:false||onclick:
				MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.addlistCustPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseCustomerClass_listCustPart_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}listCustPart_add_add_MESBasic_1_baseCustomerClass_listCustPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449632387077')}||iconcls:add||useInMore:false||onclick:
				MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.addlistCustPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}listCustPart_edit_modify_MESBasic_1_baseCustomerClass_listCustPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449632418324')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.modifylistCustPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseCustomerClass_listCustPart_BUTTON_edit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}listCustPart_edit_modify_MESBasic_1_baseCustomerClass_listCustPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449632418324')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.modifylistCustPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}listCustPart_del_del_MESBasic_1_baseCustomerClass_listCustPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449632442010')}||iconcls:del||useInMore:false||onclick:
				MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.dellistCustPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_baseCustomerClass_listCustPart_BUTTON_del"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}listCustPart_del_del_MESBasic_1_baseCustomerClass_listCustPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1449632442010')}||iconcls:del||useInMore:false||onclick:
				MESBasic.baseCustomerClass.baseCustomerClass.listCustPart.dellistCustPart()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign ccCode_displayDefaultType  = ''>
			<@datacolumn columnName="CC_CODE"    showFormat="TEXT" defaultDisplay="${ccCode_displayDefaultType!}"  key="ccCode"   label="${getText('MESBasic.propertydisplayName.randon1449628448449')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign ccName_displayDefaultType  = ''>
			<@datacolumn columnName="CC_NAME"    showFormat="TEXT" defaultDisplay="${ccName_displayDefaultType!}"  key="ccName"   label="${getText('MESBasic.propertydisplayName.randon1449628587988')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign ccMemo_displayDefaultType  = ''>
			<@datacolumn columnName="CC_MEMO"    showFormat="TEXT" defaultDisplay="${ccMemo_displayDefaultType!}"  key="ccMemo"   label="${getText('MESBasic.propertydisplayName.randon1449628553060')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_RenderOverEvent(){
}
function ec_MESBasic_baseCustomerClass_baseCustomerClass_listCustPart_PageInitMethod(){
}
	
	
	
</script>