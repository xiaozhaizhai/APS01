
<script type="text/javascript">
	CUI.ns("MESBasic.baseVendor.baseVendor","MESBasic.baseVendor.baseVendor.vendorPartRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_baseVendor_baseVendor_vendorPartRef_callBackFuncName" id="MESBasic_baseVendor_baseVendor_vendorPartRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1449536347672')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" exportUrl="/MESBasic/baseVendor/baseVendor/vendorPartRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="MESBasic_1_baseVenderClass_BaseVendorClass" value="vendorVCCode" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="vendorDepartID" />
		<input type="hidden" reset="false" name="MESBasic_baseVendor_baseVendor_vendorPartRef_condition" id="MESBasic_baseVendor_baseVendor_vendorPartRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1449536448032')}_${getText('MESBasic.viewtitle.randon1504601359572')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" idprefix="ec_MESBasic_baseVendor_baseVendor_vendorPartRef" expandType="all" expand=true fieldcodes="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode:MESBasic.propertydisplayName.randon1449537304035||MESBasic_1_baseVendor_BaseVendor_vendorShortName_vendorShortName:MESBasic.propertydisplayName.randon1449540785278||MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName:MESBasic.propertydisplayName.randon1449540299342" >
							<#assign vendorCode_defaultValue  = ''>
									<#assign vendorCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_baseVendor_BaseVendor_vendorCode_vendorCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1449537304035')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (vendorCode_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${vendorCode_defaultValue!}" deValue="${vendorCode_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorCode')" name="vendorCode" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorCode" displayFieldName="vendorCode" exp="like" classStyle="form-control"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorCode')" name="vendorCode" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorCode" displayFieldName="vendorCode" exp="like" classStyle="form-control"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign vendorShortName_defaultValue  = ''>
									<#assign vendorShortName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_baseVendor_BaseVendor_vendorShortName_vendorShortName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_baseVendor_BaseVendor_vendorShortName_vendorShortName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1449540785278')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (vendorShortName_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${vendorShortName_defaultValue!}" deValue="${vendorShortName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorShortName')" name="vendorShortName" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorShortName" displayFieldName="vendorShortName" exp="like" classStyle="form-control"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorShortName')" name="vendorShortName" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorShortName" displayFieldName="vendorShortName" exp="like" classStyle="form-control"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign vendorName_defaultValue  = ''>
									<#assign vendorName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_baseVendor_BaseVendor_vendorName_vendorName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1449540299342')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (vendorName_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${vendorName_defaultValue!}" deValue="${vendorName_defaultValue!}"   conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorName')" name="vendorName" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorName" displayFieldName="vendorName" exp="like" classStyle="form-control"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc('vendorName')" name="vendorName" id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm_vendorName" displayFieldName="vendorName" exp="like" classStyle="form-control"  url="/MESBasic/baseVendor/baseVendor/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" type="search" onclick="MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm' );
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

ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info={};
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorCode"]={};
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorCode"].dbColumnType="TEXT";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorCode"].layRec="vendorCode";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorCode"].columnName="VENDOR_CODE";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorShortName"]={};
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorShortName"].dbColumnType="TEXT";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorShortName"].layRec="vendorShortName";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorShortName"].columnName="VENDOR_SHORTNAME";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorName"]={};
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorName"].dbColumnType="TEXT";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorName"].layRec="vendorName";
ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["vendorName"].columnName="VENDOR_NAME";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.baseVendor.baseVendor.vendorPartRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/baseVendor/baseVendor/vendorPartRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query" renderOverEvent="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_RenderOverEvent"  modelCode="MESBasic_1_baseVendor_BaseVendor" noPermissionKeys="vendorCode,vendorShortName,vendorName,vendorDegreeCode,vendorVCCode.name" hidekeyPrefix="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','vendorDegreeCode','vendorVCCode.id','vendorVCCode.code']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign vendorCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${vendorCode_displayDefaultType!}"  key="vendorCode"   label="${getText('MESBasic.propertydisplayName.randon1449537304035')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign vendorShortName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${vendorShortName_displayDefaultType!}"  key="vendorShortName"   label="${getText('MESBasic.propertydisplayName.randon1449540785278')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign vendorName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${vendorName_displayDefaultType!}"  key="vendorName"   label="${getText('MESBasic.propertydisplayName.randon1449540299342')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign vendorDegreeCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${vendorDegreeCode_displayDefaultType!}"  key="vendorDegreeCodeForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1449538619738')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign vendorVCCode_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${vendorVCCode_name_displayDefaultType!}"  key="vendorVCCode.name"   label="${getText('MESBasic.propertydisplayName.randon1449472903805.vendor1')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_baseVendor_baseVendor_vendorPartRef_RenderOverEvent(){
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
	 * @method MESBasic.baseVendor.baseVendor.vendorPartRef.query
	 */
	MESBasic.baseVendor.baseVendor.vendorPartRef.query = function(type,pageNo){
		var node = MESBasic.baseVendor.baseVendor.vendorPartRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.baseVendor.baseVendor.vendorPartRef.node = null;
		if(!checkListValid("ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/baseVendor/baseVendor/vendorPartRef-query.action";
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_baseVendor_vendorPartRef";
		condobj.modelAlias="baseVendor";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm *[name="'+ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_baseVendor_baseVendor_vendorPartRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_baseVendor_baseVendor_vendorPartRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_baseVendor_vendorPartRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.baseVendor.baseVendor.vendorPartRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.baseVendor.baseVendor.vendorPartRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.baseVendor.baseVendor.vendorPartRef._prefix += '.';
			}
			MESBasic.baseVendor.baseVendor.vendorPartRef._prefix += arr[i];
		}
		MESBasic.baseVendor.baseVendor.vendorPartRef._suffix = arr[arr.length -1];
		if(MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.baseVendor.baseVendor.vendorPartRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.baseVendor.baseVendor.vendorPartRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.baseVendor.baseVendor.vendorPartRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm *[name="'+MESBasic.baseVendor.baseVendor.vendorPartRef._prefix + '.' + MESBasic.baseVendor.baseVendor.vendorPartRef._suffix +'"]').val(obj[0][MESBasic.baseVendor.baseVendor.vendorPartRef._suffix]);
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm *[name="'+MESBasic.baseVendor.baseVendor.vendorPartRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm *[name^="'+MESBasic.baseVendor.baseVendor.vendorPartRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm *[name="'+MESBasic.baseVendor.baseVendor.vendorPartRef._prefix + '.' + MESBasic.baseVendor.baseVendor.vendorPartRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_baseVendor_baseVendor_vendorPartRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.baseVendor.baseVendor.vendorPartRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.baseVendor.baseVendor.vendorPartRef.query_"+obj+")!='undefined'") ? eval('MESBasic.baseVendor.baseVendor.vendorPartRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.baseVendor.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_baseVendor_baseVendor_vendorPartRef_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_baseVendor_baseVendor_vendorPartRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_baseVendor_baseVendor_vendorPartRef_refresh = function(node){
	//var url = "/MESBasic/baseVendor/baseVendor/vendorPartRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_baseVendor_baseVendor_vendorPartRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.baseVendor.baseVendor.vendorPartRef.node = node;
	MESBasic.baseVendor.baseVendor.vendorPartRef.query("query");
}

MESBasic_baseVendor_baseVendor_vendorPartRef_getList = function() {
	return "MESBasic.baseVendor.baseVendor.vendorPartRef";
}

	MESBasic.baseVendor.baseVendor.vendorPartRef.commonQuery = function(type) {
	  if(typeof MESBasic.baseVendor.baseVendor.vendorPartRef.cancelSelectedNode == 'function') {
	   MESBasic.baseVendor.baseVendor.vendorPartRef.cancelSelectedNode();
	  }
	  MESBasic.baseVendor.baseVendor.vendorPartRef.query(type);
	 };
	
	

MESBasic.baseVendor.baseVendor.vendorPartRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.baseVendor.baseVendor.vendorPartRef.otherParams = {};
	MESBasic.baseVendor.baseVendor.vendorPartRef.otherParams.dialogType = dialogType;
	MESBasic.baseVendor.baseVendor.vendorPartRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.baseVendor.baseVendor.vendorPartRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_baseVendor_vendorPartRef,js,MESBasic_1_baseVendor_BaseVendor,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
