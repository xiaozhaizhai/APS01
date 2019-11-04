
<script type="text/javascript">
	CUI.ns("MESBasic.testMapping.testMappingSet","MESBasic.testMapping.testMappingSet.ref");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_testMapping_testMappingSet_ref_callBackFuncName" id="MESBasic_testMapping_testMappingSet_ref_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_testMapping_testMappingSet_ref_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1430808317340')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_testMapping_testMappingSet_ref_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_testMapping_testMappingSet_ref_queryForm" exportUrl="/MESBasic/testMapping/testMappingSet/ref-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" name="MESBasic_testMapping_testMappingSet_ref_condition" id="MESBasic_testMapping_testMappingSet_ref_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1430808417212')}_${getText('MESBasic.viewtitle.randon1431520980163')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_testMapping_testMappingSet_ref_queryForm" formId="ec_MESBasic_testMapping_testMappingSet_ref_queryForm" idprefix="ec_MESBasic_testMapping_testMappingSet_ref" expandType="all" expand=true fieldcodes="MESBasic_1_testMapping_TestMappingSet_testName_testName:MESBasic.propertydisplayName.randon1430808486471||MESBasic_1_testMapping_TestMappingSet_testShortName_testShortName:MESBasic.propertydisplayName.randon1430808617634||MESBasic_1_product_Product_productName_product_productName:MESBasic.propertydisplayName.radion1415772740737||MESBasic_1_product_Product_productCode_product_productCode:MESBasic.propertydisplayName.radion1415772644833" >
							<#assign testName_defaultValue  = ''>
									<#assign testName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_testMapping_TestMappingSet_testName_testName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_testMapping_TestMappingSet_testName_testName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1430808486471')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="testName" id="testName" value="${testName_defaultValue!}" deValue="${testName_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign testShortName_defaultValue  = ''>
									<#assign testShortName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_testMapping_TestMappingSet_testShortName_testShortName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_testMapping_TestMappingSet_testShortName_testShortName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1430808617634')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="testShortName" id="testShortName" value="${testShortName_defaultValue!}" deValue="${testShortName_defaultValue!}"   exp="like"/>
											
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
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.radion1415773613713')}"  conditionfunc="MESBasic.testMapping.testMappingSet.ref._querycustomFunc('product_productName')" name="product.productName" id="ec_MESBasic_testMapping_testMappingSet_ref_queryForm_product_productName" displayFieldName="productName" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_testMapping_testMappingSet_ref_queryForm" searchClick="MESBasic.testMapping.testMappingSet.ref.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign product_productCode_defaultValue  = ''>
									<#assign product_productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_product_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_product_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772644833')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.radion1415773613713')}"  conditionfunc="MESBasic.testMapping.testMappingSet.ref._querycustomFunc('product_productCode')" name="product.productCode" id="ec_MESBasic_testMapping_testMappingSet_ref_queryForm_product_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_testMapping_testMappingSet_ref_queryForm" searchClick="MESBasic.testMapping.testMappingSet.ref.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_MESBasic_testMapping_testMappingSet_ref_queryForm" type="search" onclick="MESBasic.testMapping.testMappingSet.ref.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_testMapping_testMappingSet_ref_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_testMapping_testMappingSet_ref_queryForm' );
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
<#assign datatable_queryFunc = "MESBasic.testMapping.testMappingSet.ref.query('query')">
<#assign datatable_dataUrl = "/MESBasic/testMapping/testMappingSet/ref-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_testMapping_testMappingSet_ref_query" renderOverEvent="ec_MESBasic_testMapping_testMappingSet_ref_RenderOverEvent"  modelCode="MESBasic_1_testMapping_TestMappingSet" noPermissionKeys="testName,testShortName,product.productName,product.productCode" hidekeyPrefix="ec_MESBasic_testMapping_testMappingSet_ref_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_testMapping_testMappingSet_ref_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','product.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign testName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${testName_displayDefaultType!}"  key="testName"   label="${getText('MESBasic.propertydisplayName.randon1430808486471')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign testShortName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${testShortName_displayDefaultType!}"  key="testShortName"   label="${getText('MESBasic.propertydisplayName.randon1430808617634')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign product_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${product_productCode_displayDefaultType!}"  key="product.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_testMapping_testMappingSet_ref_RenderOverEvent(){
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
	 * @method MESBasic.testMapping.testMappingSet.ref.query
	 */
	MESBasic.testMapping.testMappingSet.ref.query = function(type,pageNo){
		var node = MESBasic.testMapping.testMappingSet.ref.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.testMapping.testMappingSet.ref.node = null;
		if(!checkListValid("ec_MESBasic_testMapping_testMappingSet_ref_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/testMapping/testMappingSet/ref-query.action";
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_testMapping_testMappingSet_ref_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_testMapping_testMappingSet_ref_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_testMapping_ref';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.testMapping.testMappingSet.ref._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.testMapping.testMappingSet.ref._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.testMapping.testMappingSet.ref._prefix += '.';
			}
			MESBasic.testMapping.testMappingSet.ref._prefix += arr[i];
		}
		MESBasic.testMapping.testMappingSet.ref._suffix = arr[arr.length -1];
		if(MESBasic.testMapping.testMappingSet.ref._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.testMapping.testMappingSet.ref._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.testMapping.testMappingSet.ref._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.testMapping.testMappingSet.ref.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.testMapping.testMappingSet.ref.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+MESBasic.testMapping.testMappingSet.ref._prefix + '.' + MESBasic.testMapping.testMappingSet.ref._suffix +'"]').val(obj[0][MESBasic.testMapping.testMappingSet.ref._suffix]);
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+MESBasic.testMapping.testMappingSet.ref._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name^="'+MESBasic.testMapping.testMappingSet.ref._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+MESBasic.testMapping.testMappingSet.ref._prefix + '.' + MESBasic.testMapping.testMappingSet.ref._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_testMapping_testMappingSet_ref_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.testMapping.testMappingSet.ref._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.testMapping.testMappingSet.ref.query_"+obj+")!='undefined'") ? eval('MESBasic.testMapping.testMappingSet.ref.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.testMappingSet.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_testMapping_testMappingSet_ref_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_testMapping_testMappingSet_ref_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_testMapping_testMappingSet_ref_refresh = function(node){
	//var url = "/MESBasic/testMapping/testMappingSet/ref-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_testMapping_testMappingSet_ref_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.testMapping.testMappingSet.ref.node = node;
	MESBasic.testMapping.testMappingSet.ref.query("query");
}

MESBasic_testMapping_testMappingSet_ref_getList = function() {
	return "MESBasic.testMapping.testMappingSet.ref";
}

	MESBasic.testMapping.testMappingSet.ref.commonQuery = function(type) {
	  if(typeof MESBasic.testMapping.testMappingSet.ref.cancelSelectedNode == 'function') {
	   MESBasic.testMapping.testMappingSet.ref.cancelSelectedNode();
	  }
	  MESBasic.testMapping.testMappingSet.ref.query(type);
	 };
	
	

MESBasic.testMapping.testMappingSet.ref.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.testMapping.testMappingSet.ref.otherParams = {};
	MESBasic.testMapping.testMappingSet.ref.otherParams.dialogType = dialogType;
	MESBasic.testMapping.testMappingSet.ref.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.testMapping.testMappingSet.ref.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_testMapping_ref,js,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
