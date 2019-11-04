	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490772713348')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_taskReporting_taskReporting_modReportingList_queryFormErrorBar" />
	<form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" exportUrl="/WOM/taskReporting/taskReporting/modReportingList-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" bak_value="createDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" bak_value="createPosition"/>
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" bak_value="ownerDepartment"/>
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" bak_value="ownerPosition"/>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490772767048')}_${getText('WOM.viewtitle.randon1566214545686')}.xls" />
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
		<div id="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_taskReporting_modReportingList')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_taskReporting_modReportingList" formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" dataTableId="ec_WOM_taskReporting_taskReporting_modReportingList_query"   />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" isExpandAll=true formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" idprefix="ec_WOM_taskReporting_taskReporting_modReportingList" expandType="all"  fieldcodes="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo_tableNo:ec.common.tableNo||WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.common.tableNo1111||MESBasic_1_product_Product_productName_productID_productName:WOM.propertydisplayName.radion1415772740737333344||WOM_7.5.0.0_taskReporting_TaskReporting_batchNum_batchNum:WOM.propertydisplayName.randon1490772885990||WOM_7.5.0.0_taskReporting_TaskReporting_reportType_reportType:WOM.propertydisplayName.randon1490773072845||base_staff_name_reportStaff_name:WOM.propertydisplayName.randon1490772995868||WOM_7.5.0.0_taskReporting_TaskReporting_reportDate_reportDate:WOM.propertydisplayName.randon1490787728846" > 
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo_tableNo" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true style="" > 
										<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false  isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.taskReporting.taskReporting.modReportingList._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" searchClick="WOM.taskReporting.taskReporting.modReportingList.commonQuery('query')"   />
							</@queryfield>
							<#assign productID_productName_defaultValue  = ''>
									<#assign productID_productName_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productID_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productID_productName" isCustomize=true style="" > 
										<input type="hidden" id="productID.id" name="productID.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${productID_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.taskReporting.taskReporting.modReportingList._querycustomFunc('productID_productName')" name="productID.productName" id="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm_productID_productName" displayFieldName="productName" type="other" exp="like" classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" searchClick="WOM.taskReporting.taskReporting.modReportingList.commonQuery('query')"   />
							</@queryfield>
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReporting_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReporting_batchNum_batchNum" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchNum" id="batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<#assign reportType_defaultValue  = ''>
									<#assign reportType_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReporting_reportType" showFormat="SELECTCOMP" defaultValue=reportType_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReporting_reportType_reportType" isCustomize=true style="" > 
										<@systemcode  onchange="" ecFlag=true deValue="${reportType_defaultValue}"   name="reportType" code="womReportType" classStyle="cui-noborder-input" value="" />
							</@queryfield>
							<#assign reportStaff_name_defaultValue  = ''>
									<#assign reportStaff_name_defaultValue  = ''>
							<@queryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" code="base_staff_name" showFormat="SELECTCOMP" defaultValue=reportStaff_name_defaultValue  divCode="base_staff_name_reportStaff_name" isCustomize=true style="" > 
										<input type="hidden" id="reportStaff.id" name="reportStaff.id" value="" />
												<@mneclient iframe=true mneenable=true  isPrecise=true deValue="${reportStaff_name_defaultValue!}" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.taskReporting.taskReporting.modReportingList._querycustomFunc('reportStaff_name')" name="reportStaff.name" id="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm_reportStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="cui-noborder-input" url="/foundation/staff/common/staffListFrameset.action"   refViewCode="sysbase_1.0_staff_ref"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" searchClick="WOM.taskReporting.taskReporting.modReportingList.commonQuery('query')"   />
							</@queryfield>
							<#assign reportDate_defaultValue  = ''>
									<#assign reportDate_defaultValue  = ''>
								<#if (reportDate_defaultValue)?? &&(reportDate_defaultValue)?has_content>
									<#assign reportDate_defaultValue  = getDefaultDateTime(reportDate_defaultValue!)?datetime>
								</#if>
							<@queryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReporting_reportDate" showFormat="YMD_HMS" defaultValue=reportDate_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReporting_reportDate_reportDate" isCustomize=true style="" > 
								<div>
							  	 	<div style="float:left;width:45%">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="reportDate_start" id="reportDate_start" exp="gequal"   formid="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" />
									</div>
									<div style="float:left;width:10%;text-align:center;line-height: 26px;"> ${getText('common.date.split')}</div>
							  	 	<div style="float:left;width:45%; *margin-left:-1px;_margin-left:-3px;">
									<@datepicker type="dateTime" cssClass="cui-noborder-input" name="reportDate_end" id="reportDate_end" exp="lequal"   formid="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" />
							  		</div>
						  		</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" type="adv" onclick="WOM.taskReporting.taskReporting.modReportingList.commonQuery('query')" onadvancedclick="advQuery('WOM.taskReporting.taskReporting.modReportingList.advquery')" /> 
						       							       	<@querybutton formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" type="pending" onclick="WOM.taskReporting.taskReporting.modReportingList.commonQuery('pending')" />
						 		<@querybutton formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</form>
