	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415340239152')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" exportUrl="/MESBasic/itemRecord/itemRecord/itemRecordList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415340308405')}_${getText('MESBasic.viewtitle.radion1415340847977')}.xls" />
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
		<div id="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_itemRecord_itemRecordList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_itemRecord_itemRecordList" formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" dataTableId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" isExpandAll=true formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" idprefix="ec_MESBasic_itemRecord_itemRecord_itemRecordList" expandType="all"  fieldcodes="MESBasic_1_itemRecord_ItemRecord_planNo_planNo:MESBasic.propertydisplayName.radion1415340562803||MESBasic_1_itemRecord_ItemRecord_reaultValue_reaultValue:MESBasic.propertydisplayName.radion1415340607673||MESBasic_1_itemManage_ItemSetup_code_itemNumber_code:MESBasic.propertydisplayName.radion1415261315358||MESBasic_1_itemRecord_ItemRecord_recordTime_recordTime:MESBasic.propertydisplayName.radion1415340663783" > 
							<#assign planNo_defaultValue  = ''>
									<#assign planNo_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" code="MESBasic_1_itemRecord_ItemRecord_planNo" showFormat="TEXT" defaultValue=planNo_defaultValue  divCode="MESBasic_1_itemRecord_ItemRecord_planNo_planNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="planNo" id="planNo" value="${planNo_defaultValue!}" deValue="${planNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign reaultValue_defaultValue  = ''>
									<#assign reaultValue_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" code="MESBasic_1_itemRecord_ItemRecord_reaultValue" showFormat="SELECT" defaultValue=reaultValue_defaultValue  divCode="MESBasic_1_itemRecord_ItemRecord_reaultValue_reaultValue" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${reaultValue_defaultValue!}" name="reaultValue" id="reaultValue" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (reaultValue_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (reaultValue_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign itemNumber_code_defaultValue  = ''>
									<#assign itemNumber_code_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" code="MESBasic_1_itemManage_ItemSetup_code" showFormat="SELECTCOMP" defaultValue=itemNumber_code_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_code_itemNumber_code" isCustomize=true style="" > 
										<input type="hidden" id="itemNumber.id" name="itemNumber.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${itemNumber_code_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1415323143732')}"  conditionfunc="MESBasic.itemRecord.itemRecord.itemRecordList._querycustomFunc('itemNumber_code')" name="itemNumber.code" id="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm_itemNumber_code" displayFieldName="code" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/itemManage/itemSetup/itemRef.action"   refViewCode="MESBasic_1_itemManage_itemRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" searchClick="MESBasic.itemRecord.itemRecord.itemRecordList.commonQuery('query')"   />
							</@queryfield>
							<#assign recordTime_defaultValue  = ''>
									<#assign recordTime_defaultValue  = ''>
								<#if (recordTime_defaultValue)?? &&(recordTime_defaultValue)?has_content>
									<#assign recordTime_defaultValue  = getDefaultDateTime(recordTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" code="MESBasic_1_itemRecord_ItemRecord_recordTime" showFormat="YMD_HMS" defaultValue=recordTime_defaultValue  divCode="MESBasic_1_itemRecord_ItemRecord_recordTime_recordTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="recordTime_start" id="recordTime_start" exp="gequal"   formid="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="recordTime_end" id="recordTime_end" exp="lequal"   formid="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" type="adv" onclick="MESBasic.itemRecord.itemRecord.itemRecordList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.itemRecord.itemRecord.itemRecordList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info={};
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["MainTableName"]="Pellet_ItemRecord";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["planNo"]={};
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["planNo"].dbColumnType="TEXT";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["planNo"].layRec="planNo";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["planNo"].columnName="IR_PLANNO";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["reaultValue"]={};
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["reaultValue"].dbColumnType="BOOLEAN";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["reaultValue"].layRec="reaultValue";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["reaultValue"].columnName="IR_RESULTVALUE";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["itemNumber.code"]={};
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["itemNumber.code"].dbColumnType="TEXT";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["itemNumber.code"].layRec="PELLET_ITEMSETUP,ID,Pellet_ItemRecord,IR_ITEMNUMBER-code";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["itemNumber.code"].columnName="CODE";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["recordTime"]={};
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["recordTime"].dbColumnType="DATETIME";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["recordTime"].layRec="recordTime";
ec_MESBasic_itemRecord_itemRecord_itemRecordList_quickquery_info["recordTime"].columnName="IR_RECORDTIME";
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
 	var advRemainDialog = $('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_itemRecord_itemRecord_itemRecordList_adv_queryForm" exportUrl="/MESBasic/itemRecord/itemRecord/itemRecordList-query.action">
							<#assign planNo_defaultValue  = ''>
									<#assign planNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_adv_queryForm" code="MESBasic_1_itemRecord_ItemRecord_planNo" showFormat="TEXT" defaultValue=planNo_defaultValue  divCode="MESBasic_1_itemRecord_ItemRecord_planNo_planNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemRecord_ItemRecord" layRec="planNo" columnname="IR_PLANNO" columntype="TEXT" name="planNo" fieldType="TEXTFIELD" tableName="Pellet_ItemRecord"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										计划编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemRecord_ItemRecord" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="planNo" id="adv_planNo" value="${planNo_defaultValue!}" deValue="${planNo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign reaultValue_defaultValue  = ''>
									<#assign reaultValue_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_adv_queryForm" code="MESBasic_1_itemRecord_ItemRecord_reaultValue" showFormat="SELECT" defaultValue=reaultValue_defaultValue  divCode="MESBasic_1_itemRecord_ItemRecord_reaultValue_reaultValue" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemRecord_ItemRecord" layRec="reaultValue" columnname="IR_RESULTVALUE" columntype="BOOLEAN" name="reaultValue" fieldType="SELECT" tableName="Pellet_ItemRecord"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										质检结果
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemRecord_ItemRecord" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${reaultValue_defaultValue!}" name="reaultValue" id="adv_reaultValue" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (reaultValue_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (reaultValue_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign itemNumber_code_defaultValue  = ''>
									<#assign itemNumber_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_adv_queryForm" code="MESBasic_1_itemManage_ItemSetup_code" showFormat="SELECTCOMP" defaultValue=itemNumber_code_defaultValue  divCode="MESBasic_1_itemManage_ItemSetup_code_itemNumber_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemManage_ItemSetup" layRec="PELLET_ITEMSETUP,ID,Pellet_ItemRecord,IR_ITEMNUMBER-code" columnname="CODE" columntype="TEXT" name="itemNumber.code" fieldType="SELECTCOMP" tableName="PELLET_ITEMSETUP"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										测点编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemManage_ItemSetup" />
										<input type="hidden" id="adv_itemNumber.id" name="itemNumber.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_itemNumber.id"  isPrecise=true deValue="${itemNumber_code_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1415323143732')}"  conditionfunc="MESBasic.itemRecord.itemRecord.itemRecordList._querycustomFunc('itemNumber_code')" name="itemNumber.code" id="adv_ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm_itemNumber_code" displayFieldName="code" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/itemManage/itemSetup/itemRef.action"   refViewCode="MESBasic_1_itemManage_itemRef"  clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign recordTime_defaultValue  = ''>
									<#assign recordTime_defaultValue  = ''>
								<#if (recordTime_defaultValue)?? &&(recordTime_defaultValue)?has_content>
									<#assign recordTime_defaultValue  = getDefaultDateTime(recordTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_adv_queryForm" code="MESBasic_1_itemRecord_ItemRecord_recordTime" showFormat="YMD_HMS" defaultValue=recordTime_defaultValue  divCode="MESBasic_1_itemRecord_ItemRecord_recordTime_recordTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_itemRecord_ItemRecord" layRec="recordTime" columnname="IR_RECORDTIME" columntype="DATETIME" name="recordTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="Pellet_ItemRecord"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										记录时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_itemRecord_ItemRecord" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${recordTime_defaultValue!}" deValue="${recordTime_defaultValue!}"  name="recordTime_start" id="adv_recordTime_start" exp="gequal"    formid="ec_MESBasic_itemRecord_itemRecord_itemRecordList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${recordTime_defaultValue!}" deValue="${recordTime_defaultValue!}"  name="recordTime_end" id="adv_recordTime_end" exp="lequal"    formid="ec_MESBasic_itemRecord_itemRecord_itemRecordList_adv_queryForm" />
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
			viewCode: 'MESBasic_1_itemRecord_itemRecordList',
			modelCode: 'MESBasic_1_itemRecord_ItemRecord',
			modelName: 'ItemRecord',
			formId: 'ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm',
			olddiv: 'MESBasic.itemRecord.itemRecord.itemRecordList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.itemRecord.itemRecord.itemRecordList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_itemRecord_itemRecordList'+"&entity.code="+'MESBasic_1_itemRecord';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.itemRecord.itemRecord.itemRecordList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.itemRecord.itemRecord.itemRecordList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.itemRecord.itemRecord.itemRecordList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_itemRecord_itemRecordList'+"&entity.code="+'MESBasic_1_itemRecord';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.itemRecord.itemRecord.itemRecordList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.itemRecord.itemRecord.itemRecordList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.itemRecord.itemRecord.itemRecordList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.itemRecord.itemRecord.itemRecordList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/itemRecord/itemRecord/itemRecordList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_itemRecord_itemRecord_itemRecordList_query" renderOverEvent="ec_MESBasic_itemRecord_itemRecord_itemRecordList_RenderOverEvent" pageInitMethod="ec_MESBasic_itemRecord_itemRecord_itemRecordList_PageInitMethod" modelCode="MESBasic_1_itemRecord_ItemRecord" noPermissionKeys="itemNumber.code,recordTime,averageValue,maxValue,minValue,balanceValue,count,totalValue,realValue,planNo,reaultValue" hidekeyPrefix="ec_MESBasic_itemRecord_itemRecord_itemRecordList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_itemRecord_itemRecord_itemRecordList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.itemRecord.itemRecord.itemRecordList.dbClickViewitemRecordList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','itemNumber.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.itemRecord.itemRecord.itemRecordList.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign itemNumber_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${itemNumber_code_displayDefaultType!}"  key="itemNumber.code"   label="${getText('MESBasic.propertydisplayName.radion1415261315358')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign recordTime_displayDefaultType  = ''>
			<@datacolumn columnName="IR_RECORDTIME"    showFormat="YMD_HMS" defaultDisplay="${recordTime_displayDefaultType!}"  key="recordTime"   label="${getText('MESBasic.propertydisplayName.radion1415340663783')}" textalign="center"  width=100   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign averageValue_displayDefaultType  = ''>
			<@datacolumn columnName="IR_AVERAGEVALUE"    showFormat="TEXT" defaultDisplay="${averageValue_displayDefaultType!}"  key="averageValue"   label="${getText('MESBasic.propertydisplayName.radion1415340352536')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign maxValue_displayDefaultType  = ''>
			<@datacolumn columnName="IR_MAXVALUE"    showFormat="TEXT" defaultDisplay="${maxValue_displayDefaultType!}"  key="maxValue"   label="${getText('MESBasic.propertydisplayName.radion1415340515757')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign minValue_displayDefaultType  = ''>
			<@datacolumn columnName="IR_MINVALUE"    showFormat="TEXT" defaultDisplay="${minValue_displayDefaultType!}"  key="minValue"   label="${getText('MESBasic.propertydisplayName.radion1415340539418')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign balanceValue_displayDefaultType  = ''>
			<@datacolumn columnName="IR_TOTALVALUE_BALANCE"    showFormat="TEXT" defaultDisplay="${balanceValue_displayDefaultType!}"  key="balanceValue"   label="${getText('MESBasic.propertydisplayName.radion1415340378186')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign count_displayDefaultType  = ''>
			<@datacolumn columnName="IR_COUNT"    showFormat="TEXT" defaultDisplay="${count_displayDefaultType!}"  key="count"   label="${getText('MESBasic.propertydisplayName.radion1415340400455')}" textalign="right"  width=100   type="integer"    showFormatFunc="" cssstyle="" />
			<#assign totalValue_displayDefaultType  = ''>
			<@datacolumn columnName="IR_TOTALVALUE"    showFormat="TEXT" defaultDisplay="${totalValue_displayDefaultType!}"  key="totalValue"   label="${getText('MESBasic.propertydisplayName.radion1415340718971')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign realValue_displayDefaultType  = ''>
			<@datacolumn columnName="IR_REALVALUE"    showFormat="TEXT" defaultDisplay="${realValue_displayDefaultType!}"  key="realValue"   label="${getText('MESBasic.propertydisplayName.radion1415340583078')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign planNo_displayDefaultType  = ''>
			<@datacolumn columnName="IR_PLANNO"    showFormat="TEXT" defaultDisplay="${planNo_displayDefaultType!}"  key="planNo"   label="${getText('MESBasic.propertydisplayName.radion1415340562803')}" textalign="center"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign reaultValue_displayDefaultType  = ''>
			<@datacolumn columnName="IR_RESULTVALUE"    showFormat="CHECKBOX" defaultDisplay="${reaultValue_displayDefaultType!}"  key="reaultValue"   label="${getText('MESBasic.propertydisplayName.radion1415340607673')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_itemRecord_itemRecord_itemRecordList_RenderOverEvent(){
}
function ec_MESBasic_itemRecord_itemRecord_itemRecordList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
</script>