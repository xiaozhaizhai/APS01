
<script type="text/javascript">
	CUI.ns("RM.formula.formula","RM.formula.formula.formulaResysleRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="RM_formula_formula_formulaResysleRef_callBackFuncName" id="RM_formula_formula_formulaResysleRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_RM_formula_formula_formulaResysleRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	</#if>
	<@errorbar id="ec_RM_formula_formula_formulaResysleRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_RM_formula_formula_formulaResysleRef_queryForm" exportUrl="/RM/formula/formula/formulaResysleRef-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="RM_7_5_0_0_formulaType_FormulaType" value="formulaType" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" />
		<input type="hidden" id="RM_7_5_0_0_pickSite_PickSite" value="pickSite" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" />
		<input type="hidden" reset="false" name="RM_formula_formula_formulaResysleRef_condition" id="RM_formula_formula_formulaResysleRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487075762209')}_${getText('RM.viewtitle.randon1505377270901')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_RM_formula_formula_formulaResysleRef_queryForm" formId="ec_RM_formula_formula_formulaResysleRef_queryForm" idprefix="ec_RM_formula_formula_formulaResysleRef" expandType="all" expand=true fieldcodes="RM_7_5_0_0_formula_Formula_code_code:RM.propertydisplayName.randon1488246312092||RM_7_5_0_0_formula_Formula_name_name:RM.propertydisplayName.randon1487075823790||RM_7_5_0_0_formula_Formula_edition_edition:RM.propertydisplayName.randon1487139592239||MESBasic_1_product_Product_productCode_product_productCode:RM.propertydisplayName.radion1415772644833234||RM_7_5_0_0_formula_Formula_usedFor_usedFor:RM.propertydisplayName.randon1487076506987||RM_7_5_0_0_formula_Formula_state_state:RM.propertydisplayName.randon1487076473255||RM_7_5_0_0_formula_Formula_startTime_startTime:RM.propertydisplayName.randon1487076643939||RM_7_5_0_0_formula_Formula_endTime_endTime:RM.propertydisplayName.randon1487076706699||RM_7_5_0_0_formula_Formula_produceType_produceType:RM.propertydisplayName.randon1487076555894" >
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_Formula_code_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_code_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1488246312092')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (code_defaultValue)?has_content>
												<@mneclient formId="ec_RM_formula_formula_formulaResysleRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="RM.formula.formula.formulaResysleRef._querycustomFunc('code')" name="code" id="ec_RM_formula_formula_formulaResysleRef_queryForm_code" displayFieldName="code" exp="equal" classStyle="form-control"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaResysleRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_RM_formula_formula_formulaResysleRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="RM.formula.formula.formulaResysleRef._querycustomFunc('code')" name="code" id="ec_RM_formula_formula_formulaResysleRef_queryForm_code" displayFieldName="code" exp="equal" classStyle="form-control"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaResysleRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_Formula_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487075823790')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (name_defaultValue)?has_content>
												<@mneclient formId="ec_RM_formula_formula_formulaResysleRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="RM.formula.formula.formulaResysleRef._querycustomFunc('name')" name="name" id="ec_RM_formula_formula_formulaResysleRef_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaResysleRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_RM_formula_formula_formulaResysleRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="RM.formula.formula.formulaResysleRef._querycustomFunc('name')" name="name" id="ec_RM_formula_formula_formulaResysleRef_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/RM/formula/formula/mneClient.action" multiple=false mnewidth=260 searchClick="RM.formula.formula.formulaResysleRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign edition_defaultValue  = ''>
									<#assign edition_defaultValue  = ''>
							<div mobi-dropdown-group="edition" field-unique-code="RM_7_5_0_0_formula_Formula_edition_edition" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_edition_edition">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487139592239')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<div class="input-group">
												<span class="input-group-addon">${getText('ec.list.validate.start')}</span>	
												<input type="text" class="form-control" name="edition_start" id="edition_start" value="${edition_defaultValue!}" deValue="${edition_defaultValue!}"   exp="equal"/>
											</div>
									</div>			
								</div>
							</div>
							<div mobi-dropdown-group="edition" field-unique-code="RM_7_5_0_0_formula_Formula_edition_edition" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_edition_edition">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487139592239')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
												<div class="input-group">
													<span class="input-group-addon">${getText('ec.list.validate.end')}</span>
													<input type="text" class="form-control" name="edition_end" id="edition_end" value="${edition_defaultValue!}" deValue="${edition_defaultValue!}"   exp="equal"/>
												</div>	
											
									</div>			
								</div>
							</div>
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_product_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_product_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.radion1415772644833234')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="product.id" name="product.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="RM.formula.formula.formulaResysleRef._querycustomFunc('product_productCode')" name="product.productCode" id="ec_RM_formula_formula_formulaResysleRef_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formula_formulaResysleRef_queryForm" searchClick="RM.formula.formula.formulaResysleRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign usedFor_defaultValue  = ''>
									<#assign usedFor_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_Formula_usedFor_usedFor" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_usedFor_usedFor">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487076506987')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${usedFor_defaultValue}"   name="usedFor" code="usedFor" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_Formula_state_state" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_state_state">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487076473255')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${state_defaultValue}"   name="state" code="RMstate" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
							<#assign startTime_defaultValue  = ''>
									<#assign startTime_defaultValue  = ''>
								<#assign startTime_defaultValue  = ''>
							<div mobi-dropdown-group="startTime" field-unique-code="RM_7_5_0_0_formula_Formula_startTime_startTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_startTime_startTime">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487076643939')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${startTime_defaultValue!}" deValue="${startTime_defaultValue!}"  name="startTime_start" id="startTime_start" exp="gequal"   formid="ec_RM_formula_formula_formulaResysleRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="startTime" field-unique-code="RM_7_5_0_0_formula_Formula_startTime_startTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_startTime_startTime">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('RM.propertydisplayName.randon1487076643939')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${startTime_defaultValue!}" deValue="${startTime_defaultValue!}"  name="startTime_end" id="startTime_end" exp="lequal"   formid="ec_RM_formula_formula_formulaResysleRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
							<#assign endTime_defaultValue  = ''>
									<#assign endTime_defaultValue  = ''>
								<#assign endTime_defaultValue  = ''>
							<div mobi-dropdown-group="endTime" field-unique-code="RM_7_5_0_0_formula_Formula_endTime_endTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_endTime_endTime">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487076706699')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${endTime_defaultValue!}" deValue="${endTime_defaultValue!}"  name="endTime_start" id="endTime_start" exp="gequal"   formid="ec_RM_formula_formula_formulaResysleRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="endTime" field-unique-code="RM_7_5_0_0_formula_Formula_endTime_endTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_endTime_endTime">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('RM.propertydisplayName.randon1487076706699')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${endTime_defaultValue!}" deValue="${endTime_defaultValue!}"  name="endTime_end" id="endTime_end" exp="lequal"   formid="ec_RM_formula_formula_formulaResysleRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
							<#assign produceType_defaultValue  = ''>
									<#assign produceType_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_Formula_produceType_produceType" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_produceType_produceType">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487076555894')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${produceType_defaultValue}"   name="produceType" code="produceType" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_RM_formula_formula_formulaResysleRef_queryForm" type="search" onclick="RM.formula.formula.formulaResysleRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_RM_formula_formula_formulaResysleRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_RM_formula_formula_formulaResysleRef_queryForm' );
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

ec_RM_formula_formula_formulaResysleRef_quickquery_info={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["code"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["code"].dbColumnType="BAPCODE";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["code"].layRec="code";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["code"].columnName="CODE";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["name"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["name"].layRec="name";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["name"].columnName="NAME";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["edition"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["edition"].dbColumnType="DECIMAL";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["edition"].layRec="edition";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["edition"].columnName="EDITION";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["product.productCode"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["product.productCode"].dbColumnType="TEXT";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["product.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULAS,PRODUCT-productCode";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["product.productCode"].columnName="PRODUCT_CODE";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["product.id"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["product.id"].dbColumnType="LONG";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["product.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULAS,PRODUCT-productCode";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["product.id"].columnName="ID";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["usedFor"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["usedFor"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["usedFor"].layRec="usedFor";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["usedFor"].columnName="USED_FOR";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["state"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["state"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["state"].layRec="state";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["state"].columnName="STATE";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["startTime"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["startTime"].dbColumnType="DATETIME";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["startTime"].layRec="startTime";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["startTime"].columnName="START_TIME";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["endTime"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["endTime"].dbColumnType="DATETIME";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["endTime"].layRec="endTime";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["endTime"].columnName="END_TIME";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["produceType"]={};
ec_RM_formula_formula_formulaResysleRef_quickquery_info["produceType"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["produceType"].layRec="produceType";
ec_RM_formula_formula_formulaResysleRef_quickquery_info["produceType"].columnName="PRODUCE_TYPE";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formula.formulaResysleRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formula/formulaResysleRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formula.formulaResysleRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formula/formulaResysleRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_RM_formula_formula_formulaResysleRef_query" renderOverEvent="ec_RM_formula_formula_formulaResysleRef_RenderOverEvent"  modelCode="RM_7.5.0.0_formula_Formula" noPermissionKeys="code,name,edition,product.productCode,product.productName,product.productSpecif,product.productModel,product.productBaseUnit.name,usedFor,produceType,isForProduct,state,startTime,endTime,supportEbr,description,setProcess" hidekeyPrefix="ec_RM_formula_formula_formulaResysleRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formula_formulaResysleRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','product.productSpecif','product.productModel','product.productBaseUnit.name','usedFor.id','produceType.id','state.id','setProcess.id','setProcess','product.id','product.productBaseUnit.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('RM.propertydisplayName.randon1488246312092')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487075823790')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign edition_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${edition_displayDefaultType!}"  key="edition"   label="${getText('RM.propertydisplayName.randon1487139592239')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign product_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${product_productCode_displayDefaultType!}"  key="product.productCode"   label="${getText('RM.propertydisplayName.radion141577264483332')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('RM.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign usedFor_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${usedFor_displayDefaultType!}"  key="usedFor.value"   label="${getText('RM.propertydisplayName.randon1487076506987')}" textalign="left"  width=60   type="systemcode"    showFormatFunc=""/>
			<#assign produceType_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${produceType_displayDefaultType!}"  key="produceType.value"   label="${getText('RM.propertydisplayName.randon1487076555894')}" textalign="left"  width=80   type="systemcode"    showFormatFunc=""/>
			<#assign isForProduct_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECT" defaultDisplay="${isForProduct_displayDefaultType!}"  key="isForProduct"   label="${getText('RM.propertydisplayName.randon1487076528539')}" textalign="center"  width=60   type="boolean"    showFormatFunc=""/>
			<#assign state_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('RM.propertydisplayName.randon1487076473255')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HM" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"   label="${getText('RM.propertydisplayName.randon1489480645731')}" textalign="center"  width=130   type="datetime"    showFormatFunc=""/>
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HM" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"   label="${getText('RM.propertydisplayName.randon1489480749505')}" textalign="center"  width=130   type="datetime"    showFormatFunc=""/>
			<#assign supportEbr_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${supportEbr_displayDefaultType!}"  key="supportEbr"   label="${getText('RM.propertydisplayName.randon1490150767011')}" textalign="left"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign description_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${description_displayDefaultType!}"  key="description"   label="${getText('RM.propertydisplayName.randon1487076858348')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formula_formulaResysleRef_RenderOverEvent(){
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
	 * @method RM.formula.formula.formulaResysleRef.query
	 */
	RM.formula.formula.formulaResysleRef.query = function(type,pageNo){
		var node = RM.formula.formula.formulaResysleRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		RM.formula.formula.formulaResysleRef.node = null;
		if(!checkListValid("ec_RM_formula_formula_formulaResysleRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/RM/formula/formula/formulaResysleRef-query.action";
		CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formula_formulaResysleRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_formulaResysleRef";
		condobj.modelAlias="formula";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formula_formulaResysleRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formula_formulaResysleRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formula_formulaResysleRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formula_formulaResysleRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm *[name="'+ec_RM_formula_formula_formulaResysleRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formula_formulaResysleRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_formula_formula_formulaResysleRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formula_formulaResysleRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formula_formulaResysleRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formula_formula_formulaResysleRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_formulaResysleRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_RM_formula_formula_formulaResysleRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	RM.formula.formula.formulaResysleRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formula.formulaResysleRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formula.formulaResysleRef._prefix += '.';
			}
			RM.formula.formula.formulaResysleRef._prefix += arr[i];
		}
		RM.formula.formula.formulaResysleRef._suffix = arr[arr.length -1];
		if(RM.formula.formula.formulaResysleRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formula.formulaResysleRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formula.formulaResysleRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formula.formulaResysleRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formula.formulaResysleRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm *[name="'+RM.formula.formula.formulaResysleRef._prefix + '.' + RM.formula.formula.formulaResysleRef._suffix +'"]').val(obj[0][RM.formula.formula.formulaResysleRef._suffix]);
		CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm *[name="'+RM.formula.formula.formulaResysleRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm *[name^="'+RM.formula.formula.formulaResysleRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm *[name="'+RM.formula.formula.formulaResysleRef._prefix + '.' + RM.formula.formula.formulaResysleRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formula_formulaResysleRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	RM.formula.formula.formulaResysleRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formula.formulaResysleRef.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.formulaResysleRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formula_formula_formulaResysleRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_RM_formula_formula_formulaResysleRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('RM.formula.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formula_formula_formulaResysleRef_callBackFuncName").val() != ""){
				eval(CUI("#RM_formula_formula_formulaResysleRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
RM_formula_formula_formulaResysleRef_refresh = function(node){
	//var url = "/RM/formula/formula/formulaResysleRef-query.action";
	//if(node.layRec){
	//	datatable_ec_RM_formula_formula_formulaResysleRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_RM_formula_formula_formulaResysleRef_query.setRequestDataUrl(url,'',false);
	//}
	RM.formula.formula.formulaResysleRef.node = node;
	RM.formula.formula.formulaResysleRef.query("query");
}

RM_formula_formula_formulaResysleRef_getList = function() {
	return "RM.formula.formula.formulaResysleRef";
}

	RM.formula.formula.formulaResysleRef.commonQuery = function(type) {
	  if(typeof RM.formula.formula.formulaResysleRef.cancelSelectedNode == 'function') {
	   RM.formula.formula.formulaResysleRef.cancelSelectedNode();
	  }
	  RM.formula.formula.formulaResysleRef.query(type);
	 };
	
	

RM.formula.formula.formulaResysleRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	RM.formula.formula.formulaResysleRef.otherParams = {};
	RM.formula.formula.formulaResysleRef.otherParams.dialogType = dialogType;
	RM.formula.formula.formulaResysleRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formula.formulaResysleRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="edition_start"]').val()!= null && $('#' + formId + ' input[name^="edition_start"]').val()!= ''){if(!isDecimal($('#' + formId + ' input[name^="edition_start"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name^="edition_end"]').val()!= null && $('#' + formId + ' input[name^="edition_end"]').val()!= ''){if(!isDecimal($('#' + formId + ' input[name^="edition_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name^="startTime_start"]').val()!= null && $('#' + formId + ' input[name^="startTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="startTime_end"]').val()!= null && $('#' + formId + ' input[name^="startTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="startTime_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_start"]').val()!= null && $('#' + formId + ' input[name^="endTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="endTime_end"]').val()!= null && $('#' + formId + ' input[name^="endTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="endTime_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="startTime_start"]').val()!='' && $('#' + formId + ' input[name="startTime_end"]').val()!=''){if($('#' + formId + ' input[name="startTime_start"]').val() > $('#' + formId + ' input[name="startTime_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487076643939')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="edition_start"]').val()!='' && $('#' + formId + ' input[name="edition_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="edition_start"]').val()) > parseInt($('#' + formId + ' input[name="edition_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487139592239')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="endTime_start"]').val()!='' && $('#' + formId + ' input[name="endTime_end"]').val()!=''){if($('#' + formId + ' input[name="endTime_start"]').val() > $('#' + formId + ' input[name="endTime_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487076706699')}${getText('ec.list.validate.start')}");return false;}}return true;};





	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_formulaResysleRef,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	</script>
  </body>
</html>