</div>
<script type="text/javascript">
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["MainTableName"]="WOM_TASK_REPORTINGS";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["tableNo"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["taskID.tableNo"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_TASK_REPORTINGS,TASKID-tableNo";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["taskID.id"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_TASK_REPORTINGS,TASKID-tableNo";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["productID.productName"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["productID.productName"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["productID.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_TASK_REPORTINGS,PRODUCTID-productName";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["productID.productName"].columnName="PRODUCT_NAME";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["productID.id"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["productID.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["productID.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_TASK_REPORTINGS,PRODUCTID-productName";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["productID.id"].columnName="PRODUCT_ID";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["batchNum"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["batchNum"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["batchNum"].layRec="batchNum";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["batchNum"].columnName="BATCH_NUM";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportType"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportType"].dbColumnType="SYSTEMCODE";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportType"].layRec="reportType";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportType"].columnName="REPORT_TYPE";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportStaff.name"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportStaff.name"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportStaff.name"].layRec="base_staff,ID,WOM_TASK_REPORTINGS,REPORT_STAFF-name";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportStaff.name"].columnName="NAME";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportStaff.id"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportStaff.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportStaff.id"].layRec="base_staff,ID,WOM_TASK_REPORTINGS,REPORT_STAFF-name";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportStaff.id"].columnName="ID";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportDate"]={};
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportDate"].dbColumnType="DATETIME";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportDate"].layRec="reportDate";
ec_WOM_taskReporting_taskReporting_modReportingList_quickquery_info["reportDate"].columnName="REPORT_DATE";
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
 	var advRemainDialog = $('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"]');
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
<div style="position:relative;z-index:10;display:none;" id="WOM.taskReporting.taskReporting.modReportingList.advquery">
    <@errorbar id="adv_query_edit_bar"></@errorbar>
    <div class="advConContent">
    <form <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_taskReporting_taskReporting_modReportingList_adv_queryForm" exportUrl="/WOM/taskReporting/taskReporting/modReportingList-pending.action">
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_adv_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo" showFormat="TEXT" defaultValue=tableNo_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReporting_tableNo_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_taskReporting_TaskReporting" layRec="tableNo" columnname="TABLE_NO" columntype="TEXT" name="tableNo" fieldType="TEXTFIELD" tableName="WOM_TASK_REPORTINGS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										单据编号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_taskReporting_TaskReporting" />
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="tableNo" id="adv_tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like" />
											</div>
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_adv_queryForm" code="WOM_7.5.0.0_produceTask_ProduceTask_tableNo" showFormat="SELECTCOMP" defaultValue=taskID_tableNo_defaultValue  divCode="WOM_7.5.0.0_produceTask_ProduceTask_tableNo_taskID_tableNo" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" layRec="WOM_PRODUCE_TASKS,ID,WOM_TASK_REPORTINGS,TASKID-tableNo" columnname="TABLE_NO" columntype="TEXT" name="taskID.tableNo" fieldType="SELECTCOMP" tableName="WOM_PRODUCE_TASKS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产指令单
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_produceTask_ProduceTask" />
										<input type="hidden" id="adv_taskID.id" name="taskID.id" value="" />
												<@mneclient iframe=true mneenable=false advresume="adv_taskID.id"  isPrecise=true deValue="${taskID_tableNo_defaultValue!}" reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.taskReporting.taskReporting.modReportingList._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="adv_ec_WOM_taskReporting_taskReporting_modReportingList_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like"  classStyle="cui-noborder-input" url="/WOM/produceTask/produceTask/taskRef.action"   refViewCode="WOM_7.5.0.0_produceTask_taskRef"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReporting_modReportingList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign productID_productName_defaultValue  = ''>
									<#assign productID_productName_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_adv_queryForm" code="MESBasic_1_product_Product_productName" showFormat="SELECTCOMP" defaultValue=productID_productName_defaultValue  divCode="MESBasic_1_product_Product_productName_productID_productName" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="MESBasic_1_product_Product" layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_TASK_REPORTINGS,PRODUCTID-productName" columnname="PRODUCT_NAME" columntype="TEXT" name="productID.productName" fieldType="SELECTCOMP" tableName="S2BASE_PRODUCT"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										物品名称
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="MESBasic_1_product_Product" />
										<input type="hidden" id="adv_productID.id" name="productID.id" value="" />
												<@mneclient iframe=true mneenable=true advresume="adv_productID.id"  isPrecise=true deValue="${productID_productName_defaultValue!}" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.taskReporting.taskReporting.modReportingList._querycustomFunc('productID_productName')" name="productID.productName" id="adv_ec_WOM_taskReporting_taskReporting_modReportingList_queryForm_productID_productName" displayFieldName="productName" type="other" exp="like"  classStyle="cui-noborder-input" url="/MESBasic/product/product/refProductLayout.action"   refViewCode="MESBasic_1_product_refProductLayout"  clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReporting_modReportingList_adv_queryForm"   />
								
                                	
								</div>			
                                </div>
							</@advsqueryfield>
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
								<@advsqueryfield formId="ec_WOM_taskReporting_taskReporting_modReportingList_adv_queryForm" code="WOM_7.5.0.0_taskReporting_TaskReporting_batchNum" showFormat="TEXT" defaultValue=batchNum_defaultValue  divCode="WOM_7.5.0.0_taskReporting_TaskReporting_batchNum_batchNum" isCustomize=true > 
								
								<div class="quick_query_node" style="width:49%;">
								<input type="hidden" class="adv_cond" modelcode="WOM_7.5.0.0_taskReporting_TaskReporting" layRec="batchNum" columnname="BATCH_NUM" columntype="TEXT" name="batchNum" fieldType="TEXTFIELD" tableName="WOM_TASK_REPORTINGS"/>
								<label class="quick_query_label advQuery_label">
								<span class="quick_query_text">
										生产批号
								</span>
								</label>
							<div class="quick_query_content advQuery_content">
							
								<input type="hidden" id="modelCode" modelcode="WOM_7.5.0.0_taskReporting_TaskReporting" />
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
			viewCode: 'WOM_7.5.0.0_taskReporting_modReportingList',
			modelCode: 'WOM_7.5.0.0_taskReporting_TaskReporting',
			modelName: 'TaskReporting',
			formId: 'ec_WOM_taskReporting_taskReporting_modReportingList_queryForm',
			olddiv: 'WOM.taskReporting.taskReporting.modReportingList.advquery',
			values: values,
			
			layoutName: ''
		});
}

