
<script type="text/javascript">
	CUI.ns("MESBasic.routine.config","MESBasic.routine.config.configRefForBatch");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_routine_config_configRefForBatch_callBackFuncName" id="MESBasic_routine_config_configRefForBatch_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_routine_config_configRefForBatch_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415336450425')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_routine_config_configRefForBatch_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_routine_config_configRefForBatch_queryForm" exportUrl="/MESBasic/routine/config/configRefForBatch-query.action">
		<input type="hidden" reset="false" name="MESBasic_routine_config_configRefForBatch_condition" id="MESBasic_routine_config_configRefForBatch_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415337833221')}_${getText('MESBasic.viewtitle.randon1429854464284')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_routine_config_configRefForBatch_queryForm" formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" idprefix="ec_MESBasic_routine_config_configRefForBatch" expandType="all" expand=true fieldcodes="MESBasic_1_routine_Routine_name_routine_name:MESBasic.propertydisplayName.radion1415336597801||MESBasic_1_routine_Routine_code_routine_code:MESBasic.propertydisplayName.radion1415336575756||MESBasic_1_routine_Config_name_name:MESBasic.propertydisplayName.radion1416558524615" >
							<#assign routine_name_defaultValue  = ''>
									<#assign routine_name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Routine_name_routine_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Routine_name_routine_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415336597801')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="routine.id" name="routine.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.radion1415338782604')}"  conditionfunc="MESBasic.routine.config.configRefForBatch._querycustomFunc('routine_name')" name="routine.name" id="ec_MESBasic_routine_config_configRefForBatch_queryForm_routine_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/MESBasic/routine/routine/routineRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" searchClick="MESBasic.routine.config.configRefForBatch.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign routine_code_defaultValue  = ''>
									<#assign routine_code_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_routine_Routine_code_routine_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_routine_Routine_code_routine_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415336575756')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.radion1415338782604')}"  conditionfunc="MESBasic.routine.config.configRefForBatch._querycustomFunc('routine_code')" name="routine.code" id="ec_MESBasic_routine_config_configRefForBatch_queryForm_routine_code" displayFieldName="code" type="other" exp="like" classStyle="form-control" url="/MESBasic/routine/routine/routineRef.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" searchClick="MESBasic.routine.config.configRefForBatch.commonQuery('query')" />
											
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
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" type="search" onclick="MESBasic.routine.config.configRefForBatch.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_routine_config_configRefForBatch_queryForm' );
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

ec_MESBasic_routine_config_configRefForBatch_quickquery_info={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.name"]={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.name"].dbColumnType="TEXT";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.name"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-name";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.name"].columnName="NAME";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"]={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"].dbColumnType="LONG";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-name";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"].columnName="ID";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.code"]={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.code"].dbColumnType="TEXT";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.code"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-code";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.code"].columnName="CODE";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"]={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"].dbColumnType="LONG";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"].layRec="MESBASIC_ROUTINES,ID,MESBASIC_CONFIGS,ROUTINE-code";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["routine.id"].columnName="ID";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["name"]={};
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["name"].layRec="name";
ec_MESBasic_routine_config_configRefForBatch_quickquery_info["name"].columnName="NAME";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.routine.config.configRefForBatch.query('query')">
<#assign datatable_dataUrl = "/MESBasic/routine/config/configRefForBatch-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_routine_config_configRefForBatch_query" renderOverEvent="ec_MESBasic_routine_config_configRefForBatch_RenderOverEvent"  modelCode="MESBasic_1_routine_Config" noPermissionKeys="routine.code,routine.name,name,formula" hidekeyPrefix="ec_MESBasic_routine_config_configRefForBatch_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_routine_config_configRefForBatch_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','routine.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
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
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_routine_config_configRefForBatch_RenderOverEvent(){
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
	 * @method MESBasic.routine.config.configRefForBatch.query
	 */
	MESBasic.routine.config.configRefForBatch.query = function(type,pageNo){
		var node = MESBasic.routine.config.configRefForBatch.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.routine.config.configRefForBatch.node = null;
		if(!checkListValid("ec_MESBasic_routine_config_configRefForBatch_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/routine/config/configRefForBatch-query.action";
		CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_routine_config_configRefForBatch_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_routine_configRefForBatch";
		condobj.modelAlias="config";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_routine_config_configRefForBatch_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_routine_config_configRefForBatch_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_routine_config_configRefForBatch_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_routine_config_configRefForBatch_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm *[name="'+ec_MESBasic_routine_config_configRefForBatch_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_routine_config_configRefForBatch_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_routine_config_configRefForBatch_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_routine_config_configRefForBatch_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_routine_config_configRefForBatch_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_routine_config_configRefForBatch_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_routine_configRefForBatch';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_routine_config_configRefForBatch_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.routine.config.configRefForBatch._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.routine.config.configRefForBatch._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.routine.config.configRefForBatch._prefix += '.';
			}
			MESBasic.routine.config.configRefForBatch._prefix += arr[i];
		}
		MESBasic.routine.config.configRefForBatch._suffix = arr[arr.length -1];
		if(MESBasic.routine.config.configRefForBatch._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.routine.config.configRefForBatch._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.routine.config.configRefForBatch._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.routine.config.configRefForBatch.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.routine.config.configRefForBatch.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm *[name="'+MESBasic.routine.config.configRefForBatch._prefix + '.' + MESBasic.routine.config.configRefForBatch._suffix +'"]').val(obj[0][MESBasic.routine.config.configRefForBatch._suffix]);
		CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm *[name="'+MESBasic.routine.config.configRefForBatch._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm *[name^="'+MESBasic.routine.config.configRefForBatch._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm *[name="'+MESBasic.routine.config.configRefForBatch._prefix + '.' + MESBasic.routine.config.configRefForBatch._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_routine_config_configRefForBatch_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.routine.config.configRefForBatch._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.routine.config.configRefForBatch.query_"+obj+")!='undefined'") ? eval('MESBasic.routine.config.configRefForBatch.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_routine_config_configRefForBatch_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_routine_config_configRefForBatch_query.getSelectedRow();
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
			if(CUI("#MESBasic_routine_config_configRefForBatch_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_routine_config_configRefForBatch_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_routine_config_configRefForBatch_refresh = function(node){
	//var url = "/MESBasic/routine/config/configRefForBatch-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_routine_config_configRefForBatch_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_routine_config_configRefForBatch_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.routine.config.configRefForBatch.node = node;
	MESBasic.routine.config.configRefForBatch.query("query");
}

MESBasic_routine_config_configRefForBatch_getList = function() {
	return "MESBasic.routine.config.configRefForBatch";
}

	MESBasic.routine.config.configRefForBatch.commonQuery = function(type) {
	  if(typeof MESBasic.routine.config.configRefForBatch.cancelSelectedNode == 'function') {
	   MESBasic.routine.config.configRefForBatch.cancelSelectedNode();
	  }
	  MESBasic.routine.config.configRefForBatch.query(type);
	 };
	
	

MESBasic.routine.config.configRefForBatch.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.routine.config.configRefForBatch.otherParams = {};
	MESBasic.routine.config.configRefForBatch.otherParams.dialogType = dialogType;
	MESBasic.routine.config.configRefForBatch.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.routine.config.configRefForBatch.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_routine_configRefForBatch,js,MESBasic_1_routine_Config,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
