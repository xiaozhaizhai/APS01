	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.radion1400466776361')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_X6Basic_accountingPeriod_accountPeriod_ref_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_accountingPeriod_accountPeriod_ref_queryForm" exportUrl="/X6Basic/accountingPeriod/accountPeriod/ref-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="X6Basic_accountingPeriod_accountPeriod_ref_condition" id="X6Basic_accountingPeriod_accountPeriod_ref_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.radion1400467440493')}_${getText('X6Basic.viewtitle.radion1400634296768')}.xls" />
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
		<#assign advFlag = getAdvClassific('X6Basic_1.0_accountingPeriod_ref')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="X6Basic_1.0_accountingPeriod_ref" formId="ec_X6Basic_accountingPeriod_accountPeriod_ref_queryForm" dataTableId="ec_X6Basic_accountingPeriod_accountPeriod_ref_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_X6Basic_accountingPeriod_accountPeriod_ref_queryForm"  formId="ec_X6Basic_accountingPeriod_accountPeriod_ref_queryForm" idprefix="ec_X6Basic_accountingPeriod_accountPeriod_ref" expandType="single"  fieldcodes="X6Basic_1.0_accountingPeriod_AccountPeriod_year_year:X6Basic.propertydisplayName.radion1400468158682" > 
							<#assign year_defaultValue  = ''>
									<#assign year_defaultValue  = ''>
							<@queryfield formId="ec_X6Basic_accountingPeriod_accountPeriod_ref_queryForm" code="X6Basic_1.0_accountingPeriod_AccountPeriod_year" showFormat="SELECTCOMP" defaultValue=year_defaultValue  divCode="X6Basic_1.0_accountingPeriod_AccountPeriod_year_year" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${year_defaultValue}"   name="year" code="accYear" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_X6Basic_accountingPeriod_accountPeriod_ref_queryForm" type="adv" onclick="X6Basic.accountingPeriod.accountPeriod.ref.commonQuery('query')" onadvancedclick="advQuery('X6Basic.accountingPeriod.accountPeriod.ref.advquery')" /> 
						 		<@querybutton formId="ec_X6Basic_accountingPeriod_accountPeriod_ref_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_X6Basic_accountingPeriod_accountPeriod_ref_quickquery_info={};
