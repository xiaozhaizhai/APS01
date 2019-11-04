	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1497577629830')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_formulaType_formulaType_typePartRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formulaType_formulaType_typePartRef_queryForm" exportUrl="/RM/formulaType/formulaType/typePartRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="RM_formulaType_formulaType_typePartRef_condition" id="RM_formulaType_formulaType_typePartRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1497578145747')}_${getText('RM.viewtitle.randon1497851111873')}.xls" />
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
		<div id="ec_RM_formulaType_formulaType_typePartRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_formulaType_formulaType_typePartRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_formulaType_typePartRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_formulaType_typePartRef" formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" dataTableId="ec_RM_formulaType_formulaType_typePartRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_formulaType_formulaType_typePartRef_queryForm" isExpandAll=true formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" idprefix="ec_RM_formulaType_formulaType_typePartRef" expandType="all"  fieldcodes="RM_7.5.0.0_formulaType_FormulaType_code_code:RM.propertydisplayName.randon1497578199553||RM_7.5.0.0_formulaType_FormulaType_name_name:RM.propertydisplayName.randon1497578232478" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" code="RM_7.5.0.0_formulaType_FormulaType_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_formulaType_FormulaType_code_code" isCustomize=true style="" > 
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="RM.formulaType.formulaType.typePartRef._querycustomFunc('code')" name="code" id="ec_RM_formulaType_formulaType_typePartRef_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/RM/formulaType/formulaType/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formulaType.formulaType.typePartRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="RM.formulaType.formulaType.typePartRef._querycustomFunc('code')" name="code" id="ec_RM_formulaType_formulaType_typePartRef_queryForm_code" displayFieldName="code" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/RM/formulaType/formulaType/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formulaType.formulaType.typePartRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" code="RM_7.5.0.0_formulaType_FormulaType_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_formulaType_FormulaType_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" type="adv" onclick="RM.formulaType.formulaType.typePartRef.commonQuery('query')" onadvancedclick="advQuery('RM.formulaType.formulaType.typePartRef.advquery')" /> 
						 		<@querybutton formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_formulaType_formulaType_typePartRef_quickquery_info={};
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["MainTableName"]="RM_FORMULA_TYPES";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["code"]={};
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["code"].dbColumnType="TEXT";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["code"].layRec="code";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["code"].columnName="CODE";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["name"]={};
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["name"].layRec="name";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["name"].columnName="NAME";
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
 	var advRemainDialog = $('[id="RM.formulaType.formulaType.typePartRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.formulaType.formulaType.typePartRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_formulaType_formulaType_typePartRef_adv_queryForm" exportUrl="/RM/formulaType/formulaType/typePartRef-query.action">
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formulaType_formulaType_typePartRef_adv_queryForm" code="RM_7.5.0.0_formulaType_FormulaType_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_formulaType_FormulaType_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formulaType_FormulaType" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="RM_FORMULA_TYPES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formulaType_FormulaType" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="adv_name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_formulaType_formulaType_typePartRef_adv_queryForm" code="RM_7.5.0.0_formulaType_FormulaType_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_formulaType_FormulaType_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formulaType_FormulaType" layRec="code" columnname="CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="RM_FORMULA_TYPES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formulaType_FormulaType" />
										<#if (code_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_RM_formulaType_formulaType_typePartRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="RM.formulaType.formulaType.typePartRef._querycustomFunc('code')" name="code" id="adv_ec_RM_formulaType_formulaType_typePartRef_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/RM/formulaType/formulaType/mneClient.action" multiple=false mnewidth=260   currentViewCode="RM_7.5.0.0_formulaType_typePartRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_RM_formulaType_formulaType_typePartRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="RM.formulaType.formulaType.typePartRef._querycustomFunc('code')" name="code" id="adv_ec_RM_formulaType_formulaType_typePartRef_queryForm_code" displayFieldName="code" exp="like"  classStyle="cui-noborder-input"  url="/RM/formulaType/formulaType/mneClient.action" multiple=false mnewidth=260  currentViewCode="RM_7.5.0.0_formulaType_typePartRef"  realPermissionCode="${permissionCode!}"   />
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
			viewCode: 'RM_7.5.0.0_formulaType_typePartRef',
			modelCode: 'RM_7.5.0.0_formulaType_FormulaType',
			modelName: 'FormulaType',
			formId: 'ec_RM_formulaType_formulaType_typePartRef_queryForm',
			olddiv: 'RM.formulaType.formulaType.typePartRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.formulaType.formulaType.typePartRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formulaType_typePartRef'+"&entity.code="+'RM_7.5.0.0_formulaType';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.formulaType.formulaType.typePartRef.advquery'] #customquContent").html(html);
		 	$("[id='RM.formulaType.formulaType.typePartRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.formulaType.formulaType.typePartRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_formulaType_typePartRef'+"&entity.code="+'RM_7.5.0.0_formulaType';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.formulaType.formulaType.typePartRef.advquery'] #customquContent").html(html);
			 $("[id='RM.formulaType.formulaType.typePartRef.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.formulaType.formulaType.typePartRef.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.formulaType.formulaType.typePartRef.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.formulaType.formulaType.typePartRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.formulaType.formulaType.typePartRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.formulaType.formulaType.typePartRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.formulaType.formulaType.typePartRef.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.formulaType.formulaType.typePartRef.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.formulaType.formulaType.typePartRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.formulaType.formulaType.typePartRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.formulaType.formulaType.typePartRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.formulaType.formulaType.typePartRef.query('query')">
<#assign datatable_dataUrl = "/RM/formulaType/formulaType/typePartRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_formulaType_formulaType_typePartRef_query" renderOverEvent="ec_RM_formulaType_formulaType_typePartRef_RenderOverEvent" pageInitMethod="ec_RM_formulaType_formulaType_typePartRef_PageInitMethod" modelCode="RM_7.5.0.0_formulaType_FormulaType" noPermissionKeys="code,name,remark" hidekeyPrefix="ec_RM_formulaType_formulaType_typePartRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.formulaType.formulaType.typePartRef.sendBacktypePartRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','code','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.formulaType.formulaType.typePartRef.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePartRef_add_add_RM_7.5.0.0_formulaType_typePartRef||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1497579207817')}||iconcls:add||useInMore:false||onclick:
				RM.formulaType.formulaType.typePartRef.addtypePartRef()
		" 
		resultType="json" 
		buttonCode="RM_7.5.0.0_formulaType_typePartRef_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePartRef_add_add_RM_7.5.0.0_formulaType_typePartRef||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1497579207817')}||iconcls:add||useInMore:false||onclick:
				RM.formulaType.formulaType.typePartRef.addtypePartRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePartRef_eidt_modify_RM_7.5.0.0_formulaType_typePartRef||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1497579248360')}||iconcls:modify||useInMore:false||onclick:
				RM.formulaType.formulaType.typePartRef.modifytypePartRef()
		" 
		resultType="json" 
		buttonCode="RM_7.5.0.0_formulaType_typePartRef_BUTTON_eidt"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePartRef_eidt_modify_RM_7.5.0.0_formulaType_typePartRef||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1497579248360')}||iconcls:modify||useInMore:false||onclick:
				RM.formulaType.formulaType.typePartRef.modifytypePartRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePartRef_delete_del_RM_7.5.0.0_formulaType_typePartRef||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1497579263400')}||iconcls:del||useInMore:false||onclick:
				RM.formulaType.formulaType.typePartRef.deltypePartRef()
		" 
		resultType="json" 
		buttonCode="RM_7.5.0.0_formulaType_typePartRef_BUTTON_delete"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}typePartRef_delete_del_RM_7.5.0.0_formulaType_typePartRef||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1497579263400')}||iconcls:del||useInMore:false||onclick:
				RM.formulaType.formulaType.typePartRef.deltypePartRef()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('RM.propertydisplayName.randon14975781556699553')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon14975782355662478111')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('RM.propertydisplayName.randon1497578261795')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formulaType_formulaType_typePartRef_RenderOverEvent(){
}
function ec_RM_formulaType_formulaType_typePartRef_PageInitMethod(){
}
	
	
	
</script>