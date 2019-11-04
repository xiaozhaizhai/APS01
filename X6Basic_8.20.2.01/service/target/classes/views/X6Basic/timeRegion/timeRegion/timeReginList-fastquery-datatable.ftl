	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.randon1459213899397')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm" exportUrl="/X6Basic/timeRegion/timeRegion/timeReginList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.randon1459213973062')}_${getText('X6Basic.viewtitle.randon1459215356686')}.xls" />
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
		<div id="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('X6Basic_1.0_timeRegion_timeReginList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_timeRegion_timeReginList" formId="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm" dataTableId="ec_X6Basic_timeRegion_timeRegion_timeReginList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm" isExpandAll=true formId="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm" idprefix="ec_X6Basic_timeRegion_timeRegion_timeReginList" expandType="all"  fieldcodes="X6Basic_1.0_timeRegion_TimeRegion_name_name:X6Basic.propertydisplayName.randon1459214321561||X6Basic_1.0_timeRegion_TimeRegion_unit_unit:X6Basic.propertydisplayName.randon1459214892902" > 
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm" code="X6Basic_1.0_timeRegion_TimeRegion_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegion_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign unit_defaultValue  = ''>
									<#assign unit_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm" code="X6Basic_1.0_timeRegion_TimeRegion_unit" showFormat="SELECTCOMP" defaultValue=unit_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegion_unit_unit" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${unit_defaultValue}"   name="unit" code="timeUnit" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm" type="adv" onclick="X6Basic.timeRegion.timeRegion.timeReginList.commonQuery('query')" onadvancedclick="advQuery('X6Basic.timeRegion.timeRegion.timeReginList.advquery')" /> 
						 		<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info={};
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info["MainTableName"]="X6BASIC_TIME_REGIONS";
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info["name"]={};
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info["name"].dbColumnType="TEXT";
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info["name"].layRec="name";
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info["name"].columnName="NAME";
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info["unit"]={};
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info["unit"].dbColumnType="SYSTEMCODE";
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info["unit"].layRec="unit";
ec_X6Basic_timeRegion_timeRegion_timeReginList_quickquery_info["unit"].columnName="UNIT";
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
 	var advRemainDialog = $('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="X6Basic.timeRegion.timeRegion.timeReginList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_timeRegion_timeRegion_timeReginList_adv_queryForm" exportUrl="/X6Basic/timeRegion/timeRegion/timeReginList-query.action">
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_timeRegion_timeRegion_timeReginList_adv_queryForm" code="X6Basic_1.0_timeRegion_TimeRegion_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegion_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_timeRegion_TimeRegion" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="X6BASIC_TIME_REGIONS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_timeRegion_TimeRegion" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="adv_name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign unit_defaultValue  = ''>
									<#assign unit_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_timeRegion_timeRegion_timeReginList_adv_queryForm" code="X6Basic_1.0_timeRegion_TimeRegion_unit" showFormat="SELECTCOMP" defaultValue=unit_defaultValue  divCode="X6Basic_1.0_timeRegion_TimeRegion_unit_unit" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_timeRegion_TimeRegion" layRec="unit" columnname="UNIT" columntype="SYSTEMCODE" name="unit" fieldType="SELECTCOMP" tableName="X6BASIC_TIME_REGIONS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单位
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_timeRegion_TimeRegion" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${unit_defaultValue}"   name="unit" code="timeUnit" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'X6Basic_1.0_timeRegion_timeReginList',
			modelCode: 'X6Basic_1.0_timeRegion_TimeRegion',
			modelName: 'TimeRegion',
			formId: 'ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm',
			olddiv: 'X6Basic.timeRegion.timeRegion.timeReginList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='X6Basic.timeRegion.timeRegion.timeReginList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_timeRegion_timeReginList'+"&entity.code="+'X6Basic_1.0_timeRegion';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='X6Basic.timeRegion.timeRegion.timeReginList.advquery'] #customquContent").html(html);
		 	$("[id='X6Basic.timeRegion.timeRegion.timeReginList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='X6Basic.timeRegion.timeRegion.timeReginList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_timeRegion_timeReginList'+"&entity.code="+'X6Basic_1.0_timeRegion';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='X6Basic.timeRegion.timeRegion.timeReginList.advquery'] #customquContent").html(html);
			 $("[id='X6Basic.timeRegion.timeRegion.timeReginList.advquery'] #advQueryLoading").hide();
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
		$('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] div.customqu-content').css('display','none');
		$('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] div.move-grade').css('display','none');
		// $('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] div.customqu-content').css('display','block');
		$('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] div.move-grade').css('display','block');
		// $('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="X6Basic.timeRegion.timeRegion.timeReginList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "X6Basic.timeRegion.timeRegion.timeReginList.query('query')">
<#assign datatable_dataUrl = "/X6Basic/timeRegion/timeRegion/timeReginList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_X6Basic_timeRegion_timeRegion_timeReginList_query" renderOverEvent="ec_X6Basic_timeRegion_timeRegion_timeReginList_RenderOverEvent" pageInitMethod="ec_X6Basic_timeRegion_timeRegion_timeReginList_PageInitMethod" modelCode="X6Basic_1.0_timeRegion_TimeRegion" noPermissionKeys="name,unit" hidekeyPrefix="ec_X6Basic_timeRegion_timeRegion_timeReginList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_timeRegion_timeRegion_timeReginList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="X6Basic.timeRegion.timeRegion.timeReginList.dbmodifytimeReginList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','unit.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="X6Basic.timeRegion.timeRegion.timeReginList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}timeReginList_new_add_X6Basic_1.0_timeRegion_timeReginList||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1459222499838')}||iconcls:add||useInMore:false||onclick:
				X6Basic.timeRegion.timeRegion.timeReginList.addtimeReginList()
		" 
		resultType="json" 
		buttonCode="X6Basic_1.0_timeRegion_timeReginList_BUTTON_new"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}timeReginList_new_add_X6Basic_1.0_timeRegion_timeReginList||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1459222499838')}||iconcls:add||useInMore:false||onclick:
				X6Basic.timeRegion.timeRegion.timeReginList.addtimeReginList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}timeReginList_edit_modify_X6Basic_1.0_timeRegion_timeReginList||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1459222528430')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.timeRegion.timeRegion.timeReginList.modifytimeReginList()
		" 
		resultType="json" 
		buttonCode="X6Basic_1.0_timeRegion_timeReginList_BUTTON_edit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}timeReginList_edit_modify_X6Basic_1.0_timeRegion_timeReginList||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1459222528430')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.timeRegion.timeRegion.timeReginList.modifytimeReginList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}timeReginList_del_del_X6Basic_1.0_timeRegion_timeReginList||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1459222544398')}||iconcls:del||useInMore:false||onclick:
				X6Basic.timeRegion.timeRegion.timeReginList.deltimeReginList()
		" 
		resultType="json" 
		buttonCode="X6Basic_1.0_timeRegion_timeReginList_BUTTON_del"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}timeReginList_del_del_X6Basic_1.0_timeRegion_timeReginList||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1459222544398')}||iconcls:del||useInMore:false||onclick:
				X6Basic.timeRegion.timeRegion.timeReginList.deltimeReginList()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.randon1459214321561')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign unit_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT"    showFormat="SELECTCOMP" defaultDisplay="${unit_displayDefaultType!}"  key="unit.value"   label="${getText('X6Basic.propertydisplayName.randon1459214892902')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_timeRegion_timeRegion_timeReginList_RenderOverEvent(){
}
function ec_X6Basic_timeRegion_timeRegion_timeReginList_PageInitMethod(){
}
	
	
</script>