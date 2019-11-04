
<script type="text/javascript">
	CUI.ns("MESBasic.baseCustomer.baseCustomer","MESBasic.baseCustomer.baseCustomer.refCustListPart");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName" id="MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1449638926683')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" exportUrl="/MESBasic/baseCustomer/baseCustomer/refCustListPart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="customerDepartID" />
		<input type="hidden" id="MESBasic_1_baseCustomerClass_BaseCustomerClass" value="customerCCCode" />
		<input type="hidden" reset="false" name="MESBasic_baseCustomer_baseCustomer_refCustListPart_condition" id="MESBasic_baseCustomer_baseCustomer_refCustListPart_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1449638984644')}_${getText('MESBasic.viewtitle.randon1449650884617')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" formId="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" idprefix="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart" expandType="all" expand=true fieldcodes="MESBasic_1_baseCustomer_BaseCustomer_customerCode_customerCode:MESBasic.propertydisplayName.randon1449640688865||MESBasic_1_baseCustomer_BaseCustomer_customerShortName_customerShortName:MESBasic.propertydisplayName.randon1449647160005||MESBasic_1_baseCustomer_BaseCustomer_customerName_customerName:MESBasic.propertydisplayName.randon1449646749348" >
							<#assign customerCode_defaultValue  = ''>
									<#assign customerCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_baseCustomer_BaseCustomer_customerCode_customerCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_baseCustomer_BaseCustomer_customerCode_customerCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1449640688865')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (customerCode_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${customerCode_defaultValue!}" deValue="${customerCode_defaultValue!}"   conditionfunc="MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc('customerCode')" name="customerCode" id="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm_customerCode" displayFieldName="customerCode" exp="like" classStyle="form-control"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomer.baseCustomer.refCustListPart.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc('customerCode')" name="customerCode" id="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm_customerCode" displayFieldName="customerCode" exp="like" classStyle="form-control"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomer.baseCustomer.refCustListPart.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign customerShortName_defaultValue  = ''>
									<#assign customerShortName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_baseCustomer_BaseCustomer_customerShortName_customerShortName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_baseCustomer_BaseCustomer_customerShortName_customerShortName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1449647160005')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="customerShortName" id="customerShortName" value="${customerShortName_defaultValue!}" deValue="${customerShortName_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign customerName_defaultValue  = ''>
									<#assign customerName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_baseCustomer_BaseCustomer_customerName_customerName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_baseCustomer_BaseCustomer_customerName_customerName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1449646749348')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (customerName_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${customerName_defaultValue!}" deValue="${customerName_defaultValue!}"   conditionfunc="MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc('customerName')" name="customerName" id="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm_customerName" displayFieldName="customerName" exp="like" classStyle="form-control"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomer.baseCustomer.refCustListPart.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc('customerName')" name="customerName" id="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm_customerName" displayFieldName="customerName" exp="like" classStyle="form-control"  url="/MESBasic/baseCustomer/baseCustomer/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseCustomer.baseCustomer.refCustListPart.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" type="search" onclick="MESBasic.baseCustomer.baseCustomer.refCustListPart.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm' );
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

ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info={};
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerCode"]={};
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerCode"].dbColumnType="TEXT";
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerCode"].layRec="customerCode";
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerCode"].columnName="CUSTOMER_CODE";
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerShortName"]={};
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerShortName"].dbColumnType="TEXT";
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerShortName"].layRec="customerShortName";
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerShortName"].columnName="CUSTOMER_SHORTNAME";
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerName"]={};
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerName"].dbColumnType="TEXT";
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerName"].layRec="customerName";
ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["customerName"].columnName="CUSTOMER_NAME";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.baseCustomer.baseCustomer.refCustListPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseCustomer/baseCustomer/refCustListPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query" renderOverEvent="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_RenderOverEvent"  modelCode="MESBasic_1_baseCustomer_BaseCustomer" noPermissionKeys="customerCode,customerShortName,customerName,customerVocation,customerDCCode,customerDegreeCode,customerProperty,ownerStaff.name" hidekeyPrefix="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','customerVocation','customerDCCode','customerDegreeCode','customerProperty','ownerStaff.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign customerCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${customerCode_displayDefaultType!}"  key="customerCode"   label="${getText('MESBasic.propertydisplayName.randon1449640688865')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerShortName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${customerShortName_displayDefaultType!}"  key="customerShortName"   label="${getText('MESBasic.propertydisplayName.randon1449647160005')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${customerName_displayDefaultType!}"  key="customerName"   label="${getText('MESBasic.propertydisplayName.randon1449646749348')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerVocation_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${customerVocation_displayDefaultType!}"  key="customerVocationForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449648077021')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerDCCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${customerDCCode_displayDefaultType!}"  key="customerDCCodeForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449640880459')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerDegreeCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${customerDegreeCode_displayDefaultType!}"  key="customerDegreeCodeForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449641128193')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign customerProperty_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${customerProperty_displayDefaultType!}"  key="customerPropertyForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449647028584')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign ownerStaff_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${ownerStaff_name_displayDefaultType!}"  key="ownerStaff.name"   label="${getText('MESBasic.foundation.staff.dimissionStaff_xls.staffName.Cust1')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_RenderOverEvent(){
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
	 * @method MESBasic.baseCustomer.baseCustomer.refCustListPart.query
	 */
	MESBasic.baseCustomer.baseCustomer.refCustListPart.query = function(type,pageNo){
		var node = MESBasic.baseCustomer.baseCustomer.refCustListPart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.baseCustomer.baseCustomer.refCustListPart.node = null;
		if(!checkListValid("ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/baseCustomer/baseCustomer/refCustListPart-query.action";
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_baseCustomer_refCustListPart";
		condobj.modelAlias="baseCustomer";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_baseCustomer_baseCustomer_refCustListPart_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_baseCustomer_refCustListPart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.baseCustomer.baseCustomer.refCustListPart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix += '.';
			}
			MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix += arr[i];
		}
		MESBasic.baseCustomer.baseCustomer.refCustListPart._suffix = arr[arr.length -1];
		if(MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.baseCustomer.baseCustomer.refCustListPart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.baseCustomer.baseCustomer.refCustListPart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.baseCustomer.baseCustomer.refCustListPart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix + '.' + MESBasic.baseCustomer.baseCustomer.refCustListPart._suffix +'"]').val(obj[0][MESBasic.baseCustomer.baseCustomer.refCustListPart._suffix]);
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name^="'+MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+MESBasic.baseCustomer.baseCustomer.refCustListPart._prefix + '.' + MESBasic.baseCustomer.baseCustomer.refCustListPart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.baseCustomer.baseCustomer.refCustListPart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.baseCustomer.baseCustomer.refCustListPart.query_"+obj+")!='undefined'") ? eval('MESBasic.baseCustomer.baseCustomer.refCustListPart.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.baseCustomer.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_baseCustomer_baseCustomer_refCustListPart_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_baseCustomer_baseCustomer_refCustListPart_refresh = function(node){
	//var url = "/MESBasic/baseCustomer/baseCustomer/refCustListPart-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_baseCustomer_baseCustomer_refCustListPart_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.baseCustomer.baseCustomer.refCustListPart.node = node;
	MESBasic.baseCustomer.baseCustomer.refCustListPart.query("query");
}

MESBasic_baseCustomer_baseCustomer_refCustListPart_getList = function() {
	return "MESBasic.baseCustomer.baseCustomer.refCustListPart";
}

	MESBasic.baseCustomer.baseCustomer.refCustListPart.commonQuery = function(type) {
	  if(typeof MESBasic.baseCustomer.baseCustomer.refCustListPart.cancelSelectedNode == 'function') {
	   MESBasic.baseCustomer.baseCustomer.refCustListPart.cancelSelectedNode();
	  }
	  MESBasic.baseCustomer.baseCustomer.refCustListPart.query(type);
	 };
	
	

MESBasic.baseCustomer.baseCustomer.refCustListPart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.baseCustomer.baseCustomer.refCustListPart.otherParams = {};
	MESBasic.baseCustomer.baseCustomer.refCustListPart.otherParams.dialogType = dialogType;
	MESBasic.baseCustomer.baseCustomer.refCustListPart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.baseCustomer.baseCustomer.refCustListPart.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_baseCustomer_refCustListPart,js,MESBasic_1_baseCustomer_BaseCustomer,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
