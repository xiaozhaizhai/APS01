	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415150373047')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_tankModel_tankModel_modelRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" exportUrl="/MESBasic/tankModel/tankModel/modelRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="MESBasic_tankModel_tankModel_modelRef_condition" id="MESBasic_tankModel_tankModel_modelRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415150418847')}_${getText('MESBasic.viewtitle.radion1415322322556')}.xls" />
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
		<div id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_tankModel_modelRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_tankModel_modelRef" formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" dataTableId="ec_MESBasic_tankModel_tankModel_modelRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_tankModel_tankModel_modelRef_queryForm" isExpandAll=true formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" idprefix="ec_MESBasic_tankModel_tankModel_modelRef" expandType="all"  fieldcodes="MESBasic_1_tankModel_TankModel_code_code:MESBasic.propertydisplayName.radion1415150470967||MESBasic_1_tankModel_TankModel_name_name:MESBasic.propertydisplayName.radion1415150519135||MESBasic_1_tankModel_TankModel_shape_shape:MESBasic.propertydisplayName.radion1415150919382" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" code="MESBasic_1_tankModel_TankModel_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_tankModel_TankModel_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('code')" name="code" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('code')" name="code" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" code="MESBasic_1_tankModel_TankModel_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_tankModel_TankModel_name_name" isCustomize=true style="" > 
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('name')" name="name" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('name')" name="name" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_name" displayFieldName="name" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign shape_defaultValue  = 'TANK_SHAPE/0'>
									<#assign shape_defaultValue  = 'TANK_SHAPE/0'>
							<@queryfield formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" code="MESBasic_1_tankModel_TankModel_shape" showFormat="SELECTCOMP" defaultValue=shape_defaultValue  divCode="MESBasic_1_tankModel_TankModel_shape_shape" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${shape_defaultValue}"   name="shape" code="TANK_SHAPE" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" type="adv" onclick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" onadvancedclick="advQuery('MESBasic.tankModel.tankModel.modelRef.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info={};
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["MainTableName"]="MESBASIC_TANK_MODELS";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["code"]={};
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["code"].layRec="code";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["name"]={};
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["name"].layRec="name";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["name"].columnName="NAME";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["shape"]={};
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["shape"].dbColumnType="SYSTEMCODE";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["shape"].layRec="shape";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["shape"].columnName="SHAPE";
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
 	var advRemainDialog = $('[id="MESBasic.tankModel.tankModel.modelRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.tankModel.tankModel.modelRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_tankModel_tankModel_modelRef_adv_queryForm" exportUrl="/MESBasic/tankModel/tankModel/modelRef-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_tankModel_tankModel_modelRef_adv_queryForm" code="MESBasic_1_tankModel_TankModel_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="MESBasic_1_tankModel_TankModel_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_tankModel_TankModel" layRec="code" columnname="CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="MESBASIC_TANK_MODELS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_tankModel_TankModel" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_tankModel_tankModel_modelRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_tankModel_tankModel_modelRef_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_tankModel_modelRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_tankModel_tankModel_modelRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('code')" name="code" id="adv_ec_MESBasic_tankModel_tankModel_modelRef_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_tankModel_modelRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_tankModel_tankModel_modelRef_adv_queryForm" code="MESBasic_1_tankModel_TankModel_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="MESBasic_1_tankModel_TankModel_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_tankModel_TankModel" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="MESBASIC_TANK_MODELS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										型号名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_tankModel_TankModel" />
										<#if (name_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_tankModel_tankModel_modelRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_tankModel_tankModel_modelRef_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_tankModel_modelRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_tankModel_tankModel_modelRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('name')" name="name" id="adv_ec_MESBasic_tankModel_tankModel_modelRef_queryForm_name" displayFieldName="name" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_tankModel_modelRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign shape_defaultValue  = 'TANK_SHAPE/0'>
									<#assign shape_defaultValue  = 'TANK_SHAPE/0'>
								<@advsqueryfield formId="ec_MESBasic_tankModel_tankModel_modelRef_adv_queryForm" code="MESBasic_1_tankModel_TankModel_shape" showFormat="SELECTCOMP" defaultValue=shape_defaultValue  divCode="MESBasic_1_tankModel_TankModel_shape_shape" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_tankModel_TankModel" layRec="shape" columnname="SHAPE" columntype="SYSTEMCODE" name="shape" fieldType="SELECTCOMP" tableName="MESBASIC_TANK_MODELS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										储罐形状
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_tankModel_TankModel" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${shape_defaultValue}"   name="shape" code="TANK_SHAPE" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'MESBasic_1_tankModel_modelRef',
			modelCode: 'MESBasic_1_tankModel_TankModel',
			modelName: 'TankModel',
			formId: 'ec_MESBasic_tankModel_tankModel_modelRef_queryForm',
			olddiv: 'MESBasic.tankModel.tankModel.modelRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.tankModel.tankModel.modelRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_tankModel_modelRef'+"&entity.code="+'MESBasic_1_tankModel';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.tankModel.tankModel.modelRef.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.tankModel.tankModel.modelRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.tankModel.tankModel.modelRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_tankModel_modelRef'+"&entity.code="+'MESBasic_1_tankModel';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.tankModel.tankModel.modelRef.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.tankModel.tankModel.modelRef.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.tankModel.tankModel.modelRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.tankModel.tankModel.modelRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/tankModel/tankModel/modelRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_tankModel_tankModel_modelRef_query" renderOverEvent="ec_MESBasic_tankModel_tankModel_modelRef_RenderOverEvent" pageInitMethod="ec_MESBasic_tankModel_tankModel_modelRef_PageInitMethod" modelCode="MESBasic_1_tankModel_TankModel" noPermissionKeys="code,name,shape,volume" hidekeyPrefix="ec_MESBasic_tankModel_tankModel_modelRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.tankModel.tankModel.modelRef.sendBackmodelRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','shape.id','code','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.tankModel.tankModel.modelRef.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}modelRef_modelNew_add_MESBasic_1_tankModel_modelRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415151182181')}||iconcls:add||useInMore:false||onclick:
				MESBasic.tankModel.tankModel.modelRef.addmodelRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_tankModel_modelRef_BUTTON_modelNew"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}modelRef_modelNew_add_MESBasic_1_tankModel_modelRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415151182181')}||iconcls:add||useInMore:false||onclick:
				MESBasic.tankModel.tankModel.modelRef.addmodelRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}modelRef_modelEdit_modify_MESBasic_1_tankModel_modelRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.tankModel.tankModel.modelRef.modifymodelRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_tankModel_modelRef_BUTTON_modelEdit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}modelRef_modelEdit_modify_MESBasic_1_tankModel_modelRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.tankModel.tankModel.modelRef.modifymodelRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}modelRef_modelDel_del_MESBasic_1_tankModel_modelRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415151220172')}||iconcls:del||useInMore:false||onclick:
				MESBasic.tankModel.tankModel.modelRef.delmodelRef()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_tankModel_modelRef_BUTTON_modelDel"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}modelRef_modelDel_del_MESBasic_1_tankModel_modelRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1415151220172')}||iconcls:del||useInMore:false||onclick:
				MESBasic.tankModel.tankModel.modelRef.delmodelRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}modelRef_inportTankModel_import_MESBasic_1_tankModel_modelRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486798137287')}||iconcls:import||useInMore:false||onclick:
				MESBasic.tankModel.tankModel.modelRef.importmodelRef()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.tankModel.tankModel.modelRef.downloadTemplatemodelRef()},useInMore:'false'}]
		" 
		resultType="json" 
		buttonCode="MESBasic_1_tankModel_modelRef_BUTTON_inportTankModel"
		buttonType="IMPORT" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}modelRef_inportTankModel_import_MESBasic_1_tankModel_modelRef||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1486798137287')}||iconcls:import||useInMore:false||onclick:
				MESBasic.tankModel.tankModel.modelRef.importmodelRef()||subButtons:[{text:'${getText('import.file.downloadtemplate')}',handler:function(){MESBasic.tankModel.tankModel.modelRef.downloadTemplatemodelRef()},useInMore:'false'}]
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415150470967')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1415150519135')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign shape_displayDefaultType  = ''>
			<@datacolumn columnName="SHAPE"    showFormat="SELECTCOMP" defaultDisplay="${shape_displayDefaultType!}"  key="shape.value"   label="${getText('MESBasic.propertydisplayName.radion1415150919382')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign volume_displayDefaultType  = ''>
			<@datacolumn columnName="VOLUME"    showFormat="TEXT" defaultDisplay="${volume_displayDefaultType!}"  key="volume"   label="${getText('MESBasic.propertydisplayName.radion1415150645388')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_tankModel_tankModel_modelRef_RenderOverEvent(){
}
function ec_MESBasic_tankModel_tankModel_modelRef_PageInitMethod(){
}
	
	
	
	
</script>