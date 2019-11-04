
<script type="text/javascript">
	CUI.ns("WOM.batchingMaterial.batchingMaterial","WOM.batchingMaterial.batchingMaterial.batMaterialShowRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_callBackFuncName" id="WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1491789700218')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" exportUrl="/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" />
		<input type="hidden" reset="false" name="WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_condition" id="WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1491789782377')}_${getText('WOM.viewtitle.randon1492136203126')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" idprefix="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_batchingMaterial_BatchingMaterial_tableNo_tableNo:ec.common.tableNo||WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.propertydisplayName.randon1490613814833||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.radion141577264483344556||base_staff_name_orderStaff_name:WOM.staff.dimissionStaff_xls.staffName335||WOM_7_5_0_0_batchingMaterial_BatchingMaterial_arriveTime_arriveTime:WOM.propertydisplayName.randon1491789966310||WOM_7_5_0_0_batchingMaterial_BatchingMaterial_state_state:WOM.propertydisplayName.randon1491790319028" >
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterial_tableNo_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterial_tableNo_tableNo">mobi-dropdown-active</#if>"> 
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
										${getText('WOM.propertydisplayName.randon1490613814833')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="form-control" url="/WOM/produceTask/produceTask/taskRef.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_productId_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_productId_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.radion141577264483344556')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign orderStaff_name_defaultValue  = ''>
									<#assign orderStaff_name_defaultValue  = ''>
							<div  field-unique-code="base_staff_name_orderStaff_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "base_staff_name_orderStaff_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.staff.dimissionStaff_xls.staffName335')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="orderStaff.id" name="orderStaff.id" value="" />
												<#if (orderStaff_name_defaultValue)=='currentUser'>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany value="${Session.staff.name}" deValue="currentUser" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('orderStaff_name')" name="orderStaff.name" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_orderStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery('query')" />
													<script type="text/javascript">
													(function($){
														$(function(){
															CUI('#orderStaff.id').val('${Session.staff.id}');
														});
													})(jQuery);
													</script>
												<#else>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc('orderStaff_name')" name="orderStaff.name" id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm_orderStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery('query')" />
												</#if>
											
									</div>			
								</div>
							</div>
							<#assign arriveTime_defaultValue  = ''>
									<#assign arriveTime_defaultValue  = ''>
								<#assign arriveTime_defaultValue  = ''>
							<div mobi-dropdown-group="arriveTime" field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterial_arriveTime_arriveTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterial_arriveTime_arriveTime">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1491789966310')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTime" cssClass="form-control right-border-radius" value="${arriveTime_defaultValue!}" deValue="${arriveTime_defaultValue!}"  name="arriveTime_start" id="arriveTime_start" exp="gequal"   formid="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="arriveTime" field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterial_arriveTime_arriveTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterial_arriveTime_arriveTime">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('WOM.propertydisplayName.randon1491789966310')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTime" cssClass="form-control right-border-radius" value="${arriveTime_defaultValue!}" deValue="${arriveTime_defaultValue!}"  name="arriveTime_end" id="arriveTime_end" exp="lequal"   formid="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterial_state_state" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterial_state_state">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1491790319028')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${state_defaultValue}"   name="state" code="womBatOrderState" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" type="search" onclick="WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm' );
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

ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["tableNo"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.tableNo"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIALS,TASKID-tableNo";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.id"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIALS,TASKID-tableNo";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.productCode"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIALS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.id"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIALS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["productId.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.name"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.name"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.name"].layRec="base_staff,ID,WOM_BATCHING_MATERIALS,ORDER_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.name"].columnName="NAME";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.id"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.id"].layRec="base_staff,ID,WOM_BATCHING_MATERIALS,ORDER_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["orderStaff.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["arriveTime"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["arriveTime"].dbColumnType="DATETIME";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["arriveTime"].layRec="arriveTime";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["arriveTime"].columnName="ARRIVE_TIME";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["state"]={};
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["state"].dbColumnType="SYSTEMCODE";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["state"].layRec="state";
ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["state"].columnName="STATE";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query" renderOverEvent="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_RenderOverEvent"  modelCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial" noPermissionKeys="tableNo,orderStaff.name,createTime,taskID.tableNo,productId.productCode,productId.productName,needPartId.offerSystem,needNum,doneNum,arriveTime,state,remark" hidekeyPrefix="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','needPartId.offerSystem.id','state.id','orderStaff.id','taskID.id','productId.id','needPartId.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign orderStaff_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${orderStaff_name_displayDefaultType!}"  key="orderStaff.name"   label="${getText('WOM.staff.dimissionStaff_xls.staffName334')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('WOM.common.createTime324567')}" textalign="center"  width=150   type="datetime"    showFormatFunc=""/>
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.propertydisplayName.randon1490605002360')}" textalign="center"  width=150   type="textfield"    click="function(cell){WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc=""/>
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion1415772644833222')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737334')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign needPartId_offerSystem_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${needPartId_offerSystem_displayDefaultType!}"  key="needPartId.offerSystem.value"   label="${getText('WOM.propertydisplayName.randon1490614163532')}" textalign="left"  width=80   type="systemcode"    showFormatFunc=""/>
			<#assign needNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${needNum_displayDefaultType!}"  key="needNum"   label="${getText('WOM.propertydisplayName.randon14917899223367')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc=""/>
			<#assign doneNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${doneNum_displayDefaultType!}"  key="doneNum"   label="${getText('WOM.propertydisplayName.randon1491789944047')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc=""/>
			<#assign arriveTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HMS" defaultDisplay="${arriveTime_displayDefaultType!}"  key="arriveTime"   label="${getText('WOM.propertydisplayName.randon1491789966310')}" textalign="center"  width=150   type="datetime"    showFormatFunc=""/>
			<#assign state_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('WOM.propertydisplayName.randon1491790319028')}" textalign="left"  width=60   type="systemcode"    showFormatFunc=""/>
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1491790056696')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_RenderOverEvent(){
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
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query = function(type,pageNo){
		var node = WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.node = null;
		if(!checkListValid("ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef-query.action";
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_batchingMaterial_batMaterialShowRef";
		condobj.modelAlias="batchingMaterial";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm *[name="'+ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_batchingMaterial_batMaterialShowRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._prefix += '.';
			}
			WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._prefix += arr[i];
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._suffix = arr[arr.length -1];
		if(WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm *[name="'+WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._prefix + '.' + WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._suffix +'"]').val(obj[0][WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._suffix]);
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm *[name="'+WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm *[name^="'+WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm *[name="'+WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._prefix + '.' + WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.batchingMaterial.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_callBackFuncName").val() != ""){
				eval(CUI("#WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_refresh = function(node){
	//var url = "/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_query.setRequestDataUrl(url,'',false);
	//}
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.node = node;
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query("query");
}

WOM_batchingMaterial_batchingMaterial_batMaterialShowRef_getList = function() {
	return "WOM.batchingMaterial.batchingMaterial.batMaterialShowRef";
}

	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.commonQuery = function(type) {
	  if(typeof WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.cancelSelectedNode == 'function') {
	   WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.cancelSelectedNode();
	  }
	  WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.query(type);
	 };
	
	

WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.otherParams = {};
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.otherParams.dialogType = dialogType;
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="arriveTime_start"]').val()!= null && $('#' + formId + ' input[name^="arriveTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="arriveTime_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="arriveTime_end"]').val()!= null && $('#' + formId + ' input[name^="arriveTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="arriveTime_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="arriveTime_start"]').val()!='' && $('#' + formId + ' input[name="arriveTime_end"]').val()!=''){if($('#' + formId + ' input[name="arriveTime_start"]').val() > $('#' + formId + ' input[name="arriveTime_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.start')}");return false;}}return true;};




(function($){
	$(function(){
		$(".ewc-dialog-button-right :eq(0)").remove();
	});
})(jQuery);

	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_batchingMaterial_batMaterialShowRef,js,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码
                        /**
	 * 双击事件
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.sendBackbatMaterialShowRef
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialShowRef.sendBackbatMaterialShowRef = function(event, oRow) {}
/* CUSTOM CODE END */
	</script>
  </body>
</html>
