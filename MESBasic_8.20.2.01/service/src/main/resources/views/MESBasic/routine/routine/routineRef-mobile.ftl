
<script type="text/javascript">
	CUI.ns("MESBasic.routine.routine","MESBasic.routine.routine.routineRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_routine_routine_routineRef_callBackFuncName" id="MESBasic_routine_routine_routineRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_routine_routine_routineRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415336450425')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_routine_routine_routineRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_routine_routine_routineRef_queryForm" exportUrl="/MESBasic/routine/routine/routineRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_routine_routine_routineRef_condition" id="MESBasic_routine_routine_routineRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415336555124')}_${getText('MESBasic.viewtitle.radion1415338782604')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_routine_routine_routineRef_queryForm" formId="ec_MESBasic_routine_routine_routineRef_queryForm" idprefix="ec_MESBasic_routine_routine_routineRef" expandType="all" expand=true fieldcodes="MESBasic_1_routine_Routine_code_code:MESBasic.propertydisplayName.radion1415336575756||MESBasic_1_routine_Routine_name_name:MESBasic.propertydisplayName.radion1415336597801||MESBasic_1_equipManage_Equipment_name_srouceEqp_name:MESBasic.propertydisplayName.randon1427442213645||MESBasic_1_equipManage_Equipment_name_destEqp_name:MESBasic.propertydisplayName.randon1427442234442||MESBasic_1_product_Product_productName_product_productName:MESBasic.propertydisplayName.radion1415772740737" >
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Routine_code_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Routine_code_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415336575756')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Routine_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Routine_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415336597801')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign srouceEqp_name_defaultValue  = ''>
									<#assign srouceEqp_name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_equipManage_Equipment_name_srouceEqp_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_equipManage_Equipment_name_srouceEqp_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1427442213645')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="srouceEqp.id" name="srouceEqp.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  conditionfunc="MESBasic.routine.routine.routineRef._querycustomFunc('srouceEqp_name')" name="srouceEqp.name" id="ec_MESBasic_routine_routine_routineRef_queryForm_srouceEqp_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/MESBasic/equipManage/equipment/ref.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineRef_queryForm" searchClick="MESBasic.routine.routine.routineRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign destEqp_name_defaultValue  = ''>
									<#assign destEqp_name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_equipManage_Equipment_name_destEqp_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_equipManage_Equipment_name_destEqp_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1427442234442')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="destEqp.id" name="destEqp.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  conditionfunc="MESBasic.routine.routine.routineRef._querycustomFunc('destEqp_name')" name="destEqp.name" id="ec_MESBasic_routine_routine_routineRef_queryForm_destEqp_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/MESBasic/equipManage/equipment/ref.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineRef_queryForm" searchClick="MESBasic.routine.routine.routineRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign product_productName_defaultValue  = ''>
									<#assign product_productName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productName_product_productName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productName_product_productName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772740737')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="product.id" name="product.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="MESBasic.routine.routine.routineRef._querycustomFunc('product_productName')" name="product.productName" id="ec_MESBasic_routine_routine_routineRef_queryForm_product_productName" displayFieldName="productName" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_routine_routineRef_queryForm" searchClick="MESBasic.routine.routine.routineRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_routine_routine_routineRef_queryForm" type="search" onclick="MESBasic.routine.routine.routineRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_routine_routine_routineRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_routine_routine_routineRef_queryForm' );
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

