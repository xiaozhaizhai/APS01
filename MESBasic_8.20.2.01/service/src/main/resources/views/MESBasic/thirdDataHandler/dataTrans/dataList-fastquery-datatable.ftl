	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1414977751020')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" exportUrl="/MESBasic/thirdDataHandler/dataTrans/dataList-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1414977890489')}_${getText('MESBasic.viewtitle.radion1414981200840')}.xls" />
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
		<div id="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('MESBasic_1_thirdDataHandler_dataList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="MESBasic_1_thirdDataHandler_dataList" formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" dataTableId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" isExpandAll=true formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" idprefix="ec_MESBasic_thirdDataHandler_dataTrans_dataList" expandType="all"  fieldcodes="MESBasic_1_thirdDataHandler_DataTrans_tag_tag:MESBasic.propertydisplayName.radion1414979937365||MESBasic_1_thirdDataHandler_DataTrans_dataTime_dataTime:MESBasic.propertydisplayName.radion1414978911978||MESBasic_1_thirdDataHandler_DataTrans_content_content:MESBasic.propertydisplayName.radion1414980110091||MESBasic_1_thirdDataHandler_DataTrans_tvalue_tvalue:MESBasic.propertydisplayName.randon1555573356578" > 
							<#assign tag_defaultValue  = ''>
									<#assign tag_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" code="MESBasic_1_thirdDataHandler_DataTrans_tag" showFormat="TEXT" defaultValue=tag_defaultValue  divCode="MESBasic_1_thirdDataHandler_DataTrans_tag_tag" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tag" id="tag" value="${tag_defaultValue!}" deValue="${tag_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign dataTime_defaultValue  = ''>
									<#assign dataTime_defaultValue  = ''>
								<#if (dataTime_defaultValue)?? &&(dataTime_defaultValue)?has_content>
									<#assign dataTime_defaultValue  = getDefaultDateTime(dataTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" code="MESBasic_1_thirdDataHandler_DataTrans_dataTime" showFormat="YMD_HMS" defaultValue=dataTime_defaultValue  divCode="MESBasic_1_thirdDataHandler_DataTrans_dataTime_dataTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="dataTime_start" id="dataTime_start" exp="gequal"   formid="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="dataTime_end" id="dataTime_end" exp="lequal"   formid="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign content_defaultValue  = ''>
									<#assign content_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" code="MESBasic_1_thirdDataHandler_DataTrans_content" showFormat="TEXT" defaultValue=content_defaultValue  divCode="MESBasic_1_thirdDataHandler_DataTrans_content_content" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="content" id="content" value="${content_defaultValue!}" deValue="${content_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign tvalue_defaultValue  = ''>
									<#assign tvalue_defaultValue  = ''>
							<@queryfield formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" code="MESBasic_1_thirdDataHandler_DataTrans_tvalue" showFormat="TEXT" defaultValue=tvalue_defaultValue  divCode="MESBasic_1_thirdDataHandler_DataTrans_tvalue_tvalue" isCustomize=true style="" > 
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="tvalue_start" id="tvalue_start" value="${tvalue_defaultValue!}" deValue="${tvalue_defaultValue!}"   exp="equal"/>
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" showformat="TEXT" class="cui-noborder-input" style="*padding-right:0px;" name="tvalue_end" id="tvalue_end" value="${tvalue_defaultValue!}" deValue="${tvalue_defaultValue!}"   exp="equal"/>
									  		</div></div>
									  		</div>
								  		</div>								  		
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" type="adv" onclick="MESBasic.thirdDataHandler.dataTrans.dataList.commonQuery('query')" onadvancedclick="advQuery('MESBasic.thirdDataHandler.dataTrans.dataList.advquery')" /> 
						 		<@querybutton formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info={};
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["MainTableName"]="MESBASIC_DATA_TRANS";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["tag"]={};
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["tag"].dbColumnType="TEXT";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["tag"].layRec="tag";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["tag"].columnName="TAG";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["dataTime"]={};
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["dataTime"].dbColumnType="DATETIME";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["dataTime"].layRec="dataTime";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["dataTime"].columnName="DATA_TIME";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["content"]={};
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["content"].dbColumnType="TEXT";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["content"].layRec="content";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["content"].columnName="CONTENT";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["tvalue"]={};
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["tvalue"].dbColumnType="DECIMAL";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["tvalue"].layRec="tvalue";
ec_MESBasic_thirdDataHandler_dataTrans_dataList_quickquery_info["tvalue"].columnName="TVALUE";
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
 	var advRemainDialog = $('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_MESBasic_thirdDataHandler_dataTrans_dataList_adv_queryForm" exportUrl="/MESBasic/thirdDataHandler/dataTrans/dataList-query.action">
							<#assign tag_defaultValue  = ''>
									<#assign tag_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_adv_queryForm" code="MESBasic_1_thirdDataHandler_DataTrans_tag" showFormat="TEXT" defaultValue=tag_defaultValue  divCode="MESBasic_1_thirdDataHandler_DataTrans_tag_tag" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_thirdDataHandler_DataTrans" layRec="tag" columnname="TAG" columntype="TEXT" name="tag" fieldType="TEXTFIELD" tableName="MESBASIC_DATA_TRANS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										位号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_thirdDataHandler_DataTrans" />
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
								<@advsqueryfield formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_adv_queryForm" code="MESBasic_1_thirdDataHandler_DataTrans_dataTime" showFormat="YMD_HMS" defaultValue=dataTime_defaultValue  divCode="MESBasic_1_thirdDataHandler_DataTrans_dataTime_dataTime" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_thirdDataHandler_DataTrans" layRec="dataTime" columnname="DATA_TIME" columntype="DATETIME" name="dataTime" fieldType="DATETIME" showFormat="YMD_HMS" tableName="MESBASIC_DATA_TRANS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										数据时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_thirdDataHandler_DataTrans" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${dataTime_defaultValue!}" deValue="${dataTime_defaultValue!}"  name="dataTime_start" id="adv_dataTime_start" exp="gequal"    formid="ec_MESBasic_thirdDataHandler_dataTrans_dataList_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" value="${dataTime_defaultValue!}" deValue="${dataTime_defaultValue!}"  name="dataTime_end" id="adv_dataTime_end" exp="lequal"    formid="ec_MESBasic_thirdDataHandler_dataTrans_dataList_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign content_defaultValue  = ''>
									<#assign content_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_adv_queryForm" code="MESBasic_1_thirdDataHandler_DataTrans_content" showFormat="TEXT" defaultValue=content_defaultValue  divCode="MESBasic_1_thirdDataHandler_DataTrans_content_content" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_thirdDataHandler_DataTrans" layRec="content" columnname="CONTENT" columntype="TEXT" name="content" fieldType="TEXTFIELD" tableName="MESBASIC_DATA_TRANS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										业务数据
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_thirdDataHandler_DataTrans" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="content" id="adv_content" value="${content_defaultValue!}" deValue="${content_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign processed_defaultValue  = ''>
									<#assign processed_defaultValue  = ''>
								<@advsqueryfield formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_adv_queryForm" code="MESBasic_1_thirdDataHandler_DataTrans_processed" showFormat="SELECT" defaultValue=processed_defaultValue  divCode="MESBasic_1_thirdDataHandler_DataTrans_processed_processed" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_thirdDataHandler_DataTrans" layRec="processed" columnname="PROCESSED" columntype="BOOLEAN" name="processed" fieldType="SELECT" tableName="MESBASIC_DATA_TRANS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										处理标记
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_thirdDataHandler_DataTrans" />
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
								<@advsqueryfield formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_adv_queryForm" code="MESBasic_1_thirdDataHandler_DataTrans_tvalue" showFormat="TEXT" defaultValue=tvalue_defaultValue  divCode="MESBasic_1_thirdDataHandler_DataTrans_tvalue_tvalue" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_thirdDataHandler_DataTrans" layRec="tvalue" columnname="TVALUE" columntype="DECIMAL" name="tvalue" fieldType="TEXTFIELD" tableName="MESBASIC_DATA_TRANS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										位号值
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_thirdDataHandler_DataTrans" />
										<div>
									  	 	<div style="float:left;width:45%">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="tvalue_start" id="adv_tvalue_start" value="${tvalue_defaultValue!}" deValue="${tvalue_defaultValue!}"   exp="equal"   />
											</div></div>
											</div>
											<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
											<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									  	 	<div class="fix-input"><div class="fix-search-click clearfix">
											<input type="text" class="cui-noborder-input" style="*padding-right:0px;" name="tvalue_end" id="adv_tvalue_end" value="${tvalue_defaultValue!}" deValue="${tvalue_defaultValue!}"   exp="equal"  />
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
			viewCode: 'MESBasic_1_thirdDataHandler_dataList',
			modelCode: 'MESBasic_1_thirdDataHandler_DataTrans',
			modelName: 'DataTrans',
			formId: 'ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm',
			olddiv: 'MESBasic.thirdDataHandler.dataTrans.dataList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='MESBasic.thirdDataHandler.dataTrans.dataList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_thirdDataHandler_dataList'+"&entity.code="+'MESBasic_1_thirdDataHandler';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='MESBasic.thirdDataHandler.dataTrans.dataList.advquery'] #customquContent").html(html);
		 	$("[id='MESBasic.thirdDataHandler.dataTrans.dataList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='MESBasic.thirdDataHandler.dataTrans.dataList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'MESBasic_1_thirdDataHandler_dataList'+"&entity.code="+'MESBasic_1_thirdDataHandler';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='MESBasic.thirdDataHandler.dataTrans.dataList.advquery'] #customquContent").html(html);
			 $("[id='MESBasic.thirdDataHandler.dataTrans.dataList.advquery'] #advQueryLoading").hide();
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
		$('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] div.customqu-content').css('display','none');
		$('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] div.move-grade').css('display','none');
		// $('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] div.customqu-content').css('display','block');
		$('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] div.move-grade').css('display','block');
		// $('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="MESBasic.thirdDataHandler.dataTrans.dataList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "MESBasic.thirdDataHandler.dataTrans.dataList.query('query')">
<#assign datatable_dataUrl = "/MESBasic/thirdDataHandler/dataTrans/dataList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_MESBasic_thirdDataHandler_dataTrans_dataList_query" renderOverEvent="ec_MESBasic_thirdDataHandler_dataTrans_dataList_RenderOverEvent" pageInitMethod="ec_MESBasic_thirdDataHandler_dataTrans_dataList_PageInitMethod" modelCode="MESBasic_1_thirdDataHandler_DataTrans" noPermissionKeys="processed,tag,tvalue,content,businessType,dataTime" hidekeyPrefix="ec_MESBasic_thirdDataHandler_dataTrans_dataList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_thirdDataHandler_dataTrans_dataList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="MESBasic.thirdDataHandler.dataTrans.dataList.dbmodifydataList" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','businessType.id']" postData="&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="MESBasic.thirdDataHandler.dataTrans.dataList.showErrorMsg"   >
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataNew_add_MESBasic_1_thirdDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423730541699')}||iconcls:add||useInMore:false||onclick:
				MESBasic.thirdDataHandler.dataTrans.dataList.adddataList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_thirdDataHandler_dataList_BUTTON_dataNew"
		buttonType="ADD" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataNew_add_MESBasic_1_thirdDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423730541699')}||iconcls:add||useInMore:false||onclick:
				MESBasic.thirdDataHandler.dataTrans.dataList.adddataList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataEdit_modify_MESBasic_1_thirdDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423817453627')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.thirdDataHandler.dataTrans.dataList.modifydataList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_thirdDataHandler_dataList_BUTTON_dataEdit"
		buttonType="MODIFY" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataEdit_modify_MESBasic_1_thirdDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1423817453627')}||iconcls:modify||useInMore:false||onclick:
				MESBasic.thirdDataHandler.dataTrans.dataList.modifydataList()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataDel_del_MESBasic_1_thirdDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1414981388059')}||iconcls:del||useInMore:false||onclick:
				MESBasic.thirdDataHandler.dataTrans.dataList.deldataList()
		" 
		resultType="json" 
		buttonCode="MESBasic_1_thirdDataHandler_dataList_BUTTON_dataDel"
		buttonType="DELETE" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}dataList_dataDel_del_MESBasic_1_thirdDataHandler_dataList||separateNum:0||name:${getText('MESBasic.buttonPropertyshowName.radion1414981388059')}||iconcls:del||useInMore:false||onclick:
				MESBasic.thirdDataHandler.dataTrans.dataList.deldataList()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign processed_displayDefaultType  = ''>
			<@datacolumn columnName="PROCESSED"    showFormat="CHECKBOX" defaultDisplay="${processed_displayDefaultType!}"  key="processed"   label="${getText('MESBasic.propertydisplayName.radion1414980054820')}" textalign="center"  width=80   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign tag_displayDefaultType  = ''>
			<@datacolumn columnName="TAG"    showFormat="TEXT" defaultDisplay="${tag_displayDefaultType!}"  key="tag"   label="${getText('MESBasic.propertydisplayName.radion1414979937365')}" textalign="left"  width=160   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign tvalue_displayDefaultType  = ''>
			<@datacolumn columnName="TVALUE"    showFormat="TEXT" defaultDisplay="${tvalue_displayDefaultType!}"  key="tvalue"   label="${getText('MESBasic.propertydisplayName.randon1555573356578')}" textalign="right" decimal="4" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign content_displayDefaultType  = ''>
			<@datacolumn columnName="CONTENT"    showFormat="TEXT" defaultDisplay="${content_displayDefaultType!}"  key="content"   label="${getText('MESBasic.propertydisplayName.radion1414980110091')}" textalign="left"  width=140   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign businessType_displayDefaultType  = ''>
			<@datacolumn columnName="BUSINESS_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${businessType_displayDefaultType!}"  key="businessType.value"   label="${getText('MESBasic.propertydisplayName.radion1414980623415')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign dataTime_displayDefaultType  = ''>
			<@datacolumn columnName="DATA_TIME"    showFormat="YMD_HMS" defaultDisplay="${dataTime_displayDefaultType!}"  key="dataTime"   label="${getText('MESBasic.propertydisplayName.radion1414978911978')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_thirdDataHandler_dataTrans_dataList_RenderOverEvent(){
}
function ec_MESBasic_thirdDataHandler_dataTrans_dataList_PageInitMethod(){
}
	
	
	
	
	
	
</script>