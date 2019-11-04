
<script type="text/javascript">
	CUI.ns("WOM.producePlanRef.dayBatchPlanParts","WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_callBackFuncName" id="WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489822754667')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" exportUrl="/WOM/producePlanRef/dayBatchPlanParts/batchPlanOneRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="manudeptId" />
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryCode" />
		<input type="hidden" reset="false" name="WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_condition" id="WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489822962143')}_${getText('WOM.viewtitle.randon1495691448944')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" idprefix="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_producePlanRef_DayBatchPlanInfo_tableNo_dayPlanInfo_tableNo:ec.common.tableNo||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.radion141577264483343445||RM_7_5_0_0_formula_Formula_code_formularID_code:WOM.propertydisplayName.randon1488246312092445||MESBasic_1_factoryModel_FactoryModel_name_factoryCode_name:WOM.propertydisplayName.radion14192323937824455||WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_startTime_startTime:WOM.propertydisplayName.randon1489823646428||WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_endTime_endTime:WOM.propertydisplayName.randon1489823379542" >
							<#assign dayPlanInfo_tableNo_defaultValue  = ''>
									<#assign dayPlanInfo_tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_producePlanRef_DayBatchPlanInfo_tableNo_dayPlanInfo_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_producePlanRef_DayBatchPlanInfo_tableNo_dayPlanInfo_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('ec.common.tableNo')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="dayPlanInfo.id" name="dayPlanInfo.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('dayPlanInfo_tableNo')" name="dayPlanInfo.tableNo" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_dayPlanInfo_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="form-control" url="" clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" searchClick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_productId_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_productId_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.radion141577264483343445')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" searchClick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign formularID_code_defaultValue  = ''>
									<#assign formularID_code_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_Formula_code_formularID_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_code_formularID_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1488246312092445')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="formularID.id" name="formularID.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('RM.viewtitle.randon1488246963795')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('formularID_code')" name="formularID.code" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_formularID_code" displayFieldName="code" type="other" exp="equal" classStyle="form-control" url="/RM/formula/formula/formulaRef.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" searchClick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign factoryCode_name_defaultValue  = ''>
									<#assign factoryCode_name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_factoryModel_FactoryModel_name_factoryCode_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_factoryModel_FactoryModel_name_factoryCode_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.radion14192323937824455')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="factoryCode.id" name="factoryCode.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc('factoryCode_name')" name="factoryCode.name" id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm_factoryCode_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" searchClick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign startTime_defaultValue  = ''>
									<#assign startTime_defaultValue  = ''>
								<#assign startTime_defaultValue  = ''>
							<div mobi-dropdown-group="startTime" field-unique-code="WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_startTime_startTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_startTime_startTime">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1489823646428')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${startTime_defaultValue!}" deValue="${startTime_defaultValue!}"  name="startTime_start" id="startTime_start" exp="gequal"   formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="startTime" field-unique-code="WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_startTime_startTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_startTime_startTime">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('WOM.propertydisplayName.randon1489823646428')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${startTime_defaultValue!}" deValue="${startTime_defaultValue!}"  name="startTime_end" id="startTime_end" exp="lequal"   formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
							<#assign endTime_defaultValue  = ''>
									<#assign endTime_defaultValue  = ''>
								<#assign endTime_defaultValue  = ''>
							<div mobi-dropdown-group="endTime" field-unique-code="WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_endTime_endTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_endTime_endTime">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1489823379542')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${endTime_defaultValue!}" deValue="${endTime_defaultValue!}"  name="endTime_start" id="endTime_start" exp="gequal"   formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="endTime" field-unique-code="WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_endTime_endTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_producePlanRef_DayBatchPlanParts_endTime_endTime">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('WOM.propertydisplayName.randon1489823379542')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${endTime_defaultValue!}" deValue="${endTime_defaultValue!}"  name="endTime_end" id="endTime_end" exp="lequal"   formid="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" type="search" onclick="WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm' );
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

ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.tableNo"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.tableNo"].dbColumnType="TEXT";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.tableNo"].layRec="PPM_DAY_PLAN_INFOS,ID,PPM_DAY_PLAN_PARS,DAY_PLAN_INFO-tableNo";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.tableNo"].columnName="TABLE_NO";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.id"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.id"].dbColumnType="LONG";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.id"].layRec="PPM_DAY_PLAN_INFOS,ID,PPM_DAY_PLAN_PARS,DAY_PLAN_INFO-tableNo";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["dayPlanInfo.id"].columnName="ID";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.productCode"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,PPM_DAY_PLAN_PARS,PRODUCT_ID-productCode";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.id"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,PPM_DAY_PLAN_PARS,PRODUCT_ID-productCode";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["productId.id"].columnName="ID";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.code"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.code"].dbColumnType="BAPCODE";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.code"].layRec="RM_FORMULAS,ID,PPM_DAY_PLAN_PARS,FORMULARID-code";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.code"].columnName="CODE";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.id"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.id"].dbColumnType="LONG";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.id"].layRec="RM_FORMULAS,ID,PPM_DAY_PLAN_PARS,FORMULARID-code";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["formularID.id"].columnName="ID";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.name"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.name"].dbColumnType="TEXT";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.name"].layRec="factory_tbcompanystructure,ID,PPM_DAY_PLAN_PARS,FACTORY_CODE-name";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.name"].columnName="NODENAME";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.id"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.id"].dbColumnType="LONG";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.id"].layRec="factory_tbcompanystructure,ID,PPM_DAY_PLAN_PARS,FACTORY_CODE-name";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["factoryCode.id"].columnName="ID";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["startTime"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["startTime"].dbColumnType="DATETIME";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["startTime"].layRec="startTime";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["startTime"].columnName="START_TIME";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["endTime"]={};
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["endTime"].dbColumnType="DATETIME";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["endTime"].layRec="endTime";
ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["endTime"].columnName="END_TIME";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query('query')">
<#assign datatable_dataUrl = "/WOM/producePlanRef/dayBatchPlanParts/batchPlanOneRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query('query')">
<#assign datatable_dataUrl = "/WOM/producePlanRef/dayBatchPlanParts/batchPlanOneRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query" renderOverEvent="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_RenderOverEvent"  modelCode="WOM_7.5.0.0_producePlanRef_DayBatchPlanParts" noPermissionKeys="dayPlanInfo.tableNo,productId.productCode,productId.productName,batchNum,quantity,formularID.code,formularID.name,factoryCode.name,startTime,endTime" hidekeyPrefix="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','dayPlanInfo.id','productId.id','formularID.id','factoryCode.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
			<#assign dayPlanInfo_tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${dayPlanInfo_tableNo_displayDefaultType!}"  key="dayPlanInfo.tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=190   type="textfield"    showFormatFunc=""/>
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448334334')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1489823243312')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign quantity_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${quantity_displayDefaultType!}"  key="quantity"   label="${getText('WOM.propertydisplayName.randon1489823617233')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign formularID_code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${formularID_code_displayDefaultType!}"  key="formularID.code"   label="${getText('WOM.propertydisplayName.randon148824631209sss2')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign formularID_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${formularID_name_displayDefaultType!}"  key="formularID.name"   label="${getText('WOM.propertydisplayName.randon14870758237ee90')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign factoryCode_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${factoryCode_name_displayDefaultType!}"  key="factoryCode.name"   label="${getText('WOM.propertydisplayName.radion1419232393782efe')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HM" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"   label="${getText('WOM.propertydisplayName.randon1489823646428')}" textalign="left"  width=150   type="datetime"    showFormatFunc=""/>
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HM" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"   label="${getText('WOM.propertydisplayName.randon1489823379542')}" textalign="left"  width=150   type="datetime"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_RenderOverEvent(){
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
	 * @method WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query
	 */
	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query = function(type,pageNo){
		var node = WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.node = null;
		if(!checkListValid("ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/producePlanRef/dayBatchPlanParts/batchPlanOneRef-query.action";
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_producePlanRef_batchPlanOneRef";
		condobj.modelAlias="dayBatchPlanParts";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm *[name="'+ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_producePlanRef_batchPlanOneRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._prefix += '.';
			}
			WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._prefix += arr[i];
		}
		WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._suffix = arr[arr.length -1];
		if(WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm *[name="'+WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._prefix + '.' + WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._suffix +'"]').val(obj[0][WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._suffix]);
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm *[name="'+WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm *[name^="'+WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm *[name="'+WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._prefix + '.' + WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query_"+obj+")!='undefined'") ? eval('WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.dayBatchPlanParts.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_callBackFuncName").val() != ""){
				eval(CUI("#WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_refresh = function(node){
	//var url = "/WOM/producePlanRef/dayBatchPlanParts/batchPlanOneRef-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_query.setRequestDataUrl(url,'',false);
	//}
	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.node = node;
	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query("query");
}

WOM_producePlanRef_dayBatchPlanParts_batchPlanOneRef_getList = function() {
	return "WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef";
}

	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.commonQuery = function(type) {
	  if(typeof WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.cancelSelectedNode == 'function') {
	   WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.cancelSelectedNode();
	  }
	  WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.query(type);
	 };
	
	

WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.otherParams = {};
	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.otherParams.dialogType = dialogType;
	WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.producePlanRef.dayBatchPlanParts.batchPlanOneRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="startTime_start"]').val()!= null && $('#' + formId + ' input[name^="startTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823646428')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="startTime_end"]').val()!= null && $('#' + formId + ' input[name^="startTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823646428')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_start"]').val()!= null && $('#' + formId + ' input[name^="endTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823379542')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_end"]').val()!= null && $('#' + formId + ' input[name^="endTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823379542')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="startTime_start"]').val()!='' && $('#' + formId + ' input[name="startTime_end"]').val()!=''){if($('#' + formId + ' input[name="startTime_start"]').val() > $('#' + formId + ' input[name="startTime_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823646428')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489823646428')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="endTime_start"]').val()!='' && $('#' + formId + ' input[name="endTime_end"]').val()!=''){if($('#' + formId + ' input[name="endTime_start"]').val() > $('#' + formId + ' input[name="endTime_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1489823379542')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1489823379542')}${getText('ec.list.validate.start')}");return false;}}return true;};





	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_producePlanRef_batchPlanOneRef,js,WOM_7.5.0.0_producePlanRef_DayBatchPlanParts,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
