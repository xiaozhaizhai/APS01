
<script type="text/javascript">
	CUI.ns("X6Basic.timeRegion.timeRegionPar","X6Basic.timeRegion.timeRegionPar.partRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="X6Basic_timeRegion_timeRegionPar_partRef_callBackFuncName" id="X6Basic_timeRegion_timeRegionPar_partRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.randon1459213899397')}</span></div>
	</#if>
	<@errorbar id="ec_X6Basic_timeRegion_timeRegionPar_partRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm" exportUrl="/X6Basic/timeRegion/timeRegionPar/partRef-query.action">
		<input type="hidden" reset="false" name="X6Basic_timeRegion_timeRegionPar_partRef_condition" id="X6Basic_timeRegion_timeRegionPar_partRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.randon1459214032452')}_${getText('X6Basic.viewtitle.randon1459216504054')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm" formId="ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm" idprefix="ec_X6Basic_timeRegion_timeRegionPar_partRef" expandType="all" expand=true fieldcodes="X6Basic_1_0_timeRegion_TimeRegionPar_name_name:X6Basic.propertydisplayName.randon1459215074302||X6Basic_1_0_timeRegion_TimeRegionPar_year_year:X6Basic.propertydisplayName.randon1459215254357||X6Basic_1_0_timeRegion_TimeRegionPar_month_month:X6Basic.propertydisplayName.randon1459215052167" >
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="X6Basic_1_0_timeRegion_TimeRegionPar_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "X6Basic_1_0_timeRegion_TimeRegionPar_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('X6Basic.propertydisplayName.randon1459215074302')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign year_defaultValue  = ''>
									<#assign year_defaultValue  = ''>
							<div mobi-dropdown-group="year" field-unique-code="X6Basic_1_0_timeRegion_TimeRegionPar_year_year" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "X6Basic_1_0_timeRegion_TimeRegionPar_year_year">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('X6Basic.propertydisplayName.randon1459215254357')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<div class="input-group">
												<span class="input-group-addon">${getText('ec.list.validate.start')}</span>	
												<input type="text" class="form-control" name="year_start" id="year_start" value="${year_defaultValue!}" deValue="${year_defaultValue!}"   exp="equal"/>
											</div>
									</div>			
								</div>
							</div>
							<div mobi-dropdown-group="year" field-unique-code="X6Basic_1_0_timeRegion_TimeRegionPar_year_year" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "X6Basic_1_0_timeRegion_TimeRegionPar_year_year">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('X6Basic.propertydisplayName.randon1459215254357')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
												<div class="input-group">
													<span class="input-group-addon">${getText('ec.list.validate.end')}</span>
													<input type="text" class="form-control" name="year_end" id="year_end" value="${year_defaultValue!}" deValue="${year_defaultValue!}"   exp="equal"/>
												</div>	
											
									</div>			
								</div>
							</div>
							<#assign month_defaultValue  = ''>
									<#assign month_defaultValue  = ''>
							<div mobi-dropdown-group="month" field-unique-code="X6Basic_1_0_timeRegion_TimeRegionPar_month_month" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "X6Basic_1_0_timeRegion_TimeRegionPar_month_month">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('X6Basic.propertydisplayName.randon1459215052167')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<div class="input-group">
												<span class="input-group-addon">${getText('ec.list.validate.start')}</span>	
												<input type="text" class="form-control" name="month_start" id="month_start" value="${month_defaultValue!}" deValue="${month_defaultValue!}"   exp="equal"/>
											</div>
									</div>			
								</div>
							</div>
							<div mobi-dropdown-group="month" field-unique-code="X6Basic_1_0_timeRegion_TimeRegionPar_month_month" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "X6Basic_1_0_timeRegion_TimeRegionPar_month_month">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('X6Basic.propertydisplayName.randon1459215052167')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
												<div class="input-group">
													<span class="input-group-addon">${getText('ec.list.validate.end')}</span>
													<input type="text" class="form-control" name="month_end" id="month_end" value="${month_defaultValue!}" deValue="${month_defaultValue!}"   exp="equal"/>
												</div>	
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm" type="search" onclick="X6Basic.timeRegion.timeRegionPar.partRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm' );
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

ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info={};
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["name"]={};
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["name"].dbColumnType="TEXT";
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["name"].layRec="name";
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["name"].columnName="NAME";
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["year"]={};
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["year"].dbColumnType="INTEGER";
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["year"].layRec="year";
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["year"].columnName="YEAR";
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["month"]={};
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["month"].dbColumnType="INTEGER";
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["month"].layRec="month";
ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["month"].columnName="MONTH";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "X6Basic.timeRegion.timeRegionPar.partRef.query('query')">
<#assign datatable_dataUrl = "/X6Basic/timeRegion/timeRegionPar/partRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_timeRegion_timeRegionPar_partRef_query" renderOverEvent="ec_X6Basic_timeRegion_timeRegionPar_partRef_RenderOverEvent"  modelCode="X6Basic_1.0_timeRegion_TimeRegionPar" noPermissionKeys="name,year,quarter,month,week,startDate,endDate" hidekeyPrefix="ec_X6Basic_timeRegion_timeRegionPar_partRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.randon1459215074302')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign year_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${year_displayDefaultType!}"  key="year"   label="${getText('X6Basic.propertydisplayName.randon1459215254357')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign quarter_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${quarter_displayDefaultType!}"  key="quarter"   label="${getText('X6Basic.propertydisplayName.randon1459215116732')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign month_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${month_displayDefaultType!}"  key="month"   label="${getText('X6Basic.propertydisplayName.randon1459215052167')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign week_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${week_displayDefaultType!}"  key="week"   label="${getText('X6Basic.propertydisplayName.randon1459215239844')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign startDate_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD" defaultDisplay="${startDate_displayDefaultType!}"  key="startDate"   label="${getText('X6Basic.propertydisplayName.randon1459215181902')}" textalign="center"  width=100   type="date"    showFormatFunc=""/>
			<#assign endDate_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD" defaultDisplay="${endDate_displayDefaultType!}"  key="endDate"   label="${getText('X6Basic.propertydisplayName.randon1459215032319')}" textalign="center"  width=100   type="date"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_timeRegion_timeRegionPar_partRef_RenderOverEvent(){
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
	 * @method X6Basic.timeRegion.timeRegionPar.partRef.query
	 */
	X6Basic.timeRegion.timeRegionPar.partRef.query = function(type,pageNo){
		var node = X6Basic.timeRegion.timeRegionPar.partRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		X6Basic.timeRegion.timeRegionPar.partRef.node = null;
		if(!checkListValid("ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/X6Basic/timeRegion/timeRegionPar/partRef-query.action";
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="X6Basic_1.0_timeRegion_partRef";
		condobj.modelAlias="timeRegionPar";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm *[name="'+ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info["MainTableName"];
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
						var layrec=ec_X6Basic_timeRegion_timeRegionPar_partRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_X6Basic_timeRegion_timeRegionPar_partRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#X6Basic_timeRegion_timeRegionPar_partRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_timeRegion_partRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_X6Basic_timeRegion_timeRegionPar_partRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	X6Basic.timeRegion.timeRegionPar.partRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.timeRegion.timeRegionPar.partRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.timeRegion.timeRegionPar.partRef._prefix += '.';
			}
			X6Basic.timeRegion.timeRegionPar.partRef._prefix += arr[i];
		}
		X6Basic.timeRegion.timeRegionPar.partRef._suffix = arr[arr.length -1];
		if(X6Basic.timeRegion.timeRegionPar.partRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.timeRegion.timeRegionPar.partRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.timeRegion.timeRegionPar.partRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.timeRegion.timeRegionPar.partRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.timeRegion.timeRegionPar.partRef.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm *[name="'+X6Basic.timeRegion.timeRegionPar.partRef._prefix + '.' + X6Basic.timeRegion.timeRegionPar.partRef._suffix +'"]').val(obj[0][X6Basic.timeRegion.timeRegionPar.partRef._suffix]);
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm *[name="'+X6Basic.timeRegion.timeRegionPar.partRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm *[name^="'+X6Basic.timeRegion.timeRegionPar.partRef._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm *[name="'+X6Basic.timeRegion.timeRegionPar.partRef._prefix + '.' + X6Basic.timeRegion.timeRegionPar.partRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_timeRegion_timeRegionPar_partRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	X6Basic.timeRegion.timeRegionPar.partRef._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.timeRegion.timeRegionPar.partRef.query_"+obj+")!='undefined'") ? eval('X6Basic.timeRegion.timeRegionPar.partRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_X6Basic_timeRegion_timeRegionPar_partRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_X6Basic_timeRegion_timeRegionPar_partRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('X6Basic.timeRegionPar.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#X6Basic_timeRegion_timeRegionPar_partRef_callBackFuncName").val() != ""){
				eval(CUI("#X6Basic_timeRegion_timeRegionPar_partRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
X6Basic_timeRegion_timeRegionPar_partRef_refresh = function(node){
	//var url = "/X6Basic/timeRegion/timeRegionPar/partRef-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_timeRegion_timeRegionPar_partRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_timeRegion_timeRegionPar_partRef_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.timeRegion.timeRegionPar.partRef.node = node;
	X6Basic.timeRegion.timeRegionPar.partRef.query("query");
}

X6Basic_timeRegion_timeRegionPar_partRef_getList = function() {
	return "X6Basic.timeRegion.timeRegionPar.partRef";
}

	X6Basic.timeRegion.timeRegionPar.partRef.commonQuery = function(type) {
	  if(typeof X6Basic.timeRegion.timeRegionPar.partRef.cancelSelectedNode == 'function') {
	   X6Basic.timeRegion.timeRegionPar.partRef.cancelSelectedNode();
	  }
	  X6Basic.timeRegion.timeRegionPar.partRef.query(type);
	 };
	
	

X6Basic.timeRegion.timeRegionPar.partRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.timeRegion.timeRegionPar.partRef.otherParams = {};
	X6Basic.timeRegion.timeRegionPar.partRef.otherParams.dialogType = dialogType;
	X6Basic.timeRegion.timeRegionPar.partRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.timeRegion.timeRegionPar.partRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="year_start"]').val()!=null && $('#' + formId + ' input[name^="year_start"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="year_start"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215254357')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name^="year_end"]').val()!=null && $('#' + formId + ' input[name^="year_end"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="year_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215254357')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name^="month_start"]').val()!=null && $('#' + formId + ' input[name^="month_start"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="month_start"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215052167')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name^="month_end"]').val()!=null && $('#' + formId + ' input[name^="month_end"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="month_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215052167')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name="month_start"]').val()!='' && $('#' + formId + ' input[name="month_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="month_start"]').val()) > parseInt($('#' + formId + ' input[name="month_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215052167')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('X6Basic.propertydisplayName.randon1459215052167')}${getText('ec.list.validate.start')}");return false;}}if($('#' + formId + ' input[name="year_start"]').val()!='' && $('#' + formId + ' input[name="year_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="year_start"]').val()) > parseInt($('#' + formId + ' input[name="year_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1459215254357')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('X6Basic.propertydisplayName.randon1459215254357')}${getText('ec.list.validate.start')}");return false;}}return true;};





	/* CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_timeRegion_partRef,js,X6Basic_1.0_timeRegion_TimeRegionPar,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
