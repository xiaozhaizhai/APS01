	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1543218605993')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" exportUrl="/WOM/materialReject/rejectReason/rejectReasonRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="WOM_materialReject_rejectReason_rejectReasonRef_condition" id="WOM_materialReject_rejectReason_rejectReasonRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1543218738977')}_${getText('WOM.viewtitle.randon1543219942185')}.xls" />
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
		<div id="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_materialReject_rejectReasonRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_materialReject_rejectReasonRef" formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" dataTableId="ec_WOM_materialReject_rejectReason_rejectReasonRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" isExpandAll=true formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" idprefix="ec_WOM_materialReject_rejectReason_rejectReasonRef" expandType="all"  fieldcodes="WOM_7.5.0.0_materialReject_RejectReason_rejectReson_rejectReson:WOM.propertydisplayName.randon1543218783588||WOM_7.5.0.0_materialReject_RejectReason_isChangeNeed_isChangeNeed:WOM.propertydisplayName.randon1543218766334" > 
							<#assign rejectReson_defaultValue  = ''>
									<#assign rejectReson_defaultValue  = ''>
							<@queryfield formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" code="WOM_7.5.0.0_materialReject_RejectReason_rejectReson" showFormat="TEXT" defaultValue=rejectReson_defaultValue  divCode="WOM_7.5.0.0_materialReject_RejectReason_rejectReson_rejectReson" isCustomize=true style="" > 
										<#if (rejectReson_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${rejectReson_defaultValue!}" deValue="${rejectReson_defaultValue!}"   conditionfunc="WOM.materialReject.rejectReason.rejectReasonRef._querycustomFunc('rejectReson')" name="rejectReson" id="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm_rejectReson" displayFieldName="rejectReson" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/WOM/materialReject/rejectReason/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.materialReject.rejectReason.rejectReasonRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="WOM.materialReject.rejectReason.rejectReasonRef._querycustomFunc('rejectReson')" name="rejectReson" id="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm_rejectReson" displayFieldName="rejectReson" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/WOM/materialReject/rejectReason/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.materialReject.rejectReason.rejectReasonRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<#assign isChangeNeed_defaultValue  = ''>
									<#assign isChangeNeed_defaultValue  = ''>
							<@queryfield formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" code="WOM_7.5.0.0_materialReject_RejectReason_isChangeNeed" showFormat="SELECT" defaultValue=isChangeNeed_defaultValue  divCode="WOM_7.5.0.0_materialReject_RejectReason_isChangeNeed_isChangeNeed" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${isChangeNeed_defaultValue!}" name="isChangeNeed" id="isChangeNeed" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (isChangeNeed_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (isChangeNeed_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" type="adv" onclick="WOM.materialReject.rejectReason.rejectReasonRef.commonQuery('query')" onadvancedclick="advQuery('WOM.materialReject.rejectReason.rejectReasonRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info={};
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info["MainTableName"]="WOM_REJECT_REASONS";
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info["rejectReson"]={};
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info["rejectReson"].dbColumnType="TEXT";
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info["rejectReson"].layRec="rejectReson";
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info["rejectReson"].columnName="REJECT_RESON";
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info["isChangeNeed"]={};
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info["isChangeNeed"].dbColumnType="BOOLEAN";
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info["isChangeNeed"].layRec="isChangeNeed";
ec_WOM_materialReject_rejectReason_rejectReasonRef_quickquery_info["isChangeNeed"].columnName="IS_CHANGE_NEED";
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
 	var advRemainDialog = $('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.materialReject.rejectReason.rejectReasonRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_materialReject_rejectReason_rejectReasonRef_adv_queryForm" exportUrl="/WOM/materialReject/rejectReason/rejectReasonRef-query.action">
							<#assign rejectReson_defaultValue  = ''>
									<#assign rejectReson_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_adv_queryForm" code="WOM_7.5.0.0_materialReject_RejectReason_rejectReson" showFormat="TEXT" defaultValue=rejectReson_defaultValue  divCode="WOM_7.5.0.0_materialReject_RejectReason_rejectReson_rejectReson" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_materialReject_RejectReason" layRec="rejectReson" columnname="REJECT_RESON" columntype="TEXT" name="rejectReson" fieldType="TEXTFIELD" tableName="WOM_REJECT_REASONS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										退料原因
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_materialReject_RejectReason" />
										<#if (rejectReson_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${rejectReson_defaultValue!}" deValue="${rejectReson_defaultValue!}"   conditionfunc="WOM.materialReject.rejectReason.rejectReasonRef._querycustomFunc('rejectReson')" name="rejectReson" id="adv_ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm_rejectReson" displayFieldName="rejectReson" exp="like"  classStyle="cui-noborder-input"  url="/WOM/materialReject/rejectReason/mneClient.action" multiple=false mnewidth=260   currentViewCode="WOM_7.5.0.0_materialReject_rejectReasonRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="WOM.materialReject.rejectReason.rejectReasonRef._querycustomFunc('rejectReson')" name="rejectReson" id="adv_ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm_rejectReson" displayFieldName="rejectReson" exp="like"  classStyle="cui-noborder-input"  url="/WOM/materialReject/rejectReason/mneClient.action" multiple=false mnewidth=260  currentViewCode="WOM_7.5.0.0_materialReject_rejectReasonRef"  realPermissionCode="${permissionCode!}"   />
										</#if>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign isChangeNeed_defaultValue  = ''>
									<#assign isChangeNeed_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_adv_queryForm" code="WOM_7.5.0.0_materialReject_RejectReason_isChangeNeed" showFormat="SELECT" defaultValue=isChangeNeed_defaultValue  divCode="WOM_7.5.0.0_materialReject_RejectReason_isChangeNeed_isChangeNeed" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_materialReject_RejectReason" layRec="isChangeNeed" columnname="IS_CHANGE_NEED" columntype="BOOLEAN" name="isChangeNeed" fieldType="SELECT" tableName="WOM_REJECT_REASONS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										是否修改配料需求状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_materialReject_RejectReason" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${isChangeNeed_defaultValue!}" name="isChangeNeed" id="adv_isChangeNeed" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (isChangeNeed_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (isChangeNeed_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
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
			viewCode: 'WOM_7.5.0.0_materialReject_rejectReasonRef',
			modelCode: 'WOM_7.5.0.0_materialReject_RejectReason',
			modelName: 'RejectReason',
			formId: 'ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm',
			olddiv: 'WOM.materialReject.rejectReason.rejectReasonRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.materialReject.rejectReason.rejectReasonRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_materialReject_rejectReasonRef'+"&entity.code="+'WOM_7.5.0.0_materialReject';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.materialReject.rejectReason.rejectReasonRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.materialReject.rejectReason.rejectReasonRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.materialReject.rejectReason.rejectReasonRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_materialReject_rejectReasonRef'+"&entity.code="+'WOM_7.5.0.0_materialReject';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.materialReject.rejectReason.rejectReasonRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.materialReject.rejectReason.rejectReasonRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.materialReject.rejectReason.rejectReasonRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.materialReject.rejectReason.rejectReasonRef.query('query')">
<#assign datatable_dataUrl = "/WOM/materialReject/rejectReason/rejectReasonRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_materialReject_rejectReason_rejectReasonRef_query" renderOverEvent="ec_WOM_materialReject_rejectReason_rejectReasonRef_RenderOverEvent" pageInitMethod="ec_WOM_materialReject_rejectReason_rejectReasonRef_PageInitMethod" modelCode="WOM_7.5.0.0_materialReject_RejectReason" noPermissionKeys="rejectReson,isChangeNeed,demo" hidekeyPrefix="ec_WOM_materialReject_rejectReason_rejectReasonRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_materialReject_rejectReason_rejectReasonRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.materialReject.rejectReason.rejectReasonRef.sendBackrejectReasonRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.materialReject.rejectReason.rejectReasonRef.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}rejectReasonRef_add_add_WOM_7.5.0.0_materialReject_rejectReasonRef||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543220008751')}||iconcls:add||useInMore:false||onclick:
				WOM.materialReject.rejectReason.rejectReasonRef.addrejectReasonRef()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_materialReject_rejectReasonRef_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}rejectReasonRef_add_add_WOM_7.5.0.0_materialReject_rejectReasonRef||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543220008751')}||iconcls:add||useInMore:false||onclick:
				WOM.materialReject.rejectReason.rejectReasonRef.addrejectReasonRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}rejectReasonRef_edit_modify_WOM_7.5.0.0_materialReject_rejectReasonRef||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543220046447')}||iconcls:modify||useInMore:false||onclick:
				WOM.materialReject.rejectReason.rejectReasonRef.modifyrejectReasonRef()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_materialReject_rejectReasonRef_BUTTON_edit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}rejectReasonRef_edit_modify_WOM_7.5.0.0_materialReject_rejectReasonRef||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543220046447')}||iconcls:modify||useInMore:false||onclick:
				WOM.materialReject.rejectReason.rejectReasonRef.modifyrejectReasonRef()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}rejectReasonRef_delete_del_WOM_7.5.0.0_materialReject_rejectReasonRef||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543220063678')}||iconcls:del||useInMore:false||onclick:
				WOM.materialReject.rejectReason.rejectReasonRef.delrejectReasonRef()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_materialReject_rejectReasonRef_BUTTON_delete"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}rejectReasonRef_delete_del_WOM_7.5.0.0_materialReject_rejectReasonRef||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543220063678')}||iconcls:del||useInMore:false||onclick:
				WOM.materialReject.rejectReason.rejectReasonRef.delrejectReasonRef()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign rejectReson_displayDefaultType  = ''>
			<@datacolumn columnName="REJECT_RESON"    showFormat="TEXT" defaultDisplay="${rejectReson_displayDefaultType!}"  key="rejectReson"   label="${getText('WOM.propertydisplayName.randon1543218783588')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign isChangeNeed_displayDefaultType  = ''>
			<@datacolumn columnName="IS_CHANGE_NEED"    showFormat="SELECT" defaultDisplay="${isChangeNeed_displayDefaultType!}"  key="isChangeNeed"   label="${getText('WOM.propertydisplayName.randon1543218766334')}" textalign="center"  width=150   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign demo_displayDefaultType  = ''>
			<@datacolumn columnName="DEMO"    showFormat="TEXT" defaultDisplay="${demo_displayDefaultType!}"  key="demo"   label="${getText('WOM.propertydisplayName.randon1543218754563')}" textalign="left"  width=400   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_materialReject_rejectReason_rejectReasonRef_RenderOverEvent(){
}
function ec_WOM_materialReject_rejectReason_rejectReasonRef_PageInitMethod(){
}
	
	
	
</script>