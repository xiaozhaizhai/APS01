
<script type="text/javascript">
	CUI.ns("WOM.taskReporting.taskReporting","WOM.taskReporting.taskReporting.taskReportingRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_taskReporting_taskReporting_taskReportingRef_callBackFuncName" id="WOM_taskReporting_taskReporting_taskReportingRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490772713348')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" exportUrl="/WOM/taskReporting/taskReporting/taskReportingRef-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" />
		<input type="hidden" reset="false" name="WOM_taskReporting_taskReporting_taskReportingRef_condition" id="WOM_taskReporting_taskReporting_taskReportingRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490772767048')}_${getText('WOM.viewtitle.randon1495093797243')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" formId="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" idprefix="ec_WOM_taskReporting_taskReporting_taskReportingRef" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_taskReporting_TaskReporting_tableNo_tableNo:ec.common.tableNo||WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.common.tableNo1111||MESBasic_1_product_Product_productName_productID_productName:WOM.propertydisplayName.radion1415772740737333344||WOM_7_5_0_0_taskReporting_TaskReporting_batchNum_batchNum:WOM.propertydisplayName.randon1490772885990||WOM_7_5_0_0_taskReporting_TaskReporting_reportType_reportType:WOM.propertydisplayName.randon1490773072845||base_staff_name_reportStaff_name:WOM.propertydisplayName.randon1490772995868||WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_reportDate:WOM.propertydisplayName.randon1490787728846" >
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_taskReporting_TaskReporting_tableNo_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_taskReporting_TaskReporting_tableNo_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('ec.common.tableNo')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.common.tableNo1111')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.taskReporting.taskReporting.taskReportingRef._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="form-control" url="/WOM/produceTask/produceTask/taskRef.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" searchClick="WOM.taskReporting.taskReporting.taskReportingRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign productID_productName_defaultValue  = ''>
									<#assign productID_productName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productName_productID_productName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productName_productID_productName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.radion1415772740737333344')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="productID.id" name="productID.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  conditionfunc="WOM.taskReporting.taskReporting.taskReportingRef._querycustomFunc('productID_productName')" name="productID.productName" id="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm_productID_productName" displayFieldName="productName" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" searchClick="WOM.taskReporting.taskReporting.taskReportingRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign batchNum_defaultValue  = ''>
									<#assign batchNum_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_taskReporting_TaskReporting_batchNum_batchNum" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_taskReporting_TaskReporting_batchNum_batchNum">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1490772885990')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="batchNum" id="batchNum" value="${batchNum_defaultValue!}" deValue="${batchNum_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign reportType_defaultValue  = ''>
									<#assign reportType_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_taskReporting_TaskReporting_reportType_reportType" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_taskReporting_TaskReporting_reportType_reportType">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1490773072845')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${reportType_defaultValue}"   name="reportType" code="womReportType" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
							<#assign reportStaff_name_defaultValue  = ''>
									<#assign reportStaff_name_defaultValue  = ''>
							<div  field-unique-code="base_staff_name_reportStaff_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "base_staff_name_reportStaff_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1490772995868')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="reportStaff.id" name="reportStaff.id" value="" />
												<#if (reportStaff_name_defaultValue)=='currentUser'>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany value="${Session.staff.name}" deValue="currentUser" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.taskReporting.taskReporting.taskReportingRef._querycustomFunc('reportStaff_name')" name="reportStaff.name" id="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm_reportStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" searchClick="WOM.taskReporting.taskReporting.taskReportingRef.commonQuery('query')" />
													<script type="text/javascript">
													(function($){
														$(function(){
															CUI('#reportStaff.id').val('${Session.staff.id}');
														});
													})(jQuery);
													</script>
												<#else>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.taskReporting.taskReporting.taskReportingRef._querycustomFunc('reportStaff_name')" name="reportStaff.name" id="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm_reportStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" searchClick="WOM.taskReporting.taskReporting.taskReportingRef.commonQuery('query')" />
												</#if>
											
									</div>			
								</div>
							</div>
							<#assign reportDate_defaultValue  = ''>
									<#assign reportDate_defaultValue  = ''>
								<#assign reportDate_defaultValue  = ''>
							<div mobi-dropdown-group="reportDate" field-unique-code="WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_reportDate" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_reportDate">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1490787728846')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTime" cssClass="form-control right-border-radius" value="${reportDate_defaultValue!}" deValue="${reportDate_defaultValue!}"  name="reportDate_start" id="reportDate_start" exp="gequal"   formid="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="reportDate" field-unique-code="WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_reportDate" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_taskReporting_TaskReporting_reportDate_reportDate">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('WOM.propertydisplayName.randon1490787728846')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTime" cssClass="form-control right-border-radius" value="${reportDate_defaultValue!}" deValue="${reportDate_defaultValue!}"  name="reportDate_end" id="reportDate_end" exp="lequal"   formid="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" type="search" onclick="WOM.taskReporting.taskReporting.taskReportingRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm' );
		if( buttons.length > 0 ){
			// 去掉按钮间的空格
			var parentNode = buttons.parent()[0];
			var textNodes = [];
			for ( var i = 0, l = parentNode.childNodes.length; i < l; i++ ) { 
				// 文本节点
				if ( parentNode.childNodes[i].nodeType == 3  ) { 
					textNodes.push( parentNode.childNodes[i] ); 
				} 
			}
			for ( var i = 0, l = textNodes.length; i < l; i++ ) { 
				textNodes[i].parentNode.removeChild( textNodes[i] );
			}
			// 设置样式
			buttons.addClass( "btn-center" );
			buttons.first().removeClass( "btn-center" ).addClass( "btn-left" );
			buttons.last().removeClass( "btn-center" ).addClass( "btn-right" );
			
			switch( buttons.length ){
				case 2:
					buttons.css( 'width', '50%' );
					break;
				case 3:
					buttons.css( 'width', '33.3%' );
					break;
				case 4:
					buttons.css( 'width', '25%' );
					break;
				case 5:
					buttons.css( 'width', '20%' );
					break;
			}
			
			$(document.body).css( 'visibility', 'visible');
			
			buttons.unbind( 'touchstart.changeStyle' ).unbind( 'touchend.changeStyle' ).bind( {
				'touchstart.changeStyle': function ( ) {
					$(this).addClass('touch-style');
				},
				'touchend.changeStyle': function ( ) {
					var self = $(this);
					setTimeout( function ( ) {
						self.removeClass('touch-style');
					}, 200)
				}
			} )
		}	
	})

ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["tableNo"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["taskID.tableNo"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_TASK_REPORTINGS,TASKID-tableNo";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["taskID.id"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_TASK_REPORTINGS,TASKID-tableNo";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["productID.productName"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["productID.productName"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["productID.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_TASK_REPORTINGS,PRODUCTID-productName";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["productID.productName"].columnName="PRODUCT_NAME";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["productID.id"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["productID.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["productID.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_TASK_REPORTINGS,PRODUCTID-productName";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["productID.id"].columnName="ID";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["batchNum"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["batchNum"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["batchNum"].layRec="batchNum";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["batchNum"].columnName="BATCH_NUM";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportType"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportType"].dbColumnType="SYSTEMCODE";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportType"].layRec="reportType";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportType"].columnName="REPORT_TYPE";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportStaff.name"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportStaff.name"].dbColumnType="TEXT";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportStaff.name"].layRec="base_staff,ID,WOM_TASK_REPORTINGS,REPORT_STAFF-name";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportStaff.name"].columnName="NAME";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportStaff.id"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportStaff.id"].dbColumnType="LONG";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportStaff.id"].layRec="base_staff,ID,WOM_TASK_REPORTINGS,REPORT_STAFF-name";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportStaff.id"].columnName="ID";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportDate"]={};
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportDate"].dbColumnType="DATETIME";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportDate"].layRec="reportDate";
ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["reportDate"].columnName="REPORT_DATE";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.taskReporting.taskReporting.taskReportingRef.query('query')">
<#assign datatable_dataUrl = "/WOM/taskReporting/taskReporting/taskReportingRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.taskReporting.taskReporting.taskReportingRef.query('query')">
<#assign datatable_dataUrl = "/WOM/taskReporting/taskReporting/taskReportingRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_WOM_taskReporting_taskReporting_taskReportingRef_query" renderOverEvent="ec_WOM_taskReporting_taskReporting_taskReportingRef_RenderOverEvent"  modelCode="WOM_7.5.0.0_taskReporting_TaskReporting" noPermissionKeys="tableNo,taskID.tableNo,productID.productCode,productID.productName,batchNum,reportStaff.name,reportDate,reportType" hidekeyPrefix="ec_WOM_taskReporting_taskReporting_taskReportingRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','reportType.id','taskID.id','productID.id','reportStaff.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=190   type="textfield"    showFormatFunc=""/>
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.common.tableNo1111')}" textalign="left"  width=190   type="textfield"    click="function(cell){WOM.taskReporting.taskReporting.taskReportingRef.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc=""/>
			<#assign productID_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productID_productCode_displayDefaultType!}"  key="productID.productCode"   label="${getText('WOM.propertydisplayName.radion1415772644833dd')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productID_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productID_productName_displayDefaultType!}"  key="productID.productName"   label="${getText('WOM.propertydisplayName.radion14157727407377788')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1490772885990')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign reportStaff_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${reportStaff_name_displayDefaultType!}"  key="reportStaff.name"   label="${getText('WOM.staff.dimissionStaff_xls.staffName0000')}" textalign="left"  width=80   type="textfield"    showFormatFunc=""/>
			<#assign reportDate_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HM" defaultDisplay="${reportDate_displayDefaultType!}"  key="reportDate"   label="${getText('WOM.propertydisplayName.randon1490787728846')}" textalign="center"  width=120   type="datetime"    showFormatFunc=""/>
			<#assign reportType_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${reportType_displayDefaultType!}"  key="reportType.value"   label="${getText('WOM.propertydisplayName.randon1490773072845')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_taskReporting_taskReporting_taskReportingRef_RenderOverEvent(){
}
	
	
	
	
	
	
	
	
</script>			</div>
		</div>
	</div>
	
</div>
	
<div id="load-mask" class="modal-backdrop fade in bg" style="display:none;overflow:auto;background-color:#000;opacity:0.6;filter: alpha(opacity=60);">
	<div style="position:absolute;top:50%;left:50%;width:50px;height:50px;margin-top:-10px;margin-left:-25px;">
		<img src="/bap/struts/mobile/img/loading.gif" width="48" height="48"/>
	</div>
</div>

<script type="text/javascript">
	/**
	 * 查询
	 * @method WOM.taskReporting.taskReporting.taskReportingRef.query
	 */
	WOM.taskReporting.taskReporting.taskReportingRef.query = function(type,pageNo){
		var node = WOM.taskReporting.taskReporting.taskReportingRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.taskReporting.taskReporting.taskReportingRef.node = null;
		if(!checkListValid("ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/taskReporting/taskReporting/taskReportingRef-query.action";
		CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_taskReporting_taskReportingRef";
		condobj.modelAlias="taskReporting";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info[fieldName].dbColumnType;
						if(fastCol.endsWith('_start')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 00:00:00";
								} else if(dateType == 'year') {
									fastColValue += "-01-01 00:00:00";
								} else if(dateType == 'yearMonth') {
									fastColValue += "-01 00:00:00";
								}
							}
							fieldObj.operator=">=";
							fieldObj.paramStr="?";
						}else if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 23:59:59";
								} else if(dateType == 'year') {
									fastColValue += "-12-31 23:59:59";
								} else if(dateType == 'yearMonth') {
									var str = fastColValue.split("-");
									var lastDay = new Date(str[0],str[1],0).getDate();
									fastColValue += "-" + str[1] + "-" + lastDay + " 23:59:59";
								}
							}
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm *[name="'+ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info["MainTableName"];
								}
								fieldObj.operator="=includeCustSub#"+tableName;
								fieldObj.paramStr="?";
							}else{
								var exp=CUI(this).attr('exp');
								var caseSensitive=CUI(this).attr('caseSensitive');
								if(exp=="equal"){
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}else if(exp=="unequal"){
									fieldObj.operator="<>";
									fieldObj.paramStr="?";
								}else if(exp=="llike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="?%";
								}else if(exp=="rlike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?";
								}else if(exp=="like"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?%";
								}else{
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}
							}
						}
						fieldObj.value=fastColValue;
						var layrec=ec_WOM_taskReporting_taskReporting_taskReportingRef_quickquery_info[fieldName].layRec;
						if(layrec.indexOf("-")>1){
							generateChainCond(condobj,layrec.split("-"),fieldObj);						
						}else{
							condobj.subconds.push(fieldObj);
						}
					}else{
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(fastColValue));
					}
				}
			}
		});
		if(type != "adv") {
			dataPost += "&fastQueryCond="+encodeURIComponent(JSON.stringify(condobj));
			//把fastQueryCond的值赋到一个隐藏的对话框，导出的时候使用
			$('#excelQueryCond').val(JSON.stringify(condobj));
		}
		var pageSize=CUI('input[name="ec_WOM_taskReporting_taskReporting_taskReportingRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_taskReporting_taskReporting_taskReportingRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_taskReporting_taskReportingRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_taskReporting_taskReporting_taskReportingRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.taskReporting.taskReporting.taskReportingRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.taskReporting.taskReporting.taskReportingRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.taskReporting.taskReporting.taskReportingRef._prefix += '.';
			}
			WOM.taskReporting.taskReporting.taskReportingRef._prefix += arr[i];
		}
		WOM.taskReporting.taskReporting.taskReportingRef._suffix = arr[arr.length -1];
		if(WOM.taskReporting.taskReporting.taskReportingRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.taskReporting.taskReporting.taskReportingRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.taskReporting.taskReporting.taskReportingRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.taskReporting.taskReporting.taskReportingRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.taskReporting.taskReporting.taskReportingRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm *[name="'+WOM.taskReporting.taskReporting.taskReportingRef._prefix + '.' + WOM.taskReporting.taskReporting.taskReportingRef._suffix +'"]').val(obj[0][WOM.taskReporting.taskReporting.taskReportingRef._suffix]);
		CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm *[name="'+WOM.taskReporting.taskReporting.taskReportingRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm *[name^="'+WOM.taskReporting.taskReporting.taskReportingRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm *[name="'+WOM.taskReporting.taskReporting.taskReportingRef._prefix + '.' + WOM.taskReporting.taskReporting.taskReportingRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_taskReporting_taskReporting_taskReportingRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.taskReporting.taskReporting.taskReportingRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.taskReporting.taskReporting.taskReportingRef.query_"+obj+")!='undefined'") ? eval('WOM.taskReporting.taskReporting.taskReportingRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_taskReporting_taskReporting_taskReportingRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_taskReporting_taskReporting_taskReportingRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.taskReporting.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_taskReporting_taskReporting_taskReportingRef_callBackFuncName").val() != ""){
				eval(CUI("#WOM_taskReporting_taskReporting_taskReportingRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_taskReporting_taskReporting_taskReportingRef_refresh = function(node){
	//var url = "/WOM/taskReporting/taskReporting/taskReportingRef-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_taskReporting_taskReporting_taskReportingRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_taskReporting_taskReporting_taskReportingRef_query.setRequestDataUrl(url,'',false);
	//}
	WOM.taskReporting.taskReporting.taskReportingRef.node = node;
	WOM.taskReporting.taskReporting.taskReportingRef.query("query");
}

WOM_taskReporting_taskReporting_taskReportingRef_getList = function() {
	return "WOM.taskReporting.taskReporting.taskReportingRef";
}

	WOM.taskReporting.taskReporting.taskReportingRef.commonQuery = function(type) {
	  if(typeof WOM.taskReporting.taskReporting.taskReportingRef.cancelSelectedNode == 'function') {
	   WOM.taskReporting.taskReporting.taskReportingRef.cancelSelectedNode();
	  }
	  WOM.taskReporting.taskReporting.taskReportingRef.query(type);
	 };
	
	

WOM.taskReporting.taskReporting.taskReportingRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.taskReporting.taskReporting.taskReportingRef.otherParams = {};
	WOM.taskReporting.taskReporting.taskReportingRef.otherParams.dialogType = dialogType;
	WOM.taskReporting.taskReporting.taskReportingRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.taskReporting.taskReporting.taskReportingRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="reportDate_start"]').val()!= null && $('#' + formId + ' input[name^="reportDate_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="reportDate_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1490787728846')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="reportDate_end"]').val()!= null && $('#' + formId + ' input[name^="reportDate_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="reportDate_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1490787728846')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="reportDate_start"]').val()!='' && $('#' + formId + ' input[name="reportDate_end"]').val()!=''){if($('#' + formId + ' input[name="reportDate_start"]').val() > $('#' + formId + ' input[name="reportDate_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1490787728846')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1490787728846')}${getText('ec.list.validate.start')}");return false;}}return true;};





	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_taskReporting_taskReportingRef,js,WOM_7.5.0.0_taskReporting_TaskReporting,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
