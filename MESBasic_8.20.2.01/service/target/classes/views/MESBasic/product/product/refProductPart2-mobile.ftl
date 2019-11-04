
<script type="text/javascript">
	CUI.ns("MESBasic.product.product","MESBasic.product.product.refProductPart2");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_product_product_refProductPart2_callBackFuncName" id="MESBasic_product_product_refProductPart2_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_product_product_refProductPart2_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415772266801')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_product_product_refProductPart2_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_product_product_refProductPart2_queryForm" exportUrl="/MESBasic/product/product/refProductPart2-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="MESBasic_1_prodList_BaseProdList" value="productListID" />
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeSet" />
		<input type="hidden" reset="false" name="MESBasic_product_product_refProductPart2_condition" id="MESBasic_product_product_refProductPart2_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415772316600')}_${getText('MESBasic.viewtitle.randon1476668319179')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_product_product_refProductPart2_queryForm" formId="ec_MESBasic_product_product_refProductPart2_queryForm" idprefix="ec_MESBasic_product_product_refProductPart2" expandType="all" expand=true fieldcodes="MESBasic_1_product_Product_productCode_productCode:MESBasic.propertydisplayName.radion1415772644833||MESBasic_1_product_Product_productName_productName:MESBasic.propertydisplayName.radion1415772740737||MESBasic_1_product_Product_productModel_productModel:MESBasic.propertydisplayName.radion1415772568665||MESBasic_1_product_Product_productSpecif_productSpecif:MESBasic.propertydisplayName.radion1415772620384" >
							<#assign productCode_defaultValue  = ''>
									<#assign productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772644833')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (productCode_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_product_product_refProductPart2_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${productCode_defaultValue!}" deValue="${productCode_defaultValue!}"   conditionfunc="MESBasic.product.product.refProductPart2._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_refProductPart2_queryForm_productCode" displayFieldName="productCode" exp="like" classStyle="form-control"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.refProductPart2.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_product_product_refProductPart2_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.product.product.refProductPart2._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_refProductPart2_queryForm_productCode" displayFieldName="productCode" exp="like" classStyle="form-control"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.refProductPart2.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign productName_defaultValue  = ''>
									<#assign productName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productName_productName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productName_productName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772740737')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (productName_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_product_product_refProductPart2_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${productName_defaultValue!}" deValue="${productName_defaultValue!}"   conditionfunc="MESBasic.product.product.refProductPart2._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_refProductPart2_queryForm_productName" displayFieldName="productName" exp="like" classStyle="form-control"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.refProductPart2.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_product_product_refProductPart2_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.product.product.refProductPart2._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_refProductPart2_queryForm_productName" displayFieldName="productName" exp="like" classStyle="form-control"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.refProductPart2.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign productModel_defaultValue  = ''>
									<#assign productModel_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productModel_productModel" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productModel_productModel">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772568665')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="productModel" id="productModel" value="${productModel_defaultValue!}" deValue="${productModel_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign productSpecif_defaultValue  = ''>
									<#assign productSpecif_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productSpecif_productSpecif" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productSpecif_productSpecif">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772620384')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="productSpecif" id="productSpecif" value="${productSpecif_defaultValue!}" deValue="${productSpecif_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_product_product_refProductPart2_queryForm" type="search" onclick="MESBasic.product.product.refProductPart2.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_product_product_refProductPart2_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_product_product_refProductPart2_queryForm' );
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

