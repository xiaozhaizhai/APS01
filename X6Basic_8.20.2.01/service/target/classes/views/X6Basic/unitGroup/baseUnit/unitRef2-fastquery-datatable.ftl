	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1398233394794')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm" exportUrl="/X6Basic/unitGroup/baseUnit/unitRef2-query.action">
		<input type="hidden" reset="false" name="X6Basic_unitGroup_baseUnit_unitRef2_condition" id="X6Basic_unitGroup_baseUnit_unitRef2_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1398235403787')}_${getText('X6Basic.viewtitle.randon1478506529624')}.xls" />
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
		<div id="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('X6Basic_1.0_unitGroup_unitRef2')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_unitGroup_unitRef2" formId="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm" dataTableId="ec_X6Basic_unitGroup_baseUnit_unitRef2_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm" isExpandAll=true formId="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm" idprefix="ec_X6Basic_unitGroup_baseUnit_unitRef2" expandType="all"  fieldcodes="X6Basic_1.0_unitGroup_BaseUnit_code_code:X6Basic.propertydisplayName.radion1398235521123||X6Basic_1.0_unitGroup_BaseUnit_name_name:X6Basic.propertydisplayName.radion1398235640483" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm" code="X6Basic_1.0_unitGroup_BaseUnit_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="X6Basic_1.0_unitGroup_BaseUnit_code_code" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm" code="X6Basic_1.0_unitGroup_BaseUnit_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_unitGroup_BaseUnit_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm" type="adv" onclick="X6Basic.unitGroup.baseUnit.unitRef2.commonQuery('query')" onadvancedclick="advQuery('X6Basic.unitGroup.baseUnit.unitRef2.advquery')" /> 
						 		<@querybutton formId="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info={};
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info["MainTableName"]="S2BASE_UNIT";
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info["code"]={};
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info["code"].dbColumnType="TEXT";
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info["code"].layRec="code";
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info["code"].columnName="UNIT_CODE";
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info["name"]={};
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info["name"].dbColumnType="TEXT";
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info["name"].layRec="name";
ec_X6Basic_unitGroup_baseUnit_unitRef2_quickquery_info["name"].columnName="UNIT_NAME";
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
 	var advRemainDialog = $('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="X6Basic.unitGroup.baseUnit.unitRef2.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_unitGroup_baseUnit_unitRef2_adv_queryForm" exportUrl="/X6Basic/unitGroup/baseUnit/unitRef2-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_unitGroup_baseUnit_unitRef2_adv_queryForm" code="X6Basic_1.0_unitGroup_BaseUnit_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="X6Basic_1.0_unitGroup_BaseUnit_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_unitGroup_BaseUnit" layRec="code" columnname="UNIT_CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="S2BASE_UNIT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单位代码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_unitGroup_BaseUnit" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="adv_code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_unitGroup_baseUnit_unitRef2_adv_queryForm" code="X6Basic_1.0_unitGroup_BaseUnit_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_unitGroup_BaseUnit_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_unitGroup_BaseUnit" layRec="name" columnname="UNIT_NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="S2BASE_UNIT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单位名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_unitGroup_BaseUnit" />
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
			viewCode: 'X6Basic_1.0_unitGroup_unitRef2',
			modelCode: 'X6Basic_1.0_unitGroup_BaseUnit',
			modelName: 'BaseUnit',
			formId: 'ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm',
			olddiv: 'X6Basic.unitGroup.baseUnit.unitRef2.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='X6Basic.unitGroup.baseUnit.unitRef2.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_unitGroup_unitRef2'+"&entity.code="+'X6Basic_1.0_unitGroup';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='X6Basic.unitGroup.baseUnit.unitRef2.advquery'] #customquContent").html(html);
		 	$("[id='X6Basic.unitGroup.baseUnit.unitRef2.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='X6Basic.unitGroup.baseUnit.unitRef2.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_unitGroup_unitRef2'+"&entity.code="+'X6Basic_1.0_unitGroup';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='X6Basic.unitGroup.baseUnit.unitRef2.advquery'] #customquContent").html(html);
			 $("[id='X6Basic.unitGroup.baseUnit.unitRef2.advquery'] #advQueryLoading").hide();
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
		$('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] div.customqu-content').css('display','none');
		$('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] div.move-grade').css('display','none');
		// $('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] div.customqu-content').css('display','block');
		$('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] div.move-grade').css('display','block');
		// $('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="X6Basic.unitGroup.baseUnit.unitRef2.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "X6Basic.unitGroup.baseUnit.unitRef2.query('query')">
<#assign datatable_dataUrl = "/X6Basic/unitGroup/baseUnit/unitRef2-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_X6Basic_unitGroup_baseUnit_unitRef2_query" renderOverEvent="ec_X6Basic_unitGroup_baseUnit_unitRef2_RenderOverEvent" pageInitMethod="ec_X6Basic_unitGroup_baseUnit_unitRef2_PageInitMethod" modelCode="X6Basic_1.0_unitGroup_BaseUnit" noPermissionKeys="code,name,rate,isMain,comments" hidekeyPrefix="ec_X6Basic_unitGroup_baseUnit_unitRef2_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_unitGroup_baseUnit_unitRef2_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="X6Basic.unitGroup.baseUnit.unitRef2.sendBackunitRef2" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','id','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="X6Basic.unitGroup.baseUnit.unitRef2.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('X6Basic.propertydisplayName.radion1398235521123')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign rate_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_RATE"    showFormat="TEXT" defaultDisplay="${rate_displayDefaultType!}"  key="rate"   label="${getText('X6Basic.propertydisplayName.radion1398235704972')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign isMain_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_MAIN"    showFormat="CHECKBOX" defaultDisplay="${isMain_displayDefaultType!}"  key="isMain"   label="${getText('X6Basic.propertydisplayName.radion1398235666506')}" textalign="center"  width=40   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign comments_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_MEMO"    showFormat="TEXT" defaultDisplay="${comments_displayDefaultType!}"  key="comments" order=false  label="${getText('X6Basic.propertydisplayName.radion1398235798163')}" textalign="left"  width=200   type="textarea"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_unitGroup_baseUnit_unitRef2_RenderOverEvent(){
}
function ec_X6Basic_unitGroup_baseUnit_unitRef2_PageInitMethod(){
}
	
	
	
	
	
</script>