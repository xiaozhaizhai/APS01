
<script type="text/javascript">
	CUI.ns("RM.formula.formulaProcessActive","RM.formula.formulaProcessActive.processActiveRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="RM_formula_formulaProcessActive_processActiveRef_callBackFuncName" id="RM_formula_formulaProcessActive_processActiveRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	</#if>
	<@errorbar id="ec_RM_formula_formulaProcessActive_processActiveRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" exportUrl="/RM/formula/formulaProcessActive/processActiveRef-query.action">
		<input type="hidden" reset="false" name="RM_formula_formulaProcessActive_processActiveRef_condition" id="RM_formula_formulaProcessActive_processActiveRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487330059541')}_${getText('RM.viewtitle.randon1488184710189')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" idprefix="ec_RM_formula_formulaProcessActive_processActiveRef" expandType="all" expand=true fieldcodes="RM_7_5_0_0_formula_FormulaProcessActive_name_name:RM.propertydisplayName.randon1487330156499||RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_exeOrder:RM.propertydisplayName.randon1487330171009" >
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_FormulaProcessActive_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_FormulaProcessActive_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487330156499')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign exeOrder_defaultValue  = ''>
									<#assign exeOrder_defaultValue  = ''>
							<div mobi-dropdown-group="exeOrder" field-unique-code="RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_exeOrder" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_exeOrder">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487330171009')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<div class="input-group">
												<span class="input-group-addon">${getText('ec.list.validate.start')}</span>	
												<input type="text" class="form-control" name="exeOrder_start" id="exeOrder_start" value="${exeOrder_defaultValue!}" deValue="${exeOrder_defaultValue!}"   exp="equal"/>
											</div>
									</div>			
								</div>
							</div>
							<div mobi-dropdown-group="exeOrder" field-unique-code="RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_exeOrder" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_FormulaProcessActive_exeOrder_exeOrder">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487330171009')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
												<div class="input-group">
													<span class="input-group-addon">${getText('ec.list.validate.end')}</span>
													<input type="text" class="form-control" name="exeOrder_end" id="exeOrder_end" value="${exeOrder_defaultValue!}" deValue="${exeOrder_defaultValue!}"   exp="equal"/>
												</div>	
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" type="search" onclick="RM.formula.formulaProcessActive.processActiveRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm' );
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

ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info={};
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["name"]={};
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["name"].layRec="name";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["name"].columnName="NAME";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["exeOrder"]={};
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["exeOrder"].dbColumnType="INTEGER";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["exeOrder"].layRec="exeOrder";
ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["exeOrder"].columnName="EXE_ORDER";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaProcessActive.processActiveRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcessActive/processActiveRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaProcessActive.processActiveRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcessActive/processActiveRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_RM_formula_formulaProcessActive_processActiveRef_query" renderOverEvent="ec_RM_formula_formulaProcessActive_processActiveRef_RenderOverEvent"  modelCode="RM_7.5.0.0_formula_FormulaProcessActive" noPermissionKeys="name,exeOrder,isReplace,auto" hidekeyPrefix="ec_RM_formula_formulaProcessActive_processActiveRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formulaProcessActive_processActiveRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487330156499')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign exeOrder_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${exeOrder_displayDefaultType!}"  key="exeOrder"   label="${getText('RM.propertydisplayName.randon1487330171009')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign isReplace_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECT" defaultDisplay="${isReplace_displayDefaultType!}"  key="isReplace"   label="${getText('RM.propertydisplayName.randon1487331060176')}" textalign="left"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign auto_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECT" defaultDisplay="${auto_displayDefaultType!}"  key="auto"   label="${getText('RM.propertydisplayName.randon1487331130107')}" textalign="left"  width=100   type="boolean"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formulaProcessActive_processActiveRef_RenderOverEvent(){
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
	 * @method RM.formula.formulaProcessActive.processActiveRef.query
	 */
	RM.formula.formulaProcessActive.processActiveRef.query = function(type,pageNo){
		var node = RM.formula.formulaProcessActive.processActiveRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		RM.formula.formulaProcessActive.processActiveRef.node = null;
		if(!checkListValid("ec_RM_formula_formulaProcessActive_processActiveRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/RM/formula/formulaProcessActive/processActiveRef-query.action";
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_processActiveRef";
		condobj.modelAlias="formulaProcessActive";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formulaProcessActive_processActiveRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formulaProcessActive_processActiveRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formula_formulaProcessActive_processActiveRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_processActiveRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	RM.formula.formulaProcessActive.processActiveRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formulaProcessActive.processActiveRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formulaProcessActive.processActiveRef._prefix += '.';
			}
			RM.formula.formulaProcessActive.processActiveRef._prefix += arr[i];
		}
		RM.formula.formulaProcessActive.processActiveRef._suffix = arr[arr.length -1];
		if(RM.formula.formulaProcessActive.processActiveRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcessActive.processActiveRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formulaProcessActive.processActiveRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formulaProcessActive.processActiveRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcessActive.processActiveRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+RM.formula.formulaProcessActive.processActiveRef._prefix + '.' + RM.formula.formulaProcessActive.processActiveRef._suffix +'"]').val(obj[0][RM.formula.formulaProcessActive.processActiveRef._suffix]);
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+RM.formula.formulaProcessActive.processActiveRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name^="'+RM.formula.formulaProcessActive.processActiveRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+RM.formula.formulaProcessActive.processActiveRef._prefix + '.' + RM.formula.formulaProcessActive.processActiveRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formulaProcessActive_processActiveRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	RM.formula.formulaProcessActive.processActiveRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcessActive.processActiveRef.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcessActive.processActiveRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('RM.formulaProcessActive.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formula_formulaProcessActive_processActiveRef_callBackFuncName").val() != ""){
				eval(CUI("#RM_formula_formulaProcessActive_processActiveRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
RM_formula_formulaProcessActive_processActiveRef_refresh = function(node){
	//var url = "/RM/formula/formulaProcessActive/processActiveRef-query.action";
	//if(node.layRec){
	//	datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_RM_formula_formulaProcessActive_processActiveRef_query.setRequestDataUrl(url,'',false);
	//}
	RM.formula.formulaProcessActive.processActiveRef.node = node;
	RM.formula.formulaProcessActive.processActiveRef.query("query");
}

RM_formula_formulaProcessActive_processActiveRef_getList = function() {
	return "RM.formula.formulaProcessActive.processActiveRef";
}

	RM.formula.formulaProcessActive.processActiveRef.commonQuery = function(type) {
	  if(typeof RM.formula.formulaProcessActive.processActiveRef.cancelSelectedNode == 'function') {
	   RM.formula.formulaProcessActive.processActiveRef.cancelSelectedNode();
	  }
	  RM.formula.formulaProcessActive.processActiveRef.query(type);
	 };
	
	

RM.formula.formulaProcessActive.processActiveRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	RM.formula.formulaProcessActive.processActiveRef.otherParams = {};
	RM.formula.formulaProcessActive.processActiveRef.otherParams.dialogType = dialogType;
	RM.formula.formulaProcessActive.processActiveRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formulaProcessActive.processActiveRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="exeOrder_start"]').val()!=null && $('#' + formId + ' input[name^="exeOrder_start"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="exeOrder_start"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487330171009')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name^="exeOrder_end"]').val()!=null && $('#' + formId + ' input[name^="exeOrder_end"]').val()!=''){if(!isInteger($('#' + formId + ' input[name^="exeOrder_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487330171009')}${getText('ec.list.validate.integer')}");return false;}}if($('#' + formId + ' input[name="exeOrder_start"]').val()!='' && $('#' + formId + ' input[name="exeOrder_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="exeOrder_start"]').val()) > parseInt($('#' + formId + ' input[name="exeOrder_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487330171009')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487330171009')}${getText('ec.list.validate.start')}");return false;}}return true;};





	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_processActiveRef,js,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	</script>
  </body>
</html>
