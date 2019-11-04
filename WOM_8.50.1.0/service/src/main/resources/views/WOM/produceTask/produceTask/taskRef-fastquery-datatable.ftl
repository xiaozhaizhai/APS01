	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_produceTask_taskRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_produceTask_taskRef_queryForm" exportUrl="/WOM/produceTask/produceTask/taskRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" name="WOM_produceTask_produceTask_taskRef_condition" id="WOM_produceTask_produceTask_taskRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489657901718')}_${getText('WOM.viewtitle.randon1489737198145')}.xls" />
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
		<div id="ec_WOM_produceTask_produceTask_taskRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_produceTask_produceTask_taskRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_produceTask_taskRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_produceTask_taskRef" formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" dataTableId="ec_WOM_produceTask_produceTask_taskRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_produceTask_taskRef_queryForm" isExpandAll=true formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" idprefix="ec_WOM_produceTask_produceTask_taskRef" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_tableNo:ec.common.tableNo||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.randon1490772847738||WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_productBatchNum:WOM.propertydisplayName.randon1489668325364||RM_7.5.0.0_formula_Formula_code_formularId_code:WOM.propertydisplayName.randon1489669324447||MESBasic_1_factoryModel_FactoryModel_name_factoryId_name:WOM.propertydisplayName.randonpl5||WOM_7.5.0.0_produceTask_ProduceTask_planStartTime_planStartTime:WOM.propertydisplayName.randon1489669409811||WOM_7.5.0.0_produceTask_ProduceTask_planEndTime_planEndTime:WOM.propertydisplayName.randon1489669527423" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productId_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productId_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${productId_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.produceTask.produceTask.taskRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_produceTask_produceTask_taskRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/productRefNew.action"   refViewCode="MESBasic_1_product_productRefNew"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" searchClick="WOM.produceTask.produceTask.taskRef.commonQuery('query')"   />
							</@queryfield>
							<#assign productBatchNum_defaultValue  = ''>
									<#assign productBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="TEXT" defaultValue=productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_productBatchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productBatchNum" id="productBatchNum" value="${productBatchNum_defaultValue!}" deValue="${productBatchNum_defaultValue!}"   exp="equal"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign formularId_code_defaultValue  = ''>
									<#assign formularId_code_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formularId_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formularId_code" isCustomize=true style="" > 
										<input type="hidden" id="formularId.id" name="formularId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${formularId_code_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1488246963795')}"  conditionfunc="WOM.produceTask.produceTask.taskRef._querycustomFunc('formularId_code')" name="formularId.code" id="ec_WOM_produceTask_produceTask_taskRef_queryForm_formularId_code" displayFieldName="code" type="other" exp="equal" classStyle="cui-noborder-input" url="/RM/formula/formula/formulaRef.action"   refViewCode="RM_7.5.0.0_formula_formulaRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" searchClick="WOM.produceTask.produceTask.taskRef.commonQuery('query')"   />
							</@queryfield>
							<#assign factoryId_name_defaultValue  = ''>
									<#assign factoryId_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=factoryId_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_factoryId_name" isCustomize=true style="" > 
										<input type="hidden" id="factoryId.id" name="factoryId.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${factoryId_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="WOM.produceTask.produceTask.taskRef._querycustomFunc('factoryId_name')" name="factoryId.name" id="ec_WOM_produceTask_produceTask_taskRef_queryForm_factoryId_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action"   refViewCode="MESBasic_1_factoryModel_factroyRef1"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" searchClick="WOM.produceTask.produceTask.taskRef.commonQuery('query')"   />
							</@queryfield>
							<#assign planStartTime_defaultValue  = ''>
									<#assign planStartTime_defaultValue  = ''>
								<#if (planStartTime_defaultValue)?? &&(planStartTime_defaultValue)?has_content>
									<#assign planStartTime_defaultValue  = getDefaultDateTime(planStartTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_planStartTime" showFormat="YMD_HM" defaultValue=planStartTime_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_planStartTime_planStartTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="planStartTime_start" id="planStartTime_start" exp="gequal"   formid="ec_WOM_produceTask_produceTask_taskRef_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="planStartTime_end" id="planStartTime_end" exp="lequal"   formid="ec_WOM_produceTask_produceTask_taskRef_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign planEndTime_defaultValue  = ''>
									<#assign planEndTime_defaultValue  = ''>
								<#if (planEndTime_defaultValue)?? &&(planEndTime_defaultValue)?has_content>
									<#assign planEndTime_defaultValue  = getDefaultDateTime(planEndTime_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_planEndTime" showFormat="YMD_HM" defaultValue=planEndTime_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_planEndTime_planEndTime" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="planEndTime_start" id="planEndTime_start" exp="gequal"   formid="ec_WOM_produceTask_produceTask_taskRef_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="planEndTime_end" id="planEndTime_end" exp="lequal"   formid="ec_WOM_produceTask_produceTask_taskRef_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" type="adv" onclick="WOM.produceTask.produceTask.taskRef.commonQuery('query')" onadvancedclick="advQuery('WOM.produceTask.produceTask.taskRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_produceTask_produceTask_taskRef_quickquery_info={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["MainTableName"]="WOM_PRODUCE_TASKS";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["tableNo"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productId.productCode"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productCode";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productId.id"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productCode";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productBatchNum"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productBatchNum"].dbColumnType="BAPCODE";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productBatchNum"].layRec="productBatchNum";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productBatchNum"].columnName="PRODUCT_BATCH_NUM";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["formularId.code"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["formularId.code"].dbColumnType="BAPCODE";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["formularId.code"].layRec="RM_FORMULAS,ID,WOM_PRODUCE_TASKS,FORMULAR_ID-code";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["formularId.code"].columnName="CODE";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["formularId.id"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["formularId.id"].dbColumnType="LONG";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["formularId.id"].layRec="RM_FORMULAS,ID,WOM_PRODUCE_TASKS,FORMULAR_ID-code";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["formularId.id"].columnName="ID";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["factoryId.name"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["factoryId.name"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["factoryId.name"].layRec="factory_tbcompanystructure,ID,WOM_PRODUCE_TASKS,FACTORY_ID-name";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["factoryId.name"].columnName="NODENAME";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["factoryId.id"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["factoryId.id"].dbColumnType="LONG";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["factoryId.id"].layRec="factory_tbcompanystructure,ID,WOM_PRODUCE_TASKS,FACTORY_ID-name";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["factoryId.id"].columnName="ID";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["planStartTime"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["planStartTime"].dbColumnType="DATETIME";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["planStartTime"].layRec="planStartTime";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["planStartTime"].columnName="PLAN_START_TIME";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["planEndTime"]={};
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["planEndTime"].dbColumnType="DATETIME";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["planEndTime"].layRec="planEndTime";
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["planEndTime"].columnName="PLAN_END_TIME";
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
 	var advRemainDialog = $('[id="WOM.produceTask.produceTask.taskRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.produceTask.produceTask.taskRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_produceTask_taskRef_adv_queryForm" exportUrl="/WOM/produceTask/produceTask/taskRef-query.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_taskRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_tableNo" isCustomize=true > 
								
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
							<#assign productBatchNum_defaultValue  = ''>
									<#assign productBatchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_taskRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="TEXT" defaultValue=productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_productBatchNum" isCustomize=true > 
								
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
			viewCode: 'WOM_7.5.0.0_produceTask_taskRef',
			modelCode: 'WOM_7.5.0.0_produceTask_ProduceTask',
			modelName: 'ProduceTask',
			formId: 'ec_WOM_produceTask_produceTask_taskRef_queryForm',
			olddiv: 'WOM.produceTask.produceTask.taskRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.produceTask.produceTask.taskRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_taskRef'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.produceTask.produceTask.taskRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.produceTask.produceTask.taskRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.produceTask.produceTask.taskRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_taskRef'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.produceTask.produceTask.taskRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.produceTask.produceTask.taskRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.produceTask.produceTask.taskRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.produceTask.produceTask.taskRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.produceTask.produceTask.taskRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.produceTask.produceTask.taskRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.produceTask.produceTask.taskRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.produceTask.produceTask.taskRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.produceTask.produceTask.taskRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.produceTask.produceTask.taskRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.produceTask.produceTask.taskRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.produceTask.produceTask.taskRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.produceTask.produceTask.taskRef.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTask/taskRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.produceTask.taskRef.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTask/taskRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_produceTask_produceTask_taskRef_query" renderOverEvent="ec_WOM_produceTask_produceTask_taskRef_RenderOverEvent" pageInitMethod="ec_WOM_produceTask_produceTask_taskRef_PageInitMethod" modelCode="WOM_7.5.0.0_produceTask_ProduceTask" noPermissionKeys="tableNo,productId.productCode,productId.productName,productNum,productBatchNum,taskType,formularId.code,formularId.name,formularId.setProcess,factoryId.name,planStartTime,planEndTime,taskState" hidekeyPrefix="ec_WOM_produceTask_produceTask_taskRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.produceTask.produceTask.taskRef.sendBacktaskRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','taskType.id','formularId.setProcess.id','taskState.id','productId.id','formularId.id','factoryId.id','tableNo','tableNo','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.produceTask.produceTask.taskRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=190   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion1415772644833dd')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion14157727407377788')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NUM"    showFormat="TEXT" defaultDisplay="${productNum_displayDefaultType!}"  key="productNum"   label="${getText('WOM.propertydisplayName.randon1489658031489')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign productBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${productBatchNum_displayDefaultType!}"  key="productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskType_displayDefaultType  = ''>
			<@datacolumn columnName="TASK_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${taskType_displayDefaultType!}"  key="taskType.value"   label="${getText('WOM.propertydisplayName.randon150389713334722')}" textalign="left"  width=40   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign formularId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${formularId_code_displayDefaultType!}"  key="formularId.code"   label="${getText('WOM.propertydisplayName.randon1488246312092')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formularId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${formularId_name_displayDefaultType!}"  key="formularId.name"   label="${getText('WOM.propertydisplayName.randon1487075823790')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign formularId_setProcess_displayDefaultType  = ''>
			<@datacolumn columnName="SET_PROCESS"    showFormat="SELECTCOMP" defaultDisplay="${formularId_setProcess_displayDefaultType!}"  key="formularId.setProcess.value"  hiddenCol=true label="${getText('RM.propertydisplayName.randon1490578864812')}" textalign="left"  width=40   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('WOM.propertydisplayName.radion141923239378233')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign planStartTime_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_START_TIME"    showFormat="YMD_HM" defaultDisplay="${planStartTime_displayDefaultType!}"  key="planStartTime"   label="${getText('WOM.propertydisplayName.randon1489669409811')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign planEndTime_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_END_TIME"    showFormat="YMD_HM" defaultDisplay="${planEndTime_displayDefaultType!}"  key="planEndTime"   label="${getText('WOM.propertydisplayName.randon1489669527423')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign taskState_displayDefaultType  = ''>
			<@datacolumn columnName="TASK_STATE"    showFormat="SELECTCOMP" defaultDisplay="${taskState_displayDefaultType!}"  key="taskState.value"   label="${getText('WOM.propertydisplayName.randon1490865032818')}" textalign="left"  width=60   type="systemcode"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTask", "WOM_7.5.0.0_produceTask_taskRef", "LIST", "produceTask")>
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
function ec_WOM_produceTask_produceTask_taskRef_RenderOverEvent(){
}
function ec_WOM_produceTask_produceTask_taskRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>