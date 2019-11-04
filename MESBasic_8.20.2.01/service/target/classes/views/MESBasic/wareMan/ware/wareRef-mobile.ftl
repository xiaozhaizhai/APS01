
<script type="text/javascript">
	CUI.ns("MESBasic.wareMan.ware","MESBasic.wareMan.ware.wareRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_wareMan_ware_wareRef_callBackFuncName" id="MESBasic_wareMan_ware_wareRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_wareMan_ware_wareRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1484030983271')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_wareMan_ware_wareRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_wareMan_ware_wareRef_queryForm" exportUrl="/MESBasic/wareMan/ware/wareRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="belongDept" />
		<input type="hidden" reset="false" name="MESBasic_wareMan_ware_wareRef_condition" id="MESBasic_wareMan_ware_wareRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1484031011977')}_${getText('MESBasic.viewtitle.randon1484031981880')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_wareMan_ware_wareRef_queryForm" formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" idprefix="ec_MESBasic_wareMan_ware_wareRef" expandType="all" expand=true fieldcodes="MESBasic_1_wareMan_Ware_wareName_wareName:MESBasic.propertydisplayName.randon1484031316281||MESBasic_1_wareMan_Ware_wareCode_wareCode:MESBasic.propertydisplayName.randon1484031239866||base_staff_name_storeKeeper_name:MESBasic.propertydisplayName.randon1484031191617" >
							<#assign wareName_defaultValue  = ''>
									<#assign wareName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_wareMan_Ware_wareName_wareName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_wareMan_Ware_wareName_wareName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1484031316281')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (wareName_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${wareName_defaultValue!}" deValue="${wareName_defaultValue!}"   conditionfunc="MESBasic.wareMan.ware.wareRef._querycustomFunc('wareName')" name="wareName" id="ec_MESBasic_wareMan_ware_wareRef_queryForm_wareName" displayFieldName="wareName" exp="like" classStyle="form-control"  url="/MESBasic/wareMan/ware/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.wareMan.ware.wareRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.wareMan.ware.wareRef._querycustomFunc('wareName')" name="wareName" id="ec_MESBasic_wareMan_ware_wareRef_queryForm_wareName" displayFieldName="wareName" exp="like" classStyle="form-control"  url="/MESBasic/wareMan/ware/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.wareMan.ware.wareRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign wareCode_defaultValue  = ''>
									<#assign wareCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_wareMan_Ware_wareCode_wareCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_wareMan_Ware_wareCode_wareCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1484031239866')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (wareCode_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${wareCode_defaultValue!}" deValue="${wareCode_defaultValue!}"   conditionfunc="MESBasic.wareMan.ware.wareRef._querycustomFunc('wareCode')" name="wareCode" id="ec_MESBasic_wareMan_ware_wareRef_queryForm_wareCode" displayFieldName="wareCode" exp="like" classStyle="form-control"  url="/MESBasic/wareMan/ware/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.wareMan.ware.wareRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.wareMan.ware.wareRef._querycustomFunc('wareCode')" name="wareCode" id="ec_MESBasic_wareMan_ware_wareRef_queryForm_wareCode" displayFieldName="wareCode" exp="like" classStyle="form-control"  url="/MESBasic/wareMan/ware/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.wareMan.ware.wareRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign storeKeeper_name_defaultValue  = ''>
									<#assign storeKeeper_name_defaultValue  = ''>
							<div  field-unique-code="base_staff_name_storeKeeper_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "base_staff_name_storeKeeper_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1484031191617')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="storeKeeper.id" name="storeKeeper.id" value="" />
												<#if (storeKeeper_name_defaultValue)=='currentUser'>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany value="${Session.staff.name}" deValue="currentUser" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="MESBasic.wareMan.ware.wareRef._querycustomFunc('storeKeeper_name')" name="storeKeeper.name" id="ec_MESBasic_wareMan_ware_wareRef_queryForm_storeKeeper_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" searchClick="MESBasic.wareMan.ware.wareRef.commonQuery('query')" />
													<script type="text/javascript">
													(function($){
														$(function(){
															CUI('#storeKeeper.id').val('${Session.staff.id}');
														});
													})(jQuery);
													</script>
												<#else>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="MESBasic.wareMan.ware.wareRef._querycustomFunc('storeKeeper_name')" name="storeKeeper.name" id="ec_MESBasic_wareMan_ware_wareRef_queryForm_storeKeeper_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" searchClick="MESBasic.wareMan.ware.wareRef.commonQuery('query')" />
												</#if>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" type="search" onclick="MESBasic.wareMan.ware.wareRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_wareMan_ware_wareRef_queryForm' );
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

ec_MESBasic_wareMan_ware_wareRef_quickquery_info={};
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["wareName"]={};
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["wareName"].dbColumnType="TEXT";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["wareName"].layRec="wareName";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["wareName"].columnName="WARE_NAME";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["wareCode"]={};
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["wareCode"].dbColumnType="TEXT";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["wareCode"].layRec="wareCode";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["wareCode"].columnName="WARE_CODE";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["storeKeeper.name"]={};
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["storeKeeper.name"].dbColumnType="TEXT";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["storeKeeper.name"].layRec="base_staff,ID,MATERIAL_WARES,STORE_KEEPER-name";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["storeKeeper.name"].columnName="NAME";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["storeKeeper.id"]={};
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["storeKeeper.id"].dbColumnType="LONG";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["storeKeeper.id"].layRec="base_staff,ID,MATERIAL_WARES,STORE_KEEPER-name";
ec_MESBasic_wareMan_ware_wareRef_quickquery_info["storeKeeper.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.wareMan.ware.wareRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/wareMan/ware/wareRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_wareMan_ware_wareRef_query" renderOverEvent="ec_MESBasic_wareMan_ware_wareRef_RenderOverEvent"  modelCode="MESBasic_1_wareMan_Ware" noPermissionKeys="wareCode,wareName,wareAddress,storeKeeper.name" hidekeyPrefix="ec_MESBasic_wareMan_ware_wareRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_wareMan_ware_wareRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','storeKeeper.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign wareCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareCode_displayDefaultType!}"  key="wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign wareName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareName_displayDefaultType!}"  key="wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign wareAddress_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareAddress_displayDefaultType!}"  key="wareAddress"   label="${getText('MESBasic.propertydisplayName.randon1484031218230')}" textalign="left"  width=200   type="textfield"    showFormatFunc=""/>
			<#assign storeKeeper_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${storeKeeper_name_displayDefaultType!}"  key="storeKeeper.name"   label="${getText('MESBasic.propertydisplayName.randon1484031191617')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_wareMan_ware_wareRef_RenderOverEvent(){
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
	 * @method MESBasic.wareMan.ware.wareRef.query
	 */
	MESBasic.wareMan.ware.wareRef.query = function(type,pageNo){
		var node = MESBasic.wareMan.ware.wareRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.wareMan.ware.wareRef.node = null;
		if(!checkListValid("ec_MESBasic_wareMan_ware_wareRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/wareMan/ware/wareRef-query.action";
		CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_wareMan_ware_wareRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_wareMan_wareRef";
		condobj.modelAlias="ware";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_wareMan_ware_wareRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_wareMan_ware_wareRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_wareMan_ware_wareRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_wareMan_ware_wareRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm *[name="'+ec_MESBasic_wareMan_ware_wareRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_wareMan_ware_wareRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_wareMan_ware_wareRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_wareMan_ware_wareRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_wareMan_ware_wareRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_wareMan_ware_wareRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_wareMan_wareRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_wareMan_ware_wareRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.wareMan.ware.wareRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.wareMan.ware.wareRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.wareMan.ware.wareRef._prefix += '.';
			}
			MESBasic.wareMan.ware.wareRef._prefix += arr[i];
		}
		MESBasic.wareMan.ware.wareRef._suffix = arr[arr.length -1];
		if(MESBasic.wareMan.ware.wareRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.wareMan.ware.wareRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.wareMan.ware.wareRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.wareMan.ware.wareRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.wareMan.ware.wareRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm *[name="'+MESBasic.wareMan.ware.wareRef._prefix + '.' + MESBasic.wareMan.ware.wareRef._suffix +'"]').val(obj[0][MESBasic.wareMan.ware.wareRef._suffix]);
		CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm *[name="'+MESBasic.wareMan.ware.wareRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm *[name^="'+MESBasic.wareMan.ware.wareRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm *[name="'+MESBasic.wareMan.ware.wareRef._prefix + '.' + MESBasic.wareMan.ware.wareRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_wareMan_ware_wareRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.wareMan.ware.wareRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.wareMan.ware.wareRef.query_"+obj+")!='undefined'") ? eval('MESBasic.wareMan.ware.wareRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_wareMan_ware_wareRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_wareMan_ware_wareRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.ware.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_wareMan_ware_wareRef_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_wareMan_ware_wareRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_wareMan_ware_wareRef_refresh = function(node){
	//var url = "/MESBasic/wareMan/ware/wareRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_wareMan_ware_wareRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_wareMan_ware_wareRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.wareMan.ware.wareRef.node = node;
	MESBasic.wareMan.ware.wareRef.query("query");
}

MESBasic_wareMan_ware_wareRef_getList = function() {
	return "MESBasic.wareMan.ware.wareRef";
}

	MESBasic.wareMan.ware.wareRef.commonQuery = function(type) {
	  if(typeof MESBasic.wareMan.ware.wareRef.cancelSelectedNode == 'function') {
	   MESBasic.wareMan.ware.wareRef.cancelSelectedNode();
	  }
	  MESBasic.wareMan.ware.wareRef.query(type);
	 };
	
	

MESBasic.wareMan.ware.wareRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.wareMan.ware.wareRef.otherParams = {};
	MESBasic.wareMan.ware.wareRef.otherParams.dialogType = dialogType;
	MESBasic.wareMan.ware.wareRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.wareMan.ware.wareRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_wareMan_wareRef,js,MESBasic_1_wareMan_Ware,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
