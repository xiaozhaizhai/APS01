	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490772713348')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" exportUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef-query.action">
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeID" bak_value="storeID"/>
		<input type="hidden" reset="false" name="WOM_taskReporting_taskReportingPart_reportDetaliRef_condition" id="WOM_taskReporting_taskReportingPart_reportDetaliRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490773102678')}_${getText('WOM.viewtitle.randon1495093620878')}.xls" />
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
		<div id="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_taskReporting_reportDetaliRef')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_taskReporting_reportDetaliRef" formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" dataTableId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" isExpandAll=true formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" idprefix="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef" expandType="all"  fieldcodes="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo_headId_tableNo:WOM.menuName.randon1490785542610||WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.propertydisplayName.randon1490613814833||MESBasic_1_product_Product_productCode_productID_productCode:WOM.propertydisplayName.randon1490772847738||WOM_7.5.0.0_taskReporting_TaskReportingPart_proBatchNum_proBatchNum:WOM.propertydisplayName.randon1492078507544||base_staff_name_reportStaff_name:WOM.staff.dimissionStaff_xls.staffName0000||WOM_7.5.0.0_taskReporting_TaskReportingPart_reportDate_reportDate:WOM.propertydisplayName.randon1492078626890||WOM_7.5.0.0_taskReporting_TaskReportingPart_reportType_reportType:WOM.propertydisplayName.randon1492078645437" > 
							<#assign headId_tableNo_defaultValue  = ''>
									<#assign headId_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo" showFormat="SELECTCOMP" defaultValue=headId_tableNo_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo_headId_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="headId.id" name="headId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="headId.tableNo" id="headId.tableNo" value="${headId_tableNo_defaultValue!}" deValue="${headId_tableNo_defaultValue!}"   exp="like"/>
												</div>
							</@queryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false isCrossCompany=isCrossCompany isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.taskReporting.taskReportingPart.reportDetaliRef._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" searchClick="WOM.taskReporting.taskReportingPart.reportDetaliRef.commonQuery('query')"   />
							</@queryfield>
							<#assign productID_productCode_defaultValue  = ''>
									<#assign productID_productCode_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productID_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productID_productCode" isCustomize=true style="" > 
										<input type="hidden" id="productID.id" name="productID.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${productID_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.taskReporting.taskReportingPart.reportDetaliRef._querycustomFunc('productID_productCode')" name="productID.productCode" id="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm_productID_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" searchClick="WOM.taskReporting.taskReportingPart.reportDetaliRef.commonQuery('query')"   />
							</@queryfield>
							<#assign proBatchNum_defaultValue  = ''>
									<#assign proBatchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReportingPart_proBatchNum" showFormat="TEXT" defaultValue=proBatchNum_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReportingPart_proBatchNum_proBatchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="proBatchNum" id="proBatchNum" value="${proBatchNum_defaultValue!}" deValue="${proBatchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign reportStaff_name_defaultValue  = ''>
									<#assign reportStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=reportStaff_name_defaultValue  divCode="base_staff_name_reportStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="reportStaff.id" name="reportStaff.id" value="" />
												<@mneclient iframe=true mneenable=true isCrossCompany=isCrossCompany isPrecise=true deValue="${reportStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.taskReporting.taskReportingPart.reportDetaliRef._querycustomFunc('reportStaff_name')" name="reportStaff.name" id="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm_reportStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" searchClick="WOM.taskReporting.taskReportingPart.reportDetaliRef.commonQuery('query')"   />
							</@queryfield>
							<#assign reportDate_defaultValue  = ''>
									<#assign reportDate_defaultValue  = ''>
								<#if (reportDate_defaultValue)?? &&(reportDate_defaultValue)?has_content>
									<#assign reportDate_defaultValue  = getDefaultDateTime(reportDate_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReportingPart_reportDate" showFormat="YMD_HM" defaultValue=reportDate_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReportingPart_reportDate_reportDate" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="reportDate_start" id="reportDate_start" exp="gequal"   formid="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" name="reportDate_end" id="reportDate_end" exp="lequal"   formid="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<#assign reportType_defaultValue  = ''>
									<#assign reportType_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReportingPart_reportType" showFormat="SELECTCOMP" defaultValue=reportType_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReportingPart_reportType_reportType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${reportType_defaultValue}"   name="reportType" code="womReportType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" type="adv" onclick="WOM.taskReporting.taskReportingPart.reportDetaliRef.commonQuery('query')" onadvancedclick="advQuery('WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery')" /> 
						 		<@querybutton formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["MainTableName"]="WOM_TASK_REPORTING_PARTS";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["headId.tableNo"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["headId.tableNo"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["headId.tableNo"].layRec="WOM_TASK_REPORTINGS,ID,WOM_TASK_REPORTING_PARTS,HEAD_ID-tableNo";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["headId.tableNo"].columnName="TABLE_NO";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["headId.id"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["headId.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["headId.id"].layRec="WOM_TASK_REPORTINGS,ID,WOM_TASK_REPORTING_PARTS,HEAD_ID-tableNo";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["headId.id"].columnName="ID";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["taskID.tableNo"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_TASK_REPORTING_PARTS,TASKID-tableNo";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["taskID.id"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_TASK_REPORTING_PARTS,TASKID-tableNo";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["productID.productCode"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["productID.productCode"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["productID.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_TASK_REPORTING_PARTS,PRODUCTID-productCode";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["productID.productCode"].columnName="PRODUCT_CODE";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["productID.id"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["productID.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["productID.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_TASK_REPORTING_PARTS,PRODUCTID-productCode";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["productID.id"].columnName="PRODUCT_ID";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["proBatchNum"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["proBatchNum"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["proBatchNum"].layRec="proBatchNum";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["proBatchNum"].columnName="PRO_BATCH_NUM";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportStaff.name"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportStaff.name"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportStaff.name"].layRec="base_staff,ID,WOM_TASK_REPORTING_PARTS,REPORT_STAFF-name";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportStaff.name"].columnName="NAME";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportStaff.id"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportStaff.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportStaff.id"].layRec="base_staff,ID,WOM_TASK_REPORTING_PARTS,REPORT_STAFF-name";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportStaff.id"].columnName="ID";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportDate"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportDate"].dbColumnType="DATETIME";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportDate"].layRec="reportDate";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportDate"].columnName="REPORT_DATE";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportType"]={};
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportType"].dbColumnType="SYSTEMCODE";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportType"].layRec="reportType";
ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_quickquery_info["reportType"].columnName="REPORT_TYPE";
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
 	var advRemainDialog = $('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" exportUrl="/WOM/taskReporting/taskReportingPart/reportDetaliRef-query.action">
							<#assign headId_tableNo_defaultValue  = ''>
									<#assign headId_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo" showFormat="SELECTCOMP" defaultValue=headId_tableNo_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo_headId_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_taskReporting_TaskReporting" layRec="WOM_TASK_REPORTINGS,ID,WOM_TASK_REPORTING_PARTS,HEAD_ID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="headId.tableNo" fieldType="SELECTCOMP" tableName="WOM_TASK_REPORTINGS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产报工单
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_taskReporting_TaskReporting" />
										<input type="hidden" id="adv_headId.id" name="headId.id" value="" />
												<div class="fix-input">
													<input type="text" class="cui-noborder-input" name="headId.tableNo" id="adv_headId.tableNo" value="${headId_tableNo_defaultValue!}" deValue="${headId_tableNo_defaultValue!}"   exp="like" />
												</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="WOM_PRODUCE_TASKS,ID,WOM_TASK_REPORTING_PARTS,TASKID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="taskID.tableNo" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产指令单
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
										<input type="hidden" id="adv_taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_taskID.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.taskReporting.taskReportingPart.reportDetaliRef._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="adv_ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productID_productCode_defaultValue  = ''>
									<#assign productID_productCode_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" code="MESBasic_1_product_Product_productCode" showFormat="SELECTCOMP" defaultValue=productID_productCode_defaultValue  divCode="MESBasic_1_product_Product_productCode_productID_productCode" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_TASK_REPORTING_PARTS,PRODUCTID-productCode" columnname="PRODUCT_CODE" columntype="TEXT" name="productID.productCode" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										产品编码
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productID.id" name="productID.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productID.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${productID_productCode_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.taskReporting.taskReportingPart.reportDetaliRef._querycustomFunc('productID_productCode')" name="productID.productCode" id="adv_ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm_productID_productCode" displayFieldName="productCode" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign proBatchNum_defaultValue  = ''>
									<#assign proBatchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReportingPart_proBatchNum" showFormat="TEXT" defaultValue=proBatchNum_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReportingPart_proBatchNum_proBatchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_taskReporting_TaskReportingPart" layRec="proBatchNum" columnname="PRO_BATCH_NUM" columntype="TEXT" name="proBatchNum" fieldType="TEXTFIELD" tableName="WOM_TASK_REPORTING_PARTS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_taskReporting_TaskReportingPart" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="proBatchNum" id="adv_proBatchNum" value="${proBatchNum_defaultValue!}" deValue="${proBatchNum_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign reportStaff_name_defaultValue  = ''>
									<#assign reportStaff_name_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=reportStaff_name_defaultValue  divCode="base_staff_name_reportStaff_name" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="sysbase_1.0_staff_base_staff" layRec="base_staff,ID,WOM_TASK_REPORTING_PARTS,REPORT_STAFF-name" columnname="NAME" columntype="TEXT" name="reportStaff.name" fieldType="SELECTCOMP" tableName="base_staff"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										报工人
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="sysbase_1.0_staff_base_staff" />
										<input type="hidden" id="adv_reportStaff.id" name="reportStaff.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_reportStaff.id" isCrossCompany=isCrossCompany isPrecise=true deValue="${reportStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.taskReporting.taskReportingPart.reportDetaliRef._querycustomFunc('reportStaff_name')" name="reportStaff.name" id="adv_ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm_reportStaff_name" displayFieldName="name" type="Staff" exp="like"  classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign reportDate_defaultValue  = ''>
									<#assign reportDate_defaultValue  = ''>
								<#if (reportDate_defaultValue)?? &&(reportDate_defaultValue)?has_content>
									<#assign reportDate_defaultValue  = getDefaultDateTime(reportDate_defaultValue!)?datetime>
								</#if>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReportingPart_reportDate" showFormat="YMD_HM" defaultValue=reportDate_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReportingPart_reportDate_reportDate" isCustomize=true > 
								
								<div class="quick_query_node" style="width:98%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_taskReporting_TaskReportingPart" layRec="reportDate" columnname="REPORT_DATE" columntype="DATETIME" name="reportDate" fieldType="DATETIME" showFormat="YMD_HM" tableName="WOM_TASK_REPORTING_PARTS"/>
								<label class="quick_query_labeltime advQuery_label" style="text-align:right;float:left;width:14%;height:28px;line-height:28px">
								<span class="quick_query_text">
										报工时间
								</span>
								</label>
							<div class="quick_query_contenttime advQuery_content" style="float:left;width:86%">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_taskReporting_TaskReportingPart" />
								<div>
							  	 	<div style="float:left;width:41.8%">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${reportDate_defaultValue!}" deValue="${reportDate_defaultValue!}"  name="reportDate_start" id="adv_reportDate_start" exp="gequal"    formid="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" />
									</div>
									<div style="float:left;width:16.3%;text-align:center;line-height: 26px;"> - - ${getText('common.date.split')} - - </div>
							  	 	<div style="float:left;width:41.8%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTimeMin" cssClass="cui-noborder-input" value="${reportDate_defaultValue!}" deValue="${reportDate_defaultValue!}"  name="reportDate_end" id="adv_reportDate_end" exp="lequal"    formid="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" />
							  		</div>
						  		</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign reportType_defaultValue  = ''>
									<#assign reportType_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReportingPart_reportType" showFormat="SELECTCOMP" defaultValue=reportType_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReportingPart_reportType_reportType" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_taskReporting_TaskReportingPart" layRec="reportType" columnname="REPORT_TYPE" columntype="SYSTEMCODE" name="reportType" fieldType="SELECTCOMP" tableName="WOM_TASK_REPORTING_PARTS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										报工类型
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_taskReporting_TaskReportingPart" />
										<@systemcode  advquery=true onchange="" ecFlag=true deValue="${reportType_defaultValue}"   name="reportType" code="womReportType" classStyle="cui-noborder-input" value="" />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_adv_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReportingPart_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReportingPart_batchNum_batchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_taskReporting_TaskReportingPart" layRec="batchNum" columnname="BATCH_NUM" columntype="TEXT" name="batchNum" fieldType="TEXTFIELD" tableName="WOM_TASK_REPORTING_PARTS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										入库批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_taskReporting_TaskReportingPart" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="adv_batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like" />
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
			viewCode: 'WOM_7.5.0.0_taskReporting_reportDetaliRef',
			modelCode: 'WOM_7.5.0.0_taskReporting_TaskReportingPart',
			modelName: 'TaskReportingPart',
			formId: 'ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm',
			olddiv: 'WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_taskReporting_reportDetaliRef'+"&entity.code="+'WOM_7.5.0.0_taskReporting';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery'] #customquContent").html(html);
		 	$("[id='WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_taskReporting_reportDetaliRef'+"&entity.code="+'WOM_7.5.0.0_taskReporting';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery'] #customquContent").html(html);
			 $("[id='WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.taskReporting.taskReportingPart.reportDetaliRef.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.taskReporting.taskReportingPart.reportDetaliRef.query('query')">
<#assign datatable_dataUrl = "/WOM/taskReporting/taskReportingPart/reportDetaliRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.taskReporting.taskReportingPart.reportDetaliRef.query('query')">
<#assign datatable_dataUrl = "/WOM/taskReporting/taskReportingPart/reportDetaliRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag  superChecked=superChecked superCheckedName=superCheckedName superCheckedId=superCheckedId checkedRowsMap=checkedRowsMap id="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_query" renderOverEvent="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_RenderOverEvent" pageInitMethod="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_PageInitMethod" modelCode="WOM_7.5.0.0_taskReporting_TaskReportingPart" noPermissionKeys="headId.tableNo,taskID.tableNo,productID.productCode,productID.productName,proBatchNum,headId.inputCode,content,reportNum,reportStaff.name,reportDate,reportType,wareId.wareCode,wareId.wareName,batchNum,remark" hidekeyPrefix="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_queryForm" firstLoad=datatable_firstLoad  lockColumnCount="" dblclick="WOM.taskReporting.taskReportingPart.reportDetaliRef.sendBackreportDetaliRef" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','reportType.id','headId.id','taskID.id','productID.id','reportStaff.id','wareId.id','id','id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}" throwError="WOM.taskReporting.taskReportingPart.reportDetaliRef.showErrorMsg"   >
					<#if (flowBulkFlag?? && flowBulkFlag==true)  || ((multiSelect??&&(multiSelect)?default('false') == 'true'))  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign headId_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${headId_tableNo_displayDefaultType!}"  key="headId.tableNo"   label="${getText('WOM.menuName.randon1490785542610')}" textalign="center"  width=190   type="textfield"    click="function(cell){WOM.taskReporting.taskReportingPart.reportDetaliRef.showLinkView('/WOM/taskReporting/taskReporting/taskReportingView.action?${getPowerCode('','WOM_7.5.0.0_taskReporting_taskReportingView')}','headId.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.propertydisplayName.randon1490613814833')}" textalign="center"  width=190   type="textfield"    click="function(cell){WOM.taskReporting.taskReportingPart.reportDetaliRef.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc="" cssstyle="" />
			<#assign productID_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productID_productCode_displayDefaultType!}"  key="productID.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448334334')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productID_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productID_productName_displayDefaultType!}"  key="productID.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737333344')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign proBatchNum_displayDefaultType  = ''>
			<@datacolumn columnName="PRO_BATCH_NUM"    showFormat="TEXT" defaultDisplay="${proBatchNum_displayDefaultType!}"  key="proBatchNum"   label="${getText('WOM.propertydisplayName.randon1492078507544')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign headId_inputCode_displayDefaultType  = ''>
			<@datacolumn columnName="INPUT_CODE"    showFormat="TEXT" defaultDisplay="${headId_inputCode_displayDefaultType!}"  key="headId.inputCode"   label="${getText('WOM.propertydisplayName.randon1565061995937')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign content_displayDefaultType  = ''>
			<@datacolumn columnName="CONTENT"    showFormat="TEXT" defaultDisplay="${content_displayDefaultType!}"  key="content"   label="${getText('WOM.propertydisplayName.randon1565060960816')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign reportNum_displayDefaultType  = ''>
			<@datacolumn columnName="REPORT_NUM"    showFormat="TEXT" defaultDisplay="${reportNum_displayDefaultType!}"  key="reportNum"   label="${getText('WOM.propertydisplayName.randon1492079279822858252')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc="" cssstyle="" />
			<#assign reportStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${reportStaff_name_displayDefaultType!}"  key="reportStaff.name"   label="${getText('WOM.propertydisplayName.randon1492078600032')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign reportDate_displayDefaultType  = ''>
			<@datacolumn columnName="REPORT_DATE"    showFormat="YMD_HM" defaultDisplay="${reportDate_displayDefaultType!}"  key="reportDate"   label="${getText('WOM.propertydisplayName.randon1492078626890')}" textalign="center"  width=150   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign reportType_displayDefaultType  = ''>
			<@datacolumn columnName="REPORT_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${reportType_displayDefaultType!}"  key="reportType.value"   label="${getText('WOM.propertydisplayName.randon1492078645437')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
			<#assign wareId_wareCode_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_CODE"    showFormat="TEXT" defaultDisplay="${wareId_wareCode_displayDefaultType!}"  key="wareId.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign wareId_wareName_displayDefaultType  = ''>
			<@datacolumn columnName="WARE_NAME"    showFormat="TEXT" defaultDisplay="${wareId_wareName_displayDefaultType!}"  key="wareId.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1490773190433')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_taskReporting_TaskReportingPart", "WOM_7.5.0.0_taskReporting_reportDetaliRef", "LIST", "taskReportingPart")>
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
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1490773225991')}" textalign="left"  width=200   type="textfield"    showFormatFunc="" cssstyle="" />
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_RenderOverEvent(){
}
function ec_WOM_taskReporting_taskReportingPart_reportDetaliRef_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>