ec_MESBasic_routine_routine_routineRef_quickquery_info={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["code"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["code"].layRec="code";
ec_MESBasic_routine_routine_routineRef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_routine_routine_routineRef_quickquery_info["name"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["name"].layRec="name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["name"].columnName="NAME";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.name"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.name"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.name"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,SROUCE_EQP-name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.name"].columnName="EAM_NAME";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.id"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.id"].dbColumnType="LONG";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.id"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,SROUCE_EQP-name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["srouceEqp.id"].columnName="ID";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.name"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.name"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.name"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,DEST_EQP-name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.name"].columnName="EAM_NAME";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.id"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.id"].dbColumnType="LONG";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.id"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_ROUTINES,DEST_EQP-name";
ec_MESBasic_routine_routine_routineRef_quickquery_info["destEqp.id"].columnName="ID";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.productName"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.productName"].dbColumnType="TEXT";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_ROUTINES,PRODUCT-productName";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.productName"].columnName="PRODUCT_NAME";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.id"]={};
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.id"].dbColumnType="LONG";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_ROUTINES,PRODUCT-productName";
ec_MESBasic_routine_routine_routineRef_quickquery_info["product.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.routine.routine.routineRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/routine/routine/routineRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_routine_routine_routineRef_query" renderOverEvent="ec_MESBasic_routine_routine_routineRef_RenderOverEvent"  modelCode="MESBasic_1_routine_Routine" noPermissionKeys="code,name,srouceEqp.name,destEqp.name,product.productName,density,routineStrategy" hidekeyPrefix="ec_MESBasic_routine_routine_routineRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_routine_routine_routineRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','routineStrategy.id','routineStrategy','srouceEqp.id','destEqp.id','product.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415336575756')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1415336597801')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign srouceEqp_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${srouceEqp_name_displayDefaultType!}"  key="srouceEqp.name"   label="${getText('MESBasic.propertydisplayName.randon1427442213645')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign destEqp_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${destEqp_name_displayDefaultType!}"  key="destEqp.name"   label="${getText('MESBasic.propertydisplayName.randon1427442234442')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign density_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${density_displayDefaultType!}"  key="density"   label="${getText('MESBasic.propertydisplayName.randon1423898372445')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_routine_routine_routineRef_RenderOverEvent(){
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
	 * @method MESBasic.routine.routine.routineRef.query
	 */
	MESBasic.routine.routine.routineRef.query = function(type,pageNo){
		var node = MESBasic.routine.routine.routineRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.routine.routine.routineRef.node = null;
		if(!checkListValid("ec_MESBasic_routine_routine_routineRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/routine/routine/routineRef-query.action";
		CUI('#ec_MESBasic_routine_routine_routineRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_routine_routine_routineRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_routine_routineRef";
		condobj.modelAlias="routine";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_routine_routine_routineRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_routine_routine_routineRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_routine_routine_routineRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_routine_routine_routineRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_routine_routine_routineRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_routine_routine_routineRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_routine_routine_routineRef_queryForm *[name="'+ec_MESBasic_routine_routine_routineRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_routine_routine_routineRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_routine_routine_routineRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_routine_routine_routineRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_routine_routine_routineRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_routine_routine_routineRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_routine_routine_routineRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_routine_routineRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_routine_routine_routineRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.routine.routine.routineRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.routine.routine.routineRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.routine.routine.routineRef._prefix += '.';
			}
			MESBasic.routine.routine.routineRef._prefix += arr[i];
		}
		MESBasic.routine.routine.routineRef._suffix = arr[arr.length -1];
		if(MESBasic.routine.routine.routineRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.routine.routine.routineRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.routine.routine.routineRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.routine.routine.routineRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.routine.routine.routineRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_routine_routine_routineRef_queryForm *[name="'+MESBasic.routine.routine.routineRef._prefix + '.' + MESBasic.routine.routine.routineRef._suffix +'"]').val(obj[0][MESBasic.routine.routine.routineRef._suffix]);
		CUI('#ec_MESBasic_routine_routine_routineRef_queryForm *[name="'+MESBasic.routine.routine.routineRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_routine_routine_routineRef_queryForm *[name^="'+MESBasic.routine.routine.routineRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_routine_routine_routineRef_queryForm *[name="'+MESBasic.routine.routine.routineRef._prefix + '.' + MESBasic.routine.routine.routineRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_routine_routine_routineRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.routine.routine.routineRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.routine.routine.routineRef.query_"+obj+")!='undefined'") ? eval('MESBasic.routine.routine.routineRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_routine_routine_routineRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_routine_routine_routineRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.routine.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_routine_routine_routineRef_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_routine_routine_routineRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_routine_routine_routineRef_refresh = function(node){
	//var url = "/MESBasic/routine/routine/routineRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_routine_routine_routineRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_routine_routine_routineRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.routine.routine.routineRef.node = node;
	MESBasic.routine.routine.routineRef.query("query");
}

MESBasic_routine_routine_routineRef_getList = function() {
	return "MESBasic.routine.routine.routineRef";
}

	MESBasic.routine.routine.routineRef.commonQuery = function(type) {
	  if(typeof MESBasic.routine.routine.routineRef.cancelSelectedNode == 'function') {
	   MESBasic.routine.routine.routineRef.cancelSelectedNode();
	  }
	  MESBasic.routine.routine.routineRef.query(type);
	 };
	
	

MESBasic.routine.routine.routineRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.routine.routine.routineRef.otherParams = {};
	MESBasic.routine.routine.routineRef.otherParams.dialogType = dialogType;
	MESBasic.routine.routine.routineRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.routine.routine.routineRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_routine_routineRef,js,MESBasic_1_routine_Routine,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
