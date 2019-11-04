	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1429057173329')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" exportUrl="/MESBasic/backgroundServiceMonitor/mESServices/logList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1429057210032')}_${getText('MESBasic.viewtitle.randon1429057796203')}.xls" />
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
		<div id="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_backgroundServiceMonitor_logList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_backgroundServiceMonitor_logList" formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" dataTableId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" isExpandAll=true formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" idprefix="ec_MESBasic_backgroundServiceMonitor_mESServices_logList" expandType="all"  fieldcodes="MESBasic_1_backgroundServiceMonitor_MESServices_serviceName_serviceName:MESBasic.propertydisplayName.randon1429057348197||MESBasic_1_backgroundServiceMonitor_MESServices_serviceCode_serviceCode:MESBasic.propertydisplayName.randon1429057324372||MESBasic_1_backgroundServiceMonitor_MESServices_active_active:MESBasic.propertydisplayName.randon1429057668351" > 
							<#assign serviceName_defaultValue  = ''>
									<#assign serviceName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_serviceName" showFormat="TEXT" defaultValue=serviceName_defaultValue  divCode="MESBasic_1_backgroundServiceMonitor_MESServices_serviceName_serviceName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="serviceName" id="serviceName" value="${serviceName_defaultValue!}" deValue="${serviceName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign serviceCode_defaultValue  = ''>
									<#assign serviceCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_serviceCode" showFormat="TEXT" defaultValue=serviceCode_defaultValue  divCode="MESBasic_1_backgroundServiceMonitor_MESServices_serviceCode_serviceCode" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="serviceCode" id="serviceCode" value="${serviceCode_defaultValue!}" deValue="${serviceCode_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign active_defaultValue  = ''>
									<#assign active_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_active" showFormat="SELECT" defaultValue=active_defaultValue  divCode="MESBasic_1_backgroundServiceMonitor_MESServices_active_active" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${active_defaultValue!}" name="active" id="active" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (active_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (active_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" type="adv" onclick="MESBasic.backgroundServiceMonitor.mESServices.logList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.backgroundServiceMonitor.mESServices.logList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info={};
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["MainTableName"]="MESBASIC_MESSERVICES";
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["serviceName"]={};
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["serviceName"].dbColumnType="TEXT";
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["serviceName"].layRec="serviceName";
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["serviceName"].columnName="SERVICE_NAME";
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["serviceCode"]={};
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["serviceCode"].dbColumnType="TEXT";
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["serviceCode"].layRec="serviceCode";
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["serviceCode"].columnName="SERVICE_CODE";
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["active"]={};
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["active"].dbColumnType="BOOLEAN";
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["active"].layRec="active";
ec_MESBasic_backgroundServiceMonitor_mESServices_logList_quickquery_info["active"].columnName="ACTIVE";
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
 	var advRemainDialog = $('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_adv_queryForm" exportUrl="/MESBasic/backgroundServiceMonitor/mESServices/logList-query.action">
							<#assign serviceName_defaultValue  = ''>
									<#assign serviceName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_adv_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_serviceName" showFormat="TEXT" defaultValue=serviceName_defaultValue  divCode="MESBasic_1_backgroundServiceMonitor_MESServices_serviceName_serviceName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_backgroundServiceMonitor_MESServices" layRec="serviceName" columnname="SERVICE_NAME" columntype="TEXT" name="serviceName" fieldType="TEXTFIELD" tableName="MESBASIC_MESSERVICES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										服务名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_backgroundServiceMonitor_MESServices" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="serviceName" id="adv_serviceName" value="${serviceName_defaultValue!}" deValue="${serviceName_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign serviceCode_defaultValue  = ''>
									<#assign serviceCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_adv_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_serviceCode" showFormat="TEXT" defaultValue=serviceCode_defaultValue  divCode="MESBasic_1_backgroundServiceMonitor_MESServices_serviceCode_serviceCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_backgroundServiceMonitor_MESServices" layRec="serviceCode" columnname="SERVICE_CODE" columntype="TEXT" name="serviceCode" fieldType="TEXTFIELD" tableName="MESBASIC_MESSERVICES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										服务编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_backgroundServiceMonitor_MESServices" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="serviceCode" id="adv_serviceCode" value="${serviceCode_defaultValue!}" deValue="${serviceCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign active_defaultValue  = ''>
									<#assign active_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_adv_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_active" showFormat="SELECT" defaultValue=active_defaultValue  divCode="MESBasic_1_backgroundServiceMonitor_MESServices_active_active" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_backgroundServiceMonitor_MESServices" layRec="active" columnname="ACTIVE" columntype="BOOLEAN" name="active" fieldType="SELECT" tableName="MESBASIC_MESSERVICES"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										运行状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_backgroundServiceMonitor_MESServices" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${active_defaultValue!}" name="active" id="adv_active" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (active_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (active_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign lastRunningTime_defaultValue  = ''>
									<#assign lastRunningTime_defaultValue  = ''>
								<#if (lastRunningTime_defaultValue)?? &&(lastRunningTime_defaultValue)?has_content>
									<#assign lastRunningTime_defaultValue  = getDefaultDateTime(lastRunningTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_adv_queryForm" code="MESBasic_1_backgroundServiceMonitor_MESServices_lastRunningTime" showFormat="YMD_HMS" defaultValue=lastRunningTime_defaultValue  divCode="MESBasic_1_backgroundServiceMonitor_MESServices_lastRunningTime_lastRunningTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_backgroundServiceMonitor_MESServices" layRec="lastRunningTime" columnname="LAST_RUNNING_TIME" columntype="DATETIME" name="lastRunningTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="MESBASIC_MESSERVICES"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										上一次运行时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_backgroundServiceMonitor_MESServices" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${lastRunningTime_defaultValue!}" deValue="${lastRunningTime_defaultValue!}"  name="lastRunningTime_start" id="adv_lastRunningTime_start" exp="gequal"    formid="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${lastRunningTime_defaultValue!}" deValue="${lastRunningTime_defaultValue!}"  name="lastRunningTime_end" id="adv_lastRunningTime_end" exp="lequal"    formid="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_adv_queryForm" />
							  		</div>
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
			viewCode: 'MESBasic_1_backgroundServiceMonitor_logList',
			modelCode: 'MESBasic_1_backgroundServiceMonitor_MESServices',
			modelName: 'MESServices',
			formId: 'ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm',
			olddiv: 'MESBasic.backgroundServiceMonitor.mESServices.logList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.backgroundServiceMonitor.mESServices.logList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_backgroundServiceMonitor_logList'+"&entity.code="+'MESBasic_1_backgroundServiceMonitor';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.backgroundServiceMonitor.mESServices.logList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.backgroundServiceMonitor.mESServices.logList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.backgroundServiceMonitor.mESServices.logList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_backgroundServiceMonitor_logList'+"&entity.code="+'MESBasic_1_backgroundServiceMonitor';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.backgroundServiceMonitor.mESServices.logList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.backgroundServiceMonitor.mESServices.logList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.backgroundServiceMonitor.mESServices.logList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.backgroundServiceMonitor.mESServices.logList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/backgroundServiceMonitor/mESServices/logList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_query" renderOverEvent="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_RenderOverEvent" pageInitMethod="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_PageInitMethod" modelCode="MESBasic_1_backgroundServiceMonitor_MESServices" noPermissionKeys="serviceCode,serviceName,active,lastRunningTime" hidekeyPrefix="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_backgroundServiceMonitor_mESServices_logList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.backgroundServiceMonitor.mESServices.logList.dbClickViewlogList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.backgroundServiceMonitor.mESServices.logList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}logList_changeStatus_modify_MESBasic_1_backgroundServiceMonitor_logList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1429063205656')}||iconcls:modify||useInMore:false||onclick:
					changeStatus()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="MESBasic_1_backgroundServiceMonitor_logList_BUTTON_changeStatus"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}logList_changeStatus_modify_MESBasic_1_backgroundServiceMonitor_logList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1429063205656')}||iconcls:modify||useInMore:false||onclick:
					changeStatus()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign serviceCode_displayDefaultType  = ''>
			<@datacolumn columnName="SERVICE_CODE"    showFormat="TEXT" defaultDisplay="${serviceCode_displayDefaultType!}"  key="serviceCode"   label="${getText('MESBasic.propertydisplayName.randon1429057324372')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign serviceName_displayDefaultType  = ''>
			<@datacolumn columnName="SERVICE_NAME"    showFormat="TEXT" defaultDisplay="${serviceName_displayDefaultType!}"  key="serviceName"   label="${getText('MESBasic.propertydisplayName.randon1429057348197')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign active_displayDefaultType  = ''>
			<@datacolumn columnName="ACTIVE"    showFormat="CHECKBOX" defaultDisplay="${active_displayDefaultType!}"  key="active"   label="${getText('MESBasic.propertydisplayName.randon1429057668351')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign lastRunningTime_displayDefaultType  = ''>
			<@datacolumn columnName="LAST_RUNNING_TIME"    showFormat="YMD_HMS" defaultDisplay="${lastRunningTime_displayDefaultType!}"  key="lastRunningTime"   label="${getText('MESBasic.propertydisplayName.randon1429057448034')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_backgroundServiceMonitor_mESServices_logList_RenderOverEvent(){
}
function ec_MESBasic_backgroundServiceMonitor_mESServices_logList_PageInitMethod(){
}
	
	
	
	
</script>