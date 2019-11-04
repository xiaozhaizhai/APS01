
<script type="text/javascript">
	CUI.ns("X6Basic.timeRegion.timeRegion","X6Basic.timeRegion.timeRegion.timeRegRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="X6Basic_timeRegion_timeRegion_timeRegRef_callBackFuncName" id="X6Basic_timeRegion_timeRegion_timeRegRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('X6Basic.entityname.randon1441778268642')}</span></div>
	</#if>
	<@errorbar id="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" exportUrl="/X6Basic/timeRegion/timeRegion/timeRegRef-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" name="X6Basic_timeRegion_timeRegion_timeRegRef_condition" id="X6Basic_timeRegion_timeRegion_timeRegRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('X6Basic.modelname.randon1441778365812')}_${getText('X6Basic.viewtitle.randon1441798201767')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" idprefix="ec_X6Basic_timeRegion_timeRegion_timeRegRef" expandType="all" expand=true fieldcodes="X6Basic_1_0_timeRegion_TimeRegion_name_name:X6Basic.propertydisplayName.randon1441778463050||X6Basic_1_0_timeRegion_TimeRegion_unit_unit:X6Basic.propertydisplayName.randon1441779032052" >
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="X6Basic_1_0_timeRegion_TimeRegion_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "X6Basic_1_0_timeRegion_TimeRegion_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('X6Basic.propertydisplayName.randon1441778463050')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign unit_defaultValue  = ''>
									<#assign unit_defaultValue  = ''>
							<div  field-unique-code="X6Basic_1_0_timeRegion_TimeRegion_unit_unit" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "X6Basic_1_0_timeRegion_TimeRegion_unit_unit">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('X6Basic.propertydisplayName.randon1441779032052')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${unit_defaultValue}"   name="unit" code="timeUnit" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" type="search" onclick="X6Basic.timeRegion.timeRegion.timeRegRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm' );
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
<#assign datatable_queryFunc = "X6Basic.timeRegion.timeRegion.timeRegRef.query('query')">
<#assign datatable_dataUrl = "/X6Basic/timeRegion/timeRegion/timeRegRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_X6Basic_timeRegion_timeRegion_timeRegRef_query" renderOverEvent="ec_X6Basic_timeRegion_timeRegion_timeRegRef_RenderOverEvent"  modelCode="X6Basic_1.0_timeRegion_TimeRegion" noPermissionKeys="name,unit" hidekeyPrefix="ec_X6Basic_timeRegion_timeRegion_timeRegRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','unit.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('X6Basic.propertydisplayName.randon1441778463050')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign unit_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${unit_displayDefaultType!}"  key="unit.value"   label="${getText('X6Basic.propertydisplayName.randon1441779032052')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_X6Basic_timeRegion_timeRegion_timeRegRef_RenderOverEvent(){
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
	 * @method X6Basic.timeRegion.timeRegion.timeRegRef.query
	 */
	X6Basic.timeRegion.timeRegion.timeRegRef.query = function(type,pageNo){
		var node = X6Basic.timeRegion.timeRegion.timeRegRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		X6Basic.timeRegion.timeRegion.timeRegRef.node = null;
		if(!checkListValid("ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/X6Basic/timeRegion/timeRegion/timeRegRef-query.action";
		CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_X6Basic_timeRegion_timeRegion_timeRegRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#X6Basic_timeRegion_timeRegion_timeRegRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_timeRegion_timeRegRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_X6Basic_timeRegion_timeRegion_timeRegRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	X6Basic.timeRegion.timeRegion.timeRegRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.timeRegion.timeRegion.timeRegRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.timeRegion.timeRegion.timeRegRef._prefix += '.';
			}
			X6Basic.timeRegion.timeRegion.timeRegRef._prefix += arr[i];
		}
		X6Basic.timeRegion.timeRegion.timeRegRef._suffix = arr[arr.length -1];
		if(X6Basic.timeRegion.timeRegion.timeRegRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.timeRegion.timeRegion.timeRegRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.timeRegion.timeRegion.timeRegRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.timeRegion.timeRegion.timeRegRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.timeRegion.timeRegion.timeRegRef.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+X6Basic.timeRegion.timeRegion.timeRegRef._prefix + '.' + X6Basic.timeRegion.timeRegion.timeRegRef._suffix +'"]').val(obj[0][X6Basic.timeRegion.timeRegion.timeRegRef._suffix]);
		CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+X6Basic.timeRegion.timeRegion.timeRegRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name^="'+X6Basic.timeRegion.timeRegion.timeRegRef._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+X6Basic.timeRegion.timeRegion.timeRegRef._prefix + '.' + X6Basic.timeRegion.timeRegion.timeRegRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_timeRegion_timeRegion_timeRegRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	X6Basic.timeRegion.timeRegion.timeRegRef._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.timeRegion.timeRegion.timeRegRef.query_"+obj+")!='undefined'") ? eval('X6Basic.timeRegion.timeRegion.timeRegRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_X6Basic_timeRegion_timeRegion_timeRegRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_X6Basic_timeRegion_timeRegion_timeRegRef_query.getSelectedRow();
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
			if(CUI("#X6Basic_timeRegion_timeRegion_timeRegRef_callBackFuncName").val() != ""){
				eval(CUI("#X6Basic_timeRegion_timeRegion_timeRegRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
X6Basic_timeRegion_timeRegion_timeRegRef_refresh = function(node){
	//var url = "/X6Basic/timeRegion/timeRegion/timeRegRef-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_timeRegion_timeRegion_timeRegRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_timeRegion_timeRegion_timeRegRef_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.timeRegion.timeRegion.timeRegRef.node = node;
	X6Basic.timeRegion.timeRegion.timeRegRef.query("query");
}

X6Basic_timeRegion_timeRegion_timeRegRef_getList = function() {
	return "X6Basic.timeRegion.timeRegion.timeRegRef";
}

	X6Basic.timeRegion.timeRegion.timeRegRef.commonQuery = function(type) {
	  if(typeof X6Basic.timeRegion.timeRegion.timeRegRef.cancelSelectedNode == 'function') {
	   X6Basic.timeRegion.timeRegion.timeRegRef.cancelSelectedNode();
	  }
	  X6Basic.timeRegion.timeRegion.timeRegRef.query(type);
	 };
	
	

X6Basic.timeRegion.timeRegion.timeRegRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.timeRegion.timeRegion.timeRegRef.otherParams = {};
	X6Basic.timeRegion.timeRegion.timeRegRef.otherParams.dialogType = dialogType;
	X6Basic.timeRegion.timeRegion.timeRegRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.timeRegion.timeRegion.timeRegRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-X6Basic_1.0_timeRegion_timeRegRef,js,X6Basic_1.0_timeRegion_TimeRegion,X6Basic_1.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
