
<script type="text/javascript">
	CUI.ns("WOM.putInMaterial.putInMaterialPart","WOM.putInMaterial.putInMaterialPart.putinRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_putInMaterial_putInMaterialPart_putinRef_callBackFuncName" id="WOM_putInMaterial_putInMaterialPart_putinRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490604762072')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" exportUrl="/WOM/putInMaterial/putInMaterialPart/putinRef-query.action">
		<input type="hidden" id="MESBasic_1_factoryModel_FactoryModel" value="factoryId" />
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeID" />
		<input type="hidden" reset="false" name="WOM_putInMaterial_putInMaterialPart_putinRef_condition" id="WOM_putInMaterial_putInMaterialPart_putinRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490604876056')}_${getText('WOM.viewtitle.randon1494828456715')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" idprefix="ec_WOM_putInMaterial_putInMaterialPart_putinRef" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_putInMaterial_PutInMaterial_tableNo_headId_tableNo:WOM.tableNo1122||MESBasic_1_product_Product_productCode_productId_productCode:MESBasic.propertydisplayName.radion1415772644833" >
							<#assign headId_tableNo_defaultValue  = ''>
									<#assign headId_tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_putInMaterial_PutInMaterial_tableNo_headId_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_putInMaterial_PutInMaterial_tableNo_headId_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.tableNo1122')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="headId.id" name="headId.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putinRef._querycustomFunc('headId_tableNo')" name="headId.tableNo" id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm_headId_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="form-control" url="" clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" searchClick="WOM.putInMaterial.putInMaterialPart.putinRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_productId_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_productId_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415772644833')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  conditionfunc="WOM.putInMaterial.putInMaterialPart.putinRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" searchClick="WOM.putInMaterial.putInMaterialPart.putinRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" type="search" onclick="WOM.putInMaterial.putInMaterialPart.putinRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm' );
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

ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.tableNo"]={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.tableNo"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.tableNo"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-tableNo";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.tableNo"].columnName="TABLE_NO";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.id"]={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.id"].layRec="WOM_PUT_IN_MATERIALS,ID,WOM_PUT_IN_MATERIAL_PARTS,HEAD_ID-tableNo";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["headId.id"].columnName="ID";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.productCode"]={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.id"]={};
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,WOM_PUT_IN_MATERIAL_PARTS,PRODUCT_ID-productCode";
ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["productId.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterialPart.putinRef.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterialPart/putinRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterialPart.putinRef.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterialPart/putinRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_WOM_putInMaterial_putInMaterialPart_putinRef_query" renderOverEvent="ec_WOM_putInMaterial_putInMaterialPart_putinRef_RenderOverEvent"  modelCode="WOM_7.5.0.0_putInMaterial_PutInMaterialPart" noPermissionKeys="headId.tableNo,productId.productCode,productId.productName,batchNum,wareID.wareCode,wareID.wareName,storeID.placeSetCode,storeID.placeSetName,useNum,lossNum" hidekeyPrefix="ec_WOM_putInMaterial_putInMaterialPart_putinRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','headId.id','productId.id','wareID.id','storeID.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign headId_tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${headId_tableNo_displayDefaultType!}"  key="headId.tableNo"   label="${getText('WOM.tableNo1122')}" textalign="center"  width=190   type="textfield"    showFormatFunc=""/>
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign batchNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${batchNum_displayDefaultType!}"  key="batchNum"   label="${getText('WOM.propertydisplayName.randon1490605271044')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storeID_placeSetCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${storeID_placeSetCode_displayDefaultType!}"  key="storeID.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storeID_placeSetName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${storeID_placeSetName_displayDefaultType!}"  key="storeID.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign useNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${useNum_displayDefaultType!}"  key="useNum"   label="${getText('WOM.propertydisplayName.randon1490605292518')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign lossNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${lossNum_displayDefaultType!}"  key="lossNum"   label="${getText('WOM.propertydisplayName.randon1490605314992')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_putInMaterial_putInMaterialPart_putinRef_RenderOverEvent(){
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
	 * @method WOM.putInMaterial.putInMaterialPart.putinRef.query
	 */
	WOM.putInMaterial.putInMaterialPart.putinRef.query = function(type,pageNo){
		var node = WOM.putInMaterial.putInMaterialPart.putinRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.putInMaterial.putInMaterialPart.putinRef.node = null;
		if(!checkListValid("ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/putInMaterial/putInMaterialPart/putinRef-query.action";
		CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_putInMaterial_putinRef";
		condobj.modelAlias="putInMaterialPart";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm *[name="'+ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_putInMaterial_putInMaterialPart_putinRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_putInMaterial_putInMaterialPart_putinRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_putInMaterial_putInMaterialPart_putinRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_putInMaterial_putinRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_putInMaterial_putInMaterialPart_putinRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.putInMaterial.putInMaterialPart.putinRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.putInMaterial.putInMaterialPart.putinRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.putInMaterial.putInMaterialPart.putinRef._prefix += '.';
			}
			WOM.putInMaterial.putInMaterialPart.putinRef._prefix += arr[i];
		}
		WOM.putInMaterial.putInMaterialPart.putinRef._suffix = arr[arr.length -1];
		if(WOM.putInMaterial.putInMaterialPart.putinRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.putInMaterial.putInMaterialPart.putinRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.putInMaterial.putInMaterialPart.putinRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.putInMaterial.putInMaterialPart.putinRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.putInMaterial.putInMaterialPart.putinRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm *[name="'+WOM.putInMaterial.putInMaterialPart.putinRef._prefix + '.' + WOM.putInMaterial.putInMaterialPart.putinRef._suffix +'"]').val(obj[0][WOM.putInMaterial.putInMaterialPart.putinRef._suffix]);
		CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm *[name="'+WOM.putInMaterial.putInMaterialPart.putinRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm *[name^="'+WOM.putInMaterial.putInMaterialPart.putinRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm *[name="'+WOM.putInMaterial.putInMaterialPart.putinRef._prefix + '.' + WOM.putInMaterial.putInMaterialPart.putinRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_putInMaterial_putInMaterialPart_putinRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.putInMaterial.putInMaterialPart.putinRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.putInMaterial.putInMaterialPart.putinRef.query_"+obj+")!='undefined'") ? eval('WOM.putInMaterial.putInMaterialPart.putinRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_putInMaterial_putInMaterialPart_putinRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_putInMaterial_putInMaterialPart_putinRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.putInMaterialPart.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_putInMaterial_putInMaterialPart_putinRef_callBackFuncName").val() != ""){
				eval(CUI("#WOM_putInMaterial_putInMaterialPart_putinRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_putInMaterial_putInMaterialPart_putinRef_refresh = function(node){
	//var url = "/WOM/putInMaterial/putInMaterialPart/putinRef-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_putInMaterial_putInMaterialPart_putinRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_putInMaterial_putInMaterialPart_putinRef_query.setRequestDataUrl(url,'',false);
	//}
	WOM.putInMaterial.putInMaterialPart.putinRef.node = node;
	WOM.putInMaterial.putInMaterialPart.putinRef.query("query");
}

WOM_putInMaterial_putInMaterialPart_putinRef_getList = function() {
	return "WOM.putInMaterial.putInMaterialPart.putinRef";
}

	WOM.putInMaterial.putInMaterialPart.putinRef.commonQuery = function(type) {
	  if(typeof WOM.putInMaterial.putInMaterialPart.putinRef.cancelSelectedNode == 'function') {
	   WOM.putInMaterial.putInMaterialPart.putinRef.cancelSelectedNode();
	  }
	  WOM.putInMaterial.putInMaterialPart.putinRef.query(type);
	 };
	
	

WOM.putInMaterial.putInMaterialPart.putinRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.putInMaterial.putInMaterialPart.putinRef.otherParams = {};
	WOM.putInMaterial.putInMaterialPart.putinRef.otherParams.dialogType = dialogType;
	WOM.putInMaterial.putInMaterialPart.putinRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.putInMaterial.putInMaterialPart.putinRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_putInMaterial_putinRef,js,WOM_7.5.0.0_putInMaterial_PutInMaterialPart,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
