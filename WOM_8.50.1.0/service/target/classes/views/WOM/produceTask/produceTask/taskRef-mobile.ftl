
<script type="text/javascript">
	CUI.ns("WOM.produceTask.produceTask","WOM.produceTask.produceTask.taskRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_produceTask_produceTask_taskRef_callBackFuncName" id="WOM_produceTask_produceTask_taskRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_produceTask_produceTask_taskRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_produceTask_taskRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_produceTask_produceTask_taskRef_queryForm" exportUrl="/WOM/produceTask/produceTask/taskRef-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" />
		<input type="hidden" reset="false" name="WOM_produceTask_produceTask_taskRef_condition" id="WOM_produceTask_produceTask_taskRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489657901718')}_${getText('WOM.viewtitle.randon1489737198145')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_produceTask_taskRef_queryForm" formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" idprefix="ec_WOM_produceTask_produceTask_taskRef" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_produceTask_ProduceTask_tableNo_tableNo:ec.common.tableNo||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.randon1490772847738||WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_productBatchNum:WOM.propertydisplayName.randon1489668325364||RM_7_5_0_0_formula_Formula_code_formularId_code:WOM.propertydisplayName.randon1489669324447||MESBasic_1_factoryModel_FactoryModel_name_factoryId_name:WOM.propertydisplayName.randonpl5||WOM_7_5_0_0_produceTask_ProduceTask_planStartTime_planStartTime:WOM.propertydisplayName.randon1489669409811||WOM_7_5_0_0_produceTask_ProduceTask_planEndTime_planEndTime:WOM.propertydisplayName.randon1489669527423" >
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_tableNo_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_tableNo_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('ec.common.tableNo')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_productId_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_productId_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1490772847738')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.produceTask.produceTask.taskRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_produceTask_produceTask_taskRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" searchClick="WOM.produceTask.produceTask.taskRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign productBatchNum_defaultValue  = ''>
									<#assign productBatchNum_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_productBatchNum" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_productBatchNum">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1489668325364')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="productBatchNum" id="productBatchNum" value="${productBatchNum_defaultValue!}" deValue="${productBatchNum_defaultValue!}"   exp="equal"/>
											
									</div>			
								</div>
							</div>
							<#assign formularId_code_defaultValue  = ''>
									<#assign formularId_code_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_Formula_code_formularId_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_code_formularId_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1489669324447')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="formularId.id" name="formularId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('RM.viewtitle.randon1488246963795')}"  conditionfunc="WOM.produceTask.produceTask.taskRef._querycustomFunc('formularId_code')" name="formularId.code" id="ec_WOM_produceTask_produceTask_taskRef_queryForm_formularId_code" displayFieldName="code" type="other" exp="equal" classStyle="form-control" url="/RM/formula/formula/formulaRef.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" searchClick="WOM.produceTask.produceTask.taskRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign factoryId_name_defaultValue  = ''>
									<#assign factoryId_name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_factoryModel_FactoryModel_name_factoryId_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_factoryModel_FactoryModel_name_factoryId_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randonpl5')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="factoryId.id" name="factoryId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="WOM.produceTask.produceTask.taskRef._querycustomFunc('factoryId_name')" name="factoryId.name" id="ec_WOM_produceTask_produceTask_taskRef_queryForm_factoryId_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" searchClick="WOM.produceTask.produceTask.taskRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign planStartTime_defaultValue  = ''>
									<#assign planStartTime_defaultValue  = ''>
								<#assign planStartTime_defaultValue  = ''>
							<div mobi-dropdown-group="planStartTime" field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_planStartTime_planStartTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_planStartTime_planStartTime">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1489669409811')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${planStartTime_defaultValue!}" deValue="${planStartTime_defaultValue!}"  name="planStartTime_start" id="planStartTime_start" exp="gequal"   formid="ec_WOM_produceTask_produceTask_taskRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="planStartTime" field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_planStartTime_planStartTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_planStartTime_planStartTime">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('WOM.propertydisplayName.randon1489669409811')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${planStartTime_defaultValue!}" deValue="${planStartTime_defaultValue!}"  name="planStartTime_end" id="planStartTime_end" exp="lequal"   formid="ec_WOM_produceTask_produceTask_taskRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
							<#assign planEndTime_defaultValue  = ''>
									<#assign planEndTime_defaultValue  = ''>
								<#assign planEndTime_defaultValue  = ''>
							<div mobi-dropdown-group="planEndTime" field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_planEndTime_planEndTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_planEndTime_planEndTime">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1489669527423')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${planEndTime_defaultValue!}" deValue="${planEndTime_defaultValue!}"  name="planEndTime_start" id="planEndTime_start" exp="gequal"   formid="ec_WOM_produceTask_produceTask_taskRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="planEndTime" field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_planEndTime_planEndTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_planEndTime_planEndTime">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('WOM.propertydisplayName.randon1489669527423')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${planEndTime_defaultValue!}" deValue="${planEndTime_defaultValue!}"  name="planEndTime_end" id="planEndTime_end" exp="lequal"   formid="ec_WOM_produceTask_produceTask_taskRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" type="search" onclick="WOM.produceTask.produceTask.taskRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_produceTask_produceTask_taskRef_queryForm' );
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

ec_WOM_produceTask_produceTask_taskRef_quickquery_info={};
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
ec_WOM_produceTask_produceTask_taskRef_quickquery_info["productId.id"].columnName="ID";
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
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.produceTask.taskRef.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTask/taskRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.produceTask.taskRef.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/produceTask/taskRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_WOM_produceTask_produceTask_taskRef_query" renderOverEvent="ec_WOM_produceTask_produceTask_taskRef_RenderOverEvent"  modelCode="WOM_7.5.0.0_produceTask_ProduceTask" noPermissionKeys="tableNo,productId.productCode,productId.productName,productNum,productBatchNum,workType,formularId.code,formularId.name,formularId.setProcess,factoryId.name,planStartTime,planEndTime,taskState" hidekeyPrefix="ec_WOM_produceTask_produceTask_taskRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_produceTask_taskRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','workType.id','formularId.setProcess.id','formularId.setProcess','taskState.id','productId.id','formularId.id','factoryId.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=190   type="textfield"    showFormatFunc=""/>
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion1415772644833dd')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion14157727407377788')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productNum_displayDefaultType!}"  key="productNum"   label="${getText('WOM.propertydisplayName.randon1489658031489')}" textalign="right" decimal="6" width=80   type="decimal"    showFormatFunc=""/>
			<#assign productBatchNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productBatchNum_displayDefaultType!}"  key="productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign workType_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${workType_displayDefaultType!}"  key="workType.value"   label="${getText('WOM.propertydisplayName.randon1491448830140')}" textalign="left"  width=40   type="systemcode"    showFormatFunc=""/>
			<#assign formularId_code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${formularId_code_displayDefaultType!}"  key="formularId.code"   label="${getText('WOM.propertydisplayName.randon1488246312092')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign formularId_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${formularId_name_displayDefaultType!}"  key="formularId.name"   label="${getText('WOM.propertydisplayName.randon1487075823790')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('WOM.propertydisplayName.radion141923239378233')}" textalign="left"  width=80   type="textfield"    showFormatFunc=""/>
			<#assign planStartTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HM" defaultDisplay="${planStartTime_displayDefaultType!}"  key="planStartTime"   label="${getText('WOM.propertydisplayName.randon1489669409811')}" textalign="center"  width=150   type="datetime"    showFormatFunc=""/>
			<#assign planEndTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HM" defaultDisplay="${planEndTime_displayDefaultType!}"  key="planEndTime"   label="${getText('WOM.propertydisplayName.randon1489669527423')}" textalign="center"  width=150   type="datetime"    showFormatFunc=""/>
			<#assign taskState_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${taskState_displayDefaultType!}"  key="taskState.value"   label="${getText('WOM.propertydisplayName.randon1490865032818')}" textalign="left"  width=60   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_produceTask_produceTask_taskRef_RenderOverEvent(){
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
	 * @method WOM.produceTask.produceTask.taskRef.query
	 */
	WOM.produceTask.produceTask.taskRef.query = function(type,pageNo){
		var node = WOM.produceTask.produceTask.taskRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.produceTask.produceTask.taskRef.node = null;
		if(!checkListValid("ec_WOM_produceTask_produceTask_taskRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/produceTask/produceTask/taskRef-query.action";
		CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_produceTask_produceTask_taskRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_produceTask_taskRef";
		condobj.modelAlias="produceTask";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_produceTask_produceTask_taskRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_produceTask_produceTask_taskRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_produceTask_produceTask_taskRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_produceTask_produceTask_taskRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm *[name="'+ec_WOM_produceTask_produceTask_taskRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_produceTask_produceTask_taskRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_produceTask_produceTask_taskRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_produceTask_produceTask_taskRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_produceTask_produceTask_taskRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_produceTask_produceTask_taskRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_produceTask_taskRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_produceTask_produceTask_taskRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.produceTask.produceTask.taskRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.produceTask.produceTask.taskRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.produceTask.produceTask.taskRef._prefix += '.';
			}
			WOM.produceTask.produceTask.taskRef._prefix += arr[i];
		}
		WOM.produceTask.produceTask.taskRef._suffix = arr[arr.length -1];
		if(WOM.produceTask.produceTask.taskRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.taskRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.produceTask.produceTask.taskRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.produceTask.produceTask.taskRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.produceTask.produceTask.taskRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm *[name="'+WOM.produceTask.produceTask.taskRef._prefix + '.' + WOM.produceTask.produceTask.taskRef._suffix +'"]').val(obj[0][WOM.produceTask.produceTask.taskRef._suffix]);
		CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm *[name="'+WOM.produceTask.produceTask.taskRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm *[name^="'+WOM.produceTask.produceTask.taskRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm *[name="'+WOM.produceTask.produceTask.taskRef._prefix + '.' + WOM.produceTask.produceTask.taskRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_produceTask_produceTask_taskRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.produceTask.produceTask.taskRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.produceTask.produceTask.taskRef.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.produceTask.taskRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_produceTask_produceTask_taskRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_produceTask_produceTask_taskRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.produceTask.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_produceTask_produceTask_taskRef_callBackFuncName").val() != ""){
				eval(CUI("#WOM_produceTask_produceTask_taskRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_produceTask_produceTask_taskRef_refresh = function(node){
	//var url = "/WOM/produceTask/produceTask/taskRef-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_produceTask_produceTask_taskRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_produceTask_produceTask_taskRef_query.setRequestDataUrl(url,'',false);
	//}
	WOM.produceTask.produceTask.taskRef.node = node;
	WOM.produceTask.produceTask.taskRef.query("query");
}

WOM_produceTask_produceTask_taskRef_getList = function() {
	return "WOM.produceTask.produceTask.taskRef";
}

	WOM.produceTask.produceTask.taskRef.commonQuery = function(type) {
	  if(typeof WOM.produceTask.produceTask.taskRef.cancelSelectedNode == 'function') {
	   WOM.produceTask.produceTask.taskRef.cancelSelectedNode();
	  }
	  WOM.produceTask.produceTask.taskRef.query(type);
	 };
	
	

WOM.produceTask.produceTask.taskRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.produceTask.produceTask.taskRef.otherParams = {};
	WOM.produceTask.produceTask.taskRef.otherParams.dialogType = dialogType;
	WOM.produceTask.produceTask.taskRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.produceTask.produceTask.taskRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="planStartTime_start"]').val()!= null && $('#' + formId + ' input[name^="planStartTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="planStartTime_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669409811')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="planStartTime_end"]').val()!= null && $('#' + formId + ' input[name^="planStartTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="planStartTime_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669409811')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="planEndTime_start"]').val()!= null && $('#' + formId + ' input[name^="planEndTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="planEndTime_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669527423')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="planEndTime_end"]').val()!= null && $('#' + formId + ' input[name^="planEndTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="planEndTime_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669527423')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="planStartTime_start"]').val()!='' && $('#' + formId + ' input[name="planStartTime_end"]').val()!=''){if($('#' + formId + ' input[name="planStartTime_start"]').val() > $('#' + formId + ' input[name="planStartTime_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669409811')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489669409811')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="planEndTime_start"]').val()!='' && $('#' + formId + ' input[name="planEndTime_end"]').val()!=''){if($('#' + formId + ' input[name="planEndTime_start"]').val() > $('#' + formId + ' input[name="planEndTime_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489669527423')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489669527423')}${getText('ec.list.validate.start')}");return false;}}return true;};





	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_produceTask_taskRef,js,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
