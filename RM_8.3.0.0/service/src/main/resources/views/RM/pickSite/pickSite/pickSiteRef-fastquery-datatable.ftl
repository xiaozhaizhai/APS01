	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1503469599671')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_pickSite_pickSite_pickSiteRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_pickSite_pickSite_pickSiteRef_queryForm" exportUrl="/RM/pickSite/pickSite/pickSiteRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="RM_pickSite_pickSite_pickSiteRef_condition" id="RM_pickSite_pickSite_pickSiteRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1503469952179')}_${getText('RM.viewtitle.randon1503471313163')}.xls" />
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
		<div id="ec_RM_pickSite_pickSite_pickSiteRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_pickSite_pickSite_pickSiteRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_pickSite_pickSiteRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_pickSite_pickSiteRef" formId="ec_RM_pickSite_pickSite_pickSiteRef_queryForm" dataTableId="ec_RM_pickSite_pickSite_pickSiteRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_pickSite_pickSite_pickSiteRef_queryForm" isExpandAll=true formId="ec_RM_pickSite_pickSite_pickSiteRef_queryForm" idprefix="ec_RM_pickSite_pickSite_pickSiteRef" expandType="all"  fieldcodes="RM_7.5.0.0_pickSite_PickSite_code_code:RM.propertydisplayName.randon1503470023639||RM_7.5.0.0_pickSite_PickSite_name_name:RM.propertydisplayName.randon1503470250033" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_RM_pickSite_pickSite_pickSiteRef_queryForm" code="RM_7.5.0.0_pickSite_PickSite_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_pickSite_PickSite_code_code" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="equal"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_RM_pickSite_pickSite_pickSiteRef_queryForm" code="RM_7.5.0.0_pickSite_PickSite_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_pickSite_PickSite_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_pickSite_pickSite_pickSiteRef_queryForm" type="adv" onclick="RM.pickSite.pickSite.pickSiteRef.commonQuery('query')" onadvancedclick="advQuery('RM.pickSite.pickSite.pickSiteRef.advquery')" /> 
						 		<@querybutton formId="ec_RM_pickSite_pickSite_pickSiteRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info={};
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["MainTableName"]="LIMSBASIC_PICK_SITES";
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["code"]={};
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["code"].dbColumnType="BAPCODE";
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["code"].layRec="code";
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["code"].columnName="CODE";
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["name"]={};
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["name"].layRec="name";
ec_RM_pickSite_pickSite_pickSiteRef_quickquery_info["name"].columnName="NAME";
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
 	var advRemainDialog = $('[id="RM.pickSite.pickSite.pickSiteRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.pickSite.pickSite.pickSiteRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_pickSite_pickSite_pickSiteRef_adv_queryForm" exportUrl="/RM/pickSite/pickSite/pickSiteRef-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_pickSite_pickSite_pickSiteRef_adv_queryForm" code="RM_7.5.0.0_pickSite_PickSite_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_pickSite_PickSite_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_pickSite_PickSite" layRec="code" columnname="CODE" columntype="BAPCODE" name="code" fieldType="TEXTFIELD" tableName="LIMSBASIC_PICK_SITES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_pickSite_PickSite" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="adv_code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="equal" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_pickSite_pickSite_pickSiteRef_adv_queryForm" code="RM_7.5.0.0_pickSite_PickSite_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_pickSite_PickSite_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_pickSite_PickSite" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="LIMSBASIC_PICK_SITES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_pickSite_PickSite" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="adv_name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like" />
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
			viewCode: 'RM_7.5.0.0_pickSite_pickSiteRef',
			modelCode: 'RM_7.5.0.0_pickSite_PickSite',
			modelName: 'PickSite',
			formId: 'ec_RM_pickSite_pickSite_pickSiteRef_queryForm',
			olddiv: 'RM.pickSite.pickSite.pickSiteRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.pickSite.pickSite.pickSiteRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_pickSite_pickSiteRef'+"&entity.code="+'RM_7.5.0.0_pickSite';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.pickSite.pickSite.pickSiteRef.advquery'] #customquContent").html(html);
		 	$("[id='RM.pickSite.pickSite.pickSiteRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.pickSite.pickSite.pickSiteRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_pickSite_pickSiteRef'+"&entity.code="+'RM_7.5.0.0_pickSite';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.pickSite.pickSite.pickSiteRef.advquery'] #customquContent").html(html);
			 $("[id='RM.pickSite.pickSite.pickSiteRef.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.pickSite.pickSite.pickSiteRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.pickSite.pickSite.pickSiteRef.query('query')">
<#assign datatable_dataUrl = "/RM/pickSite/pickSite/pickSiteRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_pickSite_pickSite_pickSiteRef_query" renderOverEvent="ec_RM_pickSite_pickSite_pickSiteRef_RenderOverEvent" pageInitMethod="ec_RM_pickSite_pickSite_pickSiteRef_PageInitMethod" modelCode="RM_7.5.0.0_pickSite_PickSite" noPermissionKeys="code,name,active,distrib,meno" hidekeyPrefix="ec_RM_pickSite_pickSite_pickSiteRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_pickSite_pickSite_pickSiteRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.pickSite.pickSite.pickSiteRef.sendBackpickSiteRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.pickSite.pickSite.pickSiteRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('RM.propertydisplayName.randon1503470023639')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1503470250033')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign active_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE"    showFormat="CHECKBOX" defaultDisplay="${active_displayDefaultType!}"  key="active"   label="${getText('RM.propertydisplayName.randon1503469992676')}" textalign="center"  width=30   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign distrib_displayDefaultType  = ''>
			<@datacolumn columnName="DISTRIB"    showFormat="TEXT" defaultDisplay="${distrib_displayDefaultType!}"  key="distrib"   label="${getText('RM.propertydisplayName.randon1503470097787')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign meno_displayDefaultType  = ''>
			<@datacolumn columnName="MENO"    showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('RM.propertydisplayName.randon1503470187510')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_pickSite_pickSite_pickSiteRef_RenderOverEvent(){
}
function ec_RM_pickSite_pickSite_pickSiteRef_PageInitMethod(){
}
	
	
	
	
	
</script>