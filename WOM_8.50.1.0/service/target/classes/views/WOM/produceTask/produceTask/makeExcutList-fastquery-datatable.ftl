	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_produceTask_makeExcutList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" exportUrl="/WOM/produceTask/produceTask/makeExcutList-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" bak_value="factoryId"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489657901718')}_${getText('WOM.viewtitle.randon1498732053746')}.xls" />
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
		<div id="ec_WOM_produceTask_produceTask_makeExcutList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_produceTask_produceTask_makeExcutList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_produceTask_makeExcutList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_produceTask_makeExcutList" formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" dataTableId="ec_WOM_produceTask_produceTask_makeExcutList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_produceTask_makeExcutList_queryForm" isExpandAll=true formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" idprefix="ec_WOM_produceTask_produceTask_makeExcutList" expandType="all"  fieldcodes="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_tableNo:ec.common.tableNo||MESBasic_1_product_Product_productName_productId_productName:WOM.propertydisplayName.randon1489823571010||WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_productBatchNum:WOM.propertydisplayName.randon1489668325364||MESBasic_1_factoryModel_FactoryModel_name_factoryId_name:WOM.propertydisplayName.randon1489669356969||RM_7.5.0.0_formula_Formula_code_formularId_code:WOM.propertydisplayName.randon14882463120923333||WOM_7.5.0.0_produceTask_ProduceTask_taskState_taskState:WOM.propertydisplayName.randon1490865032818" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign productId_productName_defaultValue  = ''>
									<#assign productId_productName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productId_productName" isCustomize=true style="" > 
										<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${productId_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.produceTask.produceTask.makeExcutList._querycustomFunc('productId_productName')" name="productId.productName" id="ec_WOM_produceTask_produceTask_makeExcutList_queryForm_productId_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" searchClick="WOM.produceTask.produceTask.makeExcutList.commonQuery('query')"   />
							</@queryfield>
							<#assign productBatchNum_defaultValue  = ''>
									<#assign productBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="TEXT" defaultValue=productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_productBatchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="productBatchNum" id="productBatchNum" value="${productBatchNum_defaultValue!}" deValue="${productBatchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign factoryId_name_defaultValue  = ''>
									<#assign factoryId_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=factoryId_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_factoryId_name" isCustomize=true style="" > 
										<input type="hidden" id="factoryId.id" name="factoryId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${factoryId_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1490322427886')}"  conditionfunc="WOM.produceTask.produceTask.makeExcutList._querycustomFunc('factoryId_name')" name="factoryId.name" id="ec_WOM_produceTask_produceTask_makeExcutList_queryForm_factoryId_name" displayFieldName="name" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factoryProductRef.action"   refViewCode="MESBasic_1_factoryModel_factoryProductRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" searchClick="WOM.produceTask.produceTask.makeExcutList.commonQuery('query')"   />
							</@queryfield>
							<#assign formularId_code_defaultValue  = ''>
									<#assign formularId_code_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formularId_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formularId_code" isCustomize=true style="" > 
										<input type="hidden" id="formularId.id" name="formularId.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${formularId_code_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1498047455529')}"  conditionfunc="WOM.produceTask.produceTask.makeExcutList._querycustomFunc('formularId_code')" name="formularId.code" id="ec_WOM_produceTask_produceTask_makeExcutList_queryForm_formularId_code" displayFieldName="code" type="other" exp="equal" classStyle="cui-noborder-input" url="/RM/formula/formula/formulaTaskRef.action"   refViewCode="RM_7.5.0.0_formula_formulaTaskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" searchClick="WOM.produceTask.produceTask.makeExcutList.commonQuery('query')"   />
							</@queryfield>
							<#assign taskState_defaultValue  = ''>
									<#assign taskState_defaultValue  = ''>
							<@queryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_taskState" showFormat="SELECTCOMP" defaultValue=taskState_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_taskState_taskState" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${taskState_defaultValue}"   name="taskState" code="womTaskState" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" type="adv" onclick="WOM.produceTask.produceTask.makeExcutList.commonQuery('query')" onadvancedclick="advQuery('WOM.produceTask.produceTask.makeExcutList.advquery')" /> 
						       							       	<@querybutton formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" type="pending" onclick="WOM.produceTask.produceTask.makeExcutList.commonQuery('pending')" />
						 		<@querybutton formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["MainTableName"]="WOM_PRODUCE_TASKS";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["tableNo"]={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productId.productName"]={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productId.productName"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productId.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productName";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productId.productName"].columnName="PRODUCT_NAME";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productId.id"]={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productName";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productId.id"].columnName="PRODUCT_ID";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productBatchNum"]={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productBatchNum"].dbColumnType="BAPCODE";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productBatchNum"].layRec="productBatchNum";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["productBatchNum"].columnName="PRODUCT_BATCH_NUM";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["factoryId.name"]={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["factoryId.name"].dbColumnType="TEXT";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["factoryId.name"].layRec="factory_tbcompanystructure,ID,WOM_PRODUCE_TASKS,FACTORY_ID-name";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["factoryId.name"].columnName="NODENAME";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["factoryId.id"]={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["factoryId.id"].dbColumnType="LONG";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["factoryId.id"].layRec="factory_tbcompanystructure,ID,WOM_PRODUCE_TASKS,FACTORY_ID-name";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["factoryId.id"].columnName="ID";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["formularId.code"]={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["formularId.code"].dbColumnType="BAPCODE";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["formularId.code"].layRec="RM_FORMULAS,ID,WOM_PRODUCE_TASKS,FORMULAR_ID-code";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["formularId.code"].columnName="CODE";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["formularId.id"]={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["formularId.id"].dbColumnType="LONG";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["formularId.id"].layRec="RM_FORMULAS,ID,WOM_PRODUCE_TASKS,FORMULAR_ID-code";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["formularId.id"].columnName="ID";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["taskState"]={};
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["taskState"].dbColumnType="SYSTEMCODE";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["taskState"].layRec="taskState";
ec_WOM_produceTask_produceTask_makeExcutList_quickquery_info["taskState"].columnName="TASK_STATE";
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
 	var advRemainDialog = $('[id="WOM.produceTask.produceTask.makeExcutList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.produceTask.produceTask.makeExcutList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm" exportUrl="/WOM/produceTask/produceTask/makeExcutList-pending.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_tableNo" isCustomize=true > 
								
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
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productId_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productId_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PRODUCE_TASKS,PRODUCT_ID-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="productId.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										产品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productId.id" name="productId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productId.id"  isPrecise=true deValue="${productId_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.produceTask.produceTask.makeExcutList._querycustomFunc('productId_productName')" name="productId.productName" id="adv_ec_WOM_produceTask_produceTask_makeExcutList_queryForm_productId_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productBatchNum_defaultValue  = ''>
									<#assign productBatchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum" showFormat="TEXT" defaultValue=productBatchNum_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum_productBatchNum" isCustomize=true > 
								
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
							<#assign factoryId_name_defaultValue  = ''>
									<#assign factoryId_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm" code="MESBasic_1_factoryModel_FactoryModel_name" showFormat="SELECTCOMP" defaultValue=factoryId_name_defaultValue  divCode="MESBasic_1_factoryModel_FactoryModel_name_factoryId_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_factoryModel_FactoryModel" layRec="factory_tbcompanystructure,ID,WOM_PRODUCE_TASKS,FACTORY_ID-name" columnname="NODENAME" columntype="TEXT" name="factoryId.name" fieldType="SELECTCOMP" tableName="factory_tbcompanystructure"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产线
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_factoryModel_FactoryModel" />
										<input type="hidden" id="adv_factoryId.id" name="factoryId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_factoryId.id"  isPrecise=true deValue="${factoryId_name_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1490322427886')}"  conditionfunc="WOM.produceTask.produceTask.makeExcutList._querycustomFunc('factoryId_name')" name="factoryId.name" id="adv_ec_WOM_produceTask_produceTask_makeExcutList_queryForm_factoryId_name" displayFieldName="name" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/factoryModel/factoryModel/factoryProductRef.action"   refViewCode="MESBasic_1_factoryModel_factoryProductRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign formularId_code_defaultValue  = ''>
									<#assign formularId_code_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm" code="RM_7.5.0.0_formula_Formula_code" showFormat="SELECTCOMP" defaultValue=formularId_code_defaultValue  divCode="RM_7.5.0.0_formula_Formula_code_formularId_code" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="RM_7.5.0.0_formula_Formula" layRec="RM_FORMULAS,ID,WOM_PRODUCE_TASKS,FORMULAR_ID-code" columnname="CODE" columntype="BAPCODE" name="formularId.code" fieldType="SELECTCOMP" tableName="RM_FORMULAS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										配方编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="RM_7.5.0.0_formula_Formula" />
										<input type="hidden" id="adv_formularId.id" name="formularId.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_formularId.id"  isPrecise=true deValue="${formularId_code_defaultValue!}" reftitle="${getText('RM.viewtitle.randon1498047455529')}"  conditionfunc="WOM.produceTask.produceTask.makeExcutList._querycustomFunc('formularId_code')" name="formularId.code" id="adv_ec_WOM_produceTask_produceTask_makeExcutList_queryForm_formularId_code" displayFieldName="code" type="other" exp="equal"  classStyle="cui-noborder-input" url="/RM/formula/formula/formulaTaskRef.action"   refViewCode="RM_7.5.0.0_formula_formulaTaskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign taskState_defaultValue  = ''>
									<#assign taskState_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_produceTask_produceTask_makeExcutList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_taskState" showFormat="SELECTCOMP" defaultValue=taskState_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_taskState_taskState" isCustomize=true > 
								
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
			viewCode: 'WOM_7.5.0.0_produceTask_makeExcutList',
			modelCode: 'WOM_7.5.0.0_produceTask_ProduceTask',
			modelName: 'ProduceTask',
			formId: 'ec_WOM_produceTask_produceTask_makeExcutList_queryForm',
			olddiv: 'WOM.produceTask.produceTask.makeExcutList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.produceTask.produceTask.makeExcutList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_makeExcutList'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.produceTask.produceTask.makeExcutList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.produceTask.produceTask.makeExcutList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.produceTask.produceTask.makeExcutList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_produceTask_makeExcutList'+"&entity.code="+'WOM_7.5.0.0_produceTask';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.produceTask.produceTask.makeExcutList.advquery'] #customquContent").html(html);
			 $("[id='WOM.produceTask.produceTask.makeExcutList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.produceTask.produceTask.makeExcutList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.produceTask.produceTask.makeExcutList.query('goList')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTask/makeExcutList-pending.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.produceTask.makeExcutList.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTask/makeExcutList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_produceTask_produceTask_makeExcutList_query" renderOverEvent="ec_WOM_produceTask_produceTask_makeExcutList_RenderOverEvent" pageInitMethod="ec_WOM_produceTask_produceTask_makeExcutList_PageInitMethod" modelCode="WOM_7.5.0.0_produceTask_ProduceTask" noPermissionKeys="tableNo,productBatchNum,productId.productName,productNum,finishNum,taskType,formularId.code,batchContral,factoryId.name,taskState,planStartTime,planEndTime,actStartTime,actEndTime,staticFlag,isAnaly" hidekeyPrefix="ec_WOM_produceTask_produceTask_makeExcutList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_produceTask_makeExcutList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.produceTask.produceTask.makeExcutList.rowDblClick" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','pending.id','pending.deploymentId','pending.activityName','pending.bulkDealFlag','pending.processDescription','pending.processKey','pending.processVersion','pending.activityType','pending.processId','pending.openUrl','pending.userId','tableInfoId','status','taskType.id','taskState.id','productId.id','formularId.id','factoryId.id']" postData="&pending-beginDate=${pendingBeginDate!''}&pending-endDate=${pendingEndDate!''}&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.produceTask.produceTask.makeExcutList.showErrorMsg"   >
		<#if isContainsWorkflow('WOM_7.5.0.0_produceTask_makeExcutList')==true>
			<@operatebar operateType="FLOW" menuCode="${workFlowMenuCode!}" entityCode="WOM_7.5.0.0_produceTask" businessParam="${businessParam!}" resultType="JSON" >
			</@operatebar>
		</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}makeExcutList_checkExcuteLog_modify_WOM_7.5.0.0_produceTask_makeExcutList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1498787869327')}||iconcls:modify||useInMore:false||onclick:
					checkExcuteLog()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceTask_makeExcutList_BUTTON_checkExcuteLog"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}makeExcutList_checkExcuteLog_modify_WOM_7.5.0.0_produceTask_makeExcutList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1498787869327')}||iconcls:modify||useInMore:false||onclick:
					checkExcuteLog()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}makeExcutList_batchAnl_add_WOM_7.5.0.0_produceTask_makeExcutList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543545976030')}||iconcls:add||useInMore:false||onclick:
					batchAnl()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceTask_makeExcutList_BUTTON_batchAnl"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}makeExcutList_batchAnl_add_WOM_7.5.0.0_produceTask_makeExcutList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543545976030')}||iconcls:add||useInMore:false||onclick:
					batchAnl()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
		<#if !isMobile>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}makeExcutList_refreshAnl_modify_WOM_7.5.0.0_produceTask_makeExcutList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543546001326')}||iconcls:modify||useInMore:false||onclick:
					refreshAnl()
		" 
		 operateType="noPower"
		resultType="json" 
		buttonCode="WOM_7.5.0.0_produceTask_makeExcutList_BUTTON_refreshAnl"
		buttonType="CUSTOM" />
		<#else>
		<@operatebar menuCode="${workFlowMenuCode!}"  operates="
			code:${buttonPerfix!}makeExcutList_refreshAnl_modify_WOM_7.5.0.0_produceTask_makeExcutList||separateNum:0||name:${getText('WOM.buttonPropertyshowName.radion1543546001326')}||iconcls:modify||useInMore:false||onclick:
					refreshAnl()
		" 
		 operateType="noPower"
		resultType="json"  />
			</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=180   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${productBatchNum_displayDefaultType!}"  key="productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion14157727407377788')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NUM"    showFormat="TEXT" defaultDisplay="${productNum_displayDefaultType!}"  key="productNum"   label="${getText('WOM.propertydisplayName.randon1489658031489')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign finishNum_displayDefaultType  = ''>
			<@datacolumn columnName="FINISH_NUM"    showFormat="TEXT" defaultDisplay="${finishNum_displayDefaultType!}"  key="finishNum"   label="${getText('WOM.propertydisplayName.randon1489669609086')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign taskType_displayDefaultType  = ''>
			<@datacolumn columnName="TASK_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${taskType_displayDefaultType!}"  key="taskType.value"   label="${getText('WOM.propertydisplayName.randon150389713334722')}" textalign="left"  width=80   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign formularId_code_displayDefaultType  = ''>
			<@datacolumn columnName="CODE"    showFormat="TEXT" defaultDisplay="${formularId_code_displayDefaultType!}"  key="formularId.code"   label="${getText('WOM.propertydisplayName.randon1495090488729')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchContral_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_CONTRAL"    showFormat="SELECT" defaultDisplay="${batchContral_displayDefaultType!}"  key="batchContral"   label="${getText('WOM.propertydisplayName.randon1491449305032')}" textalign="center"  width=60   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn columnName="NODENAME"    showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('WOM.propertydisplayName.randon1489669356969')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign taskState_displayDefaultType  = ''>
			<@datacolumn columnName="TASK_STATE"    showFormat="SELECTCOMP" defaultDisplay="${taskState_displayDefaultType!}"  key="taskState.value"   label="${getText('WOM.propertydisplayName.randon1490865032818')}" textalign="left"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign planStartTime_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_START_TIME"    showFormat="YMD_HM" defaultDisplay="${planStartTime_displayDefaultType!}"  key="planStartTime"   label="${getText('WOM.propertydisplayName.randon1489669409811')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign planEndTime_displayDefaultType  = ''>
			<@datacolumn columnName="PLAN_END_TIME"    showFormat="YMD_HM" defaultDisplay="${planEndTime_displayDefaultType!}"  key="planEndTime"   label="${getText('WOM.propertydisplayName.randon1489669527423')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign actStartTime_displayDefaultType  = ''>
			<@datacolumn columnName="ACT_START_TIME"    showFormat="YMD_HM" defaultDisplay="${actStartTime_displayDefaultType!}"  key="actStartTime"   label="${getText('WOM.propertydisplayName.randon1489669554931')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign actEndTime_displayDefaultType  = ''>
			<@datacolumn columnName="ACT_END_TIME"    showFormat="YMD_HM" defaultDisplay="${actEndTime_displayDefaultType!}"  key="actEndTime"   label="${getText('WOM.propertydisplayName.randon1489669589966')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign staticFlag_displayDefaultType  = ''>
			<@datacolumn columnName="STATIC_FLAG"    showFormat="CHECKBOX" defaultDisplay="${staticFlag_displayDefaultType!}"  key="staticFlag"   label="${getText('WOM.propertydisplayName.randon1543321923004')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
			<#assign isAnaly_displayDefaultType  = ''>
			<@datacolumn columnName="IS_ANALY"    showFormat="CHECKBOX" defaultDisplay="${isAnaly_displayDefaultType!}"  key="isAnaly"   label="${getText('WOM.propertydisplayName.randon1543321897236')}" textalign="center"  width=100   type="boolean"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTask", "WOM_7.5.0.0_produceTask_makeExcutList", "LIST", "produceTask")>
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
		<@datacolumn key="pending.taskDescription" sortable=false label="${getText('ec.list.taskDescription')}"  width=120/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_produceTask_produceTask_makeExcutList_RenderOverEvent(){
//指令执行记录
var tableObj = document.getElementById("ec_WOM_produceTask_produceTask_makeExcutList_query_tbody");

//数据颜色
for (var i = 0; i < tableObj.rows.length; i++) { 
    //待执行
    if(ec_WOM_produceTask_produceTask_makeExcutList_queryWidget.getAllRows()[i].taskState.id=="womTaskState/01"){
        $("#ec_WOM_produceTask_produceTask_makeExcutList_query_tbody td[name='ec_WOM_produceTask_produceTask_makeExcutList_querytaskState.value']").eq(i).attr('style','background-color: #E4E4E4');
    }
    //执行中
    if(ec_WOM_produceTask_produceTask_makeExcutList_queryWidget.getAllRows()[i].taskState.id=="womTaskState/02"){
        $("#ec_WOM_produceTask_produceTask_makeExcutList_query_tbody td[name='ec_WOM_produceTask_produceTask_makeExcutList_querytaskState.value']").eq(i).attr('style','background-color: #ffd04b');
    }
    //已完成
    if(ec_WOM_produceTask_produceTask_makeExcutList_queryWidget.getAllRows()[i].taskState.id=="womTaskState/03"){
        $("#ec_WOM_produceTask_produceTask_makeExcutList_query_tbody td[name='ec_WOM_produceTask_produceTask_makeExcutList_querytaskState.value']").eq(i).attr('style','background-color: #60baff');
    }
    //终止
    if(ec_WOM_produceTask_produceTask_makeExcutList_queryWidget.getAllRows()[i].taskState.id=="womTaskState/04"){
        $("#ec_WOM_produceTask_produceTask_makeExcutList_query_tbody td[name='ec_WOM_produceTask_produceTask_makeExcutList_querytaskState.value']").eq(i).attr('style','background-color: #f54920');
    }
}
}
function ec_WOM_produceTask_produceTask_makeExcutList_PageInitMethod(){
$.ajax({
    url : "/RM/formula/formula/getSynchronData.action",
    type : "get",
    dataType : "json",
    success : function(data){
        var IsOpen = JSON.stringify(data.result);
        if(IsOpen == 'false'){
            $(".paginatorbar-operatebar a").eq(1).hide();
            $(".paginatorbar-operatebar a").eq(2).hide();
            $( 'td[key="isAnaly"]').hide();$( 'td[key="staticFlag"]').hide(); 
            ec_WOM_produceTask_produceTask_makeExcutList_queryWidget._columnDefsMaps['staticFlag'].hiddenCol = true;
           ec_WOM_produceTask_produceTask_makeExcutList_queryWidget._columnDefsMaps['isAnaly'].hiddenCol = true;
           ec_WOM_produceTask_produceTask_makeExcutList_queryWidget.redrawDT();
        }
    }
});
$("#ec_WOM_produceTask_produceTask_makeExcutList_query .paginatorbar-operatebar span:eq(0)").attr('class','buttonbar-button cui-btn-ckst');
$("#ec_WOM_produceTask_produceTask_makeExcutList_query .paginatorbar-operatebar span:eq(1)").attr('class','buttonbar-button cui-btn-ckst');
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>