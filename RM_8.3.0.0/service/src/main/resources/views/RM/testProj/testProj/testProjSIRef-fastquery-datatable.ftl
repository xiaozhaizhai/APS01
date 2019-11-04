	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487596283533')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_RM_testProj_testProj_testProjSIRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_testProj_testProj_testProjSIRef_queryForm" exportUrl="/RM/testProj/testProj/testProjSIRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="RM_testProj_testProj_testProjSIRef_condition" id="RM_testProj_testProj_testProjSIRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487596341218')}_${getText('RM.viewtitle.randon1487596519107')}.xls" />
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
		<div id="ec_RM_testProj_testProj_testProjSIRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_RM_testProj_testProj_testProjSIRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('RM_7.5.0.0_testProj_testProjSIRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="RM_7.5.0.0_testProj_testProjSIRef" formId="ec_RM_testProj_testProj_testProjSIRef_queryForm" dataTableId="ec_RM_testProj_testProj_testProjSIRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_RM_testProj_testProj_testProjSIRef_queryForm" isExpandAll=true formId="ec_RM_testProj_testProj_testProjSIRef_queryForm" idprefix="ec_RM_testProj_testProj_testProjSIRef" expandType="all"  fieldcodes="RM_7.5.0.0_testProj_TestProj_code_code:RM.propertydisplayName.randon1487596384862||RM_7.5.0.0_testProj_TestProj_name_name:RM.propertydisplayName.randon1487596428462" > 
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<@queryfield formId="ec_RM_testProj_testProj_testProjSIRef_queryForm" code="RM_7.5.0.0_testProj_TestProj_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_testProj_TestProj_code_code" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="equal"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<@queryfield formId="ec_RM_testProj_testProj_testProjSIRef_queryForm" code="RM_7.5.0.0_testProj_TestProj_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_testProj_TestProj_name_name" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_RM_testProj_testProj_testProjSIRef_queryForm" type="adv" onclick="RM.testProj.testProj.testProjSIRef.commonQuery('query')" onadvancedclick="advQuery('RM.testProj.testProj.testProjSIRef.advquery')" /> 
						 		<@querybutton formId="ec_RM_testProj_testProj_testProjSIRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_RM_testProj_testProj_testProjSIRef_quickquery_info={};
