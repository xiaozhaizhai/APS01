
<script type="text/javascript">
	CUI.ns("MESBasic.product.product","MESBasic.product.product.productRefSelf");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_product_product_productRefSelf_callBackFuncName" id="MESBasic_product_product_productRefSelf_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_product_product_productRefSelf_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415772266801')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_product_product_productRefSelf_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_product_product_productRefSelf_queryForm" exportUrl="/MESBasic/product/product/productRefSelf-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_product_product_productRefSelf_condition" id="MESBasic_product_product_productRefSelf_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415772316600')}_${getText('MESBasic.viewtitle.radion1415773613713')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_product_product_productRefSelf_queryForm" formId="ec_MESBasic_product_product_productRefSelf_queryForm" idprefix="ec_MESBasic_product_product_productRefSelf" expandType="single" expand=false fieldcodes="MESBasic_1_product_Product_productCode_productCode:MESBasic.propertydisplayName.radion1415772644833||MESBasic_1_product_Product_productName_productName:MESBasic.propertydisplayName.radion1415772740737||MESBasic_1_product_Product_productModel_productModel:MESBasic.propertydisplayName.radion1415772620384||MESBasic_1_product_Product_attachExplain_attachExplain:MESBasic.propertydisplayName.radion1416221150939" >
							<#assign productCode_defaultValue  = ''>
									<#assign productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772644833')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (productCode_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_product_product_productRefSelf_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${productCode_defaultValue!}" deValue="${productCode_defaultValue!}"   conditionfunc="MESBasic.product.product.productRefSelf._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_productRefSelf_queryForm_productCode" displayFieldName="productCode" exp="like" classStyle="form-control"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productRefSelf.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_product_product_productRefSelf_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.product.product.productRefSelf._querycustomFunc('productCode')" name="productCode" id="ec_MESBasic_product_product_productRefSelf_queryForm_productCode" displayFieldName="productCode" exp="like" classStyle="form-control"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productRefSelf.commonQuery('query')" />
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
												<@mneclient formId="ec_MESBasic_product_product_productRefSelf_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${productName_defaultValue!}" deValue="${productName_defaultValue!}"   conditionfunc="MESBasic.product.product.productRefSelf._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_productRefSelf_queryForm_productName" displayFieldName="productName" exp="like" classStyle="form-control"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productRefSelf.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_product_product_productRefSelf_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.product.product.productRefSelf._querycustomFunc('productName')" name="productName" id="ec_MESBasic_product_product_productRefSelf_queryForm_productName" displayFieldName="productName" exp="like" classStyle="form-control"  url="/MESBasic/product/product/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.product.product.productRefSelf.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign productModel_defaultValue  = ''>
									<#assign productModel_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productModel_productModel" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productModel_productModel">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772620384')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="productModel" id="productModel" value="${productModel_defaultValue!}" deValue="${productModel_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign attachExplain_defaultValue  = ''>
									<#assign attachExplain_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_attachExplain_attachExplain" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_attachExplain_attachExplain">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1416221150939')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="attachExplain" id="attachExplain" value="${attachExplain_defaultValue!}" deValue="${attachExplain_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_MESBasic_product_product_productRefSelf_queryForm" type="search" onclick="MESBasic.product.product.productRefSelf.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_product_product_productRefSelf_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_product_product_productRefSelf_queryForm' );
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
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.product.product.productRefSelf.query('query')">
<#assign datatable_dataUrl = "/MESBasic/product/product/productRefSelf-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_product_product_productRefSelf_query" renderOverEvent="ec_MESBasic_product_product_productRefSelf_RenderOverEvent"  modelCode="MESBasic_1_product_Product" noPermissionKeys="productCode,productName,assetno,attachExplain,productSpecif,seqno,unit,provalue,correcteam,storageplace,prostatus,goodState" hidekeyPrefix="ec_MESBasic_product_product_productRefSelf_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_product_product_productRefSelf_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','prostatus.id','goodState.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productCode_displayDefaultType!}"  key="productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productName_displayDefaultType!}"  key="productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign assetno_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${assetno_displayDefaultType!}"  key="assetno"   label="${getText('MESBasic.propertydisplayName.radion1426063348625')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign attachExplain_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${attachExplain_displayDefaultType!}"  key="attachExplain"   label="${getText('MESBasic.propertydisplayName.radion1416221150939')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign productSpecif_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productSpecif_displayDefaultType!}"  key="productSpecif"   label="${getText('MESBasic.propertydisplayName.radion1415772620384')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign seqno_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${seqno_displayDefaultType!}"  key="seqno"   label="${getText('MESBasic.propertydisplayName.radion1426062856782')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign unit_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${unit_displayDefaultType!}"  key="unit"   label="${getText('MESBasic.propertydisplayName.radion1416221204854')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign provalue_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${provalue_displayDefaultType!}"  key="provalue"   label="${getText('MESBasic.propertydisplayName.radion1426062803208')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign correcteam_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${correcteam_displayDefaultType!}"  key="correcteam"   label="${getText('MESBasic.propertydisplayName.radion1426062928664')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storageplace_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${storageplace_displayDefaultType!}"  key="storageplace"   label="${getText('MESBasic.propertydisplayName.radion1426062975311')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign prostatus_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${prostatus_displayDefaultType!}"  key="prostatus.value"   label="${getText('MESBasic.propertydisplayName.radion1426063248991')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign goodState_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${goodState_displayDefaultType!}"  key="goodState.value"   label="${getText('MESBasic.propertydisplayName.radion1416221691507')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_product_product_productRefSelf_RenderOverEvent(){
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
	 * @method MESBasic.product.product.productRefSelf.query
	 */
	MESBasic.product.product.productRefSelf.query = function(type,pageNo){
		var node = MESBasic.product.product.productRefSelf.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.product.product.productRefSelf.node = null;
		if(!checkListValid("ec_MESBasic_product_product_productRefSelf_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/product/product/productRefSelf-query.action";
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_product_product_productRefSelf_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_product_product_productRefSelf_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+fastCol+'"]').val();
					if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
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
						}
						if(fastCol.endsWith('_end')) {
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
						}
						var multable = CUI(this).attr('multable');
						if(multable && multable == "yes") {
							dataPost += "&" + fastCol + "=," + encodeURIComponent($.trim(fastColValue)) + ",";
						} else {
							dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(fastColValue));
						}
					}
				}	
			}
		});
		var pageSize=CUI('input[name="ec_MESBasic_product_product_productRefSelf_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_product_product_productRefSelf_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_product_productRefSelf';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_product_product_productRefSelf_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.product.product.productRefSelf._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.product.product.productRefSelf._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.product.product.productRefSelf._prefix += '.';
			}
			MESBasic.product.product.productRefSelf._prefix += arr[i];
		}
		MESBasic.product.product.productRefSelf._suffix = arr[arr.length -1];
		if(MESBasic.product.product.productRefSelf._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product.product.productRefSelf._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.product.product.productRefSelf._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.product.product.productRefSelf.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.product.product.productRefSelf.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+MESBasic.product.product.productRefSelf._prefix + '.' + MESBasic.product.product.productRefSelf._suffix +'"]').val(obj[0][MESBasic.product.product.productRefSelf._suffix]);
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+MESBasic.product.product.productRefSelf._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name^="'+MESBasic.product.product.productRefSelf._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+MESBasic.product.product.productRefSelf._prefix + '.' + MESBasic.product.product.productRefSelf._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_product_product_productRefSelf_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.product.product.productRefSelf._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product.product.productRefSelf.query_"+obj+")!='undefined'") ? eval('MESBasic.product.product.productRefSelf.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_product_product_productRefSelf_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_product_product_productRefSelf_query.getSelectedRow();
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
			if(CUI("#MESBasic_product_product_productRefSelf_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_product_product_productRefSelf_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_product_product_productRefSelf_refresh = function(node){
	//var url = "/MESBasic/product/product/productRefSelf-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_product_product_productRefSelf_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_product_product_productRefSelf_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.product.product.productRefSelf.node = node;
	MESBasic.product.product.productRefSelf.query("query");
}

MESBasic_product_product_productRefSelf_getList = function() {
	return "MESBasic.product.product.productRefSelf";
}

	MESBasic.product.product.productRefSelf.commonQuery = function(type) {
	  if(typeof MESBasic.product.product.productRefSelf.cancelSelectedNode == 'function') {
	   MESBasic.product.product.productRefSelf.cancelSelectedNode();
	  }
	  MESBasic.product.product.productRefSelf.query(type);
	 };
	
	

MESBasic.product.product.productRefSelf.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.product.product.productRefSelf.otherParams = {};
	MESBasic.product.product.productRefSelf.otherParams.dialogType = dialogType;
	MESBasic.product.product.productRefSelf.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.product.product.productRefSelf.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_product_productRefSelf,js,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
