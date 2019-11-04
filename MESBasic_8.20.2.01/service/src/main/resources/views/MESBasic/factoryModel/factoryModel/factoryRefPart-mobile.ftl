
<script type="text/javascript">
	CUI.ns("MESBasic.factoryModel.factoryModel","MESBasic.factoryModel.factoryModel.factoryRefPart");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_factoryModel_factoryModel_factoryRefPart_callBackFuncName" id="MESBasic_factoryModel_factoryModel_factoryRefPart_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1419232311198')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" exportUrl="/MESBasic/factoryModel/factoryModel/factoryRefPart-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_factoryModel_factoryModel_factoryRefPart_condition" id="MESBasic_factoryModel_factoryModel_factoryRefPart_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1419232346350')}_${getText('MESBasic.viewtitle.radion1419585671116')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" formId="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" idprefix="ec_MESBasic_factoryModel_factoryModel_factoryRefPart" expandType="all" expand=true fieldcodes="MESBasic_1_factoryModel_FactoryModel_name_name:MESBasic.propertydisplayName.radion141923322393782||MESBasic_1_factoryModel_FactoryModel_code_code:MESBasic.propertydisplayName.radion1419233767027||MESBasic_1_nodeType_NodeType_name_nodeType_name:MESBasic.menuName.randon1460948858365" >
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_factoryModel_FactoryModel_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_factoryModel_FactoryModel_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion141923322393782')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (name_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.factoryModel.factoryModel.factoryRefPart._querycustomFunc('name')" name="name" id="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.factoryRefPart.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.factoryModel.factoryModel.factoryRefPart._querycustomFunc('name')" name="name" id="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.factoryRefPart.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_factoryModel_FactoryModel_code_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_factoryModel_FactoryModel_code_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1419233767027')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (code_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.factoryModel.factoryModel.factoryRefPart._querycustomFunc('code')" name="code" id="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.factoryRefPart.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.factoryModel.factoryModel.factoryRefPart._querycustomFunc('code')" name="code" id="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/factoryModel/factoryModel/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.factoryModel.factoryModel.factoryRefPart.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign nodeType_name_defaultValue  = ''>
									<#assign nodeType_name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_nodeType_NodeType_name_nodeType_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_nodeType_NodeType_name_nodeType_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.menuName.randon1460948858365')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="nodeType.id" name="nodeType.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1460947537367')}"  conditionfunc="MESBasic.factoryModel.factoryModel.factoryRefPart._querycustomFunc('nodeType_name')" name="nodeType.name" id="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm_nodeType_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/MESBasic/nodeType/nodeType/noderef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" searchClick="MESBasic.factoryModel.factoryModel.factoryRefPart.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" type="search" onclick="MESBasic.factoryModel.factoryModel.factoryRefPart.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm' );
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

ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info={};
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["name"]={};
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["name"].layRec="name";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["name"].columnName="NODENAME";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["code"]={};
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["code"].layRec="code";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["code"].columnName="CODE";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["nodeType.name"]={};
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["nodeType.name"].dbColumnType="TEXT";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["nodeType.name"].layRec="factory_tbnodetype,ID,factory_tbcompanystructure,NODE_TYPE-name";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["nodeType.name"].columnName="NAME";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["nodeType.id"]={};
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["nodeType.id"].dbColumnType="LONG";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["nodeType.id"].layRec="factory_tbnodetype,ID,factory_tbcompanystructure,NODE_TYPE-name";
ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["nodeType.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.factoryModel.factoryModel.factoryRefPart.query('query')">
<#assign datatable_dataUrl = "/MESBasic/factoryModel/factoryModel/factoryRefPart-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_query" renderOverEvent="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_RenderOverEvent"  modelCode="MESBasic_1_factoryModel_FactoryModel" noPermissionKeys="name,code,nodeType.name,area,description" hidekeyPrefix="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','area.id','nodeType.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion141923322393782')}" textalign="left"  width=140   type="textfield"    showFormatFunc=""/>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1419233767027')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign nodeType_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${nodeType_name_displayDefaultType!}"  key="nodeType.name"   label="${getText('MESBasic.entityname.randon1460947272892')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign area_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${area_displayDefaultType!}"  key="area.value"   label="${getText('MESBasic.propertydisplayName.randon1489991460442')}" textalign="left"  width=200   type="systemcode"    showFormatFunc=""/>
			<#assign description_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${description_displayDefaultType!}"  key="description"   label="${getText('MESBasic.propertydisplayName.radion1419233695132')}" textalign="left"  width=140   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_factoryModel_factoryModel_factoryRefPart_RenderOverEvent(){
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
	 * @method MESBasic.factoryModel.factoryModel.factoryRefPart.query
	 */
	MESBasic.factoryModel.factoryModel.factoryRefPart.query = function(type,pageNo){
		var node = MESBasic.factoryModel.factoryModel.factoryRefPart.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.factoryModel.factoryModel.factoryRefPart.node = null;
		if(!checkListValid("ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/factoryModel/factoryModel/factoryRefPart-query.action";
		CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_factoryModel_factoryRefPart";
		condobj.modelAlias="factoryModel";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm *[name="'+ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_factoryModel_factoryModel_factoryRefPart_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_factoryModel_factoryModel_factoryRefPart_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_factoryModel_factoryModel_factoryRefPart_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_factoryModel_factoryRefPart';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_factoryModel_factoryModel_factoryRefPart_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.factoryModel.factoryModel.factoryRefPart._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.factoryModel.factoryModel.factoryRefPart._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.factoryModel.factoryModel.factoryRefPart._prefix += '.';
			}
			MESBasic.factoryModel.factoryModel.factoryRefPart._prefix += arr[i];
		}
		MESBasic.factoryModel.factoryModel.factoryRefPart._suffix = arr[arr.length -1];
		if(MESBasic.factoryModel.factoryModel.factoryRefPart._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.factoryModel.factoryModel.factoryRefPart._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.factoryModel.factoryModel.factoryRefPart._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.factoryModel.factoryModel.factoryRefPart.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.factoryModel.factoryModel.factoryRefPart.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm *[name="'+MESBasic.factoryModel.factoryModel.factoryRefPart._prefix + '.' + MESBasic.factoryModel.factoryModel.factoryRefPart._suffix +'"]').val(obj[0][MESBasic.factoryModel.factoryModel.factoryRefPart._suffix]);
		CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm *[name="'+MESBasic.factoryModel.factoryModel.factoryRefPart._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm *[name^="'+MESBasic.factoryModel.factoryModel.factoryRefPart._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm *[name="'+MESBasic.factoryModel.factoryModel.factoryRefPart._prefix + '.' + MESBasic.factoryModel.factoryModel.factoryRefPart._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_factoryModel_factoryModel_factoryRefPart_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.factoryModel.factoryModel.factoryRefPart._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.factoryModel.factoryModel.factoryRefPart.query_"+obj+")!='undefined'") ? eval('MESBasic.factoryModel.factoryModel.factoryRefPart.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_factoryModel_factoryModel_factoryRefPart_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_factoryModel_factoryModel_factoryRefPart_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.factoryModel.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_factoryModel_factoryModel_factoryRefPart_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_factoryModel_factoryModel_factoryRefPart_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_factoryModel_factoryModel_factoryRefPart_refresh = function(node){
	//var url = "/MESBasic/factoryModel/factoryModel/factoryRefPart-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_factoryModel_factoryModel_factoryRefPart_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_factoryModel_factoryModel_factoryRefPart_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.factoryModel.factoryModel.factoryRefPart.node = node;
	MESBasic.factoryModel.factoryModel.factoryRefPart.query("query");
}

MESBasic_factoryModel_factoryModel_factoryRefPart_getList = function() {
	return "MESBasic.factoryModel.factoryModel.factoryRefPart";
}

	MESBasic.factoryModel.factoryModel.factoryRefPart.commonQuery = function(type) {
	  if(typeof MESBasic.factoryModel.factoryModel.factoryRefPart.cancelSelectedNode == 'function') {
	   MESBasic.factoryModel.factoryModel.factoryRefPart.cancelSelectedNode();
	  }
	  MESBasic.factoryModel.factoryModel.factoryRefPart.query(type);
	 };
	
	

MESBasic.factoryModel.factoryModel.factoryRefPart.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.factoryModel.factoryModel.factoryRefPart.otherParams = {};
	MESBasic.factoryModel.factoryModel.factoryRefPart.otherParams.dialogType = dialogType;
	MESBasic.factoryModel.factoryModel.factoryRefPart.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.factoryModel.factoryModel.factoryRefPart.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_factoryModel_factoryRefPart,js,MESBasic_1_factoryModel_FactoryModel,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
