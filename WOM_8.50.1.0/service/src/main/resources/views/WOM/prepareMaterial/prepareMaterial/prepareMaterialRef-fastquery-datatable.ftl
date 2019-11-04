	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489976457717')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm" exportUrl="/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_condition" id="WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489976508917')}_${getText('WOM.viewtitle.randon1564661443506')}.xls" />
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
		<div id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_prepareMaterial_prepareMaterialRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_prepareMaterial_prepareMaterialRef" formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm" dataTableId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm" isExpandAll=true formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm" idprefix="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef" expandType="all"  fieldcodes="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_tableNo:ec.common.tableNo||WOM_7.5.0.0_prepareMaterial_PrepareMaterial_effectiveState_effectiveState:ec.common.effectiveState" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign effectiveState_defaultValue  = ''>
									<#assign effectiveState_defaultValue  = ''>
							<@queryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_effectiveState" showFormat="TEXT" defaultValue=effectiveState_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_effectiveState_effectiveState" isCustomize=true style="" > 
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="effectiveState_start" id="effectiveState_start" value="${effectiveState_defaultValue!}" deValue="${effectiveState_defaultValue!}"   exp="equal"/>
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="effectiveState_end" id="effectiveState_end" value="${effectiveState_defaultValue!}" deValue="${effectiveState_defaultValue!}"   exp="equal"/>
									  		</div></div>
									  		</div>
								  		</div>								  		
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm" type="adv" onclick="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.commonQuery('query')" onadvancedclick="advQuery('WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["MainTableName"]="WOM_PREPARE_MATERIALS";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["tableNo"]={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["effectiveState"]={};
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["effectiveState"].dbColumnType="INTEGER";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["effectiveState"].layRec="effectiveState";
ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_quickquery_info["effectiveState"].columnName="EFFECTIVE_STATE";
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
 	var advRemainDialog = $('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_adv_queryForm" exportUrl="/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef-query.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_adv_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_tableNo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" layRec="tableNo" columnname="TABLE_NO" columntype="TEXT" name="tableNo" fieldType="TEXTFIELD" tableName="WOM_PREPARE_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="adv_tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign effectiveState_defaultValue  = ''>
									<#assign effectiveState_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_adv_queryForm" code="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_effectiveState" showFormat="TEXT" defaultValue=effectiveState_defaultValue  divCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial_effectiveState_effectiveState" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" layRec="effectiveState" columnname="EFFECTIVE_STATE" columntype="INTEGER" name="effectiveState" fieldType="TEXTFIELD" tableName="WOM_PREPARE_MATERIALS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据生效状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" />
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="effectiveState_start" id="adv_effectiveState_start" value="${effectiveState_defaultValue!}" deValue="${effectiveState_defaultValue!}"   exp="equal"   />
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="effectiveState_end" id="adv_effectiveState_end" value="${effectiveState_defaultValue!}" deValue="${effectiveState_defaultValue!}"   exp="equal"  />
									  		</div></div>
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
			viewCode: 'WOM_7.5.0.0_prepareMaterial_prepareMaterialRef',
			modelCode: 'WOM_7.5.0.0_prepareMaterial_PrepareMaterial',
			modelName: 'PrepareMaterial',
			formId: 'ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm',
			olddiv: 'WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_prepareMaterial_prepareMaterialRef'+"&entity.code="+'WOM_7.5.0.0_prepareMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_prepareMaterial_prepareMaterialRef'+"&entity.code="+'WOM_7.5.0.0_prepareMaterial';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query('query')">
<#assign datatable_dataUrl = "/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.query('query')">
<#assign datatable_dataUrl = "/WOM/prepareMaterial/prepareMaterial/prepareMaterialRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query" renderOverEvent="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_RenderOverEvent" pageInitMethod="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_PageInitMethod" modelCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterial" noPermissionKeys="tableNo,manulOrderMain.manulOrderNum,manulOrderMain.saleOrderNum,effectiveState,createTime,outCode,incode" hidekeyPrefix="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.sendBackprepareMaterialRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','manulOrderMain.id','tableNo','tableNo','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.prepareMaterial.prepareMaterial.prepareMaterialRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign manulOrderMain_manulOrderNum_displayDefaultType  = ''>
			<@datacolumn columnName="MANUL_ORDER_NUM"    showFormat="TEXT" defaultDisplay="${manulOrderMain_manulOrderNum_displayDefaultType!}"  key="manulOrderMain.manulOrderNum"   label="${getText('WOM.propertydisplayName.randon1563193157341')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign manulOrderMain_saleOrderNum_displayDefaultType  = ''>
			<@datacolumn columnName="SALE_ORDER_NUM"    showFormat="TEXT" defaultDisplay="${manulOrderMain_saleOrderNum_displayDefaultType!}"  key="manulOrderMain.saleOrderNum"   label="${getText('WOM.propertydisplayName.randon1563193334953')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign effectiveState_displayDefaultType  = ''>
			<@datacolumn columnName="EFFECTIVE_STATE"    showFormat="TEXT" defaultDisplay="${effectiveState_displayDefaultType!}"  key="effectiveState"   label="${getText('ec.common.effectiveState')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="CREATE_TIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('ec.common.createTime')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign outCode_displayDefaultType  = ''>
			<@datacolumn columnName="OUT_CODE"    showFormat="TEXT" defaultDisplay="${outCode_displayDefaultType!}"  key="outCode"   label="${getText('WOM.propertydisplayName.randon1565059377008')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign incode_displayDefaultType  = ''>
			<@datacolumn columnName="INCODE"    showFormat="TEXT" defaultDisplay="${incode_displayDefaultType!}"  key="incode"   label="${getText('WOM.propertydisplayName.randon1565059320966')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_RenderOverEvent(){
}
function ec_WOM_prepareMaterial_prepareMaterial_prepareMaterialRef_PageInitMethod(){
}
	
	
	
	
	
	
	
</script>