ec_RM_testProj_testProj_testProjSIRef_quickquery_info["MainTableName"]="LIMSBASIC_TEST_PROJS";
ec_RM_testProj_testProj_testProjSIRef_quickquery_info["code"]={};
ec_RM_testProj_testProj_testProjSIRef_quickquery_info["code"].dbColumnType="BAPCODE";
ec_RM_testProj_testProj_testProjSIRef_quickquery_info["code"].layRec="code";
ec_RM_testProj_testProj_testProjSIRef_quickquery_info["code"].columnName="CODE";
ec_RM_testProj_testProj_testProjSIRef_quickquery_info["name"]={};
ec_RM_testProj_testProj_testProjSIRef_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_testProj_testProj_testProjSIRef_quickquery_info["name"].layRec="name";
ec_RM_testProj_testProj_testProjSIRef_quickquery_info["name"].columnName="NAME";
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
 	var advRemainDialog = $('[id="RM.testProj.testProj.testProjSIRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="RM.testProj.testProj.testProjSIRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_RM_testProj_testProj_testProjSIRef_adv_queryForm" exportUrl="/RM/testProj/testProj/testProjSIRef-query.action">
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_testProj_testProj_testProjSIRef_adv_queryForm" code="RM_7.5.0.0_testProj_TestProj_code" showFormat="TEXT" defaultValue=code_defaultValue  divCode="RM_7.5.0.0_testProj_TestProj_code_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_testProj_TestProj" layRec="code" columnname="CODE" columntype="BAPCODE" name="code" fieldType="TEXTFIELD" tableName="LIMSBASIC_TEST_PROJS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_testProj_TestProj" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="code" id="adv_code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="equal" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
								<@advsqueryfield formId="ec_RM_testProj_testProj_testProjSIRef_adv_queryForm" code="RM_7.5.0.0_testProj_TestProj_name" showFormat="TEXT" defaultValue=name_defaultValue  divCode="RM_7.5.0.0_testProj_TestProj_name_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_testProj_TestProj" layRec="name" columnname="NAME" columntype="TEXT" name="name" fieldType="TEXTFIELD" tableName="LIMSBASIC_TEST_PROJS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										检测方案名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_testProj_TestProj" />
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
			viewCode: 'RM_7.5.0.0_testProj_testProjSIRef',
			modelCode: 'RM_7.5.0.0_testProj_TestProj',
			modelName: 'TestProj',
			formId: 'ec_RM_testProj_testProj_testProjSIRef_queryForm',
			olddiv: 'RM.testProj.testProj.testProjSIRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='RM.testProj.testProj.testProjSIRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_testProj_testProjSIRef'+"&entity.code="+'RM_7.5.0.0_testProj';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='RM.testProj.testProj.testProjSIRef.advquery'] #customquContent").html(html);
		 	$("[id='RM.testProj.testProj.testProjSIRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='RM.testProj.testProj.testProjSIRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'RM_7.5.0.0_testProj_testProjSIRef'+"&entity.code="+'RM_7.5.0.0_testProj';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='RM.testProj.testProj.testProjSIRef.advquery'] #customquContent").html(html);
			 $("[id='RM.testProj.testProj.testProjSIRef.advquery'] #advQueryLoading").hide();
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
		$('[id="RM.testProj.testProj.testProjSIRef.advquery"] div.customqu-content').css('display','none');
		$('[id="RM.testProj.testProj.testProjSIRef.advquery"] div.move-grade').css('display','none');
		// $('[id="RM.testProj.testProj.testProjSIRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="RM.testProj.testProj.testProjSIRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="RM.testProj.testProj.testProjSIRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="RM.testProj.testProj.testProjSIRef.advquery"] div.customqu-content').css('display','block');
		$('[id="RM.testProj.testProj.testProjSIRef.advquery"] div.move-grade').css('display','block');
		// $('[id="RM.testProj.testProj.testProjSIRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="RM.testProj.testProj.testProjSIRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="RM.testProj.testProj.testProjSIRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "RM.testProj.testProj.testProjSIRef.query('query')">
<#assign datatable_dataUrl = "/RM/testProj/testProj/testProjSIRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_RM_testProj_testProj_testProjSIRef_query" renderOverEvent="ec_RM_testProj_testProj_testProjSIRef_RenderOverEvent" pageInitMethod="ec_RM_testProj_testProj_testProjSIRef_PageInitMethod" modelCode="RM_7.5.0.0_testProj_TestProj" noPermissionKeys="code,name,testType,isDefault,createStaff.name,createTime" hidekeyPrefix="ec_RM_testProj_testProj_testProjSIRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_testProj_testProj_testProjSIRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="RM.testProj.testProj.testProjSIRef.sendBacktestProjSIRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','createStaff.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="RM.testProj.testProj.testProjSIRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('RM.propertydisplayName.randon1487596384862')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487596428462')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign testType_displayDefaultType  = ''>
			<@datacolumn columnName="TEST_TYPE"    showFormat="TEXT" defaultDisplay="${testType_displayDefaultType!}"  key="testType"   label="${getText('RM.propertydisplayName.randon1487596442871')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign isDefault_displayDefaultType  = ''>
			<@datacolumn columnName="IS_DEFAULT"    showFormat="SELECT" defaultDisplay="${isDefault_displayDefaultType!}"  key="isDefault"   label="${getText('RM.propertydisplayName.randon1487596400473')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign createStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${createStaff_name_displayDefaultType!}"  key="createStaff.name"   label="${getText('RM.staff.dimissionStaff_xls.staffName232')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="CREATE_TIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('RM.common.createTime2323')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_testProj_testProj_testProjSIRef_RenderOverEvent(){
}
function ec_RM_testProj_testProj_testProjSIRef_PageInitMethod(){
}
	
	
	
	
	
	
</script>