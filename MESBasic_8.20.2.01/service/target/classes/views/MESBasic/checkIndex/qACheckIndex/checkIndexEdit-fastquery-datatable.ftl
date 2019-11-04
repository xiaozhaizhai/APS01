	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1491475975560')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm" exportUrl="/MESBasic/checkIndex/qACheckIndex/checkIndexEdit-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1491476207406')}_${getText('MESBasic.viewtitle.randon1470223101488')}.xls" />
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
		<div id="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_checkIndex_checkIndexEdit')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_checkIndex_checkIndexEdit" formId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm" dataTableId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm" isExpandAll=true formId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm" idprefix="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit" expandType="all"  fieldcodes="MESBasic_1_checkIndex_QACheckIndex_checkIndexCode_checkIndexCode:MESBasic.propertydisplayName.randon1466392167049||MESBasic_1_checkIndex_QACheckIndex_checkIndexName_checkIndexName:MESBasic.propertydisplayName.randon1466392209618" > 
							<#assign checkIndexCode_defaultValue  = ''>
									<#assign checkIndexCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm" code="MESBasic_1_checkIndex_QACheckIndex_checkIndexCode" showFormat="TEXT" defaultValue=checkIndexCode_defaultValue  divCode="MESBasic_1_checkIndex_QACheckIndex_checkIndexCode_checkIndexCode" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="checkIndexCode" id="checkIndexCode" value="${checkIndexCode_defaultValue!}" deValue="${checkIndexCode_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign checkIndexName_defaultValue  = ''>
									<#assign checkIndexName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm" code="MESBasic_1_checkIndex_QACheckIndex_checkIndexName" showFormat="TEXT" defaultValue=checkIndexName_defaultValue  divCode="MESBasic_1_checkIndex_QACheckIndex_checkIndexName_checkIndexName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="checkIndexName" id="checkIndexName" value="${checkIndexName_defaultValue!}" deValue="${checkIndexName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm" type="adv" onclick="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.commonQuery('query')" onadvancedclick="advQuery('MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info={};
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info["MainTableName"]="LIMSBASIC_CHECK_INDICES";
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info["checkIndexCode"]={};
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info["checkIndexCode"].dbColumnType="TEXT";
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info["checkIndexCode"].layRec="checkIndexCode";
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info["checkIndexCode"].columnName="CHECKINDEX_CODE";
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info["checkIndexName"]={};
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info["checkIndexName"].dbColumnType="TEXT";
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info["checkIndexName"].layRec="checkIndexName";
ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_quickquery_info["checkIndexName"].columnName="CHECKINDEX_NAME";
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
 	var advRemainDialog = $('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_adv_queryForm" exportUrl="/MESBasic/checkIndex/qACheckIndex/checkIndexEdit-query.action">
							<#assign checkIndexCode_defaultValue  = ''>
									<#assign checkIndexCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_adv_queryForm" code="MESBasic_1_checkIndex_QACheckIndex_checkIndexCode" showFormat="TEXT" defaultValue=checkIndexCode_defaultValue  divCode="MESBasic_1_checkIndex_QACheckIndex_checkIndexCode_checkIndexCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_checkIndex_QACheckIndex" layRec="checkIndexCode" columnname="CHECKINDEX_CODE" columntype="TEXT" name="checkIndexCode" fieldType="TEXTFIELD" tableName="LIMSBASIC_CHECK_INDICES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										指标编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_checkIndex_QACheckIndex" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="checkIndexCode" id="adv_checkIndexCode" value="${checkIndexCode_defaultValue!}" deValue="${checkIndexCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign checkIndexName_defaultValue  = ''>
									<#assign checkIndexName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_adv_queryForm" code="MESBasic_1_checkIndex_QACheckIndex_checkIndexName" showFormat="TEXT" defaultValue=checkIndexName_defaultValue  divCode="MESBasic_1_checkIndex_QACheckIndex_checkIndexName_checkIndexName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_checkIndex_QACheckIndex" layRec="checkIndexName" columnname="CHECKINDEX_NAME" columntype="TEXT" name="checkIndexName" fieldType="TEXTFIELD" tableName="LIMSBASIC_CHECK_INDICES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										指标名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_checkIndex_QACheckIndex" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="checkIndexName" id="adv_checkIndexName" value="${checkIndexName_defaultValue!}" deValue="${checkIndexName_defaultValue!}"   exp="like" />
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
			viewCode: 'MESBasic_1_checkIndex_checkIndexEdit',
			modelCode: 'MESBasic_1_checkIndex_QACheckIndex',
			modelName: 'QACheckIndex',
			formId: 'ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm',
			olddiv: 'MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_checkIndex_checkIndexEdit'+"&entity.code="+'MESBasic_1_checkIndex';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_checkIndex_checkIndexEdit'+"&entity.code="+'MESBasic_1_checkIndex';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.checkIndex.qACheckIndex.checkIndexEdit.query('query')">
<#assign datatable_dataUrl = "/MESBasic/checkIndex/qACheckIndex/checkIndexEdit-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_query" renderOverEvent="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_RenderOverEvent" pageInitMethod="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_PageInitMethod" modelCode="MESBasic_1_checkIndex_QACheckIndex" noPermissionKeys="checkIndexCode,checkIndexName" hidekeyPrefix="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.dbClickViewcheckIndexEdit" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.checkIndex.qACheckIndex.checkIndexEdit.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign checkIndexCode_displayDefaultType  = ''>
			<@datacolumn columnName="CHECKINDEX_CODE"    showFormat="TEXT" defaultDisplay="${checkIndexCode_displayDefaultType!}"  key="checkIndexCode"   label="${getText('MESBasic.propertydisplayName.randon1466392167049')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign checkIndexName_displayDefaultType  = ''>
			<@datacolumn columnName="CHECKINDEX_NAME"    showFormat="TEXT" defaultDisplay="${checkIndexName_displayDefaultType!}"  key="checkIndexName"   label="${getText('MESBasic.propertydisplayName.randon1466392209618')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_RenderOverEvent(){
}
function ec_MESBasic_checkIndex_qACheckIndex_checkIndexEdit_PageInitMethod(){
}
	
	
</script>