
<script type="text/javascript">
	CUI.ns("WOM.batchingMaterial.batchingMaterialPart","WOM.batchingMaterial.batchingMaterialPart.batPartShowRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_callBackFuncName" id="WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1491789700218')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" exportUrl="/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" />
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="armStoreID" />
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeID" />
		<input type="hidden" reset="false" name="WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_condition" id="WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1491789803097')}_${getText('WOM.viewtitle.randon1492238232899')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" idprefix="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_batchingMaterial_BatchingMaterial_tableNo_headId_tableNo:WOM.menuName.randon1491793946236||WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.propertydisplayName.randon1490605002360||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.randon1491790565798||base_staff_name_exeStaff_name:WOM.propertydisplayName.randon1491790473893||base_staff_name_receiveStaff_name:WOM.propertydisplayName.randon1491790518494||WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_exeDate:WOM.propertydisplayName.randon1491790496670||WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_receiveDate_receiveDate:WOM.propertydisplayName.randon1491790546754||WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_state_state:WOM.propertydisplayName.randon1491790699395" >
							<#assign headId_tableNo_defaultValue  = ''>
									<#assign headId_tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterial_tableNo_headId_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterial_tableNo_headId_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.menuName.randon1491793946236')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="headId.id" name="headId.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('headId_tableNo')" name="headId.tableNo" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_headId_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="form-control" url="" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1490605002360')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="form-control" url="/WOM/produceTask/produceTask/taskRef.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_productId_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_productId_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1491790565798')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign exeStaff_name_defaultValue  = ''>
									<#assign exeStaff_name_defaultValue  = ''>
							<div  field-unique-code="base_staff_name_exeStaff_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "base_staff_name_exeStaff_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1491790473893')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="exeStaff.id" name="exeStaff.id" value="" />
												<#if (exeStaff_name_defaultValue)=='currentUser'>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany value="${Session.staff.name}" deValue="currentUser" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('exeStaff_name')" name="exeStaff.name" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_exeStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')" />
													<script type="text/javascript">
													(function($){
														$(function(){
															CUI('#exeStaff.id').val('${Session.staff.id}');
														});
													})(jQuery);
													</script>
												<#else>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('exeStaff_name')" name="exeStaff.name" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_exeStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')" />
												</#if>
											
									</div>			
								</div>
							</div>
							<#assign receiveStaff_name_defaultValue  = ''>
									<#assign receiveStaff_name_defaultValue  = ''>
							<div  field-unique-code="base_staff_name_receiveStaff_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "base_staff_name_receiveStaff_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1491790518494')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="receiveStaff.id" name="receiveStaff.id" value="" />
												<#if (receiveStaff_name_defaultValue)=='currentUser'>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany value="${Session.staff.name}" deValue="currentUser" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('receiveStaff_name')" name="receiveStaff.name" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_receiveStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')" />
													<script type="text/javascript">
													(function($){
														$(function(){
															CUI('#receiveStaff.id').val('${Session.staff.id}');
														});
													})(jQuery);
													</script>
												<#else>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc('receiveStaff_name')" name="receiveStaff.name" id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm_receiveStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" searchClick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')" />
												</#if>
											
									</div>			
								</div>
							</div>
							<#assign exeDate_defaultValue  = ''>
									<#assign exeDate_defaultValue  = ''>
								<#assign exeDate_defaultValue  = ''>
							<div mobi-dropdown-group="exeDate" field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_exeDate" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_exeDate">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1491790496670')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${exeDate_defaultValue!}" deValue="${exeDate_defaultValue!}"  name="exeDate_start" id="exeDate_start" exp="gequal"   formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="exeDate" field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_exeDate" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_exeDate">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('WOM.propertydisplayName.randon1491790496670')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${exeDate_defaultValue!}" deValue="${exeDate_defaultValue!}"  name="exeDate_end" id="exeDate_end" exp="lequal"   formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
							<#assign receiveDate_defaultValue  = ''>
									<#assign receiveDate_defaultValue  = ''>
								<#assign receiveDate_defaultValue  = ''>
							<div mobi-dropdown-group="receiveDate" field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_receiveDate_receiveDate" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_receiveDate_receiveDate">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1491790546754')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.start')}</span>
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${receiveDate_defaultValue!}" deValue="${receiveDate_defaultValue!}"  name="receiveDate_start" id="receiveDate_start" exp="gequal"   formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" />
									</div>
								</div>			
							</div>
						</div>
						<div mobi-dropdown-group="receiveDate" field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_receiveDate_receiveDate" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_receiveDate_receiveDate">mobi-dropdown-active</#if>"> 
							<div class="row">
								<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
									${getText('WOM.propertydisplayName.randon1491790546754')}
								</label></div>
								<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									<div class="input-group">
										<span class="input-group-addon">${getText('ec.list.validate.end')}</span>	
										<@datepicker type="dateTimeMin" cssClass="form-control right-border-radius" value="${receiveDate_defaultValue!}" deValue="${receiveDate_defaultValue!}"  name="receiveDate_end" id="receiveDate_end" exp="lequal"   formid="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" />
									</div>
									</div>			
								</div>
							</div>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_state_state" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_state_state">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1491790699395')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${state_defaultValue}"   name="state" code="womBatPartState" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" type="search" onclick="WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm' );
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

ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.tableNo"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.tableNo"].layRec="WOM_BATCHING_MATERIALS,ID,WOM_BATCHING_MATERIAL_PARTS,HEAD_ID-tableNo";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.id"].layRec="WOM_BATCHING_MATERIALS,ID,WOM_BATCHING_MATERIAL_PARTS,HEAD_ID-tableNo";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["headId.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.tableNo"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_PARTS,TASKID-tableNo";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_PARTS,TASKID-tableNo";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.productCode"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["productId.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.name"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.name"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.name"].layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,EXE_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.name"].columnName="NAME";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.id"].layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,EXE_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeStaff.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.name"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.name"].dbColumnType="TEXT";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.name"].layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,RECEIVE_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.name"].columnName="NAME";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.id"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.id"].dbColumnType="LONG";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.id"].layRec="base_staff,ID,WOM_BATCHING_MATERIAL_PARTS,RECEIVE_STAFF-name";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveStaff.id"].columnName="ID";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeDate"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeDate"].dbColumnType="DATETIME";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeDate"].layRec="exeDate";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["exeDate"].columnName="EXE_DATE";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveDate"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveDate"].dbColumnType="DATETIME";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveDate"].layRec="receiveDate";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["receiveDate"].columnName="RECEIVE_DATE";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["state"]={};
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["state"].dbColumnType="SYSTEMCODE";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["state"].layRec="state";
ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["state"].columnName="STATE";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query" renderOverEvent="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_RenderOverEvent"  modelCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart" noPermissionKeys="headId.tableNo,taskID.tableNo,productId.productCode,productId.productName,batchNum,doneNum,wareID.wareCode,wareID.wareName,storeID.placeSetCode,storeID.placeSetName,offerSystem,exeStaff.name,exeDate,receiveStaff.name,receiveDate,state" hidekeyPrefix="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','offerSystem.id','state.id','headId.id','taskID.id','productId.id','wareID.id','storeID.id','exeStaff.id','receiveStaff.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign headId_tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${headId_tableNo_displayDefaultType!}"  key="headId.tableNo"   label="${getText('WOM.menuName.randon1491793946236')}" textalign="left"  width=150   type="textfield"    click="function(cell){WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.showLinkView('/WOM/batchingMaterial/batchingMaterial/batMaterialView.action?${getPowerCode('','WOM_7.5.0.0_batchingMaterial_batMaterialView')}','headId.id',cell)}" showFormatFunc=""/>
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.propertydisplayName.randon1490613814833')}" textalign="left"  width=150   type="textfield"    click="function(cell){WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc=""/>
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1491790594009')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign doneNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${doneNum_displayDefaultType!}"  key="doneNum"   label="${getText('WOM.propertydisplayName.randon1491790683313')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc=""/>
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=80   type="textfield"    showFormatFunc=""/>
			<#assign storeID_placeSetCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${storeID_placeSetCode_displayDefaultType!}"  key="storeID.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storeID_placeSetName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${storeID_placeSetName_displayDefaultType!}"  key="storeID.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign offerSystem_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${offerSystem_displayDefaultType!}"  key="offerSystem.value"   label="${getText('WOM.propertydisplayName.randon1491978940082')}" textalign="left"  width=80   type="systemcode"    showFormatFunc=""/>
			<#assign exeStaff_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${exeStaff_name_displayDefaultType!}"  key="exeStaff.name"   label="${getText('WOM.propertydisplayName.randon1491790473893')}" textalign="left"  width=80   type="textfield"    showFormatFunc=""/>
			<#assign exeDate_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HMS" defaultDisplay="${exeDate_displayDefaultType!}"  key="exeDate"   label="${getText('WOM.propertydisplayName.randon1491790496670')}" textalign="left"  width=150   type="datetime"    showFormatFunc=""/>
			<#assign receiveStaff_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${receiveStaff_name_displayDefaultType!}"  key="receiveStaff.name"   label="${getText('WOM.propertydisplayName.randon1491790518494')}" textalign="left"  width=80   type="textfield"    showFormatFunc=""/>
			<#assign receiveDate_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HMS" defaultDisplay="${receiveDate_displayDefaultType!}"  key="receiveDate"   label="${getText('WOM.propertydisplayName.randon1491790546754')}" textalign="center"  width=150   type="datetime"    showFormatFunc=""/>
			<#assign state_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('WOM.propertydisplayName.randon1491790699395')}" textalign="left"  width=60   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_RenderOverEvent(){
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
	 * @method WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query
	 */
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query = function(type,pageNo){
		var node = WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.node = null;
		if(!checkListValid("ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef-query.action";
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_batchingMaterial_batPartShowRef";
		condobj.modelAlias="batchingMaterialPart";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm *[name="'+ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_batchingMaterial_batPartShowRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._prefix += '.';
			}
			WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._prefix += arr[i];
		}
		WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._suffix = arr[arr.length -1];
		if(WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm *[name="'+WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._prefix + '.' + WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._suffix +'"]').val(obj[0][WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._suffix]);
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm *[name="'+WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm *[name^="'+WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm *[name="'+WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._prefix + '.' + WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.batchingMaterialPart.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_callBackFuncName").val() != ""){
				eval(CUI("#WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_refresh = function(node){
	//var url = "/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_query.setRequestDataUrl(url,'',false);
	//}
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.node = node;
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query("query");
}

WOM_batchingMaterial_batchingMaterialPart_batPartShowRef_getList = function() {
	return "WOM.batchingMaterial.batchingMaterialPart.batPartShowRef";
}

	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.commonQuery = function(type) {
	  if(typeof WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.cancelSelectedNode == 'function') {
	   WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.cancelSelectedNode();
	  }
	  WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.query(type);
	 };
	
	

WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.otherParams = {};
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.otherParams.dialogType = dialogType;
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="exeDate_start"]').val()!= null && $('#' + formId + ' input[name^="exeDate_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="exeDate_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790496670')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="exeDate_end"]').val()!= null && $('#' + formId + ' input[name^="exeDate_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="exeDate_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790496670')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="receiveDate_start"]').val()!= null && $('#' + formId + ' input[name^="receiveDate_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="receiveDate_start"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790546754')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="receiveDate_end"]').val()!= null && $('#' + formId + ' input[name^="receiveDate_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="receiveDate_end"]').val()+"")){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790546754')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="receiveDate_start"]').val()!='' && $('#' + formId + ' input[name="receiveDate_end"]').val()!=''){if($('#' + formId + ' input[name="receiveDate_start"]').val() > $('#' + formId + ' input[name="receiveDate_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790546754')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1491790546754')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="exeDate_start"]').val()!='' && $('#' + formId + ' input[name="exeDate_end"]').val()!=''){if($('#' + formId + ' input[name="exeDate_start"]').val() > $('#' + formId + ' input[name="exeDate_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491790496670')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1491790496670')}${getText('ec.list.validate.start')}");return false;}}return true;};




(function($){
	$(function(){
		$(".ewc-dialog-button-right :eq(0)").remove();
	});
})(jQuery);

	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_batchingMaterial_batPartShowRef,js,WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart,WOM_7.5.0.0) */
// 自定义代码
	/**
	 * 双击事件
	 * @method WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.sendBackbatPartShowRef
	 */
	WOM.batchingMaterial.batchingMaterialPart.batPartShowRef.sendBackbatPartShowRef = function(event, oRow) {}
/* CUSTOM CODE END */
	</script>
  </body>
</html>