ec_X6Basic_accountingPeriod_accountPeriod_ref_quickquery_info["MainTableName"]="X6BASIC_ACCOUNT_PERIODS";
ec_X6Basic_accountingPeriod_accountPeriod_ref_quickquery_info["year"]={};
ec_X6Basic_accountingPeriod_accountPeriod_ref_quickquery_info["year"].dbColumnType="SYSTEMCODE";
ec_X6Basic_accountingPeriod_accountPeriod_ref_quickquery_info["year"].layRec="year";
ec_X6Basic_accountingPeriod_accountPeriod_ref_quickquery_info["year"].columnName="YEAR";
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
 	var advRemainDialog = $('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="X6Basic.accountingPeriod.accountPeriod.ref.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_X6Basic_accountingPeriod_accountPeriod_ref_adv_queryForm" exportUrl="/X6Basic/accountingPeriod/accountPeriod/ref-query.action">
							<#assign year_defaultValue  = ''>
									<#assign year_defaultValue  = ''>
								<@advsqueryfield formId="ec_X6Basic_accountingPeriod_accountPeriod_ref_adv_queryForm" code="X6Basic_1.0_accountingPeriod_AccountPeriod_year" showFormat="SELECTCOMP" defaultValue=year_defaultValue  divCode="X6Basic_1.0_accountingPeriod_AccountPeriod_year_year" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_accountingPeriod_AccountPeriod" layRec="year" columnname="YEAR" columntype="SYSTEMCODE" name="year" fieldType="SELECTCOMP" tableName="X6BASIC_ACCOUNT_PERIODS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										年度
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_accountingPeriod_AccountPeriod" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${year_defaultValue}"   name="year" code="accYear" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign createTime_defaultValue  = ''>
									<#assign createTime_defaultValue  = ''>
								<#if (createTime_defaultValue)?? &&(createTime_defaultValue)?has_content>
									<#assign createTime_defaultValue  = getDefaultDateTime(createTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_X6Basic_accountingPeriod_accountPeriod_ref_adv_queryForm" code="X6Basic_1.0_accountingPeriod_AccountPeriod_createTime" showFormat="YMD_HMS" defaultValue=createTime_defaultValue  divCode="X6Basic_1.0_accountingPeriod_AccountPeriod_createTime_createTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_accountingPeriod_AccountPeriod" layRec="createTime" columnname="CREATE_TIME" columntype="DATETIME" name="createTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="X6BASIC_ACCOUNT_PERIODS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										创建时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_accountingPeriod_AccountPeriod" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${createTime_defaultValue!}" deValue="${createTime_defaultValue!}"  name="createTime_start" id="adv_createTime_start" exp="gequal"    formid="ec_X6Basic_accountingPeriod_accountPeriod_ref_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${createTime_defaultValue!}" deValue="${createTime_defaultValue!}"  name="createTime_end" id="adv_createTime_end" exp="lequal"    formid="ec_X6Basic_accountingPeriod_accountPeriod_ref_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign modifyTime_defaultValue  = ''>
									<#assign modifyTime_defaultValue  = ''>
								<#if (modifyTime_defaultValue)?? &&(modifyTime_defaultValue)?has_content>
									<#assign modifyTime_defaultValue  = getDefaultDateTime(modifyTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_X6Basic_accountingPeriod_accountPeriod_ref_adv_queryForm" code="X6Basic_1.0_accountingPeriod_AccountPeriod_modifyTime" showFormat="YMD_HMS" defaultValue=modifyTime_defaultValue  divCode="X6Basic_1.0_accountingPeriod_AccountPeriod_modifyTime_modifyTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="X6Basic_1.0_accountingPeriod_AccountPeriod" layRec="modifyTime" columnname="MODIFY_TIME" columntype="DATETIME" name="modifyTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="X6BASIC_ACCOUNT_PERIODS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										修改时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="X6Basic_1.0_accountingPeriod_AccountPeriod" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${modifyTime_defaultValue!}" deValue="${modifyTime_defaultValue!}"  name="modifyTime_start" id="adv_modifyTime_start" exp="gequal"    formid="ec_X6Basic_accountingPeriod_accountPeriod_ref_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${modifyTime_defaultValue!}" deValue="${modifyTime_defaultValue!}"  name="modifyTime_end" id="adv_modifyTime_end" exp="lequal"    formid="ec_X6Basic_accountingPeriod_accountPeriod_ref_adv_queryForm" />
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
			viewCode: 'X6Basic_1.0_accountingPeriod_ref',
			modelCode: 'X6Basic_1.0_accountingPeriod_AccountPeriod',
			modelName: 'AccountPeriod',
			formId: 'ec_X6Basic_accountingPeriod_accountPeriod_ref_queryForm',
			olddiv: 'X6Basic.accountingPeriod.accountPeriod.ref.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='X6Basic.accountingPeriod.accountPeriod.ref.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_accountingPeriod_ref'+"&entity.code="+'X6Basic_1.0_accountingPeriod';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='X6Basic.accountingPeriod.accountPeriod.ref.advquery'] #customquContent").html(html);
		 	$("[id='X6Basic.accountingPeriod.accountPeriod.ref.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='X6Basic.accountingPeriod.accountPeriod.ref.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'X6Basic_1.0_accountingPeriod_ref'+"&entity.code="+'X6Basic_1.0_accountingPeriod';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='X6Basic.accountingPeriod.accountPeriod.ref.advquery'] #customquContent").html(html);
			 $("[id='X6Basic.accountingPeriod.accountPeriod.ref.advquery'] #advQueryLoading").hide();
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
		$('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] div.customqu-content').css('display','none');
		$('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] div.move-grade').css('display','none');
		// $('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] div.customqu-content').css('display','block');
		$('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] div.move-grade').css('display','block');
		// $('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="X6Basic.accountingPeriod.accountPeriod.ref.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "X6Basic.accountingPeriod.accountPeriod.ref.query('query')">
<#assign datatable_dataUrl = "/X6Basic/accountingPeriod/accountPeriod/ref-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_X6Basic_accountingPeriod_accountPeriod_ref_query" renderOverEvent="ec_X6Basic_accountingPeriod_accountPeriod_ref_RenderOverEvent" pageInitMethod="ec_X6Basic_accountingPeriod_accountPeriod_ref_PageInitMethod" modelCode="X6Basic_1.0_accountingPeriod_AccountPeriod" noPermissionKeys="year" hidekeyPrefix="ec_X6Basic_accountingPeriod_accountPeriod_ref_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_accountingPeriod_accountPeriod_ref_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="X6Basic.accountingPeriod.accountPeriod.ref.sendBackref" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','year.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="X6Basic.accountingPeriod.accountPeriod.ref.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}ref_add_add_X6Basic_1.0_accountingPeriod_ref||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1400468718215')}||iconcls:add||useInMore:false||onclick:
				X6Basic.accountingPeriod.accountPeriod.ref.addref()
		" 
		resultType="json" 
		buttonCode="X6Basic_1.0_accountingPeriod_ref_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}ref_add_add_X6Basic_1.0_accountingPeriod_ref||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1400468718215')}||iconcls:add||useInMore:false||onclick:
				X6Basic.accountingPeriod.accountPeriod.ref.addref()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}ref_modify_modify_X6Basic_1.0_accountingPeriod_ref||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1400468744166')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.accountingPeriod.accountPeriod.ref.modifyref()
		" 
		resultType="json" 
		buttonCode="X6Basic_1.0_accountingPeriod_ref_BUTTON_modify"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}ref_modify_modify_X6Basic_1.0_accountingPeriod_ref||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1400468744166')}||iconcls:modify||useInMore:false||onclick:
				X6Basic.accountingPeriod.accountPeriod.ref.modifyref()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}ref_del_del_X6Basic_1.0_accountingPeriod_ref||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1400634194043')}||iconcls:del||useInMore:false||onclick:
				X6Basic.accountingPeriod.accountPeriod.ref.delref()
		" 
		resultType="json" 
		buttonCode="X6Basic_1.0_accountingPeriod_ref_BUTTON_del"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}ref_del_del_X6Basic_1.0_accountingPeriod_ref||separateNum:0||name:${getText('X6Basic.buttonPropertyshowName.radion1400634194043')}||iconcls:del||useInMore:false||onclick:
				X6Basic.accountingPeriod.accountPeriod.ref.delref()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign year_displayDefaultType  = ''>
			<@datacolumn columnName="YEAR"    showFormat="SELECTCOMP" defaultDisplay="${year_displayDefaultType!}"  key="year.value"   label="${getText('X6Basic.propertydisplayName.radion1400468158682')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_accountingPeriod_accountPeriod_ref_RenderOverEvent(){
}
function ec_X6Basic_accountingPeriod_accountPeriod_ref_PageInitMethod(){
}
	
</script>