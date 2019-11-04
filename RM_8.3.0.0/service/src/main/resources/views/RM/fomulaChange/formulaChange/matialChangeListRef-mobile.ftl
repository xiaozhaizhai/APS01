
<script type="text/javascript">
	CUI.ns("RM.fomulaChange.formulaChange","RM.fomulaChange.formulaChange.matialChangeListRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="RM_fomulaChange_formulaChange_matialChangeListRef_callBackFuncName" id="RM_fomulaChange_formulaChange_matialChangeListRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1488267707733')}</span></div>
	</#if>
	<@errorbar id="ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm" exportUrl="/RM/fomulaChange/formulaChange/matialChangeListRef-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" />
		<input type="hidden" reset="false" name="RM_fomulaChange_formulaChange_matialChangeListRef_condition" id="RM_fomulaChange_formulaChange_matialChangeListRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1488267733872')}_${getText('RM.viewtitle.randon1504840699544')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm" formId="ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm" idprefix="ec_RM_fomulaChange_formulaChange_matialChangeListRef" expandType="all" expand=true fieldcodes="RM_7_5_0_0_fomulaChange_FormulaChange_tableNo_tableNo:ec.common.tableNo||RM_7_5_0_0_fomulaChange_FormulaChange_changeType_changeType:RM.propertydisplayName.randon1488268014469" >
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_fomulaChange_FormulaChange_tableNo_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_fomulaChange_FormulaChange_tableNo_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('ec.common.tableNo')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign changeType_defaultValue  = ''>
									<#assign changeType_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_fomulaChange_FormulaChange_changeType_changeType" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_fomulaChange_FormulaChange_changeType_changeType">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1488268014469')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${changeType_defaultValue}"   name="changeType" code="changeType" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm" type="search" onclick="RM.fomulaChange.formulaChange.matialChangeListRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm' );
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

ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info={};
ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info["tableNo"]={};
ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info["tableNo"].layRec="tableNo";
ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info["changeType"]={};
ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info["changeType"].dbColumnType="SYSTEMCODE";
ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info["changeType"].layRec="changeType";
ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info["changeType"].columnName="CHANGE_TYPE";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.fomulaChange.formulaChange.matialChangeListRef.query('query')">
<#assign datatable_dataUrl = "/RM/fomulaChange/formulaChange/matialChangeListRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.fomulaChange.formulaChange.matialChangeListRef.query('query')">
<#assign datatable_dataUrl = "/RM/fomulaChange/formulaChange/matialChangeListRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_RM_fomulaChange_formulaChange_matialChangeListRef_query" renderOverEvent="ec_RM_fomulaChange_formulaChange_matialChangeListRef_RenderOverEvent"  modelCode="RM_7.5.0.0_fomulaChange_FormulaChange" noPermissionKeys="tableNo,modifyStaff.name,createTime,formulaId.code,formulaId.name,formulaId.edition,oldUsedFor,oldIsForProduct,oldState,changeType,usedFor,isForProduct,state" hidekeyPrefix="ec_RM_fomulaChange_formulaChange_matialChangeListRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','oldUsedFor.id','oldState.id','changeType.id','usedFor.id','state.id','modifyStaff.id','formulaId.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="left"  width=200   type="textfield"    showFormatFunc=""/>
			<#assign modifyStaff_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${modifyStaff_name_displayDefaultType!}"  key="modifyStaff.name"   label="${getText('RM.staff.dimissionStaff_xls.staffName')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign createTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HMS" defaultDisplay="${createTime_displayDefaultType!}"  key="createTime"   label="${getText('RM.common.createTime3233223')}" textalign="center"  width=150   type="datetime"    showFormatFunc=""/>
			<#assign formulaId_code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${formulaId_code_displayDefaultType!}"  key="formulaId.code"   label="${getText('RM.formula.randon14882463120921123')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign formulaId_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${formulaId_name_displayDefaultType!}"  key="formulaId.name"   label="${getText('RM.formula.randon1487075823790112331')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign formulaId_edition_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${formulaId_edition_displayDefaultType!}"  key="formulaId.edition"   label="${getText('RM.formula.randon1222222221awef')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign oldUsedFor_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${oldUsedFor_displayDefaultType!}"  key="oldUsedFor.value"   label="${getText('RM.formula.randon1487076506987555434562345aaa')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign oldIsForProduct_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${oldIsForProduct_displayDefaultType!}"  key="oldIsForProduct"   label="${getText('RM.propertydisplayName.randon1489108150216777')}" textalign="center"  width=70   type="boolean"    showFormatFunc=""/>
			<#assign oldState_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${oldState_displayDefaultType!}"  key="oldState.value"   label="${getText('RM.propertydisplayName.randon14870764732577889ssaa13')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign changeType_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${changeType_displayDefaultType!}"  key="changeType.value"   label="${getText('RM.propertydisplayName.randon1488268014469')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign usedFor_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${usedFor_displayDefaultType!}"  key="usedFor.value"   label="${getText('RM.propertydisplayName.randon1488268147405134')}" textalign="center"  width=80   type="systemcode"    showFormatFunc=""/>
			<#assign isForProduct_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECT" defaultDisplay="${isForProduct_displayDefaultType!}"  key="isForProduct"   label="${getText('RM.propertydisplayName.randon14882681701216767')}" textalign="center"  width=70   type="boolean"    showFormatFunc=""/>
			<#assign state_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${state_displayDefaultType!}"  key="state.value"   label="${getText('RM.propertydisplayName.randon1488268127768')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_fomulaChange_formulaChange_matialChangeListRef_RenderOverEvent(){
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
	 * @method RM.fomulaChange.formulaChange.matialChangeListRef.query
	 */
	RM.fomulaChange.formulaChange.matialChangeListRef.query = function(type,pageNo){
		var node = RM.fomulaChange.formulaChange.matialChangeListRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		RM.fomulaChange.formulaChange.matialChangeListRef.node = null;
		if(!checkListValid("ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/RM/fomulaChange/formulaChange/matialChangeListRef-query.action";
		CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_fomulaChange_matialChangeListRef";
		condobj.modelAlias="formulaChange";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm *[name="'+ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_fomulaChange_formulaChange_matialChangeListRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_fomulaChange_formulaChange_matialChangeListRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_fomulaChange_formulaChange_matialChangeListRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_fomulaChange_matialChangeListRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_RM_fomulaChange_formulaChange_matialChangeListRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	RM.fomulaChange.formulaChange.matialChangeListRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.fomulaChange.formulaChange.matialChangeListRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.fomulaChange.formulaChange.matialChangeListRef._prefix += '.';
			}
			RM.fomulaChange.formulaChange.matialChangeListRef._prefix += arr[i];
		}
		RM.fomulaChange.formulaChange.matialChangeListRef._suffix = arr[arr.length -1];
		if(RM.fomulaChange.formulaChange.matialChangeListRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.fomulaChange.formulaChange.matialChangeListRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.fomulaChange.formulaChange.matialChangeListRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.fomulaChange.formulaChange.matialChangeListRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.fomulaChange.formulaChange.matialChangeListRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm *[name="'+RM.fomulaChange.formulaChange.matialChangeListRef._prefix + '.' + RM.fomulaChange.formulaChange.matialChangeListRef._suffix +'"]').val(obj[0][RM.fomulaChange.formulaChange.matialChangeListRef._suffix]);
		CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm *[name="'+RM.fomulaChange.formulaChange.matialChangeListRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm *[name^="'+RM.fomulaChange.formulaChange.matialChangeListRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm *[name="'+RM.fomulaChange.formulaChange.matialChangeListRef._prefix + '.' + RM.fomulaChange.formulaChange.matialChangeListRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_fomulaChange_formulaChange_matialChangeListRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	RM.fomulaChange.formulaChange.matialChangeListRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.fomulaChange.formulaChange.matialChangeListRef.query_"+obj+")!='undefined'") ? eval('RM.fomulaChange.formulaChange.matialChangeListRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_fomulaChange_formulaChange_matialChangeListRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_RM_fomulaChange_formulaChange_matialChangeListRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('RM.formulaChange.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_fomulaChange_formulaChange_matialChangeListRef_callBackFuncName").val() != ""){
				eval(CUI("#RM_fomulaChange_formulaChange_matialChangeListRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
RM_fomulaChange_formulaChange_matialChangeListRef_refresh = function(node){
	//var url = "/RM/fomulaChange/formulaChange/matialChangeListRef-query.action";
	//if(node.layRec){
	//	datatable_ec_RM_fomulaChange_formulaChange_matialChangeListRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_RM_fomulaChange_formulaChange_matialChangeListRef_query.setRequestDataUrl(url,'',false);
	//}
	RM.fomulaChange.formulaChange.matialChangeListRef.node = node;
	RM.fomulaChange.formulaChange.matialChangeListRef.query("query");
}

RM_fomulaChange_formulaChange_matialChangeListRef_getList = function() {
	return "RM.fomulaChange.formulaChange.matialChangeListRef";
}

	RM.fomulaChange.formulaChange.matialChangeListRef.commonQuery = function(type) {
	  if(typeof RM.fomulaChange.formulaChange.matialChangeListRef.cancelSelectedNode == 'function') {
	   RM.fomulaChange.formulaChange.matialChangeListRef.cancelSelectedNode();
	  }
	  RM.fomulaChange.formulaChange.matialChangeListRef.query(type);
	 };
	
	

RM.fomulaChange.formulaChange.matialChangeListRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	RM.fomulaChange.formulaChange.matialChangeListRef.otherParams = {};
	RM.fomulaChange.formulaChange.matialChangeListRef.otherParams.dialogType = dialogType;
	RM.fomulaChange.formulaChange.matialChangeListRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.fomulaChange.formulaChange.matialChangeListRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




(function($){
	$(function(){
		$("#bottom-submit").hide();
$("#bottom-reset").hide();
	});
})(jQuery);

	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_fomulaChange_matialChangeListRef,js,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
