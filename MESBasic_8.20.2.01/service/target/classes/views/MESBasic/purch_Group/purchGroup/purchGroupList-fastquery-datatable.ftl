	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1470291704097')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm" exportUrl="/MESBasic/purch_Group/purchGroup/purchGroupList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1470291767311')}_${getText('MESBasic.viewtitle.randon1470292220603')}.xls" />
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
		<div id="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_purch_Group_purchGroupList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_purch_Group_purchGroupList" formId="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm" dataTableId="ec_MESBasic_purch_Group_purchGroup_purchGroupList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm" isExpandAll=true formId="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm" idprefix="ec_MESBasic_purch_Group_purchGroup_purchGroupList" expandType="all"  fieldcodes="MESBasic_1_purch_Group_PurchGroup_purchGroupName_purchGroupName:MESBasic.propertydisplayName.randon1470291954144" > 
							<#assign purchGroupName_defaultValue  = ''>
									<#assign purchGroupName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm" code="MESBasic_1_purch_Group_PurchGroup_purchGroupName" showFormat="TEXT" defaultValue=purchGroupName_defaultValue  divCode="MESBasic_1_purch_Group_PurchGroup_purchGroupName_purchGroupName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="purchGroupName" id="purchGroupName" value="${purchGroupName_defaultValue!}" deValue="${purchGroupName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm" type="adv" onclick="MESBasic.purch_Group.purchGroup.purchGroupList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.purch_Group.purchGroup.purchGroupList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_purch_Group_purchGroup_purchGroupList_quickquery_info={};
ec_MESBasic_purch_Group_purchGroup_purchGroupList_quickquery_info["MainTableName"]="S2BASE_USERREPORT";
ec_MESBasic_purch_Group_purchGroup_purchGroupList_quickquery_info["purchGroupName"]={};
ec_MESBasic_purch_Group_purchGroup_purchGroupList_quickquery_info["purchGroupName"].dbColumnType="TEXT";
ec_MESBasic_purch_Group_purchGroup_purchGroupList_quickquery_info["purchGroupName"].layRec="purchGroupName";
ec_MESBasic_purch_Group_purchGroup_purchGroupList_quickquery_info["purchGroupName"].columnName="USERREPORT_PARAMC";
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
 	var advRemainDialog = $('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_purch_Group_purchGroup_purchGroupList_adv_queryForm" exportUrl="/MESBasic/purch_Group/purchGroup/purchGroupList-query.action">
							<#assign purchGroupName_defaultValue  = ''>
									<#assign purchGroupName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_purch_Group_purchGroup_purchGroupList_adv_queryForm" code="MESBasic_1_purch_Group_PurchGroup_purchGroupName" showFormat="TEXT" defaultValue=purchGroupName_defaultValue  divCode="MESBasic_1_purch_Group_PurchGroup_purchGroupName_purchGroupName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_purch_Group_PurchGroup" layRec="purchGroupName" columnname="USERREPORT_PARAMC" columntype="TEXT" name="purchGroupName" fieldType="TEXTFIELD" tableName="S2BASE_USERREPORT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										采购组名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_purch_Group_PurchGroup" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="purchGroupName" id="adv_purchGroupName" value="${purchGroupName_defaultValue!}" deValue="${purchGroupName_defaultValue!}"   exp="like" />
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
			viewCode: 'MESBasic_1_purch_Group_purchGroupList',
			modelCode: 'MESBasic_1_purch_Group_PurchGroup',
			modelName: 'PurchGroup',
			formId: 'ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm',
			olddiv: 'MESBasic.purch_Group.purchGroup.purchGroupList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.purch_Group.purchGroup.purchGroupList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_purch_Group_purchGroupList'+"&entity.code="+'MESBasic_1_purch_Group';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.purch_Group.purchGroup.purchGroupList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.purch_Group.purchGroup.purchGroupList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.purch_Group.purchGroup.purchGroupList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_purch_Group_purchGroupList'+"&entity.code="+'MESBasic_1_purch_Group';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.purch_Group.purchGroup.purchGroupList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.purch_Group.purchGroup.purchGroupList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.purch_Group.purchGroup.purchGroupList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.purch_Group.purchGroup.purchGroupList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/purch_Group/purchGroup/purchGroupList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_purch_Group_purchGroup_purchGroupList_query" renderOverEvent="ec_MESBasic_purch_Group_purchGroup_purchGroupList_RenderOverEvent" pageInitMethod="ec_MESBasic_purch_Group_purchGroup_purchGroupList_PageInitMethod" modelCode="MESBasic_1_purch_Group_PurchGroup" noPermissionKeys="purchGroupName,purchGroupMemo" hidekeyPrefix="ec_MESBasic_purch_Group_purchGroup_purchGroupList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_purch_Group_purchGroup_purchGroupList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.purch_Group.purchGroup.purchGroupList.dbClickViewpurchGroupList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.purch_Group.purchGroup.purchGroupList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign purchGroupName_displayDefaultType  = ''>
			<@datacolumn columnName="USERREPORT_PARAMC"    showFormat="TEXT" defaultDisplay="${purchGroupName_displayDefaultType!}"  key="purchGroupName"   label="${getText('MESBasic.propertydisplayName.randon1470291954144')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign purchGroupMemo_displayDefaultType  = ''>
			<@datacolumn columnName="USERREPORT_MEMO"    showFormat="TEXT" defaultDisplay="${purchGroupMemo_displayDefaultType!}"  key="purchGroupMemo"   label="${getText('MESBasic.propertydisplayName.randon1470291885225')}" textalign="center"  width=100   type="textarea"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_purch_Group_purchGroup_purchGroupList_RenderOverEvent(){
}
function ec_MESBasic_purch_Group_purchGroup_purchGroupList_PageInitMethod(){
}
	
	
</script>