	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_produceTask_generalManageView_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_produceTask_generalManageView_queryForm" exportUrl="/WOM/produceTask/produceTask/generalManageView-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489657901718')}_${getText('WOM.viewtitle.randon1502676061843')}.xls" />
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
		<div id="ec_WOM_produceTask_produceTask_generalManageView_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_produceTask_produceTask_generalManageView_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_produceTask_generalManageView')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_produceTask_generalManageView" formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" dataTableId="ec_WOM_produceTask_produceTask_generalManageView_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_produceTask_generalManageView_queryForm" isExpandAll=true formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" idprefix="ec_WOM_produceTask_produceTask_generalManageView" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_tableNo:ec.common.tableNo||MESBasic_1_product_Product_productName_productId_productName:WOM.propertydisplayName.radion14157727407373333445||WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_productBatchNum:WOM.propertydisplayName.randon1489668325364||WOM_7.5.0.0_produceTask_ProduceTask_taskType_taskType:WOM.propertydisplayName.randon1503897133347||WOM_7.5.0.0_produceTask_ProduceTask_taskState_taskState:WOM.propertydisplayName.randon1490865032818" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign productId_productName_defaultValue  = ''>
									<#assign productId_productName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productId_productName" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${productId_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.produceTask.produceTask.generalManageView._querycustomFunc('productId_productName')" name="productId.productName" id="ec_WOM_produceTask_produceTask_generalManageView_queryForm_productId_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" searchClick="WOM.produceTask.produceTask.generalManageView.commonQuery('query')"   />
							</@queryfield>
							<#assign productBatchNum_defaultValue  = ''>
									<#assign productBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="TEXT" defaultValue=productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_productBatchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productBatchNum" id="productBatchNum" value="${productBatchNum_defaultValue!}" deValue="${productBatchNum_defaultValue!}"   exp="equal"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign taskType_defaultValue  = ''>
									<#assign taskType_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_taskType" showFormat="SELECTCOMP" defaultValue=taskType_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_taskType_taskType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${taskType_defaultValue}"   name="taskType" code="womTaskType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign taskState_defaultValue  = ''>
									<#assign taskState_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_taskState" showFormat="SELECTCOMP" defaultValue=taskState_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_taskState_taskState" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${taskState_defaultValue}"   name="taskState" code="womTaskState" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" type="adv" onclick="WOM.produceTask.produceTask.generalManageView.commonQuery('query')" onadvancedclick="advQuery('WOM.produceTask.produceTask.generalManageView.advquery')" /> 
						       							       	<@querybutton formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" type="pending" onclick="WOM.produceTask.produceTask.generalManageView.commonQuery('pending')" />
						 		<@querybutton formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info={};
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["MainTableName"]="WOM_PRODUCE_TASKS";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["tableNo"]={};
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productId.productName"]={};
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productId.productName"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productId.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productName";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productId.productName"].columnName="PRODUCT_NAME";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productId.id"]={};
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productName";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productBatchNum"]={};
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productBatchNum"].dbColumnType="BAPCODE";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productBatchNum"].layRec="productBatchNum";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["productBatchNum"].columnName="PRODUCT_BATCH_NUM";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["taskType"]={};
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["taskType"].dbColumnType="SYSTEMCODE";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["taskType"].layRec="taskType";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["taskType"].columnName="TASK_TYPE";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["taskState"]={};
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["taskState"].dbColumnType="SYSTEMCODE";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["taskState"].layRec="taskState";
ec_WOM_produceTask_produceTask_generalManageView_quickquery_info["taskState"].columnName="TASK_STATE";
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
 	var advRemainDialog = $('[id="WOM.produceTask.produceTask.generalManageView.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.produceTask.produceTask.generalManageView.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_produceTask_generalManageView_adv_queryForm" exportUrl="/WOM/produceTask/produceTask/generalManageView-pending.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_generalManageView_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="tableNo" columnname="TABLE_NO" columntype="TEXT" name="tableNo" fieldType="TEXTFIELD" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="adv_tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productId_productName_defaultValue  = ''>
									<#assign productId_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_generalManageView_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productId_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="productId.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										产品名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productId.id"  isPrecise=true deValue="${productId_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.produceTask.produceTask.generalManageView._querycustomFunc('productId_productName')" name="productId.productName" id="adv_ec_WOM_produceTask_produceTask_generalManageView_queryForm_productId_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_generalManageView_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productBatchNum_defaultValue  = ''>
									<#assign productBatchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_generalManageView_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="TEXT" defaultValue=productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_productBatchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="productBatchNum" columnname="PRODUCT_BATCH_NUM" columntype="BAPCODE" name="productBatchNum" fieldType="TEXTFIELD" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productBatchNum" id="adv_productBatchNum" value="${productBatchNum_defaultValue!}" deValue="${productBatchNum_defaultValue!}"   exp="equal" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign taskType_defaultValue  = ''>
									<#assign taskType_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_generalManageView_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_taskType" showFormat="SELECTCOMP" defaultValue=taskType_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_taskType_taskType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="taskType" columnname="TASK_TYPE" columntype="SYSTEMCODE" name="taskType" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										指令单类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${taskType_defaultValue}"   name="taskType" code="womTaskType" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign taskState_defaultValue  = ''>
									<#assign taskState_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_generalManageView_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_taskState" showFormat="SELECTCOMP" defaultValue=taskState_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_taskState_taskState" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="taskState" columnname="TASK_STATE" columntype="SYSTEMCODE" name="taskState" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										执行状态
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${taskState_defaultValue}"   name="taskState" code="womTaskState" classStyle="cui-noborder-input" value="" />
								
                                	
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
			viewCode: 'WOM_7.5.0.0_produceTask_generalManageView',
			modelCode: 'WOM_7.5.0.0_produceTask_ProduceTask',
			modelName: 'ProduceTask',
			formId: 'ec_WOM_produceTask_produceTask_generalManageView_queryForm',
			olddiv: 'WOM.produceTask.produceTask.generalManageView.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.produceTask.produceTask.generalManageView.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_generalManageView'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.produceTask.produceTask.generalManageView.advquery'] #customquContent").html(html);
		 	$("[id='WOM.produceTask.produceTask.generalManageView.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.produceTask.produceTask.generalManageView.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_generalManageView'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.produceTask.produceTask.generalManageView.advquery'] #customquContent").html(html);
			 $("[id='WOM.produceTask.produceTask.generalManageView.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.produceTask.produceTask.generalManageView.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.produceTask.produceTask.generalManageView.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.produceTask.produceTask.generalManageView.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.produceTask.produceTask.generalManageView.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.produceTask.produceTask.generalManageView.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.produceTask.produceTask.generalManageView.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.produceTask.produceTask.generalManageView.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.produceTask.produceTask.generalManageView.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.produceTask.produceTask.generalManageView.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.produceTask.produceTask.generalManageView.advquery"] div.advConContent').css('height','130px');
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

<#assign datatable_firstLoad = false>
<#assign datatable_queryFunc = "WOM.produceTask.produceTask.generalManageView.query('goList')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTask/generalManageView-pending.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.produceTask.generalManageView.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTask/generalManageView-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_produceTask_produceTask_generalManageView_query" renderOverEvent="ec_WOM_produceTask_produceTask_generalManageView_RenderOverEvent" pageInitMethod="ec_WOM_produceTask_produceTask_generalManageView_PageInitMethod" modelCode="WOM_7.5.0.0_produceTask_ProduceTask" noPermissionKeys="tableNo,planParId.dayPlanInfo.tableNo,productId.productCode,productId.productName,productId.productBaseUnit.name,productBatchNum,taskType,formularId.code,formularId.name,formularId.edition,formularId.setProcess,factoryId.name,taskState,productNum,finishNum,actStartTime,actEndTime,remark" hidekeyPrefix="ec_WOM_produceTask_produceTask_generalManageView_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_produceTask_generalManageView_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.produceTask.produceTask.generalManageView.rowDblClick" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','pending.id','pending.deploymentId','pending.activityName','pending.bulkDealFlag','pending.processDescription','pending.processKey','pending.processVersion','pending.activityType','pending.processId','pending.openUrl','pending.userId','tableInfoId','status','taskType.id','formularId.setProcess.id','taskState.id','planParId.dayPlanInfo.id','productId.id','productId.productBaseUnit.id','formularId.id','factoryId.id']" postData="&pending-beginDate=${pendingBeginDate!''}&pending-endDate=${pendingEndDate!''}&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.produceTask.produceTask.generalManageView.showErrorMsg"   >
		<#if isContainsWorkflow('WOM_7.5.0.0_produceTask_generalManageView')==true>
			<@operatebar operateType="FLOW" menuCode="${workFlowMenuCode!}" entityCode="WOM_7.5.0.0_produceTask" businessParam="${businessParam!}" resultType="JSON" >
			</@operatebar>
		</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}generalManageView_putin_modify_WOM_7.5.0.0_produceTask_generalManageView||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1502784980457')}||iconcls:modify||useInMore:false||onclick:
					putinFun()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceTask_generalManageView_BUTTON_putin"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}generalManageView_putin_modify_WOM_7.5.0.0_produceTask_generalManageView||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1502784980457')}||iconcls:modify||useInMore:false||onclick:
					putinFun()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}generalManageView_inspect_modify_WOM_7.5.0.0_produceTask_generalManageView||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1502785011587')}||iconcls:modify||useInMore:false||onclick:
					inspectFun()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceTask_generalManageView_BUTTON_inspect"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}generalManageView_inspect_modify_WOM_7.5.0.0_produceTask_generalManageView||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1502785011587')}||iconcls:modify||useInMore:false||onclick:
					inspectFun()
		" 
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}generalManageView_taskReport_modify_WOM_7.5.0.0_produceTask_generalManageView||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1502785062839')}||iconcls:modify||useInMore:false||onclick:
					taskReportFun()
		" 
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceTask_generalManageView_BUTTON_taskReport"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}generalManageView_taskReport_modify_WOM_7.5.0.0_produceTask_generalManageView||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1502785062839')}||iconcls:modify||useInMore:false||onclick:
					taskReportFun()
		" 
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=130   type="textfield"  click="function(cell){WOM.produceTask.produceTask.generalManageView.rowDblClick(null,cell);}"   showFormatFunc="" cssstyle="" />
			<#assign planParId_dayPlanInfo_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${planParId_dayPlanInfo_tableNo_displayDefaultType!}"  key="planParId.dayPlanInfo.tableNo"   label="${getText('WOM.common.tableNo1113')}" textalign="center"  width=130   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448334334')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737333344666')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productBaseUnit_name_displayDefaultType  = ''>
			<@datacolumn columnName="UNIT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productBaseUnit_name_displayDefaultType!}"  key="productId.productBaseUnit.name"  hiddenCol=true label="${getText('WOM.propertydisplayName.radion1398235640483')}" textalign="center"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${productBatchNum_displayDefaultType!}"  key="productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskType_displayDefaultType  = ''>
			<@datacolumn columnName="TASK_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${taskType_displayDefaultType!}"  key="taskType.value"   label="${getText('WOM.propertydisplayName.randon1503897133347')}" textalign="left"  width=60   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign formularId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${formularId_code_displayDefaultType!}"  key="formularId.code"   label="${getText('WOM.propertydisplayName.randon1488246312092')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formularId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${formularId_name_displayDefaultType!}"  key="formularId.name"   label="${getText('WOM.propertydisplayName.randon1487075823790')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formularId_edition_displayDefaultType  = ''>
			<@datacolumn columnName="EDITION"    showFormat="TEXT" defaultDisplay="${formularId_edition_displayDefaultType!}"  key="formularId.edition"   label="${getText('WOM.propertydisplayName.randon1487139592239')}" textalign="right" decimal="2" width=60   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign formularId_setProcess_displayDefaultType  = ''>
			<@datacolumn columnName="SET_PROCESS"    showFormat="SELECTCOMP" defaultDisplay="${formularId_setProcess_displayDefaultType!}"  key="formularId.setProcess.value"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1490578864812')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('WOM.propertydisplayName.radion141923239378233')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskState_displayDefaultType  = ''>
			<@datacolumn columnName="TASK_STATE"    showFormat="SELECTCOMP" defaultDisplay="${taskState_displayDefaultType!}"  key="taskState.value"   label="${getText('WOM.propertydisplayName.randon1490865032818')}" textalign="left"  width=60   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign productNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NUM"    showFormat="TEXT" defaultDisplay="${productNum_displayDefaultType!}"  key="productNum"   label="${getText('WOM.propertydisplayName.randon1489658031489')}" textalign="right" decimal="2" width=60   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign finishNum_displayDefaultType  = ''>
			<@datacolumn columnName="FINISH_NUM"    showFormat="TEXT" defaultDisplay="${finishNum_displayDefaultType!}"  key="finishNum"   label="${getText('WOM.propertydisplayName.randon1489669609086')}" textalign="right" decimal="2" width=60   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign actStartTime_displayDefaultType  = ''>
			<@datacolumn columnName="ACT_START_TIME"    showFormat="YMD_HMS" defaultDisplay="${actStartTime_displayDefaultType!}"  key="actStartTime"   label="${getText('WOM.propertydisplayName.randon1489669554931')}" textalign="center"  width=100   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign actEndTime_displayDefaultType  = ''>
			<@datacolumn columnName="ACT_END_TIME"    showFormat="YMD_HMS" defaultDisplay="${actEndTime_displayDefaultType!}"  key="actEndTime"   label="${getText('WOM.propertydisplayName.randon1489669589966')}" textalign="center"  width=100   type="datetime"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTask", "WOM_7.5.0.0_produceTask_generalManageView", "LIST", "produceTask")>
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
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1489669389730')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
		<@datacolumn key="pending.taskDescription" sortable=false label="${getText('ec.list.taskDescription')}"  width=120/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_produceTask_produceTask_generalManageView_RenderOverEvent(){
//加载下半部分表格
$("#ec_WOM_produceTask_produceTask_generalManageView_container_main").append("<div id='newadd'\>");
var url = "/WOM/produceTask/produceTask/getdatagrid.action?entityCode=WOM_7.5.0.0_generalManage";
$("#newadd").load(url);
//绑定单击事件
var tableObj = document.getElementById("ec_WOM_produceTask_produceTask_generalManageView_query_tbody");
for (var i = 0; i < tableObj.rows.length; i++) {    //遍历Table的所有Row
	tableObj.rows[i].onclick=function(){ setClickEvent() };  						
}
//数据颜色
for (var i = 0; i < tableObj.rows.length; i++) { 
	if(ec_WOM_produceTask_produceTask_generalManageView_queryWidget.getAllRows()[i].taskState.id=="womTaskState/01"){
		$("#ec_WOM_produceTask_produceTask_generalManageView_query_tbody .dg-bd-tr:eq(" + i + ") td[name='ec_WOM_produceTask_produceTask_generalManageView_querytaskState.value']").attr('style','background-color: #ffd861');
	}
	if(ec_WOM_produceTask_produceTask_generalManageView_queryWidget.getAllRows()[i].taskState.id=="womTaskState/02"){
		$("#ec_WOM_produceTask_produceTask_generalManageView_query_tbody .dg-bd-tr:eq(" + i + ") td[name='ec_WOM_produceTask_produceTask_generalManageView_querytaskState.value']").attr('style','background-color: #c4e7ff');
	}
	if(ec_WOM_produceTask_produceTask_generalManageView_queryWidget.getAllRows()[i].taskState.id=="womTaskState/03"){
		$("#ec_WOM_produceTask_produceTask_generalManageView_query_tbody .dg-bd-tr:eq(" + i + ") td[name='ec_WOM_produceTask_produceTask_generalManageView_querytaskState.value']").attr('style','background-color: #d3ffbe');
	}
	if(ec_WOM_produceTask_produceTask_generalManageView_queryWidget.getAllRows()[i].taskState.id=="womTaskState/04"){
		$("#ec_WOM_produceTask_produceTask_generalManageView_query_tbody .dg-bd-tr:eq(" + i + ") td[name='ec_WOM_produceTask_produceTask_generalManageView_querytaskState.value']").attr('style','background-color: #ff6b6b');
	}
}
}
function ec_WOM_produceTask_produceTask_generalManageView_PageInitMethod(){
//修改按钮样式
$("#ec_WOM_produceTask_produceTask_generalManageView_query .paginatorbar-operatebar span:eq(0)").attr('class','buttonbar-button cui-btn-putin');
$("#ec_WOM_produceTask_produceTask_generalManageView_query .paginatorbar-operatebar span:eq(1)").attr('class','buttonbar-button cui-btn-inspect');
$("#ec_WOM_produceTask_produceTask_generalManageView_query .paginatorbar-operatebar span:eq(2)").attr('class','buttonbar-button cui-btn-taskReport');
$("#ec_WOM_produceTask_produceTask_generalManageView_query .paginatorbar-operatebar span:eq(3)").attr('class','buttonbar-button cui-btn-disable');
//计算表体高度
var mainHeight = $("#ec_WOM_produceTask_produceTask_generalManageView_container_main").height();   //总大小
var queryHeight = $("#ec_WOM_produceTask_produceTask_generalManageView_queryForm_allContainer").height();   //快速查询栏
var barHeight = $(".paginatorbar").height();   //表格栏
var tabsHeight = $(".edit-tabs").height();
var gridHeight = (mainHeight-queryHeight-barHeight*3)/2 -2*barHeight ;  //两个表格，平分大小
ec_WOM_produceTask_produceTask_generalManageView_queryWidget.setHeight(gridHeight);
//表体查询
WOM.produceTask.produceTask.generalManageView.query("query");
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>