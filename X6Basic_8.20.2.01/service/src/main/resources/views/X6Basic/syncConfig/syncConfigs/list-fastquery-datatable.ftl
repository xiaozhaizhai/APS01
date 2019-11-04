	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1409053208659')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_syncConfig_syncConfigs_list_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_syncConfig_syncConfigs_list_queryForm" exportUrl="/X6Basic/syncConfig/syncConfigs/list-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1409053271008')}_${getText('X6Basic.viewtitle.radion1409054616561')}.xls" />
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
		<#assign advFlag = getAdvClassific('X6Basic_1.0_syncConfig_list')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_syncConfig_list" formId="ec_X6Basic_syncConfig_syncConfigs_list_queryForm" dataTableId="ec_X6Basic_syncConfig_syncConfigs_list_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_syncConfig_syncConfigs_list_queryForm"  formId="ec_X6Basic_syncConfig_syncConfigs_list_queryForm" idprefix="ec_X6Basic_syncConfig_syncConfigs_list" expandType="single"  fieldcodes="X6Basic_1.0_syncConfig_SyncConfigs_syncBBSFlag_syncBBSFlag:X6Basic.propertydisplayName.radion1409053368915||X6Basic_1.0_syncConfig_SyncConfigs_syncEmailFlag_syncEmailFlag:X6Basic.propertydisplayName.radion1409053309514||X6Basic_1.0_syncConfig_SyncConfigs_syncPandionFlag_syncPandionFlag:X6Basic.propertydisplayName.radion1409053401279" > 
							<#assign syncBBSFlag_defaultValue  = ''>
									<#assign syncBBSFlag_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_syncConfig_syncConfigs_list_queryForm" code="X6Basic_1.0_syncConfig_SyncConfigs_syncBBSFlag" showFormat="SELECT" defaultValue=syncBBSFlag_defaultValue  divCode="X6Basic_1.0_syncConfig_SyncConfigs_syncBBSFlag_syncBBSFlag" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${syncBBSFlag_defaultValue!}" name="syncBBSFlag" id="syncBBSFlag" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (syncBBSFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (syncBBSFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign syncEmailFlag_defaultValue  = ''>
									<#assign syncEmailFlag_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_syncConfig_syncConfigs_list_queryForm" code="X6Basic_1.0_syncConfig_SyncConfigs_syncEmailFlag" showFormat="SELECT" defaultValue=syncEmailFlag_defaultValue  divCode="X6Basic_1.0_syncConfig_SyncConfigs_syncEmailFlag_syncEmailFlag" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${syncEmailFlag_defaultValue!}" name="syncEmailFlag" id="syncEmailFlag" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (syncEmailFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (syncEmailFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign syncPandionFlag_defaultValue  = ''>
									<#assign syncPandionFlag_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_syncConfig_syncConfigs_list_queryForm" code="X6Basic_1.0_syncConfig_SyncConfigs_syncPandionFlag" showFormat="SELECT" defaultValue=syncPandionFlag_defaultValue  divCode="X6Basic_1.0_syncConfig_SyncConfigs_syncPandionFlag_syncPandionFlag" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${syncPandionFlag_defaultValue!}" name="syncPandionFlag" id="syncPandionFlag" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (syncPandionFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (syncPandionFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_syncConfig_syncConfigs_list_queryForm" type="adv" onclick="X6Basic.syncConfig.syncConfigs.list.commonQuery('query')" onadvancedclick="advQuery('X6Basic.syncConfig.syncConfigs.list.advquery')" /> 
						 		<@querybutton formId="ec_X6Basic_syncConfig_syncConfigs_list_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info={};
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["MainTableName"]="X6BASIC_SYNC_CONFIGS";
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncBBSFlag"]={};
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncBBSFlag"].dbColumnType="BOOLEAN";
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncBBSFlag"].layRec="syncBBSFlag";
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncBBSFlag"].columnName="SYNCBBSFLAG";
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncEmailFlag"]={};
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncEmailFlag"].dbColumnType="BOOLEAN";
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncEmailFlag"].layRec="syncEmailFlag";
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncEmailFlag"].columnName="SYNC_EMAIL_FLAG";
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncPandionFlag"]={};
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncPandionFlag"].dbColumnType="BOOLEAN";
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncPandionFlag"].layRec="syncPandionFlag";
ec_X6Basic_syncConfig_syncConfigs_list_quickquery_info["syncPandionFlag"].columnName="SYNC_PANDION_FLAG";
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
 	var advRemainDialog = $('[id="X6Basic.syncConfig.syncConfigs.list.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="X6Basic.syncConfig.syncConfigs.list.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_syncConfig_syncConfigs_list_adv_queryForm" exportUrl="/X6Basic/syncConfig/syncConfigs/list-query.action">
							<#assign syncBBSFlag_defaultValue  = ''>
									<#assign syncBBSFlag_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_syncConfig_syncConfigs_list_adv_queryForm" code="X6Basic_1.0_syncConfig_SyncConfigs_syncBBSFlag" showFormat="SELECT" defaultValue=syncBBSFlag_defaultValue  divCode="X6Basic_1.0_syncConfig_SyncConfigs_syncBBSFlag_syncBBSFlag" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_syncConfig_SyncConfigs" layRec="syncBBSFlag" columnname="SYNCBBSFLAG" columntype="BOOLEAN" name="syncBBSFlag" fieldType="SELECT" tableName="X6BASIC_SYNC_CONFIGS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										同步BBS账户
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_syncConfig_SyncConfigs" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${syncBBSFlag_defaultValue!}" name="syncBBSFlag" id="adv_syncBBSFlag" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (syncBBSFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (syncBBSFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign syncEmailFlag_defaultValue  = ''>
									<#assign syncEmailFlag_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_syncConfig_syncConfigs_list_adv_queryForm" code="X6Basic_1.0_syncConfig_SyncConfigs_syncEmailFlag" showFormat="SELECT" defaultValue=syncEmailFlag_defaultValue  divCode="X6Basic_1.0_syncConfig_SyncConfigs_syncEmailFlag_syncEmailFlag" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_syncConfig_SyncConfigs" layRec="syncEmailFlag" columnname="SYNC_EMAIL_FLAG" columntype="BOOLEAN" name="syncEmailFlag" fieldType="SELECT" tableName="X6BASIC_SYNC_CONFIGS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										同步邮件账户
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_syncConfig_SyncConfigs" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${syncEmailFlag_defaultValue!}" name="syncEmailFlag" id="adv_syncEmailFlag" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (syncEmailFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (syncEmailFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign syncPandionFlag_defaultValue  = ''>
									<#assign syncPandionFlag_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_syncConfig_syncConfigs_list_adv_queryForm" code="X6Basic_1.0_syncConfig_SyncConfigs_syncPandionFlag" showFormat="SELECT" defaultValue=syncPandionFlag_defaultValue  divCode="X6Basic_1.0_syncConfig_SyncConfigs_syncPandionFlag_syncPandionFlag" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_syncConfig_SyncConfigs" layRec="syncPandionFlag" columnname="SYNC_PANDION_FLAG" columntype="BOOLEAN" name="syncPandionFlag" fieldType="SELECT" tableName="X6BASIC_SYNC_CONFIGS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										同步聊天工具账户
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_syncConfig_SyncConfigs" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${syncPandionFlag_defaultValue!}" name="syncPandionFlag" id="adv_syncPandionFlag" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (syncPandionFlag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (syncPandionFlag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
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
			viewCode: 'X6Basic_1.0_syncConfig_list',
			modelCode: 'X6Basic_1.0_syncConfig_SyncConfigs',
			modelName: 'SyncConfigs',
			formId: 'ec_X6Basic_syncConfig_syncConfigs_list_queryForm',
			olddiv: 'X6Basic.syncConfig.syncConfigs.list.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='X6Basic.syncConfig.syncConfigs.list.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_syncConfig_list'+"&entity.code="+'X6Basic_1.0_syncConfig';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='X6Basic.syncConfig.syncConfigs.list.advquery'] #customquContent").html(html);
		 	$("[id='X6Basic.syncConfig.syncConfigs.list.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='X6Basic.syncConfig.syncConfigs.list.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_syncConfig_list'+"&entity.code="+'X6Basic_1.0_syncConfig';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='X6Basic.syncConfig.syncConfigs.list.advquery'] #customquContent").html(html);
			 $("[id='X6Basic.syncConfig.syncConfigs.list.advquery'] #advQueryLoading").hide();
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
		$('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] div.customqu-content').css('display','none');
		$('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] div.move-grade').css('display','none');
		// $('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] div.customqu-content').css('display','block');
		$('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] div.move-grade').css('display','block');
		// $('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="X6Basic.syncConfig.syncConfigs.list.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "X6Basic.syncConfig.syncConfigs.list.query('query')">
<#assign datatable_dataUrl = "/X6Basic/syncConfig/syncConfigs/list-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_X6Basic_syncConfig_syncConfigs_list_query" renderOverEvent="ec_X6Basic_syncConfig_syncConfigs_list_RenderOverEvent" pageInitMethod="ec_X6Basic_syncConfig_syncConfigs_list_PageInitMethod" modelCode="X6Basic_1.0_syncConfig_SyncConfigs" noPermissionKeys="syncEmailFlag,syncBBSFlag,syncPandionFlag" hidekeyPrefix="ec_X6Basic_syncConfig_syncConfigs_list_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_syncConfig_syncConfigs_list_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="X6Basic.syncConfig.syncConfigs.list.dbmodifylist" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="X6Basic.syncConfig.syncConfigs.list.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_modify_modify_X6Basic_1.0_syncConfig_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1409054708028')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.syncConfig.syncConfigs.list.modifylist()
		" 
		resultType="json" 
		buttonCode="X6Basic_1.0_syncConfig_list_BUTTON_modify"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_modify_modify_X6Basic_1.0_syncConfig_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1409054708028')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.syncConfig.syncConfigs.list.modifylist()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_add_add_X6Basic_1.0_syncConfig_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1409209633610')}||iconcls:add||useInMore:false||onclick:
				X6Basic.syncConfig.syncConfigs.list.addlist()
		" 
		resultType="json" 
		buttonCode="X6Basic_1.0_syncConfig_list_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}list_add_add_X6Basic_1.0_syncConfig_list||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1409209633610')}||iconcls:add||useInMore:false||onclick:
				X6Basic.syncConfig.syncConfigs.list.addlist()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign syncEmailFlag_displayDefaultType  = ''>
			<@datacolumn columnName="SYNC_EMAIL_FLAG"    showFormat="CHECKBOX" defaultDisplay="${syncEmailFlag_displayDefaultType!}"  key="syncEmailFlag"   label="${getText('X6Basic.propertydisplayName.radion1409053309514')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign syncBBSFlag_displayDefaultType  = ''>
			<@datacolumn columnName="SYNCBBSFLAG"    showFormat="CHECKBOX" defaultDisplay="${syncBBSFlag_displayDefaultType!}"  key="syncBBSFlag"   label="${getText('X6Basic.propertydisplayName.radion1409053368915')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign syncPandionFlag_displayDefaultType  = ''>
			<@datacolumn columnName="SYNC_PANDION_FLAG"    showFormat="CHECKBOX" defaultDisplay="${syncPandionFlag_displayDefaultType!}"  key="syncPandionFlag"   label="${getText('X6Basic.propertydisplayName.radion1409053401279')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_syncConfig_syncConfigs_list_RenderOverEvent(){
}
function ec_X6Basic_syncConfig_syncConfigs_list_PageInitMethod(){
}
	
	
	
</script>