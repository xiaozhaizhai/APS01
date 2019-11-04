
<script type="text/javascript">
	CUI.ns("MESBasic.prodtype.prodtype","MESBasic.prodtype.prodtype.ptrec");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_prodtype_prodtype_ptrec_callBackFuncName" id="MESBasic_prodtype_prodtype_ptrec_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_prodtype_prodtype_ptrec_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1421287707449')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_prodtype_prodtype_ptrec_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_prodtype_prodtype_ptrec_queryForm" exportUrl="/MESBasic/prodtype/prodtype/ptrec-query.action">
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" reset="false" name="MESBasic_prodtype_prodtype_ptrec_condition" id="MESBasic_prodtype_prodtype_ptrec_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1421288154333')}_${getText('MESBasic.viewtitle.radion1421288474675')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_prodtype_prodtype_ptrec_queryForm" formId="ec_MESBasic_prodtype_prodtype_ptrec_queryForm" idprefix="ec_MESBasic_prodtype_prodtype_ptrec" expandType="single"  fieldcodes="MESBasic_1_prodtype_Prodtype_ptid_ptid:MESBasic.propertydisplayName.radion1421288205380||MESBasic_1_prodtype_Prodtype_ptname_ptname:MESBasic.propertydisplayName.radion1421288241194||MESBasic_1_prodtype_Prodtype_notes_notes:MESBasic.propertydisplayName.radion1421288266808" >
							<#assign ptid_defaultValue  = ''>
									<#assign ptid_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_prodtype_Prodtype_ptid_ptid" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_prodtype_Prodtype_ptid_ptid">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1421288205380')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="ptid" id="ptid" value="${ptid_defaultValue!}" deValue="${ptid_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign ptname_defaultValue  = ''>
									<#assign ptname_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_prodtype_Prodtype_ptname_ptname" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_prodtype_Prodtype_ptname_ptname">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1421288241194')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="ptname" id="ptname" value="${ptname_defaultValue!}" deValue="${ptname_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign notes_defaultValue  = ''>
									<#assign notes_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_prodtype_Prodtype_notes_notes" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_prodtype_Prodtype_notes_notes">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1421288266808')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="notes" id="notes" value="${notes_defaultValue!}" deValue="${notes_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_MESBasic_prodtype_prodtype_ptrec_queryForm" type="search" onclick="MESBasic.prodtype.prodtype.ptrec.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_prodtype_prodtype_ptrec_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_prodtype_prodtype_ptrec_queryForm' );
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
<#assign datatable_queryFunc = "MESBasic.prodtype.prodtype.ptrec.query('query')">
<#assign datatable_dataUrl = "/MESBasic/prodtype/prodtype/ptrec-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_prodtype_prodtype_ptrec_query" renderOverEvent="ec_MESBasic_prodtype_prodtype_ptrec_RenderOverEvent"  modelCode="MESBasic_1_prodtype_Prodtype" noPermissionKeys="ptid,ptname,notes" hidekeyPrefix="ec_MESBasic_prodtype_prodtype_ptrec_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_prodtype_prodtype_ptrec_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign ptid_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${ptid_displayDefaultType!}"  key="ptid"   label="${getText('MESBasic.propertydisplayName.radion1421288205380')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign ptname_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${ptname_displayDefaultType!}"  key="ptname"   label="${getText('MESBasic.propertydisplayName.radion1421288241194')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign notes_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${notes_displayDefaultType!}"  key="notes"   label="${getText('MESBasic.propertydisplayName.radion1421288266808')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_prodtype_prodtype_ptrec_RenderOverEvent(){
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
	 * @method MESBasic.prodtype.prodtype.ptrec.query
	 */
	MESBasic.prodtype.prodtype.ptrec.query = function(type,pageNo){
		var node = MESBasic.prodtype.prodtype.ptrec.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.prodtype.prodtype.ptrec.node = null;
		if(!checkListValid("ec_MESBasic_prodtype_prodtype_ptrec_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/prodtype/prodtype/ptrec-query.action";
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol+'"]').prop('checked')));
					}
				} else {
					var fastColValue = CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+fastCol+'"]').val();
					if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
						if(fastCol.endsWith('_start')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType && dateType == 'date') {
								fastColValue += " 00:00:00";
							}
						}
						if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType && dateType == 'date') {
								fastColValue += " 23:59:59";
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
		var pageSize=CUI('input[name="ec_MESBasic_prodtype_prodtype_ptrec_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_prodtype_prodtype_ptrec_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_prodtype_ptrec';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.prodtype.prodtype.ptrec._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.prodtype.prodtype.ptrec._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.prodtype.prodtype.ptrec._prefix += '.';
			}
			MESBasic.prodtype.prodtype.ptrec._prefix += arr[i];
		}
		MESBasic.prodtype.prodtype.ptrec._suffix = arr[arr.length -1];
		if(MESBasic.prodtype.prodtype.ptrec._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.prodtype.prodtype.ptrec._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.prodtype.prodtype.ptrec._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.prodtype.prodtype.ptrec.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.prodtype.prodtype.ptrec.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+MESBasic.prodtype.prodtype.ptrec._prefix + '.' + MESBasic.prodtype.prodtype.ptrec._suffix +'"]').val(obj[0][MESBasic.prodtype.prodtype.ptrec._suffix]);
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+MESBasic.prodtype.prodtype.ptrec._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name^="'+MESBasic.prodtype.prodtype.ptrec._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+MESBasic.prodtype.prodtype.ptrec._prefix + '.' + MESBasic.prodtype.prodtype.ptrec._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_prodtype_prodtype_ptrec_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.prodtype.prodtype.ptrec._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.prodtype.prodtype.ptrec.query_"+obj+")!='undefined'") ? eval('MESBasic.prodtype.prodtype.ptrec.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.prodtype.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_prodtype_prodtype_ptrec_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_prodtype_prodtype_ptrec_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_prodtype_prodtype_ptrec_refresh = function(node){
	//var url = "/MESBasic/prodtype/prodtype/ptrec-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_prodtype_prodtype_ptrec_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.prodtype.prodtype.ptrec.node = node;
	MESBasic.prodtype.prodtype.ptrec.query("query");
}

MESBasic_prodtype_prodtype_ptrec_getList = function() {
	return "MESBasic.prodtype.prodtype.ptrec";
}

	MESBasic.prodtype.prodtype.ptrec.commonQuery = function(type) {
	  if(typeof MESBasic.prodtype.prodtype.ptrec.cancelSelectedNode == 'function') {
	   MESBasic.prodtype.prodtype.ptrec.cancelSelectedNode();
	  }
	  MESBasic.prodtype.prodtype.ptrec.query(type);
	 };
	
	

MESBasic.prodtype.prodtype.ptrec.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.prodtype.prodtype.ptrec.otherParams = {};
	MESBasic.prodtype.prodtype.ptrec.otherParams.dialogType = dialogType;
	MESBasic.prodtype.prodtype.ptrec.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.prodtype.prodtype.ptrec.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_prodtype_ptrec,js,MESBasic_1_prodtype_Prodtype,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	</script>
  </body>
</html>
