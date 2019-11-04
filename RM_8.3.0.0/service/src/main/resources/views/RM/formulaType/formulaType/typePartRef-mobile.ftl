
<script type="text/javascript">
	CUI.ns("RM.formulaType.formulaType","RM.formulaType.formulaType.typePartRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="RM_formulaType_formulaType_typePartRef_callBackFuncName" id="RM_formulaType_formulaType_typePartRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_RM_formulaType_formulaType_typePartRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1497577629830')}</span></div>
	</#if>
	<@errorbar id="ec_RM_formulaType_formulaType_typePartRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_RM_formulaType_formulaType_typePartRef_queryForm" exportUrl="/RM/formulaType/formulaType/typePartRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="RM_formulaType_formulaType_typePartRef_condition" id="RM_formulaType_formulaType_typePartRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1497578145747')}_${getText('RM.viewtitle.randon1497851111873')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_RM_formulaType_formulaType_typePartRef_queryForm" formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" idprefix="ec_RM_formulaType_formulaType_typePartRef" expandType="all" expand=true fieldcodes="RM_7_5_0_0_formulaType_FormulaType_code_code:RM.propertydisplayName.randon1497578199553||RM_7_5_0_0_formulaType_FormulaType_name_name:RM.propertydisplayName.randon1497578232478" >
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formulaType_FormulaType_code_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formulaType_FormulaType_code_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1497578199553')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="code" id="code" value="${code_defaultValue!}" deValue="${code_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formulaType_FormulaType_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formulaType_FormulaType_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1497578232478')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" type="search" onclick="RM.formulaType.formulaType.typePartRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_RM_formulaType_formulaType_typePartRef_queryForm' );
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

ec_RM_formulaType_formulaType_typePartRef_quickquery_info={};
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["code"]={};
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["code"].dbColumnType="TEXT";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["code"].layRec="code";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["code"].columnName="CODE";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["name"]={};
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["name"].dbColumnType="TEXT";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["name"].layRec="name";
ec_RM_formulaType_formulaType_typePartRef_quickquery_info["name"].columnName="NAME";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formulaType.formulaType.typePartRef.query('query')">
<#assign datatable_dataUrl = "/RM/formulaType/formulaType/typePartRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_RM_formulaType_formulaType_typePartRef_query" renderOverEvent="ec_RM_formulaType_formulaType_typePartRef_RenderOverEvent"  modelCode="RM_7.5.0.0_formulaType_FormulaType" noPermissionKeys="code,name,remark" hidekeyPrefix="ec_RM_formulaType_formulaType_typePartRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formulaType_formulaType_typePartRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('RM.propertydisplayName.randon1497578199553')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('RM.propertydisplayName.randon1497578232478111')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('RM.propertydisplayName.randon1497578261795')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formulaType_formulaType_typePartRef_RenderOverEvent(){
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
	 * @method RM.formulaType.formulaType.typePartRef.query
	 */
	RM.formulaType.formulaType.typePartRef.query = function(type,pageNo){
		var node = RM.formulaType.formulaType.typePartRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		RM.formulaType.formulaType.typePartRef.node = null;
		if(!checkListValid("ec_RM_formulaType_formulaType_typePartRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/RM/formulaType/formulaType/typePartRef-query.action";
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formulaType_formulaType_typePartRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formulaType_typePartRef";
		condobj.modelAlias="formulaType";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_formulaType_formulaType_typePartRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formulaType_formulaType_typePartRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formulaType_formulaType_typePartRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formulaType_formulaType_typePartRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formulaType_typePartRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_RM_formulaType_formulaType_typePartRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	RM.formulaType.formulaType.typePartRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formulaType.formulaType.typePartRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formulaType.formulaType.typePartRef._prefix += '.';
			}
			RM.formulaType.formulaType.typePartRef._prefix += arr[i];
		}
		RM.formulaType.formulaType.typePartRef._suffix = arr[arr.length -1];
		if(RM.formulaType.formulaType.typePartRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formulaType.formulaType.typePartRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formulaType.formulaType.typePartRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formulaType.formulaType.typePartRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formulaType.formulaType.typePartRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+RM.formulaType.formulaType.typePartRef._prefix + '.' + RM.formulaType.formulaType.typePartRef._suffix +'"]').val(obj[0][RM.formulaType.formulaType.typePartRef._suffix]);
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+RM.formulaType.formulaType.typePartRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name^="'+RM.formulaType.formulaType.typePartRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+RM.formulaType.formulaType.typePartRef._prefix + '.' + RM.formulaType.formulaType.typePartRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formulaType_formulaType_typePartRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	RM.formulaType.formulaType.typePartRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formulaType.formulaType.typePartRef.query_"+obj+")!='undefined'") ? eval('RM.formulaType.formulaType.typePartRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formulaType_formulaType_typePartRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_RM_formulaType_formulaType_typePartRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('RM.formulaType.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formulaType_formulaType_typePartRef_callBackFuncName").val() != ""){
				eval(CUI("#RM_formulaType_formulaType_typePartRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
RM_formulaType_formulaType_typePartRef_refresh = function(node){
	//var url = "/RM/formulaType/formulaType/typePartRef-query.action";
	//if(node.layRec){
	//	datatable_ec_RM_formulaType_formulaType_typePartRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_RM_formulaType_formulaType_typePartRef_query.setRequestDataUrl(url,'',false);
	//}
	RM.formulaType.formulaType.typePartRef.node = node;
	RM.formulaType.formulaType.typePartRef.query("query");
}

RM_formulaType_formulaType_typePartRef_getList = function() {
	return "RM.formulaType.formulaType.typePartRef";
}

	RM.formulaType.formulaType.typePartRef.commonQuery = function(type) {
	  if(typeof RM.formulaType.formulaType.typePartRef.cancelSelectedNode == 'function') {
	   RM.formulaType.formulaType.typePartRef.cancelSelectedNode();
	  }
	  RM.formulaType.formulaType.typePartRef.query(type);
	 };
	
	

RM.formulaType.formulaType.typePartRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	RM.formulaType.formulaType.typePartRef.otherParams = {};
	RM.formulaType.formulaType.typePartRef.otherParams.dialogType = dialogType;
	RM.formulaType.formulaType.typePartRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formulaType.formulaType.typePartRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formulaType_typePartRef,js,RM_7.5.0.0_formulaType_FormulaType,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
