
<script type="text/javascript">
	CUI.ns("MESBasic.nodeType.nodeType","MESBasic.nodeType.nodeType.noderef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_nodeType_nodeType_noderef_callBackFuncName" id="MESBasic_nodeType_nodeType_noderef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_nodeType_nodeType_noderef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1460947272892')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_nodeType_nodeType_noderef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_nodeType_nodeType_noderef_queryForm" exportUrl="/MESBasic/nodeType/nodeType/noderef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_nodeType_nodeType_noderef_condition" id="MESBasic_nodeType_nodeType_noderef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1460947310555')}_${getText('MESBasic.viewtitle.randon1460947537367')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_nodeType_nodeType_noderef_queryForm" formId="ec_MESBasic_nodeType_nodeType_noderef_queryForm" idprefix="ec_MESBasic_nodeType_nodeType_noderef" expandType="all" expand=true fieldcodes="MESBasic_1_nodeType_NodeType_code_code:MESBasic.propertydisplayName.randon1460947336569||MESBasic_1_nodeType_NodeType_name_name:MESBasic.propertydisplayName.randon1460947375824||MESBasic_1_nodeType_NodeType_nodeComment_nodeComment:MESBasic.propertydisplayName.randon1460947417565" >
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_nodeType_NodeType_code_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_nodeType_NodeType_code_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1460947336569')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (code_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_nodeType_nodeType_noderef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.nodeType.nodeType.noderef._querycustomFunc('code')" name="code" id="ec_MESBasic_nodeType_nodeType_noderef_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/nodeType/nodeType/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.nodeType.nodeType.noderef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_nodeType_nodeType_noderef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.nodeType.nodeType.noderef._querycustomFunc('code')" name="code" id="ec_MESBasic_nodeType_nodeType_noderef_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/nodeType/nodeType/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.nodeType.nodeType.noderef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_nodeType_NodeType_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_nodeType_NodeType_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1460947375824')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (name_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_nodeType_nodeType_noderef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.nodeType.nodeType.noderef._querycustomFunc('name')" name="name" id="ec_MESBasic_nodeType_nodeType_noderef_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/MESBasic/nodeType/nodeType/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.nodeType.nodeType.noderef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_nodeType_nodeType_noderef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.nodeType.nodeType.noderef._querycustomFunc('name')" name="name" id="ec_MESBasic_nodeType_nodeType_noderef_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/MESBasic/nodeType/nodeType/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.nodeType.nodeType.noderef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign nodeComment_defaultValue  = ''>
									<#assign nodeComment_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_nodeType_NodeType_nodeComment_nodeComment" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_nodeType_NodeType_nodeComment_nodeComment">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1460947417565')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="nodeComment" id="nodeComment" value="${nodeComment_defaultValue!}" deValue="${nodeComment_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_nodeType_nodeType_noderef_queryForm" type="search" onclick="MESBasic.nodeType.nodeType.noderef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_nodeType_nodeType_noderef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_nodeType_nodeType_noderef_queryForm' );
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

ec_MESBasic_nodeType_nodeType_noderef_quickquery_info={};
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["code"]={};
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["code"].layRec="code";
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["name"]={};
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["name"].layRec="name";
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["name"].columnName="NAME";
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["nodeComment"]={};
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["nodeComment"].dbColumnType="TEXT";
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["nodeComment"].layRec="nodeComment";
ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["nodeComment"].columnName="NODECOMMENT";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.nodeType.nodeType.noderef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/nodeType/nodeType/noderef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_nodeType_nodeType_noderef_query" renderOverEvent="ec_MESBasic_nodeType_nodeType_noderef_RenderOverEvent"  modelCode="MESBasic_1_nodeType_NodeType" noPermissionKeys="code,name,nodeComment" hidekeyPrefix="ec_MESBasic_nodeType_nodeType_noderef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_nodeType_nodeType_noderef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.randon1460947336569')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.randon1460947375824')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign nodeComment_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${nodeComment_displayDefaultType!}"  key="nodeComment"   label="${getText('MESBasic.propertydisplayName.randon1460947417565')}" textalign="left"  width=160   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_nodeType_nodeType_noderef_RenderOverEvent(){
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
	 * @method MESBasic.nodeType.nodeType.noderef.query
	 */
	MESBasic.nodeType.nodeType.noderef.query = function(type,pageNo){
		var node = MESBasic.nodeType.nodeType.noderef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.nodeType.nodeType.noderef.node = null;
		if(!checkListValid("ec_MESBasic_nodeType_nodeType_noderef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/nodeType/nodeType/noderef-query.action";
		CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_nodeType_nodeType_noderef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_nodeType_noderef";
		condobj.modelAlias="nodeType";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_nodeType_nodeType_noderef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_nodeType_nodeType_noderef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_nodeType_nodeType_noderef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_nodeType_nodeType_noderef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm *[name="'+ec_MESBasic_nodeType_nodeType_noderef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_nodeType_nodeType_noderef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_nodeType_nodeType_noderef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_nodeType_nodeType_noderef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_nodeType_nodeType_noderef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_nodeType_nodeType_noderef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_nodeType_noderef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_nodeType_nodeType_noderef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.nodeType.nodeType.noderef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.nodeType.nodeType.noderef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.nodeType.nodeType.noderef._prefix += '.';
			}
			MESBasic.nodeType.nodeType.noderef._prefix += arr[i];
		}
		MESBasic.nodeType.nodeType.noderef._suffix = arr[arr.length -1];
		if(MESBasic.nodeType.nodeType.noderef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.nodeType.nodeType.noderef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.nodeType.nodeType.noderef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.nodeType.nodeType.noderef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.nodeType.nodeType.noderef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm *[name="'+MESBasic.nodeType.nodeType.noderef._prefix + '.' + MESBasic.nodeType.nodeType.noderef._suffix +'"]').val(obj[0][MESBasic.nodeType.nodeType.noderef._suffix]);
		CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm *[name="'+MESBasic.nodeType.nodeType.noderef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm *[name^="'+MESBasic.nodeType.nodeType.noderef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm *[name="'+MESBasic.nodeType.nodeType.noderef._prefix + '.' + MESBasic.nodeType.nodeType.noderef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_nodeType_nodeType_noderef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.nodeType.nodeType.noderef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.nodeType.nodeType.noderef.query_"+obj+")!='undefined'") ? eval('MESBasic.nodeType.nodeType.noderef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_nodeType_nodeType_noderef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_nodeType_nodeType_noderef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.nodeType.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_nodeType_nodeType_noderef_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_nodeType_nodeType_noderef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_nodeType_nodeType_noderef_refresh = function(node){
	//var url = "/MESBasic/nodeType/nodeType/noderef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_nodeType_nodeType_noderef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_nodeType_nodeType_noderef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.nodeType.nodeType.noderef.node = node;
	MESBasic.nodeType.nodeType.noderef.query("query");
}

MESBasic_nodeType_nodeType_noderef_getList = function() {
	return "MESBasic.nodeType.nodeType.noderef";
}

	MESBasic.nodeType.nodeType.noderef.commonQuery = function(type) {
	  if(typeof MESBasic.nodeType.nodeType.noderef.cancelSelectedNode == 'function') {
	   MESBasic.nodeType.nodeType.noderef.cancelSelectedNode();
	  }
	  MESBasic.nodeType.nodeType.noderef.query(type);
	 };
	
	

MESBasic.nodeType.nodeType.noderef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.nodeType.nodeType.noderef.otherParams = {};
	MESBasic.nodeType.nodeType.noderef.otherParams.dialogType = dialogType;
	MESBasic.nodeType.nodeType.noderef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.nodeType.nodeType.noderef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_nodeType_noderef,js,MESBasic_1_nodeType_NodeType,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
