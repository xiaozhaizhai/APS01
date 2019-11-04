
<script type="text/javascript">
	CUI.ns("MESBasic.routine.config","MESBasic.routine.config.routineConfigRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_routine_config_routineConfigRef_callBackFuncName" id="MESBasic_routine_config_routineConfigRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_routine_config_routineConfigRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415336450425')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_routine_config_routineConfigRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_routine_config_routineConfigRef_queryForm" exportUrl="/MESBasic/routine/config/routineConfigRef-query.action">
		<input type="hidden" reset="false" name="MESBasic_routine_config_routineConfigRef_condition" id="MESBasic_routine_config_routineConfigRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415337833221')}_${getText('MESBasic.viewtitle.randon1429698827415')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_routine_config_routineConfigRef_queryForm" formId="ec_MESBasic_routine_config_routineConfigRef_queryForm" idprefix="ec_MESBasic_routine_config_routineConfigRef" expandType="all" expand=true fieldcodes="MESBasic_1_routine_Routine_code_routine_code:MESBasic.propertydisplayName.radion1415336575756||MESBasic_1_routine_Routine_name_routine_name:MESBasic.propertydisplayName.radion1415336597801||MESBasic_1_routine_Config_name_name:MESBasic.propertydisplayName.radion1416558524615||MESBasic_1_routine_Config_pumpBelong_pumpBelong:MESBasic.propertydisplayName.radion1415338200540" >
							<#assign routine_code_defaultValue  = ''>
									<#assign routine_code_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Routine_code_routine_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Routine_code_routine_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415336575756')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="routine.id" name="routine.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.radion1415338782604')}"  conditionfunc="MESBasic.routine.config.routineConfigRef._querycustomFunc('routine_code')" name="routine.code" id="ec_MESBasic_routine_config_routineConfigRef_queryForm_routine_code" displayFieldName="code" type="other" exp="like" classStyle="form-control" url="/MESBasic/routine/routine/routineRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_config_routineConfigRef_queryForm" searchClick="MESBasic.routine.config.routineConfigRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign routine_name_defaultValue  = ''>
									<#assign routine_name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Routine_name_routine_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Routine_name_routine_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415336597801')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.radion1415338782604')}"  conditionfunc="MESBasic.routine.config.routineConfigRef._querycustomFunc('routine_name')" name="routine.name" id="ec_MESBasic_routine_config_routineConfigRef_queryForm_routine_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/MESBasic/routine/routine/routineRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_config_routineConfigRef_queryForm" searchClick="MESBasic.routine.config.routineConfigRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Config_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Config_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1416558524615')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="name" id="name" value="${name_defaultValue!}" deValue="${name_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign pumpBelong_defaultValue  = ''>
									<#assign pumpBelong_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Config_pumpBelong_pumpBelong" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Config_pumpBelong_pumpBelong">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415338200540')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${pumpBelong_defaultValue}"   name="pumpBelong" code="ROUTINE_PUMP_BELONG" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_routine_config_routineConfigRef_queryForm" type="search" onclick="MESBasic.routine.config.routineConfigRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_routine_config_routineConfigRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_routine_config_routineConfigRef_queryForm' );
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

ec_MESBasic_routine_config_routineConfigRef_quickquery_info={};
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.code"]={};
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.code"].dbColumnType="TEXT";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.code"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-code";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.code"].columnName="CODE";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.id"]={};
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.id"].dbColumnType="LONG";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.id"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-code";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.id"].columnName="ID";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.name"]={};
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.name"].dbColumnType="TEXT";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.name"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-name";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.name"].columnName="NAME";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.id"]={};
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.id"].dbColumnType="LONG";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.id"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-name";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["routine.id"].columnName="ID";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["name"]={};
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["name"].layRec="name";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["name"].columnName="NAME";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["pumpBelong"]={};
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["pumpBelong"].dbColumnType="SYSTEMCODE";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["pumpBelong"].layRec="pumpBelong";
ec_MESBasic_routine_config_routineConfigRef_quickquery_info["pumpBelong"].columnName="PUMP_BELONG";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.routine.config.routineConfigRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/routine/config/routineConfigRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_routine_config_routineConfigRef_query" renderOverEvent="ec_MESBasic_routine_config_routineConfigRef_RenderOverEvent"  modelCode="MESBasic_1_routine_Config" noPermissionKeys="routine.code,routine.name,name,formula,pumpBelong,forSource,forDestination" hidekeyPrefix="ec_MESBasic_routine_config_routineConfigRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_routine_config_routineConfigRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','pumpBelong.id','routine.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign routine_code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${routine_code_displayDefaultType!}"  key="routine.code"   label="${getText('MESBasic.propertydisplayName.radion1415336575756')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign routine_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${routine_name_displayDefaultType!}"  key="routine.name"   label="${getText('MESBasic.propertydisplayName.radion1415336597801')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1416558524615')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign formula_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${formula_displayDefaultType!}"  key="formula"   label="${getText('MESBasic.propertydisplayName.randon1426644791679')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
			<#assign pumpBelong_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${pumpBelong_displayDefaultType!}"  key="pumpBelong.value"   label="${getText('MESBasic.propertydisplayName.radion1415338200540')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign forSource_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${forSource_displayDefaultType!}"  key="forSource"   label="${getText('MESBasic.propertydisplayName.radion1416558162801')}" textalign="left"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign forDestination_displayDefaultType  = ''>
			<@datacolumn   showFormat="CHECKBOX" defaultDisplay="${forDestination_displayDefaultType!}"  key="forDestination"   label="${getText('MESBasic.propertydisplayName.radion1416558185409')}" textalign="left"  width=100   type="boolean"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_routine_config_routineConfigRef_RenderOverEvent(){
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
	 * @method MESBasic.routine.config.routineConfigRef.query
	 */
	MESBasic.routine.config.routineConfigRef.query = function(type,pageNo){
		var node = MESBasic.routine.config.routineConfigRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.routine.config.routineConfigRef.node = null;
		if(!checkListValid("ec_MESBasic_routine_config_routineConfigRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/routine/config/routineConfigRef-query.action";
		CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_routine_config_routineConfigRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_routine_routineConfigRef";
		condobj.modelAlias="config";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_routine_config_routineConfigRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_routine_config_routineConfigRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_routine_config_routineConfigRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_routine_config_routineConfigRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm *[name="'+ec_MESBasic_routine_config_routineConfigRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_routine_config_routineConfigRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_routine_config_routineConfigRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_routine_config_routineConfigRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_routine_config_routineConfigRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_routine_config_routineConfigRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_routine_routineConfigRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_routine_config_routineConfigRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.routine.config.routineConfigRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.routine.config.routineConfigRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.routine.config.routineConfigRef._prefix += '.';
			}
			MESBasic.routine.config.routineConfigRef._prefix += arr[i];
		}
		MESBasic.routine.config.routineConfigRef._suffix = arr[arr.length -1];
		if(MESBasic.routine.config.routineConfigRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.routine.config.routineConfigRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.routine.config.routineConfigRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.routine.config.routineConfigRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.routine.config.routineConfigRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm *[name="'+MESBasic.routine.config.routineConfigRef._prefix + '.' + MESBasic.routine.config.routineConfigRef._suffix +'"]').val(obj[0][MESBasic.routine.config.routineConfigRef._suffix]);
		CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm *[name="'+MESBasic.routine.config.routineConfigRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm *[name^="'+MESBasic.routine.config.routineConfigRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm *[name="'+MESBasic.routine.config.routineConfigRef._prefix + '.' + MESBasic.routine.config.routineConfigRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_routine_config_routineConfigRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.routine.config.routineConfigRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.routine.config.routineConfigRef.query_"+obj+")!='undefined'") ? eval('MESBasic.routine.config.routineConfigRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_routine_config_routineConfigRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_routine_config_routineConfigRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.config.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_routine_config_routineConfigRef_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_routine_config_routineConfigRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_routine_config_routineConfigRef_refresh = function(node){
	//var url = "/MESBasic/routine/config/routineConfigRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_routine_config_routineConfigRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_routine_config_routineConfigRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.routine.config.routineConfigRef.node = node;
	MESBasic.routine.config.routineConfigRef.query("query");
}

MESBasic_routine_config_routineConfigRef_getList = function() {
	return "MESBasic.routine.config.routineConfigRef";
}

	MESBasic.routine.config.routineConfigRef.commonQuery = function(type) {
	  if(typeof MESBasic.routine.config.routineConfigRef.cancelSelectedNode == 'function') {
	   MESBasic.routine.config.routineConfigRef.cancelSelectedNode();
	  }
	  MESBasic.routine.config.routineConfigRef.query(type);
	 };
	
	

MESBasic.routine.config.routineConfigRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.routine.config.routineConfigRef.otherParams = {};
	MESBasic.routine.config.routineConfigRef.otherParams.dialogType = dialogType;
	MESBasic.routine.config.routineConfigRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.routine.config.routineConfigRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_routine_routineConfigRef,js,MESBasic_1_routine_Config,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
