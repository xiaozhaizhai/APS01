
<script type="text/javascript">
	CUI.ns("WOM.standingcropRef.standingcropRef","WOM.standingcropRef.standingcropRef.batchNumRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_standingcropRef_standingcropRef_batchNumRef_callBackFuncName" id="WOM_standingcropRef_standingcropRef_batchNumRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490063991944')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm" exportUrl="/WOM/standingcropRef/standingcropRef/batchNumRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="placeSet" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="WOM_standingcropRef_standingcropRef_batchNumRef_condition" id="WOM_standingcropRef_standingcropRef_batchNumRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490064355590')}_${getText('WOM.viewtitle.randon1490065762725')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm" formId="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm" idprefix="ec_WOM_standingcropRef_standingcropRef_batchNumRef" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_batchText:WOM.propertydisplayName.randon1490064501469" >
							<#assign batchText_defaultValue  = ''>
									<#assign batchText_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_batchText" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_batchText">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1490064501469')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (batchText_defaultValue)?has_content>
												<@mneclient formId="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${batchText_defaultValue!}" deValue="${batchText_defaultValue!}"   conditionfunc="WOM.standingcropRef.standingcropRef.batchNumRef._querycustomFunc('batchText')" name="batchText" id="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm_batchText" displayFieldName="batchText" exp="like" classStyle="form-control"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.standingcropRef.standingcropRef.batchNumRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="WOM.standingcropRef.standingcropRef.batchNumRef._querycustomFunc('batchText')" name="batchText" id="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm_batchText" displayFieldName="batchText" exp="like" classStyle="form-control"  url="/WOM/standingcropRef/standingcropRef/mneClient.action" multiple=false mnewidth=260 searchClick="WOM.standingcropRef.standingcropRef.batchNumRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm" type="search" onclick="WOM.standingcropRef.standingcropRef.batchNumRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm' );
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

ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info={};
ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info["batchText"]={};
ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info["batchText"].dbColumnType="TEXT";
ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info["batchText"].layRec="batchText";
ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info["batchText"].columnName="BATCH_TEXT";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.standingcropRef.standingcropRef.batchNumRef.query('query')">
<#assign datatable_dataUrl = "/WOM/standingcropRef/standingcropRef/batchNumRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_WOM_standingcropRef_standingcropRef_batchNumRef_query" renderOverEvent="ec_WOM_standingcropRef_standingcropRef_batchNumRef_RenderOverEvent"  modelCode="WOM_7.5.0.0_standingcropRef_StandingcropRef" noPermissionKeys="batchText,good.productCode,good.productName,wareID.wareCode,wareID.wareName,placeSet.placeSetCode,placeSet.placeSetName,onhand,frozenQuantity,availiQuantity" hidekeyPrefix="ec_WOM_standingcropRef_standingcropRef_batchNumRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','good.id','wareID.id','placeSet.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
			<#assign batchText_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${batchText_displayDefaultType!}"  key="batchText"   label="${getText('WOM.propertydisplayName.randon1490064501469')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign good_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${good_productCode_displayDefaultType!}"  key="good.productCode"   label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign good_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${good_productName_displayDefaultType!}"  key="good.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareID_wareCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareID_wareCode_displayDefaultType!}"  key="wareID.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareID_wareName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareID_wareName_displayDefaultType!}"  key="wareID.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign placeSet_placeSetCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${placeSet_placeSetCode_displayDefaultType!}"  key="placeSet.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1489731651449')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign placeSet_placeSetName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${placeSet_placeSetName_displayDefaultType!}"  key="placeSet.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1489731677162')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign onhand_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${onhand_displayDefaultType!}"  key="onhand"   label="${getText('WOM.propertydisplayName.randon1490064713692')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign frozenQuantity_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${frozenQuantity_displayDefaultType!}"  key="frozenQuantity"   label="${getText('WOM.propertydisplayName.randon1490064544582')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign availiQuantity_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${availiQuantity_displayDefaultType!}"  key="availiQuantity"   label="${getText('WOM.propertydisplayName.randon1490064478475')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_standingcropRef_standingcropRef_batchNumRef_RenderOverEvent(){
var length=ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryWidget.getRowLength();
for(var i=0;i<length;i++){
  //现存量
  var onhand=ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryWidget.getCellValue(i,'onhand');
  //冻结量
  var frozenNum=ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryWidget.getCellValue(i,'frozenQuantity');
  //可用量
  var availNum='';
  if(frozenNum=='' || frozenNum==null){
    availNum=Number(onhand);
  }else{
    availNum=Number(onhand)-Number(frozenNum);
  }
  ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryWidget.setCellValue(i,'availiQuantity',availNum);
}
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
	 * @method WOM.standingcropRef.standingcropRef.batchNumRef.query
	 */
	WOM.standingcropRef.standingcropRef.batchNumRef.query = function(type,pageNo){
		var node = WOM.standingcropRef.standingcropRef.batchNumRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.standingcropRef.standingcropRef.batchNumRef.node = null;
		if(!checkListValid("ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/standingcropRef/standingcropRef/batchNumRef-query.action";
		CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_standingcropRef_batchNumRef";
		condobj.modelAlias="standingcropRef";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm *[name="'+ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_standingcropRef_standingcropRef_batchNumRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_standingcropRef_standingcropRef_batchNumRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_standingcropRef_standingcropRef_batchNumRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_standingcropRef_batchNumRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_standingcropRef_standingcropRef_batchNumRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.standingcropRef.standingcropRef.batchNumRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.standingcropRef.standingcropRef.batchNumRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.standingcropRef.standingcropRef.batchNumRef._prefix += '.';
			}
			WOM.standingcropRef.standingcropRef.batchNumRef._prefix += arr[i];
		}
		WOM.standingcropRef.standingcropRef.batchNumRef._suffix = arr[arr.length -1];
		if(WOM.standingcropRef.standingcropRef.batchNumRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.standingcropRef.standingcropRef.batchNumRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.standingcropRef.standingcropRef.batchNumRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.standingcropRef.standingcropRef.batchNumRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.standingcropRef.standingcropRef.batchNumRef.getcallBackInfo = function(obj){
		CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm *[name="'+WOM.standingcropRef.standingcropRef.batchNumRef._prefix + '.' + WOM.standingcropRef.standingcropRef.batchNumRef._suffix +'"]').val(obj[0][WOM.standingcropRef.standingcropRef.batchNumRef._suffix]);
		CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm *[name="'+WOM.standingcropRef.standingcropRef.batchNumRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm *[name^="'+WOM.standingcropRef.standingcropRef.batchNumRef._prefix + '."]').unbind("change");
		CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm *[name="'+WOM.standingcropRef.standingcropRef.batchNumRef._prefix + '.' + WOM.standingcropRef.standingcropRef.batchNumRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_standingcropRef_standingcropRef_batchNumRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.standingcropRef.standingcropRef.batchNumRef._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.standingcropRef.standingcropRef.batchNumRef.query_"+obj+")!='undefined'") ? eval('WOM.standingcropRef.standingcropRef.batchNumRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_standingcropRef_standingcropRef_batchNumRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_standingcropRef_standingcropRef_batchNumRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.standingcropRef.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_standingcropRef_standingcropRef_batchNumRef_callBackFuncName").val() != ""){
				eval(CUI("#WOM_standingcropRef_standingcropRef_batchNumRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_standingcropRef_standingcropRef_batchNumRef_refresh = function(node){
	//var url = "/WOM/standingcropRef/standingcropRef/batchNumRef-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_standingcropRef_standingcropRef_batchNumRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_standingcropRef_standingcropRef_batchNumRef_query.setRequestDataUrl(url,'',false);
	//}
	WOM.standingcropRef.standingcropRef.batchNumRef.node = node;
	WOM.standingcropRef.standingcropRef.batchNumRef.query("query");
}

WOM_standingcropRef_standingcropRef_batchNumRef_getList = function() {
	return "WOM.standingcropRef.standingcropRef.batchNumRef";
}

	WOM.standingcropRef.standingcropRef.batchNumRef.commonQuery = function(type) {
	  if(typeof WOM.standingcropRef.standingcropRef.batchNumRef.cancelSelectedNode == 'function') {
	   WOM.standingcropRef.standingcropRef.batchNumRef.cancelSelectedNode();
	  }
	  WOM.standingcropRef.standingcropRef.batchNumRef.query(type);
	 };
	
	

WOM.standingcropRef.standingcropRef.batchNumRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.standingcropRef.standingcropRef.batchNumRef.otherParams = {};
	WOM.standingcropRef.standingcropRef.batchNumRef.otherParams.dialogType = dialogType;
	WOM.standingcropRef.standingcropRef.batchNumRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.standingcropRef.standingcropRef.batchNumRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_standingcropRef_batchNumRef,js,WOM_7.5.0.0_standingcropRef_StandingcropRef,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
