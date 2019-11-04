	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1493169918607')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_interfaceService_interfaceSyncLog_logList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" exportUrl="/RM/interfaceService/interfaceSyncLog/logList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1493192745808')}_${getText('RM.viewtitle.randon1494999169699')}.xls" />
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
		<div id="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_interfaceService_logList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_interfaceService_logList" formId="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" dataTableId="ec_RM_interfaceService_interfaceSyncLog_logList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" isExpandAll=true formId="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" idprefix="ec_RM_interfaceService_interfaceSyncLog_logList" expandType="all"  fieldcodes="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logOperate_logOperate:RM.propertydisplayName.randon1493192888108||RM_7.5.0.0_interfaceService_InterfaceSyncLog_logType_logType:RM.propertydisplayName.randon1493192959999||RM_7.5.0.0_interfaceService_InterfaceSyncLog_logSynFlag_logSynFlag:RM.propertydisplayName.randon1493192941908||RM_7.5.0.0_interfaceService_InterfaceSyncLog_logIsIgnore_logIsIgnore:RM.propertydisplayName.randon1493192863868" > 
							<#assign logOperate_defaultValue  = ''>
									<#assign logOperate_defaultValue  = ''>
							<@queryfield formId="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" code="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logOperate" showFormat="TEXT" defaultValue=logOperate_defaultValue  divCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logOperate_logOperate" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="logOperate" id="logOperate" value="${logOperate_defaultValue!}" deValue="${logOperate_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign logType_defaultValue  = ''>
									<#assign logType_defaultValue  = ''>
							<@queryfield formId="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" code="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logType" showFormat="TEXT" defaultValue=logType_defaultValue  divCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logType_logType" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="logType" id="logType" value="${logType_defaultValue!}" deValue="${logType_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign logSynFlag_defaultValue  = ''>
									<#assign logSynFlag_defaultValue  = ''>
							<@queryfield formId="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" code="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logSynFlag" showFormat="SELECT" defaultValue=logSynFlag_defaultValue  divCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logSynFlag_logSynFlag" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${logSynFlag_defaultValue!}" name="logSynFlag" id="logSynFlag" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (logSynFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (logSynFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign logIsIgnore_defaultValue  = ''>
									<#assign logIsIgnore_defaultValue  = ''>
							<@queryfield formId="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" code="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logIsIgnore" showFormat="SELECT" defaultValue=logIsIgnore_defaultValue  divCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logIsIgnore_logIsIgnore" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${logIsIgnore_defaultValue!}" name="logIsIgnore" id="logIsIgnore" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (logIsIgnore_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (logIsIgnore_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" type="adv" onclick="RM.interfaceService.interfaceSyncLog.logList.commonQuery('query')" onadvancedclick="advQuery('RM.interfaceService.interfaceSyncLog.logList.advquery')" /> 
						 		<@querybutton formId="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info={};
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["MainTableName"]="INTERFACE_SYNC_LOG";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logOperate"]={};
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logOperate"].dbColumnType="TEXT";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logOperate"].layRec="logOperate";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logOperate"].columnName="LOG_OPERATE";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logType"]={};
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logType"].dbColumnType="TEXT";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logType"].layRec="logType";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logType"].columnName="LOG_TYPE";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logSynFlag"]={};
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logSynFlag"].dbColumnType="BOOLEAN";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logSynFlag"].layRec="logSynFlag";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logSynFlag"].columnName="LOG_SYN_FLAG";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logIsIgnore"]={};
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logIsIgnore"].dbColumnType="BOOLEAN";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logIsIgnore"].layRec="logIsIgnore";
ec_RM_interfaceService_interfaceSyncLog_logList_quickquery_info["logIsIgnore"].columnName="LOG_IS_IGNORE";
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
 	var advRemainDialog = $('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.interfaceService.interfaceSyncLog.logList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_interfaceService_interfaceSyncLog_logList_adv_queryForm" exportUrl="/RM/interfaceService/interfaceSyncLog/logList-query.action">
							<#assign logOperate_defaultValue  = ''>
									<#assign logOperate_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_interfaceService_interfaceSyncLog_logList_adv_queryForm" code="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logOperate" showFormat="TEXT" defaultValue=logOperate_defaultValue  divCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logOperate_logOperate" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_interfaceService_InterfaceSyncLog" layRec="logOperate" columnname="LOG_OPERATE" columntype="TEXT" name="logOperate" fieldType="TEXTFIELD" tableName="INTERFACE_SYNC_LOG"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										操作类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_interfaceService_InterfaceSyncLog" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="logOperate" id="adv_logOperate" value="${logOperate_defaultValue!}" deValue="${logOperate_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign logType_defaultValue  = ''>
									<#assign logType_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_interfaceService_interfaceSyncLog_logList_adv_queryForm" code="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logType" showFormat="TEXT" defaultValue=logType_defaultValue  divCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logType_logType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_interfaceService_InterfaceSyncLog" layRec="logType" columnname="LOG_TYPE" columntype="TEXT" name="logType" fieldType="TEXTFIELD" tableName="INTERFACE_SYNC_LOG"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										数据类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_interfaceService_InterfaceSyncLog" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="logType" id="adv_logType" value="${logType_defaultValue!}" deValue="${logType_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign logSynFlag_defaultValue  = ''>
									<#assign logSynFlag_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_interfaceService_interfaceSyncLog_logList_adv_queryForm" code="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logSynFlag" showFormat="SELECT" defaultValue=logSynFlag_defaultValue  divCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logSynFlag_logSynFlag" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_interfaceService_InterfaceSyncLog" layRec="logSynFlag" columnname="LOG_SYN_FLAG" columntype="BOOLEAN" name="logSynFlag" fieldType="SELECT" tableName="INTERFACE_SYNC_LOG"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										数据同步状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_interfaceService_InterfaceSyncLog" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${logSynFlag_defaultValue!}" name="logSynFlag" id="adv_logSynFlag" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (logSynFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (logSynFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign logIsIgnore_defaultValue  = ''>
									<#assign logIsIgnore_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_interfaceService_interfaceSyncLog_logList_adv_queryForm" code="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logIsIgnore" showFormat="SELECT" defaultValue=logIsIgnore_defaultValue  divCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog_logIsIgnore_logIsIgnore" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_interfaceService_InterfaceSyncLog" layRec="logIsIgnore" columnname="LOG_IS_IGNORE" columntype="BOOLEAN" name="logIsIgnore" fieldType="SELECT" tableName="INTERFACE_SYNC_LOG"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										是否忽视
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_interfaceService_InterfaceSyncLog" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${logIsIgnore_defaultValue!}" name="logIsIgnore" id="adv_logIsIgnore" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (logIsIgnore_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (logIsIgnore_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
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
			viewCode: 'RM_7.5.0.0_interfaceService_logList',
			modelCode: 'RM_7.5.0.0_interfaceService_InterfaceSyncLog',
			modelName: 'InterfaceSyncLog',
			formId: 'ec_RM_interfaceService_interfaceSyncLog_logList_queryForm',
			olddiv: 'RM.interfaceService.interfaceSyncLog.logList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.interfaceService.interfaceSyncLog.logList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_interfaceService_logList'+"&entity.code="+'RM_7.5.0.0_interfaceService';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.interfaceService.interfaceSyncLog.logList.advquery'] #customquContent").html(html);
		 	$("[id='RM.interfaceService.interfaceSyncLog.logList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.interfaceService.interfaceSyncLog.logList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_interfaceService_logList'+"&entity.code="+'RM_7.5.0.0_interfaceService';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.interfaceService.interfaceSyncLog.logList.advquery'] #customquContent").html(html);
			 $("[id='RM.interfaceService.interfaceSyncLog.logList.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.interfaceService.interfaceSyncLog.logList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.interfaceService.interfaceSyncLog.logList.query('query')">
<#assign datatable_dataUrl = "/RM/interfaceService/interfaceSyncLog/logList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_RM_interfaceService_interfaceSyncLog_logList_query" renderOverEvent="ec_RM_interfaceService_interfaceSyncLog_logList_RenderOverEvent" pageInitMethod="ec_RM_interfaceService_interfaceSyncLog_logList_PageInitMethod" modelCode="RM_7.5.0.0_interfaceService_InterfaceSyncLog" noPermissionKeys="logType,logTypeDes,logFault,logOperate,logDate,logSynFlag,logIsIgnore,logID" hidekeyPrefix="ec_RM_interfaceService_interfaceSyncLog_logList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_interfaceService_interfaceSyncLog_logList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="RM.interfaceService.interfaceSyncLog.logList.dbClickViewlogList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="RM.interfaceService.interfaceSyncLog.logList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}logList_sync_modify_RM_7.5.0.0_interfaceService_logList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1494999224738')}||iconcls:modify||useInMore:false||onclick:
					sync()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="RM_7.5.0.0_interfaceService_logList_BUTTON_sync"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}logList_sync_modify_RM_7.5.0.0_interfaceService_logList||separateNum:0||name:${getText('RM.buttonPropertyshowName.radion1494999224738')}||iconcls:modify||useInMore:false||onclick:
					sync()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign logType_displayDefaultType  = ''>
			<@datacolumn columnName="LOG_TYPE"    showFormat="TEXT" defaultDisplay="${logType_displayDefaultType!}"  key="logType"   label="${getText('RM.propertydisplayName.randon1493192959999')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign logTypeDes_displayDefaultType  = ''>
			<@datacolumn columnName="LOG_TYPE_DES"    showFormat="TEXT" defaultDisplay="${logTypeDes_displayDefaultType!}"  key="logTypeDes"   label="${getText('RM.propertydisplayName.randon1493192987615')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign logFault_displayDefaultType  = ''>
			<@datacolumn columnName="LOG_FAULT"    showFormat="TEXT" defaultDisplay="${logFault_displayDefaultType!}"  key="logFault"   label="${getText('RM.propertydisplayName.randon1493192813775')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign logOperate_displayDefaultType  = ''>
			<@datacolumn columnName="LOG_OPERATE"    showFormat="TEXT" defaultDisplay="${logOperate_displayDefaultType!}"  key="logOperate"   label="${getText('RM.propertydisplayName.randon1493192888108')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign logDate_displayDefaultType  = ''>
			<@datacolumn columnName="LOG_DATE"    showFormat="YMD_HMS" defaultDisplay="${logDate_displayDefaultType!}"  key="logDate"   label="${getText('RM.propertydisplayName.randon1493192794447')}" textalign="left"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign logSynFlag_displayDefaultType  = ''>
			<@datacolumn columnName="LOG_SYN_FLAG"    showFormat="SELECT" defaultDisplay="${logSynFlag_displayDefaultType!}"  key="logSynFlag"   label="${getText('RM.propertydisplayName.randon1493192941908')}" textalign="left"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign logIsIgnore_displayDefaultType  = ''>
			<@datacolumn columnName="LOG_IS_IGNORE"    showFormat="SELECT" defaultDisplay="${logIsIgnore_displayDefaultType!}"  key="logIsIgnore"   label="${getText('RM.propertydisplayName.randon1493192863868')}" textalign="left"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign logID_displayDefaultType  = ''>
			<@datacolumn columnName="LOGID"    showFormat="TEXT" defaultDisplay="${logID_displayDefaultType!}"  key="logID"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1493192845294')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_interfaceService_interfaceSyncLog_logList_RenderOverEvent(){
/*if (!Array.prototype.forEach)  
{  
    Array.prototype.forEach = function(fun)  
    {  
        var len = this.length;  
        if (typeof fun != "function")  
            throw new TypeError();  
  
        var thisp = arguments[1];  
        for (var i = 0; i < len; i++)  
        {  
            if (i in this)  
                fun.call(thisp, this[i], i, this);  
        }  
    };  
} */

var dataList=ec_RM_interfaceService_interfaceSyncLog_logList_queryWidget.getAllData();
for(var index in dataList){
	var obj = dataList[index];
	YUE.purgeElement(obj.rowHtmlObj, true , 'dblclick');
	if(!obj.logSynFlag){
		$(obj.rowHtmlObj).css({color:"red"})
	}else{
		$(obj.rowHtmlObj).css({color:"green"})
	}

	if(obj.logType=="RMFormula"){
		$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("配方");
	}else if(obj.logType=="FactoryModel"){
		$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("工厂模型");
	}else if(obj.logType=="workOrder"){
		$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("工单");
	}else if(obj.logType=="sapSyn"){
		$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("sap");
	}else if(obj.logType=="RMBatchFormulaMain"){
		$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("批控配方");
	}



	if(obj.logOperate=="add" && obj.logType=="sapSyn"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("sap同步");
	}
	else if(obj.logOperate=="add"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("配方新增");
	}else if(obj.logOperate=="update"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("配方修改");
	}else if(obj.logOperate=="delete"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("配方删除");
	}else if(obj.logOperate=="get"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("配方获取");
	}else if(obj.logOperate=="unitadd"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("设备单元新增");
	}else if(obj.logOperate=="unitupdate"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("设备单元修改");
	}else if(obj.logOperate=="unitdelete"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("设备单元删除");
	}else if(obj.logOperate=="processadd"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("生产线新增");
	}else if(obj.logOperate=="processupdate"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("生产线修改");
	}else if(obj.logOperate=="processdelete"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("生产线删除");
	}else if(obj.logOperate=="produceTaskSyn"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单同步");
	}else if(obj.logOperate=="activeStatus"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("活动状态变更");
	}else if(obj.logOperate=="unitStatus"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工序状态变更");
	}else if(obj.logOperate=="batchStatus"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单状态变更");
	}else if(obj.logOperate=="produceTaskAdd"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单新增");
	}else if(obj.logOperate=="produceTaskUpdate"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单修改");
	}else if(obj.logOperate=="produceTaskDelete"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单删除");
	}else if(obj.logOperate=="stopPhase"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("结束活动");
	}else if(obj.logOperate=="mesStopPhaseFault"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("mes结束活动");
	}else if(obj.logOperate=="add" && obj.logType=="RMBatchFormulaMain"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("批控配方新增");
	}else if(obj.logOperate=="update" && obj.logType=="RMBatchFormulaMain"){
		$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("批控配方更新");
	}
}

/*dataList.forEach(function(obj){
	YUE.purgeElement(obj.rowHtmlObj, true , 'dblclick');
	if(!obj.logSynFlag){
		$(obj.rowHtmlObj).css({color:"red"})
	}else{
		$(obj.rowHtmlObj).css({color:"green"})
	}

	if(obj.logType=="RMFormula"){
	$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("配方");
	}else if(obj.logType=="FactoryModel"){
	$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("工厂模型");
	}else if(obj.logType=="workOrder"){
	$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("工单");
	}else if(obj.logType=="sapSyn"){
	$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("sap");
	}else if(obj.logType=="RMBatchFormulaMain"){
	$(obj.rowHtmlObj).find($("[key='logType']")).find("div").text("批控配方");
	}



	if(obj.logOperate=="add" && obj.logType=="sapSyn"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("sap同步");
	}
	else if(obj.logOperate=="add"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("配方新增");
	}else if(obj.logOperate=="update"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("配方修改");
	}else if(obj.logOperate=="delete"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("配方删除");
	}else if(obj.logOperate=="get"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("配方获取");
	}else if(obj.logOperate=="unitadd"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("设备单元新增");
	}else if(obj.logOperate=="unitupdate"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("设备单元修改");
	}else if(obj.logOperate=="unitdelete"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("设备单元删除");
	}else if(obj.logOperate=="processadd"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("生产线新增");
	}else if(obj.logOperate=="processupdate"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("生产线修改");
	}else if(obj.logOperate=="processdelete"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("生产线删除");
	}else if(obj.logOperate=="produceTaskSyn"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单同步");
	}else if(obj.logOperate=="activeStatus"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("活动状态变更");
	}else if(obj.logOperate=="unitStatus"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工序状态变更");
	}else if(obj.logOperate=="batchStatus"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单状态变更");
	}else if(obj.logOperate=="produceTaskAdd"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单新增");
	}else if(obj.logOperate=="produceTaskUpdate"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单修改");
	}else if(obj.logOperate=="produceTaskDelete"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("工单删除");
	}else if(obj.logOperate=="stopPhase"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("结束活动");
	}else if(obj.logOperate=="mesStopPhaseFault"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("mes结束活动");
	}else if(obj.logOperate=="add" && obj.logType=="RMBatchFormulaMain"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("批控配方新增");
	}else if(obj.logOperate=="update" && obj.logType=="RMBatchFormulaMain"){
	$(obj.rowHtmlObj).find($("[key='logOperate']")).find("div").text("批控配方更新");
	}
});*/
}
function ec_RM_interfaceService_interfaceSyncLog_logList_PageInitMethod(){
$("[id='logList_sync_modify_RM_7.5.0.0_interfaceService_logList']").attr('class','buttonbar-button cui-btn-zdsc');
}
	
	
	
	
	
	
	
	
</script>