
<script type="text/javascript">
	CUI.ns("MESBasic.factoryModel.objProduct","MESBasic.factoryModel.objProduct.factoryProdRefPart");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName" id="MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1419232311198')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" exportUrl="/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="objFactory" />
		<input type="hidden" reset="false" name="MESBasic_factoryModel_objProduct_factoryProdRefPart_condition" id="MESBasic_factoryModel_objProduct_factoryProdRefPart_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1460950716828')}_${getText('MESBasic.viewtitle.randon1460960787686')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" idprefix="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart" expandType="all" expand=true fieldcodes="MESBasic_1_factoryModel_FactoryModel_name_objFactory_name:MESBasic.propertydisplayName.radion1419232393782||MESBasic_1_product_Product_productName_objProduct_productName:MESBasic.propertydisplayName.radion1415772740737" >
							<#assign objFactory_name_defaultValue  = ''>
									<#assign objFactory_name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_factoryModel_FactoryModel_name_objFactory_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_factoryModel_FactoryModel_name_objFactory_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1419232393782')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="objFactory.id" name="objFactory.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  conditionfunc="MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc('objFactory_name')" name="objFactory.name" id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm_objFactory_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" searchClick="MESBasic.factoryModel.objProduct.factoryProdRefPart.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign objProduct_productName_defaultValue  = ''>
									<#assign objProduct_productName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productName_objProduct_productName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productName_objProduct_productName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772740737')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="objProduct.id" name="objProduct.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1428027703233')}"  conditionfunc="MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc('objProduct_productName')" name="objProduct.productName" id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm_objProduct_productName" displayFieldName="productName" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/ref.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" searchClick="MESBasic.factoryModel.objProduct.factoryProdRefPart.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" type="search" onclick="MESBasic.factoryModel.objProduct.factoryProdRefPart.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm' );
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

ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.name"]={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.name"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.name"].layRec="factory_tbcompanystructure,ID,MESBASIC_OBJ_PRODUCTS,OBJ_FACTORY-name";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.name"].columnName="NODENAME";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.id"]={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.id"].dbColumnType="LONG";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.id"].layRec="factory_tbcompanystructure,ID,MESBASIC_OBJ_PRODUCTS,OBJ_FACTORY-name";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objFactory.id"].columnName="ID";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.productName"]={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.productName"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_OBJ_PRODUCTS,OBJ_PRODUCT-productName";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.productName"].columnName="PRODUCT_NAME";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.id"]={};
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.id"].dbColumnType="LONG";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,MESBASIC_OBJ_PRODUCTS,OBJ_PRODUCT-productName";
ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["objProduct.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.factoryModel.objProduct.factoryProdRefPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query" renderOverEvent="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_RenderOverEvent"  modelCode="MESBasic_1_factoryModel_ObjProduct" noPermissionKeys="objFactory.name,objProduct.productName,objProduct.productCode" hidekeyPrefix="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','objFactory.id','objProduct.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign objFactory_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${objFactory_name_displayDefaultType!}"  key="objFactory.name"   label="${getText('MESBasic.propertydisplayName.radion1419232393782')}" textalign="left"  width=140   type="textfield"    showFormatFunc=""/>
			<#assign objProduct_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${objProduct_productName_displayDefaultType!}"  key="objProduct.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=140   type="textfield"    showFormatFunc=""/>
			<#assign objProduct_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${objProduct_productCode_displayDefaultType!}"  key="objProduct.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=140   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_RenderOverEvent(){
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
	 * @method MESBasic.factoryModel.objProduct.factoryProdRefPart.query
	 */
	MESBasic.factoryModel.objProduct.factoryProdRefPart.query = function(type,pageNo){
		var node = MESBasic.factoryModel.objProduct.factoryProdRefPart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.factoryModel.objProduct.factoryProdRefPart.node = null;
		if(!checkListValid("ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action";
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_factoryModel_factoryProdRefPart";
		condobj.modelAlias="objProduct";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_factoryModel_objProduct_factoryProdRefPart_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_factoryModel_factoryProdRefPart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.factoryModel.objProduct.factoryProdRefPart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix += '.';
			}
			MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix += arr[i];
		}
		MESBasic.factoryModel.objProduct.factoryProdRefPart._suffix = arr[arr.length -1];
		if(MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.factoryModel.objProduct.factoryProdRefPart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.factoryModel.objProduct.factoryProdRefPart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.factoryModel.objProduct.factoryProdRefPart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix + '.' + MESBasic.factoryModel.objProduct.factoryProdRefPart._suffix +'"]').val(obj[0][MESBasic.factoryModel.objProduct.factoryProdRefPart._suffix]);
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name^="'+MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+MESBasic.factoryModel.objProduct.factoryProdRefPart._prefix + '.' + MESBasic.factoryModel.objProduct.factoryProdRefPart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.factoryModel.objProduct.factoryProdRefPart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.factoryModel.objProduct.factoryProdRefPart.query_"+obj+")!='undefined'") ? eval('MESBasic.factoryModel.objProduct.factoryProdRefPart.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.objProduct.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_factoryModel_objProduct_factoryProdRefPart_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_factoryModel_objProduct_factoryProdRefPart_refresh = function(node){
	//var url = "/MESBasic/factoryModel/objProduct/factoryProdRefPart-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_factoryModel_objProduct_factoryProdRefPart_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.factoryModel.objProduct.factoryProdRefPart.node = node;
	MESBasic.factoryModel.objProduct.factoryProdRefPart.query("query");
}

MESBasic_factoryModel_objProduct_factoryProdRefPart_getList = function() {
	return "MESBasic.factoryModel.objProduct.factoryProdRefPart";
}

	MESBasic.factoryModel.objProduct.factoryProdRefPart.commonQuery = function(type) {
	  if(typeof MESBasic.factoryModel.objProduct.factoryProdRefPart.cancelSelectedNode == 'function') {
	   MESBasic.factoryModel.objProduct.factoryProdRefPart.cancelSelectedNode();
	  }
	  MESBasic.factoryModel.objProduct.factoryProdRefPart.query(type);
	 };
	
	

MESBasic.factoryModel.objProduct.factoryProdRefPart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.factoryModel.objProduct.factoryProdRefPart.otherParams = {};
	MESBasic.factoryModel.objProduct.factoryProdRefPart.otherParams.dialogType = dialogType;
	MESBasic.factoryModel.objProduct.factoryProdRefPart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.factoryModel.objProduct.factoryProdRefPart.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_factoryModel_factoryProdRefPart,js,MESBasic_1_factoryModel_ObjProduct,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
