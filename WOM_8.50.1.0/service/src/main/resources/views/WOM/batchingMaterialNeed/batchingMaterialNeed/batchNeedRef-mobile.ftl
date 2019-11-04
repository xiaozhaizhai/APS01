
<script type="text/javascript">
	CUI.ns("WOM.batchingMaterialNeed.batchingMaterialNeed","WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_callBackFuncName" id="WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490613727875')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm" exportUrl="/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_condition" id="WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490613780787')}_${getText('WOM.viewtitle.randon1491792578939')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm" formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm" idprefix="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.menuInfoname.randon1489670907556||MESBasic_1_product_Product_productCode_productId_productCode:WOM.propertydisplayName.radion14157726448331||WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_offerSystem:WOM.propertydisplayName.randon1490614163532||WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_state_state:WOM.propertydisplayName.randon1490614632524" >
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.menuInfoname.randon1489670907556')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="form-control" url="/WOM/produceTask/produceTask/taskRef.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm" searchClick="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_productId_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_productId_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.radion14157726448331')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm" searchClick="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign offerSystem_defaultValue  = ''>
									<#assign offerSystem_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_offerSystem" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_offerSystem">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1490614163532')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${offerSystem_defaultValue}"   name="offerSystem" code="RMsystem" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
							<#assign state_defaultValue  = ''>
									<#assign state_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_state_state" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_state_state">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1490614632524')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${state_defaultValue}"   name="state" code="womNeedState" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm" type="search" onclick="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm' );
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

ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["taskID.tableNo"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_NEEDS,TASKID-tableNo";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["taskID.id"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_BATCHING_MATERIAL_NEEDS,TASKID-tableNo";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["productId.productCode"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIAL_NEEDS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["productId.id"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_BATCHING_MATERIAL_NEEDS,PRODUCT_ID-productCode";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["productId.id"].columnName="ID";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["offerSystem"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["offerSystem"].dbColumnType="SYSTEMCODE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["offerSystem"].layRec="offerSystem";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["offerSystem"].columnName="OFFER_SYSTEM";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["state"]={};
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["state"].dbColumnType="SYSTEMCODE";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["state"].layRec="state";
ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["state"].columnName="STATE";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.query('query')">
<#assign datatable_dataUrl = "/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_query" renderOverEvent="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_RenderOverEvent"  modelCode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed" noPermissionKeys="taskID.tableNo,productId.productCode,productId.productName,taskProcess.name,factoryId.name,taskActive.name,offerOrder,offerSystem,planNum,hasOrderNum,useNum,state" hidekeyPrefix="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','offerSystem.id','state.id','taskID.id','productId.id','taskProcess.id','factoryId.id','taskActive.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.common.tableNo436457')}" textalign="center"  width=190   type="textfield"    showFormatFunc=""/>
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448331')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737334')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign taskProcess_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskProcess_name_displayDefaultType!}"  key="taskProcess.name"   label="${getText('WOM.propertydisplayName.randon1489720649125')}" textalign="left"  width=80   type="textfield"    showFormatFunc=""/>
			<#assign factoryId_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${factoryId_name_displayDefaultType!}"  key="factoryId.name"   label="${getText('WOM.propertydisplayName.randon1490605067247')}" textalign="left"  width=80   type="textfield"    showFormatFunc=""/>
			<#assign taskActive_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskActive_name_displayDefaultType!}"  key="taskActive.name"   label="${getText('WOM.propertydisplayName.randon1490683872072')}" textalign="left"  width=80   type="textfield"    showFormatFunc=""/>
			<#assign offerOrder_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${offerOrder_displayDefaultType!}"  key="offerOrder"   label="${getText('WOM.propertydisplayName.randon1490614138387')}" textalign="left"  width=60   type="integer"    showFormatFunc=""/>
			<#assign offerSystem_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${offerSystem_displayDefaultType!}"  key="offerSystem.value"   label="${getText('WOM.propertydisplayName.randon1490614163532')}" textalign="left"  width=80   type="systemcode"    showFormatFunc=""/>
			<#assign planNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${planNum_displayDefaultType!}"  key="planNum"   label="${getText('WOM.propertydisplayName.randon14906142534274345')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc=""/>
			<#assign hasOrderNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${hasOrderNum_displayDefaultType!}"  key="hasOrderNum"   label="${getText('WOM.propertydisplayName.randon1490616453276')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign useNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${useNum_displayDefaultType!}"  key="useNum"   label="${getText('WOM.propertydisplayName.randon1490614271669')}" textalign="right" decimal="2" width=80   type="decimal"    showFormatFunc=""/>
			<#assign state_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('WOM.propertydisplayName.randon1490614632524')}" textalign="left"  width=60   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_RenderOverEvent(){
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
	 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.query
	 */
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.query = function(type,pageNo){
		var node = WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.node = null;
		if(!checkListValid("ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef-query.action";
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef";
		condobj.modelAlias="batchingMaterialNeed";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm *[name="'+ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._prefix += '.';
			}
			WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._prefix += arr[i];
		}
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._suffix = arr[arr.length -1];
		if(WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm *[name="'+WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._prefix + '.' + WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._suffix +'"]').val(obj[0][WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._suffix]);
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm *[name="'+WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm *[name^="'+WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm *[name="'+WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._prefix + '.' + WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.batchingMaterialNeed.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_callBackFuncName").val() != ""){
				eval(CUI("#WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_refresh = function(node){
	//var url = "/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_query.setRequestDataUrl(url,'',false);
	//}
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.node = node;
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.query("query");
}

WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedRef_getList = function() {
	return "WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef";
}

	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.commonQuery = function(type) {
	  if(typeof WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.cancelSelectedNode == 'function') {
	   WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.cancelSelectedNode();
	  }
	  WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.query(type);
	 };
	
	

WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.otherParams = {};
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.otherParams.dialogType = dialogType;
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef,js,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