ec.view.newAdvQuery._customQuery= function(){
	$("[id='WOM.taskReporting.taskReporting.modReportingList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_taskReporting_modReportingList'+"&entity.code="+'WOM_7.5.0.0_taskReporting';
		 $.ajax({
		 url: url, 
		 cache: false,
		 async: false,
		 success:function(html){ 
		 	$("[id='WOM.taskReporting.taskReporting.modReportingList.advquery'] #customquContent").html(html);
		 	$("[id='WOM.taskReporting.taskReporting.modReportingList.advquery'] #advQueryLoading").hide();
		 }
	});
	onceOpen = true;
	ec.advQuery._renderOverFlag=true;
}
function customQuery(){
	$("[id='WOM.taskReporting.taskReporting.modReportingList.advquery'] #advQueryLoading").show();
	var url="/ec/advQuery/advconfig.action?view.code="+'WOM_7.5.0.0_taskReporting_modReportingList'+"&entity.code="+'WOM_7.5.0.0_taskReporting';
		 $.ajax({
		 url: url, 
		 cache: false,
		 success:function(html){ 
			 $("[id='WOM.taskReporting.taskReporting.modReportingList.advquery'] #customquContent").html(html);
			 $("[id='WOM.taskReporting.taskReporting.modReportingList.advquery'] #advQueryLoading").hide();
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
		$('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] div.customqu-content').css('display','none');
		$('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] div.move-grade').css('display','none');
		// $('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -61px no-repeat');
		$('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] span.customQuery').removeClass("customQuery_down").addClass("customQuery_up");											
		$('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] div.advConContent').css('height','400px');		
		showType = "down";
	}else{
		$('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] div.customqu-content').css('display','block');
		$('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] div.move-grade').css('display','block');
		// $('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] span.customQuery').css('background','url("/bap/struts/css/icon_adv.png") 0 -144px no-repeat');
		$('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] span.customQuery').removeClass("customQuery_up").addClass("customQuery_down");						
		$('[id="WOM.taskReporting.taskReporting.modReportingList.advquery"] div.advConContent').css('height','130px');
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
<#assign datatable_queryFunc = "WOM.taskReporting.taskReporting.modReportingList.query('goList')">
<#assign datatable_dataUrl = "/WOM/taskReporting/taskReporting/modReportingList-pending.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.taskReporting.taskReporting.modReportingList.query('query')">
<#assign datatable_dataUrl = "/WOM/taskReporting/taskReporting/modReportingList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<#if false && isIE>
<#assign routeFlag = "1">
<#assign datatable_dataUrl = datatable_dataUrl + "&page.paging=false">
<#else>
<#assign routeFlag = "0">
</#if>
<@datatable  colAdminFlag=colAdmFlag   id="ec_WOM_taskReporting_taskReporting_modReportingList_query" renderOverEvent="ec_WOM_taskReporting_taskReporting_modReportingList_RenderOverEvent" pageInitMethod="ec_WOM_taskReporting_taskReporting_modReportingList_PageInitMethod" modelCode="WOM_7.5.0.0_taskReporting_TaskReporting" noPermissionKeys="tableNo,taskID.tableNo,productID.productCode,productID.productName,batchNum,reportStaff.name,reportDate,reportType,remark" hidekeyPrefix="ec_WOM_taskReporting_taskReporting_modReportingList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_taskReporting_taskReporting_modReportingList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true lockColumnCount="" dblclick="WOM.taskReporting.taskReporting.modReportingList.rowDblClick" style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','layRec','valid','cid','pending.id','pending.deploymentId','pending.activityName','pending.bulkDealFlag','pending.processDescription','pending.processKey','pending.processVersion','pending.activityType','pending.processId','pending.openUrl','pending.userId','tableInfoId','status','reportType.id','taskID.id','productID.id','reportStaff.id']" postData="&pending-beginDate=${pendingBeginDate!''}&pending-endDate=${pendingEndDate!''}&businessCenterCode=${businessCenterCode!''}&mainBusinessId=${mainBusinessId!}&activityName=${activityName!}&processKey=${processKey!}&flowBulkFlag=${((flowBulkFlag!false)?string('true','false'))!}&${listCustomCondition!}&${listFirstCustomCond!}&permissionCode=${permissionCode!''}" throwError="WOM.taskReporting.taskReporting.modReportingList.showErrorMsg"   >
		<#if isContainsWorkflow('WOM_7.5.0.0_taskReporting_modReportingList')==true>
			<@operatebar operateType="FLOW" menuCode="${workFlowMenuCode!}" entityCode="WOM_7.5.0.0_taskReporting" businessParam="${businessParam!}" resultType="JSON" >
			</@operatebar>
		</#if>
					<#if (flowBulkFlag?? && flowBulkFlag==true)  >
	    				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
	    			</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=190   type="textfield"  click="function(cell){WOM.taskReporting.taskReporting.modReportingList.rowDblClick(null,cell);}"   showFormatFunc="" cssstyle="" />
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn columnName="TABLE_NO"    showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.common.tableNo1111')}" textalign="left"  width=190   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productID_productCode_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_CODE"    showFormat="TEXT" defaultDisplay="${productID_productCode_displayDefaultType!}"  key="productID.productCode"   label="${getText('WOM.propertydisplayName.radion1415772644833dd')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign productID_productName_displayDefaultType  = ''>
			<@datacolumn columnName="PRODUCT_NAME"    showFormat="TEXT" defaultDisplay="${productID_productName_displayDefaultType!}"  key="productID.productName"   label="${getText('WOM.propertydisplayName.radion14157727407377788')}" textalign="left"  width=100   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn columnName="BATCH_NUM"    showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1490772885990')}" textalign="left"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign reportStaff_name_displayDefaultType  = ''>
			<@datacolumn columnName="NAME"    showFormat="TEXT" defaultDisplay="${reportStaff_name_displayDefaultType!}"  key="reportStaff.name"   label="${getText('WOM.staff.dimissionStaff_xls.staffName0000')}" textalign="left"  width=80   type="textfield"    showFormatFunc="" cssstyle="" />
			<#assign reportDate_displayDefaultType  = ''>
			<@datacolumn columnName="REPORT_DATE"    showFormat="YMD_HM" defaultDisplay="${reportDate_displayDefaultType!}"  key="reportDate"   label="${getText('WOM.propertydisplayName.randon1490787728846')}" textalign="center"  width=120   type="datetime"    showFormatFunc="" cssstyle="" />
			<#assign reportType_displayDefaultType  = ''>
			<@datacolumn columnName="REPORT_TYPE"    showFormat="SELECTCOMP" defaultDisplay="${reportType_displayDefaultType!}"  key="reportType.value"   label="${getText('WOM.propertydisplayName.randon1490773072845')}" textalign="center"  width=100   type="systemcode"    showFormatFunc="" cssstyle="" />
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_taskReporting_TaskReporting", "WOM_7.5.0.0_taskReporting_modReportingList", "LIST", "taskReporting")>
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
				<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTask", "WOM_7.5.0.0_taskReporting_modReportingList", "LIST", "taskReporting.taskID||WOM_PRODUCE_TASKS,ID,WOM_TASK_REPORTINGS,TASKID")>
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
			<@datacolumn columnName="REMARK"    showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1490773089261')}" textalign="center"  width=150   type="textfield"    showFormatFunc="" cssstyle="" />
		<@datacolumn key="pending.taskDescription" sortable=false label="${getText('ec.list.taskDescription')}"  width=120/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_taskReporting_taskReporting_modReportingList_RenderOverEvent(){
}
function ec_WOM_taskReporting_taskReporting_modReportingList_PageInitMethod(){
}
	
	
	
	
	
	
	
	
	
	
	
</script>