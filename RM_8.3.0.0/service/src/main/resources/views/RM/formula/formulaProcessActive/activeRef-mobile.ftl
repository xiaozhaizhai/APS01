
<script type="text/javascript">
	CUI.ns("RM.formula.formulaProcessActive","RM.formula.formulaProcessActive.activeRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="RM_formula_formulaProcessActive_activeRef_callBackFuncName" id="RM_formula_formulaProcessActive_activeRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_RM_formula_formulaProcessActive_activeRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	</#if>
	<@errorbar id="ec_RM_formula_formulaProcessActive_activeRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_RM_formula_formulaProcessActive_activeRef_queryForm" exportUrl="/RM/formula/formulaProcessActive/activeRef-query.action">
		<input type="hidden" id="RM_7_5_0_0_pickSite_PickSite" value="pickSite" />
		<input type="hidden" reset="false" name="RM_formula_formulaProcessActive_activeRef_condition" id="RM_formula_formulaProcessActive_activeRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487330059541')}_${getText('RM.viewtitle.randon1489564694469')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_RM_formula_formulaProcessActive_activeRef_queryForm" formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" idprefix="ec_RM_formula_formulaProcessActive_activeRef" expandType="all" expand=true fieldcodes="RM_7_5_0_0_formula_FormulaProcessActive_activeType_activeType:RM.propertydisplayName.randon1487330759313||RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_occurTurn:RM.propertydisplayName.randon1487330199423" >
							<#assign activeType_defaultValue  = ''>
									<#assign activeType_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_FormulaProcessActive_activeType_activeType" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_FormulaProcessActive_activeType_activeType">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487330759313')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${activeType_defaultValue}"   name="activeType" code="activeType" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
							<#assign occurTurn_defaultValue  = ''>
									<#assign occurTurn_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_occurTurn" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_FormulaProcessActive_occurTurn_occurTurn">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487330199423')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${occurTurn_defaultValue}"   name="occurTurn" code="occurTurn" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" type="search" onclick="RM.formula.formulaProcessActive.activeRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_RM_formula_formulaProcessActive_activeRef_queryForm' );
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

ec_RM_formula_formulaProcessActive_activeRef_quickquery_info={};
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["activeType"]={};
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["activeType"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["activeType"].layRec="activeType";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["activeType"].columnName="ACTIVE_TYPE";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["occurTurn"]={};
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["occurTurn"].dbColumnType="SYSTEMCODE";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["occurTurn"].layRec="occurTurn";
ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["occurTurn"].columnName="OCCUR_TURN";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaProcessActive.activeRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcessActive/activeRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaProcessActive.activeRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaProcessActive/activeRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_RM_formula_formulaProcessActive_activeRef_query" renderOverEvent="ec_RM_formula_formulaProcessActive_activeRef_RenderOverEvent"  modelCode="RM_7.5.0.0_formula_FormulaProcessActive" noPermissionKeys="name,occurTurn,activeType" hidekeyPrefix="ec_RM_formula_formulaProcessActive_activeRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formulaProcessActive_activeRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','occurTurn.id','activeType.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1487330156499')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign occurTurn_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${occurTurn_displayDefaultType!}"  key="occurTurn.value"   label="${getText('RM.propertydisplayName.randon1487330199423')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign activeType_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${activeType_displayDefaultType!}"  key="activeType.value"   label="${getText('RM.propertydisplayName.randon1487330759313')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formulaProcessActive_activeRef_RenderOverEvent(){
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
	 * @method RM.formula.formulaProcessActive.activeRef.query
	 */
	RM.formula.formulaProcessActive.activeRef.query = function(type,pageNo){
		var node = RM.formula.formulaProcessActive.activeRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		RM.formula.formulaProcessActive.activeRef.node = null;
		if(!checkListValid("ec_RM_formula_formulaProcessActive_activeRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/RM/formula/formulaProcessActive/activeRef-query.action";
		CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formulaProcessActive_activeRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_activeRef";
		condobj.modelAlias="formulaProcessActive";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formulaProcessActive_activeRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formulaProcessActive_activeRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formulaProcessActive_activeRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formulaProcessActive_activeRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm *[name="'+ec_RM_formula_formulaProcessActive_activeRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formulaProcessActive_activeRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_formula_formulaProcessActive_activeRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formulaProcessActive_activeRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formulaProcessActive_activeRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formula_formulaProcessActive_activeRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_activeRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_RM_formula_formulaProcessActive_activeRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	RM.formula.formulaProcessActive.activeRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formulaProcessActive.activeRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formulaProcessActive.activeRef._prefix += '.';
			}
			RM.formula.formulaProcessActive.activeRef._prefix += arr[i];
		}
		RM.formula.formulaProcessActive.activeRef._suffix = arr[arr.length -1];
		if(RM.formula.formulaProcessActive.activeRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcessActive.activeRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formulaProcessActive.activeRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formulaProcessActive.activeRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcessActive.activeRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm *[name="'+RM.formula.formulaProcessActive.activeRef._prefix + '.' + RM.formula.formulaProcessActive.activeRef._suffix +'"]').val(obj[0][RM.formula.formulaProcessActive.activeRef._suffix]);
		CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm *[name="'+RM.formula.formulaProcessActive.activeRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm *[name^="'+RM.formula.formulaProcessActive.activeRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm *[name="'+RM.formula.formulaProcessActive.activeRef._prefix + '.' + RM.formula.formulaProcessActive.activeRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formulaProcessActive_activeRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	RM.formula.formulaProcessActive.activeRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcessActive.activeRef.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcessActive.activeRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formula_formulaProcessActive_activeRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_RM_formula_formulaProcessActive_activeRef_query.getSelectedRow();
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
			if(CUI("#RM_formula_formulaProcessActive_activeRef_callBackFuncName").val() != ""){
				eval(CUI("#RM_formula_formulaProcessActive_activeRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
RM_formula_formulaProcessActive_activeRef_refresh = function(node){
	//var url = "/RM/formula/formulaProcessActive/activeRef-query.action";
	//if(node.layRec){
	//	datatable_ec_RM_formula_formulaProcessActive_activeRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_RM_formula_formulaProcessActive_activeRef_query.setRequestDataUrl(url,'',false);
	//}
	RM.formula.formulaProcessActive.activeRef.node = node;
	RM.formula.formulaProcessActive.activeRef.query("query");
}

RM_formula_formulaProcessActive_activeRef_getList = function() {
	return "RM.formula.formulaProcessActive.activeRef";
}

	RM.formula.formulaProcessActive.activeRef.commonQuery = function(type) {
	  if(typeof RM.formula.formulaProcessActive.activeRef.cancelSelectedNode == 'function') {
	   RM.formula.formulaProcessActive.activeRef.cancelSelectedNode();
	  }
	  RM.formula.formulaProcessActive.activeRef.query(type);
	 };
	
	

RM.formula.formulaProcessActive.activeRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	RM.formula.formulaProcessActive.activeRef.otherParams = {};
	RM.formula.formulaProcessActive.activeRef.otherParams.dialogType = dialogType;
	RM.formula.formulaProcessActive.activeRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formulaProcessActive.activeRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_activeRef,js,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
