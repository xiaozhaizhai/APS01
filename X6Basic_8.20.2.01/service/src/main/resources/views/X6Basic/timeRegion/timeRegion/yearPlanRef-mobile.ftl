
<script type="text/javascript">
	CUI.ns("X6Basic.timeRegion.timeRegion","X6Basic.timeRegion.timeRegion.yearPlanRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName" id="X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.randon1441778268642')}</span></div>
	</#if>
	<@errorbar id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" exportUrl="/X6Basic/timeRegion/timeRegion/yearPlanRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="X6Basic_timeRegion_timeRegion_yearPlanRef_condition" id="X6Basic_timeRegion_timeRegion_yearPlanRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.randon1441778365812')}_${getText('X6Basic.viewtitle.randon1442368691425')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" idprefix="ec_X6Basic_timeRegion_timeRegion_yearPlanRef" expandType="all" expand=true fieldcodes="X6Basic_1_0_timeRegion_TimeRegion_setyear_setyear:X6Basic.propertydisplayName.randon1441880564502" >
							<#assign setyear_defaultValue  = ''>
									<#assign setyear_defaultValue  = ''>
							<div mobi-dropdown-group="setyear" field-unique-code="X6Basic_1_0_timeRegion_TimeRegion_setyear_setyear" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "X6Basic_1_0_timeRegion_TimeRegion_setyear_setyear">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('X6Basic.propertydisplayName.randon1441880564502')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<div class="input-group">
												<span class="input-group-addon">${getText('ec.list.validate.start')}</span>	
												<input type="text" class="form-control" name="setyear_start" id="setyear_start" value="${setyear_defaultValue!}" deValue="${setyear_defaultValue!}"   exp="equal"/>
											</div>
									</div>			
								</div>
							</div>
							<div mobi-dropdown-group="setyear" field-unique-code="X6Basic_1_0_timeRegion_TimeRegion_setyear_setyear" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "X6Basic_1_0_timeRegion_TimeRegion_setyear_setyear">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('X6Basic.propertydisplayName.randon1441880564502')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
												<div class="input-group">
													<span class="input-group-addon">${getText('ec.list.validate.end')}</span>
													<input type="text" class="form-control" name="setyear_end" id="setyear_end" value="${setyear_defaultValue!}" deValue="${setyear_defaultValue!}"   exp="equal"/>
												</div>	
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" type="search" onclick="X6Basic.timeRegion.timeRegion.yearPlanRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm' );
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
<#assign datatable_queryFunc = "X6Basic.timeRegion.timeRegion.yearPlanRef.query('query')">
<#assign datatable_dataUrl = "/X6Basic/timeRegion/timeRegion/yearPlanRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query" renderOverEvent="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_RenderOverEvent"  modelCode="X6Basic_1.0_timeRegion_TimeRegion" noPermissionKeys="name,setyear,startTime,endTime" hidekeyPrefix="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.randon1441778463050')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign setyear_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${setyear_displayDefaultType!}"  key="setyear"   label="${getText('X6Basic.propertydisplayName.randon1441880564502')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign startTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD" defaultDisplay="${startTime_displayDefaultType!}"  key="startTime"   label="${getText('X6Basic.propertydisplayName.randon1441851237774')}" textalign="center"  width=100   type="date"    showFormatFunc=""/>
			<#assign endTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD" defaultDisplay="${endTime_displayDefaultType!}"  key="endTime"   label="${getText('X6Basic.propertydisplayName.randon1441880710697')}" textalign="center"  width=100   type="date"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_timeRegion_timeRegion_yearPlanRef_RenderOverEvent(){
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
	 * @method X6Basic.timeRegion.timeRegion.yearPlanRef.query
	 */
	X6Basic.timeRegion.timeRegion.yearPlanRef.query = function(type,pageNo){
		var node = X6Basic.timeRegion.timeRegion.yearPlanRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		X6Basic.timeRegion.timeRegion.yearPlanRef.node = null;
		if(!checkListValid("ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/X6Basic/timeRegion/timeRegion/yearPlanRef-query.action";
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#X6Basic_timeRegion_timeRegion_yearPlanRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_timeRegion_yearPlanRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	X6Basic.timeRegion.timeRegion.yearPlanRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.timeRegion.timeRegion.yearPlanRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.timeRegion.timeRegion.yearPlanRef._prefix += '.';
			}
			X6Basic.timeRegion.timeRegion.yearPlanRef._prefix += arr[i];
		}
		X6Basic.timeRegion.timeRegion.yearPlanRef._suffix = arr[arr.length -1];
		if(X6Basic.timeRegion.timeRegion.yearPlanRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.timeRegion.timeRegion.yearPlanRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.timeRegion.timeRegion.yearPlanRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.timeRegion.timeRegion.yearPlanRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.timeRegion.timeRegion.yearPlanRef.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+X6Basic.timeRegion.timeRegion.yearPlanRef._prefix + '.' + X6Basic.timeRegion.timeRegion.yearPlanRef._suffix +'"]').val(obj[0][X6Basic.timeRegion.timeRegion.yearPlanRef._suffix]);
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+X6Basic.timeRegion.timeRegion.yearPlanRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name^="'+X6Basic.timeRegion.timeRegion.yearPlanRef._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+X6Basic.timeRegion.timeRegion.yearPlanRef._prefix + '.' + X6Basic.timeRegion.timeRegion.yearPlanRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_timeRegion_timeRegion_yearPlanRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	X6Basic.timeRegion.timeRegion.yearPlanRef._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.timeRegion.timeRegion.yearPlanRef.query_"+obj+")!='undefined'") ? eval('X6Basic.timeRegion.timeRegion.yearPlanRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('X6Basic.timeRegion.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName").val() != ""){
				eval(CUI("#X6Basic_timeRegion_timeRegion_yearPlanRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
X6Basic_timeRegion_timeRegion_yearPlanRef_refresh = function(node){
	//var url = "/X6Basic/timeRegion/timeRegion/yearPlanRef-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_timeRegion_timeRegion_yearPlanRef_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.timeRegion.timeRegion.yearPlanRef.node = node;
	X6Basic.timeRegion.timeRegion.yearPlanRef.query("query");
}

X6Basic_timeRegion_timeRegion_yearPlanRef_getList = function() {
	return "X6Basic.timeRegion.timeRegion.yearPlanRef";
}

	X6Basic.timeRegion.timeRegion.yearPlanRef.commonQuery = function(type) {
	  if(typeof X6Basic.timeRegion.timeRegion.yearPlanRef.cancelSelectedNode == 'function') {
	   X6Basic.timeRegion.timeRegion.yearPlanRef.cancelSelectedNode();
	  }
	  X6Basic.timeRegion.timeRegion.yearPlanRef.query(type);
	 };
	
	

X6Basic.timeRegion.timeRegion.yearPlanRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.timeRegion.timeRegion.yearPlanRef.otherParams = {};
	X6Basic.timeRegion.timeRegion.yearPlanRef.otherParams.dialogType = dialogType;
	X6Basic.timeRegion.timeRegion.yearPlanRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.timeRegion.timeRegion.yearPlanRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="setyear_start"]').val()!=null && $('#' + formId + ' input[name^="setyear_start"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="setyear_start"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1441880564502')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name^="setyear_end"]').val()!=null && $('#' + formId + ' input[name^="setyear_end"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="setyear_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1441880564502')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name="setyear_start"]').val()!='' && $('#' + formId + ' input[name="setyear_end"]').val()!=''){if($('#' + formId + ' input[name="setyear_start"]').val() > $('#' + formId + ' input[name="setyear_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('X6Basic.propertydisplayName.randon1441880564502')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('X6Basic.propertydisplayName.randon1441880564502')}${getText('ec.list.validate.start')}");return false;}}return true;};





	/* CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_timeRegion_yearPlanRef,js,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码

/* CUSTOM CODE END */
	</script>
  </body>
</html>
