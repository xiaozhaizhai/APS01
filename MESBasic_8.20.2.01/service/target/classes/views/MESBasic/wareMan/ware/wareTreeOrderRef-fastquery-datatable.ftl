	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1484030983271')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" exportUrl="/MESBasic/wareMan/ware/wareTreeOrderRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="belongDept" bak_value="belongDept"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" id="MESBasic_1_wareClass_WareClass" value="wareClass" bak_value="wareClass"/>
		<input type="hidden" reset="false" name="MESBasic_wareMan_ware_wareTreeOrderRef_condition" id="MESBasic_wareMan_ware_wareTreeOrderRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1484031011977')}_${getText('MESBasic.viewtitle.randon1531984664878')}.xls" />
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
		<div id="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_wareMan_wareTreeOrderRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_wareMan_wareTreeOrderRef" formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" dataTableId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" isExpandAll=true formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" idprefix="ec_MESBasic_wareMan_ware_wareTreeOrderRef" expandType="all"  fieldcodes="MESBasic_1_wareMan_Ware_wareCode_wareCode:MESBasic.propertydisplayName.randon1484031239866" > 
							<#assign wareCode_defaultValue  = ''>
									<#assign wareCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="TEXT" defaultValue=wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_wareCode" isCustomize=true style="" > 
										<#if (wareCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true value="${wareCode_defaultValue!}" deValue="${wareCode_defaultValue!}"   conditionfunc="MESBasic.wareMan.ware.wareTreeOrderRef._querycustomFunc('wareCode')" name="wareCode" id="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm_wareCode" displayFieldName="wareCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/wareMan/ware/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.wareMan.ware.wareTreeOrderRef.commonQuery('query')" realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" isCrossCompany=isCrossCompany isPrecise=true  conditionfunc="MESBasic.wareMan.ware.wareTreeOrderRef._querycustomFunc('wareCode')" name="wareCode" id="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm_wareCode" displayFieldName="wareCode" exp="like" caseSensitive="false" classStyle="cui-noborder-input"  url="/MESBasic/wareMan/ware/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.wareMan.ware.wareTreeOrderRef.commonQuery('query')" realPermissionCode="${permissionCode!}"   />
										</#if>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" type="adv" onclick="MESBasic.wareMan.ware.wareTreeOrderRef.commonQuery('query')" onadvancedclick="advQuery('MESBasic.wareMan.ware.wareTreeOrderRef.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_wareMan_ware_wareTreeOrderRef_quickquery_info={};
ec_MESBasic_wareMan_ware_wareTreeOrderRef_quickquery_info["MainTableName"]="MATERIAL_WARES";
ec_MESBasic_wareMan_ware_wareTreeOrderRef_quickquery_info["wareCode"]={};
ec_MESBasic_wareMan_ware_wareTreeOrderRef_quickquery_info["wareCode"].dbColumnType="TEXT";
ec_MESBasic_wareMan_ware_wareTreeOrderRef_quickquery_info["wareCode"].layRec="wareCode";
ec_MESBasic_wareMan_ware_wareTreeOrderRef_quickquery_info["wareCode"].columnName="WARE_CODE";
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
 	var advRemainDialog = $('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_wareMan_ware_wareTreeOrderRef_adv_queryForm" exportUrl="/MESBasic/wareMan/ware/wareTreeOrderRef-query.action">
							<#assign wareCode_defaultValue  = ''>
									<#assign wareCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_adv_queryForm" code="MESBasic_1_wareMan_Ware_wareCode" showFormat="TEXT" defaultValue=wareCode_defaultValue  divCode="MESBasic_1_wareMan_Ware_wareCode_wareCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_wareMan_Ware" layRec="wareCode" columnname="WARE_CODE" columntype="TEXT" name="wareCode" fieldType="TEXTFIELD" tableName="MATERIAL_WARES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										仓库编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_wareMan_Ware" />
										<#if (wareCode_defaultValue)?has_content>
											<@mneclient iframe=true formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true value="${wareCode_defaultValue!}" deValue="${wareCode_defaultValue!}"   conditionfunc="MESBasic.wareMan.ware.wareTreeOrderRef._querycustomFunc('wareCode')" name="wareCode" id="adv_ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm_wareCode" displayFieldName="wareCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/wareMan/ware/mneClient.action" multiple=false mnewidth=260   currentViewCode="MESBasic_1_wareMan_wareTreeOrderRef"   realPermissionCode="${permissionCode!}" />
										<#else>
											<@mneclient iframe=true formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_adv_queryForm" isCrossCompany=isCrossCompany       isPrecise=true  conditionfunc="MESBasic.wareMan.ware.wareTreeOrderRef._querycustomFunc('wareCode')" name="wareCode" id="adv_ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm_wareCode" displayFieldName="wareCode" exp="like"  classStyle="cui-noborder-input"  url="/MESBasic/wareMan/ware/mneClient.action" multiple=false mnewidth=260  currentViewCode="MESBasic_1_wareMan_wareTreeOrderRef"  realPermissionCode="${permissionCode!}"   />
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
			viewCode: 'MESBasic_1_wareMan_wareTreeOrderRef',
			modelCode: 'MESBasic_1_wareMan_Ware',
			modelName: 'Ware',
			formId: 'ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm',
			olddiv: 'MESBasic.wareMan.ware.wareTreeOrderRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.wareMan.ware.wareTreeOrderRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_wareMan_wareTreeOrderRef'+"&entity.code="+'MESBasic_1_wareMan';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.wareMan.ware.wareTreeOrderRef.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.wareMan.ware.wareTreeOrderRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.wareMan.ware.wareTreeOrderRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_wareMan_wareTreeOrderRef'+"&entity.code="+'MESBasic_1_wareMan';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.wareMan.ware.wareTreeOrderRef.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.wareMan.ware.wareTreeOrderRef.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.wareMan.ware.wareTreeOrderRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.wareMan.ware.wareTreeOrderRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/wareMan/ware/wareTreeOrderRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_MESBasic_wareMan_ware_wareTreeOrderRef_query" renderOverEvent="ec_MESBasic_wareMan_ware_wareTreeOrderRef_RenderOverEvent" pageInitMethod="ec_MESBasic_wareMan_ware_wareTreeOrderRef_PageInitMethod" modelCode="MESBasic_1_wareMan_Ware" noPermissionKeys="wareCode,wareName,wareAddress,storeKeeper.name,wareClass.code" hidekeyPrefix="ec_MESBasic_wareMan_ware_wareTreeOrderRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_wareMan_ware_wareTreeOrderRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="MESBasic.wareMan.ware.wareTreeOrderRef.sendBackwareTreeOrderRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','storeKeeper.id','wareClass.id','wareCode','wareName']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="MESBasic.wareMan.ware.wareTreeOrderRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareCode_displayDefaultType!}"  key="wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareName_displayDefaultType!}"  key="wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareAddress_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_ADDRESS"    showFormat="TEXT" defaultDisplay="${wareAddress_displayDefaultType!}"  key="wareAddress"   label="${getText('MESBasic.propertydisplayName.randon1484031218230')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign storeKeeper_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${storeKeeper_name_displayDefaultType!}"  key="storeKeeper.name"   label="${getText('MESBasic.propertydisplayName.randonwareCode1484031218230')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareClass_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${wareClass_code_displayDefaultType!}"  key="wareClass.code"  hiddenCol=true label="${getText('MESBasic.propertydisplayName.randon1516252276448')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_wareMan_ware_wareTreeOrderRef_RenderOverEvent(){
}
function ec_MESBasic_wareMan_ware_wareTreeOrderRef_PageInitMethod(){
}
	
	
	
	
	
</script>