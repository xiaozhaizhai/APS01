
<script type="text/javascript">
	CUI.ns("MESBasic.factoryWare.factoryWare","MESBasic.factoryWare.factoryWare.factoryWarePart");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName" id="MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1486984149095')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" exportUrl="/MESBasic/factoryWare/factoryWare/factoryWarePart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="MESBasic_1_storeSet_StoreSet" value="storeId" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_factoryWare_factoryWare_factoryWarePart_condition" id="MESBasic_factoryWare_factoryWare_factoryWarePart_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1486989542445')}_${getText('MESBasic.viewtitle.randon1486990298359')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" idprefix="ec_MESBasic_factoryWare_factoryWare_factoryWarePart" expandType="all" expand=true fieldcodes="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode:MESBasic.propertydisplayName.randon1484031239866||MESBasic_1_storeSet_StoreSet_placeSetName_storeId_placeSetName:MESBasic.propertydisplayName.randon1486607374172" >
							<#assign wareId_wareCode_defaultValue  = ''>
									<#assign wareId_wareCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1484031239866')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="wareId.id" name="wareId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc('wareId_wareCode')" name="wareId.wareCode" id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm_wareId_wareCode" displayFieldName="wareCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/wareMan/ware/wareRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" searchClick="MESBasic.factoryWare.factoryWare.factoryWarePart.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign storeId_placeSetName_defaultValue  = ''>
									<#assign storeId_placeSetName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_storeSet_StoreSet_placeSetName_storeId_placeSetName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_storeSet_StoreSet_placeSetName_storeId_placeSetName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1486607374172')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="storeId.id" name="storeId.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1486954640353')}"  conditionfunc="MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc('storeId_placeSetName')" name="storeId.placeSetName" id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm_storeId_placeSetName" displayFieldName="placeSetName" type="other" exp="like" classStyle="form-control" url="/MESBasic/storeSet/storeSet/storeRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" searchClick="MESBasic.factoryWare.factoryWare.factoryWarePart.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" type="search" onclick="MESBasic.factoryWare.factoryWare.factoryWarePart.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm' );
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

ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.wareCode"]={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.wareCode"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.wareCode"].layRec="MATERIAL_WARES,ID,MESBASIC_FACTORY_WARES,WARE_ID-wareCode";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.wareCode"].columnName="WARE_CODE";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.id"]={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.id"].layRec="MATERIAL_WARES,ID,MESBASIC_FACTORY_WARES,WARE_ID-wareCode";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["wareId.id"].columnName="ID";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.placeSetName"]={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.placeSetName"].dbColumnType="TEXT";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.placeSetName"].layRec="MATERIAL_STORE_SETS,ID,MESBASIC_FACTORY_WARES,STORE_ID-placeSetName";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.placeSetName"].columnName="PLACE_SET_NAME";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.id"]={};
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.id"].dbColumnType="LONG";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.id"].layRec="MATERIAL_STORE_SETS,ID,MESBASIC_FACTORY_WARES,STORE_ID-placeSetName";
ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["storeId.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.factoryWare.factoryWare.factoryWarePart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/factoryWare/factoryWare/factoryWarePart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query" renderOverEvent="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_RenderOverEvent"  modelCode="MESBasic_1_factoryWare_FactoryWare" noPermissionKeys="wareId.wareCode,wareId.wareName,storeId.placeSetCode,storeId.placeSetName,meno" hidekeyPrefix="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','wareId.id','storeId.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign wareId_wareCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareId_wareCode_displayDefaultType!}"  key="wareId.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareId_wareName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareId_wareName_displayDefaultType!}"  key="wareId.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storeId_placeSetCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${storeId_placeSetCode_displayDefaultType!}"  key="storeId.placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1486607342343')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign storeId_placeSetName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${storeId_placeSetName_displayDefaultType!}"  key="storeId.placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1486607374172')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign meno_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('MESBasic.propertydisplayName.randon1486989663449')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_factoryWare_factoryWare_factoryWarePart_RenderOverEvent(){
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
	 * @method MESBasic.factoryWare.factoryWare.factoryWarePart.query
	 */
	MESBasic.factoryWare.factoryWare.factoryWarePart.query = function(type,pageNo){
		var node = MESBasic.factoryWare.factoryWare.factoryWarePart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.factoryWare.factoryWare.factoryWarePart.node = null;
		if(!checkListValid("ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/factoryWare/factoryWare/factoryWarePart-query.action";
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_factoryWare_factoryWarePart";
		condobj.modelAlias="factoryWare";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_factoryWare_factoryWare_factoryWarePart_quickquery_info[fieldName].layRec;
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
		}
		var pageSize=CUI('input[name="ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_factoryWare_factoryWare_factoryWarePart_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_factoryWare_factoryWarePart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.factoryWare.factoryWare.factoryWarePart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.factoryWare.factoryWare.factoryWarePart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.factoryWare.factoryWare.factoryWarePart._prefix += '.';
			}
			MESBasic.factoryWare.factoryWare.factoryWarePart._prefix += arr[i];
		}
		MESBasic.factoryWare.factoryWare.factoryWarePart._suffix = arr[arr.length -1];
		if(MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.factoryWare.factoryWare.factoryWarePart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.factoryWare.factoryWare.factoryWarePart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.factoryWare.factoryWare.factoryWarePart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+MESBasic.factoryWare.factoryWare.factoryWarePart._prefix + '.' + MESBasic.factoryWare.factoryWare.factoryWarePart._suffix +'"]').val(obj[0][MESBasic.factoryWare.factoryWare.factoryWarePart._suffix]);
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+MESBasic.factoryWare.factoryWare.factoryWarePart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name^="'+MESBasic.factoryWare.factoryWare.factoryWarePart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+MESBasic.factoryWare.factoryWare.factoryWarePart._prefix + '.' + MESBasic.factoryWare.factoryWare.factoryWarePart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_factoryWare_factoryWare_factoryWarePart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.factoryWare.factoryWare.factoryWarePart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.factoryWare.factoryWare.factoryWarePart.query_"+obj+")!='undefined'") ? eval('MESBasic.factoryWare.factoryWare.factoryWarePart.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.factoryWare.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_factoryWare_factoryWare_factoryWarePart_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_factoryWare_factoryWare_factoryWarePart_refresh = function(node){
	//var url = "/MESBasic/factoryWare/factoryWare/factoryWarePart-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_factoryWare_factoryWare_factoryWarePart_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.factoryWare.factoryWare.factoryWarePart.node = node;
	MESBasic.factoryWare.factoryWare.factoryWarePart.query("query");
}

MESBasic_factoryWare_factoryWare_factoryWarePart_getList = function() {
	return "MESBasic.factoryWare.factoryWare.factoryWarePart";
}

	MESBasic.factoryWare.factoryWare.factoryWarePart.commonQuery = function(type) {
	  if(typeof MESBasic.factoryWare.factoryWare.factoryWarePart.cancelSelectedNode == 'function') {
	   MESBasic.factoryWare.factoryWare.factoryWarePart.cancelSelectedNode();
	  }
	  MESBasic.factoryWare.factoryWare.factoryWarePart.query(type);
	 };
	
	

MESBasic.factoryWare.factoryWare.factoryWarePart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.factoryWare.factoryWare.factoryWarePart.otherParams = {};
	MESBasic.factoryWare.factoryWare.factoryWarePart.otherParams.dialogType = dialogType;
	MESBasic.factoryWare.factoryWare.factoryWarePart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.factoryWare.factoryWare.factoryWarePart.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_factoryWare_factoryWarePart,js,MESBasic_1_factoryWare_FactoryWare,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
