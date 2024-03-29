	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1446448528424')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_batchDataHandler_batchData_dataList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" exportUrl="/MESBasic/batchDataHandler/batchData/dataList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1446448588505')}_${getText('MESBasic.viewtitle.randon1446449030478')}.xls" />
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
		<div id="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_batchDataHandler_dataList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_batchDataHandler_dataList" formId="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" dataTableId="ec_MESBasic_batchDataHandler_batchData_dataList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" isExpandAll=true formId="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" idprefix="ec_MESBasic_batchDataHandler_batchData_dataList" expandType="all"  fieldcodes="MESBasic_1_batchDataHandler_BatchData_dataTime_dataTime:MESBasic.propertydisplayName.randon1446448690014||MESBasic_1_batchDataHandler_BatchData_tag_tag:MESBasic.propertydisplayName.randon1446448741483||MESBasic_1_batchDataHandler_BatchData_processed_processed:MESBasic.propertydisplayName.randon1446448712064||MESBasic_1_batchDataHandler_BatchData_tvalue_tvalue:MESBasic.propertydisplayName.randon1555573666952" > 
							<#assign dataTime_defaultValue  = ''>
									<#assign dataTime_defaultValue  = ''>
								<#if (dataTime_defaultValue)?? &&(dataTime_defaultValue)?has_content>
									<#assign dataTime_defaultValue  = getDefaultDateTime(dataTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" code="MESBasic_1_batchDataHandler_BatchData_dataTime" showFormat="YMD_HMS" defaultValue=dataTime_defaultValue  divCode="MESBasic_1_batchDataHandler_BatchData_dataTime_dataTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="dataTime_start" id="dataTime_start" exp="gequal"   formid="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="dataTime_end" id="dataTime_end" exp="lequal"   formid="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign tag_defaultValue  = ''>
									<#assign tag_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" code="MESBasic_1_batchDataHandler_BatchData_tag" showFormat="TEXT" defaultValue=tag_defaultValue  divCode="MESBasic_1_batchDataHandler_BatchData_tag_tag" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tag" id="tag" value="${tag_defaultValue!}" deValue="${tag_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign processed_defaultValue  = ''>
									<#assign processed_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" code="MESBasic_1_batchDataHandler_BatchData_processed" showFormat="SELECT" defaultValue=processed_defaultValue  divCode="MESBasic_1_batchDataHandler_BatchData_processed_processed" isCustomize=true style="" > 
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${processed_defaultValue!}" name="processed" id="processed" exp="equal"  value=""> 
											<option value=""></option>
											<option value="1" <#if (processed_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (processed_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
							</@queryfield>
							<#assign tvalue_defaultValue  = ''>
									<#assign tvalue_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" code="MESBasic_1_batchDataHandler_BatchData_tvalue" showFormat="TEXT" defaultValue=tvalue_defaultValue  divCode="MESBasic_1_batchDataHandler_BatchData_tvalue_tvalue" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tvalue" id="tvalue" value="${tvalue_defaultValue!}" deValue="${tvalue_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" type="adv" onclick="MESBasic.batchDataHandler.batchData.dataList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.batchDataHandler.batchData.dataList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info={};
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["MainTableName"]="MESBASIC_BATCH_DATAS";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["dataTime"]={};
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["dataTime"].dbColumnType="DATETIME";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["dataTime"].layRec="dataTime";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["dataTime"].columnName="DATA_TIME";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["tag"]={};
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["tag"].dbColumnType="TEXT";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["tag"].layRec="tag";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["tag"].columnName="TAG";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["processed"]={};
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["processed"].dbColumnType="BOOLEAN";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["processed"].layRec="processed";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["processed"].columnName="PROCESSED";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["tvalue"]={};
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["tvalue"].dbColumnType="TEXT";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["tvalue"].layRec="tvalue";
ec_MESBasic_batchDataHandler_batchData_dataList_quickquery_info["tvalue"].columnName="TVALUE";
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
 	var advRemainDialog = $('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.batchDataHandler.batchData.dataList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_batchDataHandler_batchData_dataList_adv_queryForm" exportUrl="/MESBasic/batchDataHandler/batchData/dataList-query.action">
							<#assign tag_defaultValue  = ''>
									<#assign tag_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_batchDataHandler_batchData_dataList_adv_queryForm" code="MESBasic_1_batchDataHandler_BatchData_tag" showFormat="TEXT" defaultValue=tag_defaultValue  divCode="MESBasic_1_batchDataHandler_BatchData_tag_tag" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_batchDataHandler_BatchData" layRec="tag" columnname="TAG" columntype="TEXT" name="tag" fieldType="TEXTFIELD" tableName="MESBASIC_BATCH_DATAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										位号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_batchDataHandler_BatchData" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tag" id="adv_tag" value="${tag_defaultValue!}" deValue="${tag_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign dataTime_defaultValue  = ''>
									<#assign dataTime_defaultValue  = ''>
								<#if (dataTime_defaultValue)?? &&(dataTime_defaultValue)?has_content>
									<#assign dataTime_defaultValue  = getDefaultDateTime(dataTime_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_MESBasic_batchDataHandler_batchData_dataList_adv_queryForm" code="MESBasic_1_batchDataHandler_BatchData_dataTime" showFormat="YMD_HMS" defaultValue=dataTime_defaultValue  divCode="MESBasic_1_batchDataHandler_BatchData_dataTime_dataTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_batchDataHandler_BatchData" layRec="dataTime" columnname="DATA_TIME" columntype="DATETIME" name="dataTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="MESBASIC_BATCH_DATAS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										数据时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_batchDataHandler_BatchData" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${dataTime_defaultValue!}" deValue="${dataTime_defaultValue!}"  name="dataTime_start" id="adv_dataTime_start" exp="gequal"    formid="ec_MESBasic_batchDataHandler_batchData_dataList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${dataTime_defaultValue!}" deValue="${dataTime_defaultValue!}"  name="dataTime_end" id="adv_dataTime_end" exp="lequal"    formid="ec_MESBasic_batchDataHandler_batchData_dataList_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign content_defaultValue  = ''>
									<#assign content_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_batchDataHandler_batchData_dataList_adv_queryForm" code="MESBasic_1_batchDataHandler_BatchData_content" showFormat="TEXT" defaultValue=content_defaultValue  divCode="MESBasic_1_batchDataHandler_BatchData_content_content" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_batchDataHandler_BatchData" layRec="content" columnname="CONTENT" columntype="TEXT" name="content" fieldType="TEXTFIELD" tableName="MESBASIC_BATCH_DATAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										业务数据
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_batchDataHandler_BatchData" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="content" id="adv_content" value="${content_defaultValue!}" deValue="${content_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign processed_defaultValue  = ''>
									<#assign processed_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_batchDataHandler_batchData_dataList_adv_queryForm" code="MESBasic_1_batchDataHandler_BatchData_processed" showFormat="SELECT" defaultValue=processed_defaultValue  divCode="MESBasic_1_batchDataHandler_BatchData_processed_processed" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_batchDataHandler_BatchData" layRec="processed" columnname="PROCESSED" columntype="BOOLEAN" name="processed" fieldType="SELECT" tableName="MESBASIC_BATCH_DATAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										处理标记
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_batchDataHandler_BatchData" />
										<select class="edit-select"  style="width:100%;height:18px;" deValue="${processed_defaultValue!}" name="processed" id="adv_processed" exp="equal"   value=""> 
											<option value=""></option>
											<option value="1" <#if (processed_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="0" <#if (processed_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
										</select>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign tvalue_defaultValue  = ''>
									<#assign tvalue_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_batchDataHandler_batchData_dataList_adv_queryForm" code="MESBasic_1_batchDataHandler_BatchData_tvalue" showFormat="TEXT" defaultValue=tvalue_defaultValue  divCode="MESBasic_1_batchDataHandler_BatchData_tvalue_tvalue" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_batchDataHandler_BatchData" layRec="tvalue" columnname="TVALUE" columntype="TEXT" name="tvalue" fieldType="TEXTFIELD" tableName="MESBASIC_BATCH_DATAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										位号值
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_batchDataHandler_BatchData" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tvalue" id="adv_tvalue" value="${tvalue_defaultValue!}" deValue="${tvalue_defaultValue!}"   exp="like" />
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
			viewCode: 'MESBasic_1_batchDataHandler_dataList',
			modelCode: 'MESBasic_1_batchDataHandler_BatchData',
			modelName: 'BatchData',
			formId: 'ec_MESBasic_batchDataHandler_batchData_dataList_queryForm',
			olddiv: 'MESBasic.batchDataHandler.batchData.dataList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.batchDataHandler.batchData.dataList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_batchDataHandler_dataList'+"&entity.code="+'MESBasic_1_batchDataHandler';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.batchDataHandler.batchData.dataList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.batchDataHandler.batchData.dataList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.batchDataHandler.batchData.dataList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_batchDataHandler_dataList'+"&entity.code="+'MESBasic_1_batchDataHandler';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.batchDataHandler.batchData.dataList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.batchDataHandler.batchData.dataList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.batchDataHandler.batchData.dataList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.batchDataHandler.batchData.dataList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/batchDataHandler/batchData/dataList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_batchDataHandler_batchData_dataList_query" renderOverEvent="ec_MESBasic_batchDataHandler_batchData_dataList_RenderOverEvent" pageInitMethod="ec_MESBasic_batchDataHandler_batchData_dataList_PageInitMethod" modelCode="MESBasic_1_batchDataHandler_BatchData" noPermissionKeys="processed,tag,tvalue,purchaseCode,content,businessType,dataTime" hidekeyPrefix="ec_MESBasic_batchDataHandler_batchData_dataList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_batchDataHandler_batchData_dataList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.batchDataHandler.batchData.dataList.dbmodifydataList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','businessType.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.batchDataHandler.batchData.dataList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataNew_add_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1420873765612')}||iconcls:add||useInMore:false||onclick:
				MESBasic.batchDataHandler.batchData.dataList.adddataList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_batchDataHandler_dataList_BUTTON_dataNew"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataNew_add_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1420873765612')}||iconcls:add||useInMore:false||onclick:
				MESBasic.batchDataHandler.batchData.dataList.adddataList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataModify_modify_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.batchDataHandler.batchData.dataList.modifydataList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_batchDataHandler_dataList_BUTTON_dataModify"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataModify_modify_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423705335643')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.batchDataHandler.batchData.dataList.modifydataList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataDelete_del_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1429941371091')}||iconcls:del||useInMore:false||onclick:
				MESBasic.batchDataHandler.batchData.dataList.deldataList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_batchDataHandler_dataList_BUTTON_dataDelete"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataDelete_del_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1429941371091')}||iconcls:del||useInMore:false||onclick:
				MESBasic.batchDataHandler.batchData.dataList.deldataList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_runNext_modify_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1432018349287')}||iconcls:modify||useInMore:false||onclick:
					runNext()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="MESBasic_1_batchDataHandler_dataList_BUTTON_runNext"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_runNext_modify_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1432018349287')}||iconcls:modify||useInMore:false||onclick:
					runNext()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_runIndex_modify_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1432023857672')}||iconcls:modify||useInMore:false||onclick:
					runIndex()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="MESBasic_1_batchDataHandler_dataList_BUTTON_runIndex"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_runIndex_modify_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1432023857672')}||iconcls:modify||useInMore:false||onclick:
					runIndex()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_initData_del_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1432825490130')}||iconcls:del||useInMore:false||onclick:
					initData()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="MESBasic_1_batchDataHandler_dataList_BUTTON_initData"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_initData_del_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1432825490130')}||iconcls:del||useInMore:false||onclick:
					initData()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_runAll_modify_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1432825617241')}||iconcls:modify||useInMore:false||onclick:
					runAllData()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="MESBasic_1_batchDataHandler_dataList_BUTTON_runAll"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_runAll_modify_MESBasic_1_batchDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1432825617241')}||iconcls:modify||useInMore:false||onclick:
					runAllData()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign processed_displayDefaultType  = ''>
			<@datacolumn columnName="PROCESSED"    showFormat="SELECT" defaultDisplay="${processed_displayDefaultType!}"  key="processed"   label="${getText('MESBasic.propertydisplayName.randon1446448712064')}" textalign="center"  width=80   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign tag_displayDefaultType  = ''>
			<@datacolumn columnName="TAG"    showFormat="TEXT" defaultDisplay="${tag_displayDefaultType!}"  key="tag"   label="${getText('MESBasic.propertydisplayName.randon1446448741483')}" textalign="left"  width=160   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign tvalue_displayDefaultType  = ''>
			<@datacolumn columnName="TVALUE"    showFormat="TEXT" defaultDisplay="${tvalue_displayDefaultType!}"  key="tvalue"   label="${getText('MESBasic.propertydisplayName.randon1555573666952')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign purchaseCode_displayDefaultType  = ''>
			<@datacolumn columnName="PURCHASE_CODE"    showFormat="TEXT" defaultDisplay="${purchaseCode_displayDefaultType!}"  key="purchaseCode"   label="${getText('MESBasic.propertydisplayName.randon1555665070092')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign content_displayDefaultType  = ''>
			<@datacolumn columnName="CONTENT"    showFormat="TEXT" defaultDisplay="${content_displayDefaultType!}"  key="content"   label="${getText('MESBasic.propertydisplayName.randon1446448676587')}" textalign="left"  width=120   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign businessType_displayDefaultType  = ''>
			<@datacolumn columnName="BUSINESS_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${businessType_displayDefaultType!}"  key="businessType.value"   label="${getText('MESBasic.propertydisplayName.randon1446448645696')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign dataTime_displayDefaultType  = ''>
			<@datacolumn columnName="DATA_TIME"    showFormat="YMD_HMS" defaultDisplay="${dataTime_displayDefaultType!}"  key="dataTime"   label="${getText('MESBasic.propertydisplayName.randon1446448690014')}" textalign="center"  width=140   type="datetime"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_batchDataHandler_batchData_dataList_RenderOverEvent(){
}
function ec_MESBasic_batchDataHandler_batchData_dataList_PageInitMethod(){
}
	
	
	
	
	
	
	
</script>