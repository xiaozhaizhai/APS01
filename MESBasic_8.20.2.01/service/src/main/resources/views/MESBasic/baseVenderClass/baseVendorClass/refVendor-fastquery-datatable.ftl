	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1449472647159')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" exportUrl="/MESBasic/baseVenderClass/baseVendorClass/refVendor-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="MESBasic_baseVenderClass_baseVendorClass_refVendor_condition" id="MESBasic_baseVenderClass_baseVendorClass_refVendor_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1449472699525')}_${getText('MESBasic.viewtitle.randon1449474675834')}.xls" />
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
		<div id="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_baseVenderClass_refVendor')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_baseVenderClass_refVendor" formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" dataTableId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" isExpandAll=true formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" idprefix="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor" expandType="all"  fieldcodes="MESBasic_1_baseVenderClass_BaseVendorClass_code_code:MESBasic.propertydisplayName.randon1449472741485||MESBasic_1_baseVenderClass_BaseVendorClass_name_name:MESBasic.propertydisplayName.randon1449472903805" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" code="MESBasic_1_baseVenderClass_BaseVendorClass_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_baseVenderClass_BaseVendorClass_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.baseVenderClass.baseVendorClass.refVendor._querycustomFunc('code')" name="code" id="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVenderClass/baseVendorClass/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVenderClass.baseVendorClass.refVendor.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.baseVenderClass.baseVendorClass.refVendor._querycustomFunc('code')" name="code" id="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVenderClass/baseVendorClass/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVenderClass.baseVendorClass.refVendor.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" code="MESBasic_1_baseVenderClass_BaseVendorClass_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_baseVenderClass_BaseVendorClass_name_name" isCustomize=true style="" > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.baseVenderClass.baseVendorClass.refVendor._querycustomFunc('name')" name="name" id="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVenderClass/baseVendorClass/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVenderClass.baseVendorClass.refVendor.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.baseVenderClass.baseVendorClass.refVendor._querycustomFunc('name')" name="name" id="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/baseVenderClass/baseVendorClass/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVenderClass.baseVendorClass.refVendor.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" type="adv" onclick="MESBasic.baseVenderClass.baseVendorClass.refVendor.commonQuery('query')" onadvancedclick="advQuery('MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info={};
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info["MainTableName"]="S2BASE_VENDORCLASS";
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info["code"]={};
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info["code"].layRec="code";
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info["code"].columnName="VC_CODE";
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info["name"]={};
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info["name"].layRec="name";
ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_quickquery_info["name"].columnName="VC_NAME";
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
 	var advRemainDialog = $('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_adv_queryForm" exportUrl="/MESBasic/baseVenderClass/baseVendorClass/refVendor-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_adv_queryForm" code="MESBasic_1_baseVenderClass_BaseVendorClass_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_baseVenderClass_BaseVendorClass_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVenderClass_BaseVendorClass" layRec="code" columnname="VC_CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="S2BASE_VENDORCLASS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										分类编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVenderClass_BaseVendorClass" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.baseVenderClass.baseVendorClass.refVendor._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVenderClass/baseVendorClass/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseVenderClass_refVendor"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.baseVenderClass.baseVendorClass.refVendor._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVenderClass/baseVendorClass/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseVenderClass_refVendor"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_adv_queryForm" code="MESBasic_1_baseVenderClass_BaseVendorClass_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_baseVenderClass_BaseVendorClass_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_baseVenderClass_BaseVendorClass" layRec="name" columnname="VC_NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="S2BASE_VENDORCLASS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										分类名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_baseVenderClass_BaseVendorClass" />
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.baseVenderClass.baseVendorClass.refVendor._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVenderClass/baseVendorClass/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_baseVenderClass_refVendor"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.baseVenderClass.baseVendorClass.refVendor._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/baseVenderClass/baseVendorClass/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_baseVenderClass_refVendor"  realPermissionCode="${permissionCode!}"   />
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
			viewCode: 'MESBasic_1_baseVenderClass_refVendor',
			modelCode: 'MESBasic_1_baseVenderClass_BaseVendorClass',
			modelName: 'BaseVendorClass',
			formId: 'ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm',
			olddiv: 'MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseVenderClass_refVendor'+"&entity.code="+'MESBasic_1_baseVenderClass';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_baseVenderClass_refVendor'+"&entity.code="+'MESBasic_1_baseVenderClass';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.baseVenderClass.baseVendorClass.refVendor.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.baseVenderClass.baseVendorClass.refVendor.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseVenderClass/baseVendorClass/refVendor-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_query" renderOverEvent="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_RenderOverEvent" pageInitMethod="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_PageInitMethod" modelCode="MESBasic_1_baseVenderClass_BaseVendorClass" noPermissionKeys="code,name,vcMemo" hidekeyPrefix="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.baseVenderClass.baseVendorClass.refVendor.sendBackrefVendor" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','code','code','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.baseVenderClass.baseVendorClass.refVendor.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="VC_CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.randon1449472741485')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="VC_NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.randon1449472903805')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign vcMemo_displayDefaultType  = ''>
			<@datacolumn columnName="VC_MEMO"    showFormat="TEXT" defaultDisplay="${vcMemo_displayDefaultType!}"  key="vcMemo"   label="${getText('MESBasic.propertydisplayName.randon1449472974516')}" textalign="left"  width=200   type="textarea"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_RenderOverEvent(){
}
function ec_MESBasic_baseVenderClass_baseVendorClass_refVendor_PageInitMethod(){
}
	
	
	
</script>