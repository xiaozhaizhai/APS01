
<script type="text/javascript">
	CUI.ns("MESBasic.routine.config","MESBasic.routine.config.rootref");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_routine_config_rootref_callBackFuncName" id="MESBasic_routine_config_rootref_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_routine_config_rootref_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415336450425')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_routine_config_rootref_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_routine_config_rootref_queryForm" exportUrl="/MESBasic/routine/config/rootref-query.action">
		<input type="hidden" reset="false" name="MESBasic_routine_config_rootref_condition" id="MESBasic_routine_config_rootref_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415337833221')}_${getText('MESBasic.viewtitle.randon1428478760096')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_routine_config_rootref_queryForm" formId="ec_MESBasic_routine_config_rootref_queryForm" idprefix="ec_MESBasic_routine_config_rootref" expandType="single"  fieldcodes="MESBasic_1_routine_Config_formula_formula:MESBasic.propertydisplayName.randon1426644791679||MESBasic_1_routine_Config_isDefault_isDefault:MESBasic.propertydisplayName.radion1416558214312||MESBasic_1_routine_Config_maxAggValue_maxAggValue:MESBasic.propertydisplayName.radion1415338029833||MESBasic_1_routine_Config_name_name:MESBasic.propertydisplayName.radion1416558524615" >
							<#assign formula_defaultValue  = ''>
									<#assign formula_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Config_formula_formula" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Config_formula_formula">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1426644791679')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="formula" id="formula" value="${formula_defaultValue!}" deValue="${formula_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign isDefault_defaultValue  = 'true'>
									<#assign isDefault_defaultValue  = 'true'>
							<div  field-unique-code="MESBasic_1_routine_Config_isDefault_isDefault" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Config_isDefault_isDefault">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1416558214312')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<select class="form-control" deValue="${isDefault_defaultValue!}" name="isDefault" id="isDefault" exp="equal"  value=""> 
												<option value=""></option>
												<option value="1" <#if (isDefault_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
												<option value="0" <#if (isDefault_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</select>
									
									</div>			
								</div>
							</div>
							<#assign maxAggValue_defaultValue  = ''>
									<#assign maxAggValue_defaultValue  = ''>
							<div mobi-dropdown-group="maxAggValue" field-unique-code="MESBasic_1_routine_Config_maxAggValue_maxAggValue" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Config_maxAggValue_maxAggValue">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415338029833')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<div class="input-group">
												<span class="input-group-addon">${getText('ec.list.validate.start')}</span>	
												<input type="text" class="form-control" name="maxAggValue_start" id="maxAggValue_start" value="${maxAggValue_defaultValue!}" deValue="${maxAggValue_defaultValue!}"   exp="equal"/>
											</div>
									</div>			
								</div>
							</div>
							<div mobi-dropdown-group="maxAggValue" field-unique-code="MESBasic_1_routine_Config_maxAggValue_maxAggValue" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Config_maxAggValue_maxAggValue">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415338029833')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
												<div class="input-group">
													<span class="input-group-addon">${getText('ec.list.validate.end')}</span>
													<input type="text" class="form-control" name="maxAggValue_end" id="maxAggValue_end" value="${maxAggValue_defaultValue!}" deValue="${maxAggValue_defaultValue!}"   exp="equal"/>
												</div>	
											
									</div>			
								</div>
							</div>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Config_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Config_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1416558524615')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_MESBasic_routine_config_rootref_queryForm" type="search" onclick="MESBasic.routine.config.rootref.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_routine_config_rootref_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_routine_config_rootref_queryForm' );
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
<#assign datatable_queryFunc = "MESBasic.routine.config.rootref.query('query')">
<#assign datatable_dataUrl = "/MESBasic/routine/config/rootref-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_routine_config_rootref_query" renderOverEvent="ec_MESBasic_routine_config_rootref_RenderOverEvent"  modelCode="MESBasic_1_routine_Config" noPermissionKeys="name,isDefault,maxAggValue,pumpBelong,formula" hidekeyPrefix="ec_MESBasic_routine_config_rootref_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_routine_config_rootref_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','pumpBelong.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1416558524615')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign isDefault_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${isDefault_displayDefaultType!}"  key="isDefault"   label="${getText('MESBasic.propertydisplayName.radion1416558214312')}" textalign="center"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign maxAggValue_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${maxAggValue_displayDefaultType!}"  key="maxAggValue"   label="${getText('MESBasic.propertydisplayName.radion1415338029833')}" textalign="right" decimal="4" width=100   type="decimal"    showFormatFunc=""/>
			<#assign pumpBelong_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${pumpBelong_displayDefaultType!}"  key="pumpBelong.value"   label="${getText('MESBasic.propertydisplayName.radion1415338200540')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign formula_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${formula_displayDefaultType!}"  key="formula"   label="${getText('MESBasic.propertydisplayName.randon1426644791679')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_routine_config_rootref_RenderOverEvent(){
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
	 * @method MESBasic.routine.config.rootref.query
	 */
	MESBasic.routine.config.rootref.query = function(type,pageNo){
		var node = MESBasic.routine.config.rootref.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.routine.config.rootref.node = null;
		if(!checkListValid("ec_MESBasic_routine_config_rootref_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/routine/config/rootref-query.action";
		CUI('#ec_MESBasic_routine_config_rootref_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_routine_config_rootref_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_routine_config_rootref_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_MESBasic_routine_config_rootref_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_routine_config_rootref_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_routine_rootref';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_routine_config_rootref_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.routine.config.rootref._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.routine.config.rootref._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.routine.config.rootref._prefix += '.';
			}
			MESBasic.routine.config.rootref._prefix += arr[i];
		}
		MESBasic.routine.config.rootref._suffix = arr[arr.length -1];
		if(MESBasic.routine.config.rootref._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.routine.config.rootref._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.routine.config.rootref._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.routine.config.rootref.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.routine.config.rootref.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+MESBasic.routine.config.rootref._prefix + '.' + MESBasic.routine.config.rootref._suffix +'"]').val(obj[0][MESBasic.routine.config.rootref._suffix]);
		CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+MESBasic.routine.config.rootref._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name^="'+MESBasic.routine.config.rootref._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+MESBasic.routine.config.rootref._prefix + '.' + MESBasic.routine.config.rootref._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_routine_config_rootref_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.routine.config.rootref._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.routine.config.rootref.query_"+obj+")!='undefined'") ? eval('MESBasic.routine.config.rootref.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_routine_config_rootref_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_routine_config_rootref_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.config.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_routine_config_rootref_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_routine_config_rootref_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_routine_config_rootref_refresh = function(node){
	//var url = "/MESBasic/routine/config/rootref-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_routine_config_rootref_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_routine_config_rootref_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.routine.config.rootref.node = node;
	MESBasic.routine.config.rootref.query("query");
}

MESBasic_routine_config_rootref_getList = function() {
	return "MESBasic.routine.config.rootref";
}

	MESBasic.routine.config.rootref.commonQuery = function(type) {
	  if(typeof MESBasic.routine.config.rootref.cancelSelectedNode == 'function') {
	   MESBasic.routine.config.rootref.cancelSelectedNode();
	  }
	  MESBasic.routine.config.rootref.query(type);
	 };
	
	

MESBasic.routine.config.rootref.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.routine.config.rootref.otherParams = {};
	MESBasic.routine.config.rootref.otherParams.dialogType = dialogType;
	MESBasic.routine.config.rootref.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.routine.config.rootref.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="maxAggValue_start"]').val()!= null && $('#' + formId + ' input[name^="maxAggValue_start"]').val()!= ''){if(!isDecimal($('#' + formId + ' input[name^="maxAggValue_start"]').val())){workbenchErrorBarWidget.showMessage("${getText('MESBasic.propertydisplayName.radion1415338029833')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name^="maxAggValue_end"]').val()!= null && $('#' + formId + ' input[name^="maxAggValue_end"]').val()!= ''){if(!isDecimal($('#' + formId + ' input[name^="maxAggValue_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('MESBasic.propertydisplayName.radion1415338029833')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name="maxAggValue_start"]').val()!='' && $('#' + formId + ' input[name="maxAggValue_end"]').val()!=''){if($('#' + formId + ' input[name="maxAggValue_start"]').val() > $('#' + formId + ' input[name="maxAggValue_end"]').val()){workbenchErrorBarWidget.showMessage("${getText('MESBasic.propertydisplayName.radion1415338029833')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('MESBasic.propertydisplayName.radion1415338029833')}${getText('ec.list.validate.start')}");return false;}}return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_routine_rootref,js,MESBasic_1_routine_Config,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	</script>
  </body>
</html>