ec_MESBasic_product_product_refProductPart2_quickquery_info={};
ec_MESBasic_product_product_refProductPart2_quickquery_info["productCode"]={};
ec_MESBasic_product_product_refProductPart2_quickquery_info["productCode"].dbColumnType="TEXT";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productCode"].layRec="productCode";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productCode"].columnName="PRODUCT_CODE";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productName"]={};
ec_MESBasic_product_product_refProductPart2_quickquery_info["productName"].dbColumnType="TEXT";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productName"].layRec="productName";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productName"].columnName="PRODUCT_NAME";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productModel"]={};
ec_MESBasic_product_product_refProductPart2_quickquery_info["productModel"].dbColumnType="TEXT";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productModel"].layRec="productModel";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productModel"].columnName="PRODUCT_MODEL";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productSpecif"]={};
ec_MESBasic_product_product_refProductPart2_quickquery_info["productSpecif"].dbColumnType="TEXT";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productSpecif"].layRec="productSpecif";
ec_MESBasic_product_product_refProductPart2_quickquery_info["productSpecif"].columnName="PRODUCT_SPECIF";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.product.product.refProductPart2.query('query')">
<#assign datatable_dataUrl = "/MESBasic/product/product/refProductPart2-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_product_product_refProductPart2_query" renderOverEvent="ec_MESBasic_product_product_refProductPart2_RenderOverEvent"  modelCode="MESBasic_1_product_Product" noPermissionKeys="productName,productCode,prodType,productSpecif,productModel,modifyTime" hidekeyPrefix="ec_MESBasic_product_product_refProductPart2_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_product_product_refProductPart2_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','prodType']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
			<#assign productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productName_displayDefaultType!}"  key="productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productCode_displayDefaultType!}"  key="productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign prodType_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${prodType_displayDefaultType!}"  key="prodTypeForDisplay" order=false  label="${getText('MESBasic.propertydisplayName.randon1423897648875')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productSpecif_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productSpecif_displayDefaultType!}"  key="productSpecif"   label="${getText('MESBasic.propertydisplayName.radion1415772620384')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productModel_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productModel_displayDefaultType!}"  key="productModel"   label="${getText('MESBasic.propertydisplayName.radion1415772568665')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign modifyTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HMS" defaultDisplay="${modifyTime_displayDefaultType!}"  key="modifyTime"   label="${getText('ec.common.modifyTime')}" textalign="center"  width=100   type="datetime"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_product_product_refProductPart2_RenderOverEvent(){
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
	 * @method MESBasic.product.product.refProductPart2.query
	 */
	MESBasic.product.product.refProductPart2.query = function(type,pageNo){
		var node = MESBasic.product.product.refProductPart2.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.product.product.refProductPart2.node = null;
		if(!checkListValid("ec_MESBasic_product_product_refProductPart2_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/product/product/refProductPart2-query.action";
		CUI('#ec_MESBasic_product_product_refProductPart2_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_product_product_refProductPart2_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_product_refProductPart2";
		condobj.modelAlias="product";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_product_product_refProductPart2_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_product_product_refProductPart2_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_product_product_refProductPart2_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_product_product_refProductPart2_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_product_product_refProductPart2_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_product_product_refProductPart2_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_product_product_refProductPart2_queryForm *[name="'+ec_MESBasic_product_product_refProductPart2_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_product_product_refProductPart2_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_product_product_refProductPart2_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_product_product_refProductPart2_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_product_product_refProductPart2_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_product_product_refProductPart2_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_product_product_refProductPart2_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_product_refProductPart2';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_product_product_refProductPart2_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.product.product.refProductPart2._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.product.product.refProductPart2._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.product.product.refProductPart2._prefix += '.';
			}
			MESBasic.product.product.refProductPart2._prefix += arr[i];
		}
		MESBasic.product.product.refProductPart2._suffix = arr[arr.length -1];
		if(MESBasic.product.product.refProductPart2._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product.product.refProductPart2._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.product.product.refProductPart2._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.product.product.refProductPart2.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.product.product.refProductPart2.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_product_product_refProductPart2_queryForm *[name="'+MESBasic.product.product.refProductPart2._prefix + '.' + MESBasic.product.product.refProductPart2._suffix +'"]').val(obj[0][MESBasic.product.product.refProductPart2._suffix]);
		CUI('#ec_MESBasic_product_product_refProductPart2_queryForm *[name="'+MESBasic.product.product.refProductPart2._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_product_product_refProductPart2_queryForm *[name^="'+MESBasic.product.product.refProductPart2._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_product_product_refProductPart2_queryForm *[name="'+MESBasic.product.product.refProductPart2._prefix + '.' + MESBasic.product.product.refProductPart2._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_product_product_refProductPart2_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.product.product.refProductPart2._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product.product.refProductPart2.query_"+obj+")!='undefined'") ? eval('MESBasic.product.product.refProductPart2.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_product_product_refProductPart2_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_product_product_refProductPart2_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.product.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_product_product_refProductPart2_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_product_product_refProductPart2_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_product_product_refProductPart2_refresh = function(node){
	//var url = "/MESBasic/product/product/refProductPart2-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_product_product_refProductPart2_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_product_product_refProductPart2_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.product.product.refProductPart2.node = node;
	MESBasic.product.product.refProductPart2.query("query");
}

MESBasic_product_product_refProductPart2_getList = function() {
	return "MESBasic.product.product.refProductPart2";
}

	MESBasic.product.product.refProductPart2.commonQuery = function(type) {
	  if(typeof MESBasic.product.product.refProductPart2.cancelSelectedNode == 'function') {
	   MESBasic.product.product.refProductPart2.cancelSelectedNode();
	  }
	  MESBasic.product.product.refProductPart2.query(type);
	 };
	
	

MESBasic.product.product.refProductPart2.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.product.product.refProductPart2.otherParams = {};
	MESBasic.product.product.refProductPart2.otherParams.dialogType = dialogType;
	MESBasic.product.product.refProductPart2.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.product.product.refProductPart2.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_product_refProductPart2,js,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
