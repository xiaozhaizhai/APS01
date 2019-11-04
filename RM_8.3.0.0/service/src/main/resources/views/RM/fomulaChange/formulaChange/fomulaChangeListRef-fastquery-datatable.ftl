	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1488267707733')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm" exportUrl="/RM/fomulaChange/formulaChange/fomulaChangeListRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="RM_fomulaChange_formulaChange_fomulaChangeListRef_condition" id="RM_fomulaChange_formulaChange_fomulaChangeListRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1488267733872')}_${getText('RM.viewtitle.randon1497866475136')}.xls" />
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
		<div id="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_fomulaChange_fomulaChangeListRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_fomulaChange_fomulaChangeListRef" formId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm" dataTableId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm" isExpandAll=true formId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm" idprefix="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef" expandType="all"  fieldcodes="RM_7.5.0.0_fomulaChange_FormulaChange_tableNo_tableNo:ec.common.tableNo||RM_7.5.0.0_fomulaChange_FormulaChange_changeType_changeType:RM.propertydisplayName.randon1488268014469" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm" code="RM_7.5.0.0_fomulaChange_FormulaChange_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="RM_7.5.0.0_fomulaChange_FormulaChange_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign changeType_defaultValue  = ''>
									<#assign changeType_defaultValue  = ''>
							<@queryfield formId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm" code="RM_7.5.0.0_fomulaChange_FormulaChange_changeType" showFormat="SELECTCOMP" defaultValue=changeType_defaultValue  divCode="RM_7.5.0.0_fomulaChange_FormulaChange_changeType_changeType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${changeType_defaultValue}"   name="changeType" code="changeType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm" type="adv" onclick="RM.fomulaChange.formulaChange.fomulaChangeListRef.commonQuery('query')" onadvancedclick="advQuery('RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery')" /> 
						 		<@querybutton formId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info={};
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info["MainTableName"]="RM_FORMULA_CHANGES";
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info["tableNo"]={};
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info["tableNo"].layRec="tableNo";
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info["changeType"]={};
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info["changeType"].dbColumnType="SYSTEMCODE";
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info["changeType"].layRec="changeType";
ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_quickquery_info["changeType"].columnName="CHANGE_TYPE";
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
 	var advRemainDialog = $('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_adv_queryForm" exportUrl="/RM/fomulaChange/formulaChange/fomulaChangeListRef-query.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_adv_queryForm" code="RM_7.5.0.0_fomulaChange_FormulaChange_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="RM_7.5.0.0_fomulaChange_FormulaChange_tableNo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_fomulaChange_FormulaChange" layRec="tableNo" columnname="TABLE_NO" columntype="TEXT" name="tableNo" fieldType="TEXTFIELD" tableName="RM_FORMULA_CHANGES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_fomulaChange_FormulaChange" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="adv_tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign changeType_defaultValue  = ''>
									<#assign changeType_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_adv_queryForm" code="RM_7.5.0.0_fomulaChange_FormulaChange_changeType" showFormat="SELECTCOMP" defaultValue=changeType_defaultValue  divCode="RM_7.5.0.0_fomulaChange_FormulaChange_changeType_changeType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_fomulaChange_FormulaChange" layRec="changeType" columnname="CHANGE_TYPE" columntype="SYSTEMCODE" name="changeType" fieldType="SELECTCOMP" tableName="RM_FORMULA_CHANGES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										变更类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_fomulaChange_FormulaChange" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${changeType_defaultValue}"   name="changeType" code="changeType" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'RM_7.5.0.0_fomulaChange_fomulaChangeListRef',
			modelCode: 'RM_7.5.0.0_fomulaChange_FormulaChange',
			modelName: 'FormulaChange',
			formId: 'ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm',
			olddiv: 'RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_fomulaChange_fomulaChangeListRef'+"&entity.code="+'RM_7.5.0.0_fomulaChange';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery'] #customquContent").html(html);
		 	$("[id='RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_fomulaChange_fomulaChangeListRef'+"&entity.code="+'RM_7.5.0.0_fomulaChange';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery'] #customquContent").html(html);
			 $("[id='RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.fomulaChange.formulaChange.fomulaChangeListRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.fomulaChange.formulaChange.fomulaChangeListRef.query('query')">
<#assign datatable_dataUrl = "/RM/fomulaChange/formulaChange/fomulaChangeListRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.fomulaChange.formulaChange.fomulaChangeListRef.query('query')">
<#assign datatable_dataUrl = "/RM/fomulaChange/formulaChange/fomulaChangeListRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_query" renderOverEvent="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_RenderOverEvent" pageInitMethod="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_PageInitMethod" modelCode="RM_7.5.0.0_fomulaChange_FormulaChange" noPermissionKeys="tableNo,modifyStaff.name,createTime,formulaId.code,formulaId.name,formulaId.edition,oldUsedFor,oldIsForProduct,oldState,changeType,usedFor,isForProduct,state" hidekeyPrefix="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.fomulaChange.formulaChange.fomulaChangeListRef.sendBackfomulaChangeListRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','oldUsedFor.id','oldState.id','changeType.id','usedFor.id','state.id','modifyStaff.id','formulaId.id','tableNo','tableNo','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.fomulaChange.formulaChange.fomulaChangeListRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign modifyStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${modifyStaff_name_displayDefaultType!}"  key="modifyStaff.name"   label="${getText('RM.staff.dimissionStaff_xls.staffName')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="CREATE_TIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('RM.common.createTime3233223')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${formulaId_code_displayDefaultType!}"  key="formulaId.code"   label="${getText('RM.formula.randon1488246312092')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${formulaId_name_displayDefaultType!}"  key="formulaId.name"   label="${getText('RM.formula.randon1487075823790')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formulaId_edition_displayDefaultType  = ''>
			<@datacolumn columnName="EDITION"    showFormat="TEXT" defaultDisplay="${formulaId_edition_displayDefaultType!}"  key="formulaId.edition"   label="${getText('RM.formula.randon122222222')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign oldUsedFor_displayDefaultType  = ''>
			<@datacolumn columnName="OLD_USED_FOR"    showFormat="SELECTCOMP" defaultDisplay="${oldUsedFor_displayDefaultType!}"  key="oldUsedFor.value"   label="${getText('RM.formula.randon1487076506987555434562345')}" textalign="center"  width=70   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign oldIsForProduct_displayDefaultType  = ''>
			<@datacolumn columnName="OLD_IS_FOR_PRODUCT"    showFormat="CHECKBOX" defaultDisplay="${oldIsForProduct_displayDefaultType!}"  key="oldIsForProduct"   label="${getText('RM.propertydisplayName.randon1489108150216')}" textalign="center"  width=70   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign oldState_displayDefaultType  = ''>
			<@datacolumn columnName="OLD_STATE"    showFormat="SELECTCOMP" defaultDisplay="${oldState_displayDefaultType!}"  key="oldState.value"   label="${getText('RM.propertydisplayName.randon14870764732577889')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign changeType_displayDefaultType  = ''>
			<@datacolumn columnName="CHANGE_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${changeType_displayDefaultType!}"  key="changeType.value"   label="${getText('RM.propertydisplayName.randon1488268014469')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign usedFor_displayDefaultType  = ''>
			<@datacolumn columnName="USED_FOR"    showFormat="SELECTCOMP" defaultDisplay="${usedFor_displayDefaultType!}"  key="usedFor.value"   label="${getText('RM.propertydisplayName.randon1488268147405134')}" textalign="center"  width=80   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign isForProduct_displayDefaultType  = ''>
			<@datacolumn columnName="IS_FOR_PRODUCT"    showFormat="SELECT" defaultDisplay="${isForProduct_displayDefaultType!}"  key="isForProduct"   label="${getText('RM.propertydisplayName.randon14882681701216767')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign state_displayDefaultType  = ''>
			<@datacolumn columnName="STATE"    showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('RM.propertydisplayName.randon1488268127768')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_RenderOverEvent(){
}
function ec_RM_fomulaChange_formulaChange_fomulaChangeListRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>