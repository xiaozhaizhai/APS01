
<script type="text/javascript">
	CUI.ns("MESBasic.tankModel.tankModel","MESBasic.tankModel.tankModel.modelRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_tankModel_tankModel_modelRef_callBackFuncName" id="MESBasic_tankModel_tankModel_modelRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415150373047')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_tankModel_tankModel_modelRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" exportUrl="/MESBasic/tankModel/tankModel/modelRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_tankModel_tankModel_modelRef_condition" id="MESBasic_tankModel_tankModel_modelRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415150418847')}_${getText('MESBasic.viewtitle.radion1415322322556')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_tankModel_tankModel_modelRef_queryForm" formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" idprefix="ec_MESBasic_tankModel_tankModel_modelRef" expandType="all" expand=true fieldcodes="MESBasic_1_tankModel_TankModel_code_code:MESBasic.propertydisplayName.radion1415150470967||MESBasic_1_tankModel_TankModel_name_name:MESBasic.propertydisplayName.radion1415150519135||MESBasic_1_tankModel_TankModel_shape_shape:MESBasic.propertydisplayName.radion1415150919382" >
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_tankModel_TankModel_code_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_tankModel_TankModel_code_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415150470967')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (code_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('code')" name="code" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('code')" name="code" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_tankModel_TankModel_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_tankModel_TankModel_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415150519135')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (name_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('name')" name="name" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.tankModel.tankModel.modelRef._querycustomFunc('name')" name="name" id="ec_MESBasic_tankModel_tankModel_modelRef_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/MESBasic/tankModel/tankModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign shape_defaultValue  = 'TANK_SHAPE/0'>
									<#assign shape_defaultValue  = 'TANK_SHAPE/0'>
							<div  field-unique-code="MESBasic_1_tankModel_TankModel_shape_shape" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_tankModel_TankModel_shape_shape">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415150919382')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${shape_defaultValue}"   name="shape" code="TANK_SHAPE" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" type="search" onclick="MESBasic.tankModel.tankModel.modelRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_tankModel_tankModel_modelRef_queryForm' );
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

ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info={};
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["code"]={};
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["code"].layRec="code";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["name"]={};
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["name"].layRec="name";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["name"].columnName="NAME";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["shape"]={};
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["shape"].dbColumnType="SYSTEMCODE";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["shape"].layRec="shape";
ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["shape"].columnName="SHAPE";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.tankModel.tankModel.modelRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/tankModel/tankModel/modelRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_tankModel_tankModel_modelRef_query" renderOverEvent="ec_MESBasic_tankModel_tankModel_modelRef_RenderOverEvent"  modelCode="MESBasic_1_tankModel_TankModel" noPermissionKeys="code,name,shape,volume" hidekeyPrefix="ec_MESBasic_tankModel_tankModel_modelRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_tankModel_tankModel_modelRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','shape.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415150470967')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1415150519135')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign shape_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${shape_displayDefaultType!}"  key="shape.value"   label="${getText('MESBasic.propertydisplayName.radion1415150919382')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign volume_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${volume_displayDefaultType!}"  key="volume"   label="${getText('MESBasic.propertydisplayName.radion1415150645388')}" textalign="left"  width=200   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_tankModel_tankModel_modelRef_RenderOverEvent(){
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
	 * @method MESBasic.tankModel.tankModel.modelRef.query
	 */
	MESBasic.tankModel.tankModel.modelRef.query = function(type,pageNo){
		var node = MESBasic.tankModel.tankModel.modelRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.tankModel.tankModel.modelRef.node = null;
		if(!checkListValid("ec_MESBasic_tankModel_tankModel_modelRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/tankModel/tankModel/modelRef-query.action";
		CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_tankModel_modelRef";
		condobj.modelAlias="tankModel";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm *[name="'+ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_tankModel_tankModel_modelRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_tankModel_tankModel_modelRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_tankModel_tankModel_modelRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_tankModel_modelRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_tankModel_tankModel_modelRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.tankModel.tankModel.modelRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.tankModel.tankModel.modelRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.tankModel.tankModel.modelRef._prefix += '.';
			}
			MESBasic.tankModel.tankModel.modelRef._prefix += arr[i];
		}
		MESBasic.tankModel.tankModel.modelRef._suffix = arr[arr.length -1];
		if(MESBasic.tankModel.tankModel.modelRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.tankModel.tankModel.modelRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.tankModel.tankModel.modelRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.tankModel.tankModel.modelRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.tankModel.tankModel.modelRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm *[name="'+MESBasic.tankModel.tankModel.modelRef._prefix + '.' + MESBasic.tankModel.tankModel.modelRef._suffix +'"]').val(obj[0][MESBasic.tankModel.tankModel.modelRef._suffix]);
		CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm *[name="'+MESBasic.tankModel.tankModel.modelRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm *[name^="'+MESBasic.tankModel.tankModel.modelRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm *[name="'+MESBasic.tankModel.tankModel.modelRef._prefix + '.' + MESBasic.tankModel.tankModel.modelRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_tankModel_tankModel_modelRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.tankModel.tankModel.modelRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.tankModel.tankModel.modelRef.query_"+obj+")!='undefined'") ? eval('MESBasic.tankModel.tankModel.modelRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_tankModel_tankModel_modelRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_tankModel_tankModel_modelRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.tankModel.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_tankModel_tankModel_modelRef_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_tankModel_tankModel_modelRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_tankModel_tankModel_modelRef_refresh = function(node){
	//var url = "/MESBasic/tankModel/tankModel/modelRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_tankModel_tankModel_modelRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_tankModel_tankModel_modelRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.tankModel.tankModel.modelRef.node = node;
	MESBasic.tankModel.tankModel.modelRef.query("query");
}

MESBasic_tankModel_tankModel_modelRef_getList = function() {
	return "MESBasic.tankModel.tankModel.modelRef";
}

	MESBasic.tankModel.tankModel.modelRef.commonQuery = function(type) {
	  if(typeof MESBasic.tankModel.tankModel.modelRef.cancelSelectedNode == 'function') {
	   MESBasic.tankModel.tankModel.modelRef.cancelSelectedNode();
	  }
	  MESBasic.tankModel.tankModel.modelRef.query(type);
	 };
	
	

MESBasic.tankModel.tankModel.modelRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.tankModel.tankModel.modelRef.otherParams = {};
	MESBasic.tankModel.tankModel.modelRef.otherParams.dialogType = dialogType;
	MESBasic.tankModel.tankModel.modelRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.tankModel.tankModel.modelRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_tankModel_modelRef,js,MESBasic_1_tankModel_TankModel,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
