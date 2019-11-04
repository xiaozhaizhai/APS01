
<script type="text/javascript">
	CUI.ns("MESBasic.storeSet.storeSet","MESBasic.storeSet.storeSet.operateRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_storeSet_storeSet_operateRef_callBackFuncName" id="MESBasic_storeSet_storeSet_operateRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_storeSet_storeSet_operateRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.randon1486607161637')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_storeSet_storeSet_operateRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" exportUrl="/MESBasic/storeSet/storeSet/operateRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" reset="false" name="MESBasic_storeSet_storeSet_operateRef_condition" id="MESBasic_storeSet_storeSet_operateRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.randon1486607220162')}_${getText('MESBasic.viewtitle.randon1487132025914')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_storeSet_storeSet_operateRef_queryForm" formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" idprefix="ec_MESBasic_storeSet_storeSet_operateRef" expandType="all" expand=true fieldcodes="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode:MESBasic.propertydisplayName.randon1484031239866||MESBasic_1_wareMan_Ware_wareName_wareId_wareName:MESBasic.propertydisplayName.randon1484031316281||MESBasic_1_storeSet_StoreSet_placeSetCode_placeSetCode:MESBasic.propertydisplayName.randon1486607342343||MESBasic_1_storeSet_StoreSet_placeSetName_placeSetName:MESBasic.propertydisplayName.randon1486607374172" >
							<#assign wareId_wareCode_defaultValue  = ''>
									<#assign wareId_wareCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_wareMan_Ware_wareCode_wareId_wareCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1484031239866')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="wareId.id" name="wareId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.storeSet.storeSet.operateRef._querycustomFunc('wareId_wareCode')" name="wareId.wareCode" id="ec_MESBasic_storeSet_storeSet_operateRef_queryForm_wareId_wareCode" displayFieldName="wareCode" type="other" exp="like" classStyle="form-control" url="/MESBasic/wareMan/ware/wareRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" searchClick="MESBasic.storeSet.storeSet.operateRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign wareId_wareName_defaultValue  = ''>
									<#assign wareId_wareName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_wareMan_Ware_wareName_wareId_wareName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_wareMan_Ware_wareName_wareId_wareName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1484031316281')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  conditionfunc="MESBasic.storeSet.storeSet.operateRef._querycustomFunc('wareId_wareName')" name="wareId.wareName" id="ec_MESBasic_storeSet_storeSet_operateRef_queryForm_wareId_wareName" displayFieldName="wareName" type="other" exp="like" classStyle="form-control" url="/MESBasic/wareMan/ware/wareRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" searchClick="MESBasic.storeSet.storeSet.operateRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign placeSetCode_defaultValue  = ''>
									<#assign placeSetCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_storeSet_StoreSet_placeSetCode_placeSetCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_storeSet_StoreSet_placeSetCode_placeSetCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1486607342343')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="placeSetCode" id="placeSetCode" value="${placeSetCode_defaultValue!}" deValue="${placeSetCode_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign placeSetName_defaultValue  = ''>
									<#assign placeSetName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_storeSet_StoreSet_placeSetName_placeSetName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_storeSet_StoreSet_placeSetName_placeSetName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1486607374172')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="placeSetName" id="placeSetName" value="${placeSetName_defaultValue!}" deValue="${placeSetName_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" type="search" onclick="MESBasic.storeSet.storeSet.operateRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_storeSet_storeSet_operateRef_queryForm' );
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

ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareCode"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareCode"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareCode"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareCode";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareCode"].columnName="WARE_CODE";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"].dbColumnType="LONG";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareCode";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"].columnName="ID";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareName"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareName"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareName"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareName";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.wareName"].columnName="WARE_NAME";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"].dbColumnType="LONG";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"].layRec="MATERIAL_WARES,ID,MATERIAL_STORE_SETS,WARE_ID-wareName";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["wareId.id"].columnName="ID";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetCode"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetCode"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetCode"].layRec="placeSetCode";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetCode"].columnName="PLACE_SET_CODE";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetName"]={};
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetName"].dbColumnType="TEXT";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetName"].layRec="placeSetName";
ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["placeSetName"].columnName="PLACE_SET_NAME";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.storeSet.storeSet.operateRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/storeSet/storeSet/operateRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_storeSet_storeSet_operateRef_query" renderOverEvent="ec_MESBasic_storeSet_storeSet_operateRef_RenderOverEvent"  modelCode="MESBasic_1_storeSet_StoreSet" noPermissionKeys="wareId.wareCode,wareId.wareName,placeSetCode,placeSetName,owner.name,inPriority,outPriority" hidekeyPrefix="ec_MESBasic_storeSet_storeSet_operateRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_storeSet_storeSet_operateRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','wareId.id','owner.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign wareId_wareCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareId_wareCode_displayDefaultType!}"  key="wareId.wareCode"   label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign wareId_wareName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${wareId_wareName_displayDefaultType!}"  key="wareId.wareName"   label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign placeSetCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${placeSetCode_displayDefaultType!}"  key="placeSetCode"   label="${getText('MESBasic.propertydisplayName.randon1486607342343')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign placeSetName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${placeSetName_displayDefaultType!}"  key="placeSetName"   label="${getText('MESBasic.propertydisplayName.randon1486607374172')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign owner_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${owner_name_displayDefaultType!}"  key="owner.name"   label="${getText('foundation.staff.dimissionStaff_xls.staffName')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign inPriority_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${inPriority_displayDefaultType!}"  key="inPriority"   label="${getText('MESBasic.propertydisplayName.randon1486607396188')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign outPriority_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${outPriority_displayDefaultType!}"  key="outPriority"   label="${getText('MESBasic.propertydisplayName.randon1486616796931')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_storeSet_storeSet_operateRef_RenderOverEvent(){
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
	 * @method MESBasic.storeSet.storeSet.operateRef.query
	 */
	MESBasic.storeSet.storeSet.operateRef.query = function(type,pageNo){
		var node = MESBasic.storeSet.storeSet.operateRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.storeSet.storeSet.operateRef.node = null;
		if(!checkListValid("ec_MESBasic_storeSet_storeSet_operateRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/storeSet/storeSet/operateRef-query.action";
		CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_storeSet_operateRef";
		condobj.modelAlias="storeSet";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm *[name="'+ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_storeSet_storeSet_operateRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_storeSet_storeSet_operateRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_storeSet_storeSet_operateRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_storeSet_operateRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_storeSet_storeSet_operateRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.storeSet.storeSet.operateRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.storeSet.storeSet.operateRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.storeSet.storeSet.operateRef._prefix += '.';
			}
			MESBasic.storeSet.storeSet.operateRef._prefix += arr[i];
		}
		MESBasic.storeSet.storeSet.operateRef._suffix = arr[arr.length -1];
		if(MESBasic.storeSet.storeSet.operateRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.storeSet.storeSet.operateRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.storeSet.storeSet.operateRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.storeSet.storeSet.operateRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.storeSet.storeSet.operateRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm *[name="'+MESBasic.storeSet.storeSet.operateRef._prefix + '.' + MESBasic.storeSet.storeSet.operateRef._suffix +'"]').val(obj[0][MESBasic.storeSet.storeSet.operateRef._suffix]);
		CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm *[name="'+MESBasic.storeSet.storeSet.operateRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm *[name^="'+MESBasic.storeSet.storeSet.operateRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm *[name="'+MESBasic.storeSet.storeSet.operateRef._prefix + '.' + MESBasic.storeSet.storeSet.operateRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_storeSet_storeSet_operateRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.storeSet.storeSet.operateRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.storeSet.storeSet.operateRef.query_"+obj+")!='undefined'") ? eval('MESBasic.storeSet.storeSet.operateRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_storeSet_storeSet_operateRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_storeSet_storeSet_operateRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.storeSet.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_storeSet_storeSet_operateRef_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_storeSet_storeSet_operateRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_storeSet_storeSet_operateRef_refresh = function(node){
	//var url = "/MESBasic/storeSet/storeSet/operateRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_storeSet_storeSet_operateRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_storeSet_storeSet_operateRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.storeSet.storeSet.operateRef.node = node;
	MESBasic.storeSet.storeSet.operateRef.query("query");
}

MESBasic_storeSet_storeSet_operateRef_getList = function() {
	return "MESBasic.storeSet.storeSet.operateRef";
}

	MESBasic.storeSet.storeSet.operateRef.commonQuery = function(type) {
	  if(typeof MESBasic.storeSet.storeSet.operateRef.cancelSelectedNode == 'function') {
	   MESBasic.storeSet.storeSet.operateRef.cancelSelectedNode();
	  }
	  MESBasic.storeSet.storeSet.operateRef.query(type);
	 };
	
	

MESBasic.storeSet.storeSet.operateRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.storeSet.storeSet.operateRef.otherParams = {};
	MESBasic.storeSet.storeSet.operateRef.otherParams.dialogType = dialogType;
	MESBasic.storeSet.storeSet.operateRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.storeSet.storeSet.operateRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_storeSet_operateRef,js,MESBasic_1_storeSet_StoreSet,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
	</script>
  </body>
</html>
