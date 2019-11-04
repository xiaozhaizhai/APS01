	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1398303380892')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_teamManage_teamInfo_ref_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_teamManage_teamInfo_ref_queryForm" exportUrl="/X6Basic/teamManage/teamInfo/ref-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="dept" bak_value="dept"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="X6Basic_teamManage_teamInfo_ref_condition" id="X6Basic_teamManage_teamInfo_ref_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1398303528441')}_${getText('X6Basic.viewtitle.radion1398316764087')}.xls" />
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
		<#assign advFlag = getAdvClassific('X6Basic_1.0_teamManage_ref')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_teamManage_ref" formId="ec_X6Basic_teamManage_teamInfo_ref_queryForm" dataTableId="ec_X6Basic_teamManage_teamInfo_ref_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_teamManage_teamInfo_ref_queryForm"  formId="ec_X6Basic_teamManage_teamInfo_ref_queryForm" idprefix="ec_X6Basic_teamManage_teamInfo_ref" expandType="single"  fieldcodes="X6Basic_1.0_teamManage_TeamInfo_code_code:X6Basic.propertydisplayName.radion1398303581302||X6Basic_1.0_teamManage_TeamInfo_name_name:X6Basic.propertydisplayName.radion1398303611599" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_teamManage_teamInfo_ref_queryForm" code="X6Basic_1.0_teamManage_TeamInfo_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="X6Basic_1.0_teamManage_TeamInfo_code_code" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_teamManage_teamInfo_ref_queryForm" code="X6Basic_1.0_teamManage_TeamInfo_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_teamManage_TeamInfo_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_teamManage_teamInfo_ref_queryForm" type="adv" onclick="X6Basic.teamManage.teamInfo.ref.commonQuery('query')" onadvancedclick="advQuery('X6Basic.teamManage.teamInfo.ref.advquery')" /> 
						 		<@querybutton formId="ec_X6Basic_teamManage_teamInfo_ref_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info={};
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info["MainTableName"]="S2BASE_TEAMINFO";
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info["code"]={};
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info["code"].dbColumnType="TEXT";
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info["code"].layRec="code";
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info["code"].columnName="TEAM_CODE";
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info["name"]={};
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info["name"].dbColumnType="TEXT";
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info["name"].layRec="name";
ec_X6Basic_teamManage_teamInfo_ref_quickquery_info["name"].columnName="TEAM_NAME";
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
 	var advRemainDialog = $('[id="X6Basic.teamManage.teamInfo.ref.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="X6Basic.teamManage.teamInfo.ref.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_teamManage_teamInfo_ref_adv_queryForm" exportUrl="/X6Basic/teamManage/teamInfo/ref-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_teamManage_teamInfo_ref_adv_queryForm" code="X6Basic_1.0_teamManage_TeamInfo_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="X6Basic_1.0_teamManage_TeamInfo_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_teamManage_TeamInfo" layRec="code" columnname="TEAM_CODE" columntype="TEXT" name="code" fieldType="TEXTFIELD" tableName="S2BASE_TEAMINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										班组编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_teamManage_TeamInfo" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="adv_code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_teamManage_teamInfo_ref_adv_queryForm" code="X6Basic_1.0_teamManage_TeamInfo_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="X6Basic_1.0_teamManage_TeamInfo_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_teamManage_TeamInfo" layRec="name" columnname="TEAM_NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="S2BASE_TEAMINFO"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										班组名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_teamManage_TeamInfo" />
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
			viewCode: 'X6Basic_1.0_teamManage_ref',
			modelCode: 'X6Basic_1.0_teamManage_TeamInfo',
			modelName: 'TeamInfo',
			formId: 'ec_X6Basic_teamManage_teamInfo_ref_queryForm',
			olddiv: 'X6Basic.teamManage.teamInfo.ref.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='X6Basic.teamManage.teamInfo.ref.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_teamManage_ref'+"&entity.code="+'X6Basic_1.0_teamManage';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='X6Basic.teamManage.teamInfo.ref.advquery'] #customquContent").html(html);
		 	$("[id='X6Basic.teamManage.teamInfo.ref.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='X6Basic.teamManage.teamInfo.ref.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_teamManage_ref'+"&entity.code="+'X6Basic_1.0_teamManage';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='X6Basic.teamManage.teamInfo.ref.advquery'] #customquContent").html(html);
			 $("[id='X6Basic.teamManage.teamInfo.ref.advquery'] #advQueryLoading").hide();
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
		$('[id="X6Basic.teamManage.teamInfo.ref.advquery"] div.customqu-content').css('display','none');
		$('[id="X6Basic.teamManage.teamInfo.ref.advquery"] div.move-grade').css('display','none');
		// $('[id="X6Basic.teamManage.teamInfo.ref.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="X6Basic.teamManage.teamInfo.ref.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="X6Basic.teamManage.teamInfo.ref.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="X6Basic.teamManage.teamInfo.ref.advquery"] div.customqu-content').css('display','block');
		$('[id="X6Basic.teamManage.teamInfo.ref.advquery"] div.move-grade').css('display','block');
		// $('[id="X6Basic.teamManage.teamInfo.ref.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="X6Basic.teamManage.teamInfo.ref.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="X6Basic.teamManage.teamInfo.ref.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "X6Basic.teamManage.teamInfo.ref.query('query')">
<#assign datatable_dataUrl = "/X6Basic/teamManage/teamInfo/ref-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_X6Basic_teamManage_teamInfo_ref_query" renderOverEvent="ec_X6Basic_teamManage_teamInfo_ref_RenderOverEvent" pageInitMethod="ec_X6Basic_teamManage_teamInfo_ref_PageInitMethod" modelCode="X6Basic_1.0_teamManage_TeamInfo" noPermissionKeys="code,name,dept.name,createDate,principal.name,teamMemo" hidekeyPrefix="ec_X6Basic_teamManage_teamInfo_ref_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_teamManage_teamInfo_ref_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="X6Basic.teamManage.teamInfo.ref.sendBackref" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','dept.id','principal.id','code','code','name']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="X6Basic.teamManage.teamInfo.ref.showErrorMsg"   >
				 <#if (!multiSelect??) || (multiSelect??&&(multiSelect)?default('false') == 'true')>
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
				</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="TEAM_CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('X6Basic.propertydisplayName.radion1398303581302')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="TEAM_NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.radion1398303611599')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign dept_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${dept_name_displayDefaultType!}"  key="dept.name"   label="${getText('part.fzwdy.xm.mainPositionId.department.name')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign createDate_displayDefaultType  = ''>
			<@datacolumn columnName="TEAM_CREATEDATE"    showFormat="YMD" defaultDisplay="${createDate_displayDefaultType!}"  key="createDate"   label="${getText('X6Basic.propertydisplayName.radion1398303671784')}" textalign="center"  width=100   type="date"    showFormatFunc="" cssstyle="" />
			<#assign principal_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${principal_name_displayDefaultType!}"  key="principal.name"   label="${getText('X6Basic.propertydisplayName.radion1398303738668')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign teamMemo_displayDefaultType  = ''>
			<@datacolumn columnName="TEAM_MEMO"    showFormat="TEXT" defaultDisplay="${teamMemo_displayDefaultType!}"  key="teamMemo" order=false  label="${getText('X6Basic.propertydisplayName.radion1398303797341')}" textalign="left"  width=200   type="textarea"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_teamManage_teamInfo_ref_RenderOverEvent(){
}
function ec_X6Basic_teamManage_teamInfo_ref_PageInitMethod(){
}
	
	
	
	
	
	
</script>