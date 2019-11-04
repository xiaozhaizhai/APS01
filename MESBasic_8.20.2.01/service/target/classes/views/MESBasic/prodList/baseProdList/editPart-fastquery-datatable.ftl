	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1450077412035')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_prodList_baseProdList_editPart_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_prodList_baseProdList_editPart_queryForm" exportUrl="/MESBasic/prodList/baseProdList/editPart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1450078782864')}_${getText('MESBasic.viewtitle.randon1450078976066')}.xls" />
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
		<div id="ec_MESBasic_prodList_baseProdList_editPart_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_prodList_baseProdList_editPart_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_prodList_editPart')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_prodList_editPart" formId="ec_MESBasic_prodList_baseProdList_editPart_queryForm" dataTableId="ec_MESBasic_prodList_baseProdList_editPart_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_prodList_baseProdList_editPart_queryForm" isExpandAll=true formId="ec_MESBasic_prodList_baseProdList_editPart_queryForm" idprefix="ec_MESBasic_prodList_baseProdList_editPart" expandType="all"  fieldcodes="MESBasic_1_prodList_BaseProdList_prodListCode_prodListCode:MESBasic.propertydisplayName.randon1450078833366||MESBasic_1_prodList_BaseProdList_prodListName_prodListName:MESBasic.propertydisplayName.randon1450078913966||MESBasic_1_prodList_BaseProdList_modifyTime_modifyTime:ec.common.modifyTime" > 
							<#assign prodListCode_defaultValue  = ''>
									<#assign prodListCode_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_prodList_baseProdList_editPart_queryForm" code="MESBasic_1_prodList_BaseProdList_prodListCode" showFormat="TEXT" defaultValue=prodListCode_defaultValue  divCode="MESBasic_1_prodList_BaseProdList_prodListCode_prodListCode" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="prodListCode" id="prodListCode" value="${prodListCode_defaultValue!}" deValue="${prodListCode_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign prodListName_defaultValue  = ''>
									<#assign prodListName_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_prodList_baseProdList_editPart_queryForm" code="MESBasic_1_prodList_BaseProdList_prodListName" showFormat="TEXT" defaultValue=prodListName_defaultValue  divCode="MESBasic_1_prodList_BaseProdList_prodListName_prodListName" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="prodListName" id="prodListName" value="${prodListName_defaultValue!}" deValue="${prodListName_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign modifyTime_defaultValue  = ''>
									<#assign modifyTime_defaultValue  = ''>
								<#if (modifyTime_defaultValue)?? &&(modifyTime_defaultValue)?has_content>
									<#assign modifyTime_defaultValue  = getDefaultDateTime(modifyTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_MESBasic_prodList_baseProdList_editPart_queryForm" code="MESBasic_1_prodList_BaseProdList_modifyTime" showFormat="YMD_HMS" defaultValue=modifyTime_defaultValue  divCode="MESBasic_1_prodList_BaseProdList_modifyTime_modifyTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="modifyTime_start" id="modifyTime_start" exp="gequal"   formid="ec_MESBasic_prodList_baseProdList_editPart_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="modifyTime_end" id="modifyTime_end" exp="lequal"   formid="ec_MESBasic_prodList_baseProdList_editPart_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_prodList_baseProdList_editPart_queryForm" type="adv" onclick="MESBasic.prodList.baseProdList.editPart.commonQuery('query')" onadvancedclick="advQuery('MESBasic.prodList.baseProdList.editPart.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_prodList_baseProdList_editPart_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info={};
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["MainTableName"]="S2BASE_PRODLIST";
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["prodListCode"]={};
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["prodListCode"].dbColumnType="TEXT";
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["prodListCode"].layRec="prodListCode";
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["prodListCode"].columnName="PRODLIST_CODE";
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["prodListName"]={};
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["prodListName"].dbColumnType="TEXT";
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["prodListName"].layRec="prodListName";
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["prodListName"].columnName="PRODLIST_NAME";
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["modifyTime"]={};
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["modifyTime"].dbColumnType="DATETIME";
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["modifyTime"].layRec="modifyTime";
ec_MESBasic_prodList_baseProdList_editPart_quickquery_info["modifyTime"].columnName="MODIFY_TIME";
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
 	var advRemainDialog = $('[id="MESBasic.prodList.baseProdList.editPart.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.prodList.baseProdList.editPart.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_prodList_baseProdList_editPart_adv_queryForm" exportUrl="/MESBasic/prodList/baseProdList/editPart-query.action">
							<#assign prodListCode_defaultValue  = ''>
									<#assign prodListCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_prodList_baseProdList_editPart_adv_queryForm" code="MESBasic_1_prodList_BaseProdList_prodListCode" showFormat="TEXT" defaultValue=prodListCode_defaultValue  divCode="MESBasic_1_prodList_BaseProdList_prodListCode_prodListCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_prodList_BaseProdList" layRec="prodListCode" columnname="PRODLIST_CODE" columntype="TEXT" name="prodListCode" fieldType="TEXTFIELD" tableName="S2BASE_PRODLIST"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										目录代码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_prodList_BaseProdList" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="prodListCode" id="adv_prodListCode" value="${prodListCode_defaultValue!}" deValue="${prodListCode_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign prodListName_defaultValue  = ''>
									<#assign prodListName_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_prodList_baseProdList_editPart_adv_queryForm" code="MESBasic_1_prodList_BaseProdList_prodListName" showFormat="TEXT" defaultValue=prodListName_defaultValue  divCode="MESBasic_1_prodList_BaseProdList_prodListName_prodListName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_prodList_BaseProdList" layRec="prodListName" columnname="PRODLIST_NAME" columntype="TEXT" name="prodListName" fieldType="TEXTFIELD" tableName="S2BASE_PRODLIST"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										目录名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_prodList_BaseProdList" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="prodListName" id="adv_prodListName" value="${prodListName_defaultValue!}" deValue="${prodListName_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign modifyTime_defaultValue  = ''>
									<#assign modifyTime_defaultValue  = ''>
								<#if (modifyTime_defaultValue)?? &&(modifyTime_defaultValue)?has_content>
									<#assign modifyTime_defaultValue  = getDefaultDateTime(modifyTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_MESBasic_prodList_baseProdList_editPart_adv_queryForm" code="MESBasic_1_prodList_BaseProdList_modifyTime" showFormat="YMD_HMS" defaultValue=modifyTime_defaultValue  divCode="MESBasic_1_prodList_BaseProdList_modifyTime_modifyTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_prodList_BaseProdList" layRec="modifyTime" columnname="MODIFY_TIME" columntype="DATETIME" name="modifyTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="S2BASE_PRODLIST"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										修改时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_prodList_BaseProdList" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${modifyTime_defaultValue!}" deValue="${modifyTime_defaultValue!}"  name="modifyTime_start" id="adv_modifyTime_start" exp="gequal"    formid="ec_MESBasic_prodList_baseProdList_editPart_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${modifyTime_defaultValue!}" deValue="${modifyTime_defaultValue!}"  name="modifyTime_end" id="adv_modifyTime_end" exp="lequal"    formid="ec_MESBasic_prodList_baseProdList_editPart_adv_queryForm" />
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
			viewCode: 'MESBasic_1_prodList_editPart',
			modelCode: 'MESBasic_1_prodList_BaseProdList',
			modelName: 'BaseProdList',
			formId: 'ec_MESBasic_prodList_baseProdList_editPart_queryForm',
			olddiv: 'MESBasic.prodList.baseProdList.editPart.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.prodList.baseProdList.editPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_prodList_editPart'+"&entity.code="+'MESBasic_1_prodList';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.prodList.baseProdList.editPart.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.prodList.baseProdList.editPart.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.prodList.baseProdList.editPart.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_prodList_editPart'+"&entity.code="+'MESBasic_1_prodList';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.prodList.baseProdList.editPart.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.prodList.baseProdList.editPart.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.prodList.baseProdList.editPart.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.prodList.baseProdList.editPart.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.prodList.baseProdList.editPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.prodList.baseProdList.editPart.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.prodList.baseProdList.editPart.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.prodList.baseProdList.editPart.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.prodList.baseProdList.editPart.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.prodList.baseProdList.editPart.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.prodList.baseProdList.editPart.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.prodList.baseProdList.editPart.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.prodList.baseProdList.editPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/prodList/baseProdList/editPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_prodList_baseProdList_editPart_query" renderOverEvent="ec_MESBasic_prodList_baseProdList_editPart_RenderOverEvent" pageInitMethod="ec_MESBasic_prodList_baseProdList_editPart_PageInitMethod" modelCode="MESBasic_1_prodList_BaseProdList" noPermissionKeys="prodListCode,prodListName,prodList,createTime" hidekeyPrefix="ec_MESBasic_prodList_baseProdList_editPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_prodList_baseProdList_editPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.prodList.baseProdList.editPart.dbmodifyeditPart" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.prodList.baseProdList.editPart.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}editPart_add_add_MESBasic_1_prodList_editPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion14496503774347')}||iconcls:add||useInMore:false||onclick:
				MESBasic.prodList.baseProdList.editPart.addeditPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_prodList_editPart_BUTTON_add"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}editPart_add_add_MESBasic_1_prodList_editPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion14496503774347')}||iconcls:add||useInMore:false||onclick:
				MESBasic.prodList.baseProdList.editPart.addeditPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}editPart_edit_modify_MESBasic_1_prodList_editPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion14494743368210')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.prodList.baseProdList.editPart.modifyeditPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_prodList_editPart_BUTTON_edit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}editPart_edit_modify_MESBasic_1_prodList_editPart||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion14494743368210')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.prodList.baseProdList.editPart.modifyeditPart()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}editPart_Delete_del_MESBasic_1_prodList_editPart||separateNum:0||name:${getText('MESBasic.delete.buttonPropertyshowName.radion1450079428752')}||iconcls:del||useInMore:false||onclick:
				MESBasic.prodList.baseProdList.editPart.deleditPart()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_prodList_editPart_BUTTON_Delete"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}editPart_Delete_del_MESBasic_1_prodList_editPart||separateNum:0||name:${getText('MESBasic.delete.buttonPropertyshowName.radion1450079428752')}||iconcls:del||useInMore:false||onclick:
				MESBasic.prodList.baseProdList.editPart.deleditPart()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign prodListCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODLIST_CODE"    showFormat="TEXT" defaultDisplay="${prodListCode_displayDefaultType!}"  key="prodListCode"   label="${getText('MESBasic.propertydisplayName.randon1450078833366')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign prodListName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODLIST_NAME"    showFormat="TEXT" defaultDisplay="${prodListName_displayDefaultType!}"  key="prodListName"   label="${getText('MESBasic.propertydisplayName.randon1450078913966')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign prodList_displayDefaultType  = ''>
			<@datacolumn columnName="PRODLIST_MEMO"    showFormat="TEXT" defaultDisplay="${prodList_displayDefaultType!}"  key="prodList"   label="${getText('MESBasic.propertydisplayName.randon1450078800494')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn columnName="CREATE_TIME"    showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('ec.common.createTime')}" textalign="center"  width=100   type="datetime"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("MESBasic_1_prodList_BaseProdList", "MESBasic_1_prodList_editPart", "LIST", "baseProdList")>
				<#-- 排布自定义字段 -->
				<#if customPropList?? && customPropList?has_content>
					<#list customPropList as c>
						<#assign cpWidth = 100>
						<#if c.property.type == 'DATETIME'>
							<#assign cpWidth = 130>
						</#if>
						<#if c.fieldType == 'TEXTAREA'>
							<#assign cpWidth = 200>
						</#if>
						<#assign cpOrder = true>
						<#assign cpMultable = false>
						<#if (c.property.type == 'SYSTEMCODE' && ((c.property.multable!false) || (c.property.seniorSystemCode!false))) || c.property.type == 'LONGTEXT'>
							<#assign cpOrder = false>
						</#if>
						<#if c.property.type == 'SYSTEMCODE' && (c.property.multable!false)>
							<#assign cpMultable = true>
						</#if>
						<#assign cpType = ''>
						<#if c.property.type == 'SYSTEMCODE'>
							<#if (c.property.seniorSystemCode!false)>
								<#assign cpType = 'textfield'>
							<#else>
								<#assign cpType = 'systemcode'>
							</#if>
						<#elseif c.property.type == 'TEXT' || c.property.type == 'OBJECT'>
							<#assign cpType = 'textfield'>
						<#else>
							<#assign cpType = c.property.type?lower_case>
						</#if>
						<#assign cpDecimal = ''>
						<#if c.property.type == 'DECIMAL'>
							<#assign cpDecimal = (c.property.decimalNum!0)>
							<#if c.precision??>
								<#assign cpDecimal =c.precision!>
							</#if>
						</#if>
						<#assign fsIndex = c.propertyLayRec?index_of(".")+1>
						<#assign keyname = c.propertyLayRec?substring(fsIndex)?trim>
						
						<#if c.align??>
							<#assign columnAlign = c.align >						
						<#elseif (c.property.type=='INTEGER' || c.property.type=='DECIMAL')>
							<#assign columnAlign = 'right'>
						<#elseif (c.property.type=='DATETIME') >					
							<#assign columnAlign = 'center'>
						<#else>
							<#assign columnAlign = 'left' >
						</#if>				
												
						<@datacolumn columnName=c.property.columnName width=cpWidth key=c.propertyLayRec showFormat=c.format order=cpOrder label="${getText('${c.displayName}')}" decimal="${cpDecimal}" multable=cpMultable type="${cpType}" textalign="${columnAlign}" />
					</#list>
				</#if>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_prodList_baseProdList_editPart_RenderOverEvent(){
}
function ec_MESBasic_prodList_baseProdList_editPart_PageInitMethod(){
}
	
	
	
	
	
	
</script>