
<script type="text/javascript">
	CUI.ns("RM.formula.formulaBeforeProcess","RM.formula.formulaBeforeProcess.beforeProcessRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="RM_formula_formulaBeforeProcess_beforeProcessRef_callBackFuncName" id="RM_formula_formulaBeforeProcess_beforeProcessRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	</#if>
	<@errorbar id="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm" exportUrl="/RM/formula/formulaBeforeProcess/beforeProcessRef-query.action">
		<input type="hidden" reset="false" name="RM_formula_formulaBeforeProcess_beforeProcessRef_condition" id="RM_formula_formulaBeforeProcess_beforeProcessRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487306893498')}_${getText('RM.viewtitle.randon1488596358736')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm" formId="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm" idprefix="ec_RM_formula_formulaBeforeProcess_beforeProcessRef" expandType="all" expand=true fieldcodes="RM_7_5_0_0_formula_FormulaProcess_name_beforeProcessID_name:RM.propertydisplayName.randon1487295011793||RM_7_5_0_0_processType_ProcessType_name_beforeProcessID_processType_name:RM.propertydisplayName.randon1487074387497||RM_7_5_0_0_formula_FormulaProcess_longTime_beforeProcessID_longTime:RM.propertydisplayName.randon1487292241411" >
							<#assign beforeProcessID_name_defaultValue  = ''>
									<#assign beforeProcessID_name_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_FormulaProcess_name_beforeProcessID_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_FormulaProcess_name_beforeProcessID_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487295011793')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="beforeProcessID.id" name="beforeProcessID.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('')}"  conditionfunc="RM.formula.formulaBeforeProcess.beforeProcessRef._querycustomFunc('beforeProcessID_name')" name="beforeProcessID.name" id="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm_beforeProcessID_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="" clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm" searchClick="RM.formula.formulaBeforeProcess.beforeProcessRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign beforeProcessID_processType_name_defaultValue  = ''>
									<#assign beforeProcessID_processType_name_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_processType_ProcessType_name_beforeProcessID_processType_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_processType_ProcessType_name_beforeProcessID_processType_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487074387497')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="beforeProcessID.processType.id" name="beforeProcessID.processType.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('RM.viewtitle.randon1487220867598')}"  conditionfunc="RM.formula.formulaBeforeProcess.beforeProcessRef._querycustomFunc('beforeProcessID_processType_name')" name="beforeProcessID.processType.name" id="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm_beforeProcessID_processType_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/RM/processType/processType/processTypeRef.action" clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm" searchClick="RM.formula.formulaBeforeProcess.beforeProcessRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign beforeProcessID_longTime_defaultValue  = ''>
									<#assign beforeProcessID_longTime_defaultValue  = ''>
							<div mobi-dropdown-group="beforeProcessID.longTime" field-unique-code="RM_7_5_0_0_formula_FormulaProcess_longTime_beforeProcessID_longTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_FormulaProcess_longTime_beforeProcessID_longTime">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487292241411')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<div class="input-group">
												<span class="input-group-addon">${getText('ec.list.validate.start')}</span>	
												<input type="text" class="form-control" name="beforeProcessID.longTime_start" id="beforeProcessID.longTime_start" value="${beforeProcessID_longTime_defaultValue!}" deValue="${beforeProcessID_longTime_defaultValue!}"   exp="equal"/>
											</div>
									</div>			
								</div>
							</div>
							<div mobi-dropdown-group="beforeProcessID.longTime" field-unique-code="RM_7_5_0_0_formula_FormulaProcess_longTime_beforeProcessID_longTime" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_FormulaProcess_longTime_beforeProcessID_longTime">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.randon1487292241411')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
												<div class="input-group">
													<span class="input-group-addon">${getText('ec.list.validate.end')}</span>
													<input type="text" class="form-control" name="beforeProcessID.longTime_end" id="beforeProcessID.longTime_end" value="${beforeProcessID_longTime_defaultValue!}" deValue="${beforeProcessID_longTime_defaultValue!}"   exp="equal"/>
												</div>	
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm" type="search" onclick="RM.formula.formulaBeforeProcess.beforeProcessRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm' );
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

ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info={};
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.name"]={};
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.name"].dbColumnType="TEXT";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.name"].layRec="RM_FORMULA_PROCESSES,ID,RM_FORMULA_BEFORE_PROCESSES,BEFORE_PROCESSID-name";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.name"].columnName="NAME";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.id"]={};
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.id"].dbColumnType="LONG";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.id"].layRec="RM_FORMULA_PROCESSES,ID,RM_FORMULA_BEFORE_PROCESSES,BEFORE_PROCESSID-name";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.id"].columnName="ID";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.processType.name"]={};
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.processType.name"].dbColumnType="TEXT";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.processType.name"].layRec="RM_FORMULA_PROCESSES,ID,RM_FORMULA_BEFORE_PROCESSES,BEFORE_PROCESSID-RM_PROCESS_TYPES,ID,RM_FORMULA_PROCESSES,PROCESS_TYPE-name";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.processType.name"].columnName="NAME";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.processType.id"]={};
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.processType.id"].dbColumnType="LONG";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.processType.id"].layRec="RM_FORMULA_PROCESSES,ID,RM_FORMULA_BEFORE_PROCESSES,BEFORE_PROCESSID-RM_PROCESS_TYPES,ID,RM_FORMULA_PROCESSES,PROCESS_TYPE-name";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.processType.id"].columnName="ID";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.longTime"]={};
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.longTime"].dbColumnType="DECIMAL";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.longTime"].layRec="RM_FORMULA_PROCESSES,ID,RM_FORMULA_BEFORE_PROCESSES,BEFORE_PROCESSID-longTime";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.longTime"].columnName="LONG_TIME";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.id"]={};
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.id"].dbColumnType="LONG";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.id"].layRec="RM_FORMULA_PROCESSES,ID,RM_FORMULA_BEFORE_PROCESSES,BEFORE_PROCESSID-longTime";
ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["beforeProcessID.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaBeforeProcess.beforeProcessRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaBeforeProcess/beforeProcessRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaBeforeProcess.beforeProcessRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaBeforeProcess/beforeProcessRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_query" renderOverEvent="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_RenderOverEvent"  modelCode="RM_7.5.0.0_formula_FormulaBeforeProcess" noPermissionKeys="beforeProcessID.name,beforeProcessID.processType.name,beforeProcessID.longTime" hidekeyPrefix="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','beforeProcessID.id','beforeProcessID.processType.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
			<#assign beforeProcessID_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${beforeProcessID_name_displayDefaultType!}"  key="beforeProcessID.name"   label="${getText('RM.propertydisplayName.randon1487295011793')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign beforeProcessID_processType_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${beforeProcessID_processType_name_displayDefaultType!}"  key="beforeProcessID.processType.name"   label="${getText('RM.propertydisplayName.randon1487074387497')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign beforeProcessID_longTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${beforeProcessID_longTime_displayDefaultType!}"  key="beforeProcessID.longTime"   label="${getText('RM.propertydisplayName.randon1487292241411')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formulaBeforeProcess_beforeProcessRef_RenderOverEvent(){
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
	 * @method RM.formula.formulaBeforeProcess.beforeProcessRef.query
	 */
	RM.formula.formulaBeforeProcess.beforeProcessRef.query = function(type,pageNo){
		var node = RM.formula.formulaBeforeProcess.beforeProcessRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		RM.formula.formulaBeforeProcess.beforeProcessRef.node = null;
		if(!checkListValid("ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/RM/formula/formulaBeforeProcess/beforeProcessRef-query.action";
		CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_beforeProcessRef";
		condobj.modelAlias="formulaBeforeProcess";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm *[name="'+ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formulaBeforeProcess_beforeProcessRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formulaBeforeProcess_beforeProcessRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formula_formulaBeforeProcess_beforeProcessRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_beforeProcessRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_RM_formula_formulaBeforeProcess_beforeProcessRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	RM.formula.formulaBeforeProcess.beforeProcessRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formulaBeforeProcess.beforeProcessRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formulaBeforeProcess.beforeProcessRef._prefix += '.';
			}
			RM.formula.formulaBeforeProcess.beforeProcessRef._prefix += arr[i];
		}
		RM.formula.formulaBeforeProcess.beforeProcessRef._suffix = arr[arr.length -1];
		if(RM.formula.formulaBeforeProcess.beforeProcessRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaBeforeProcess.beforeProcessRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formulaBeforeProcess.beforeProcessRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formulaBeforeProcess.beforeProcessRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaBeforeProcess.beforeProcessRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm *[name="'+RM.formula.formulaBeforeProcess.beforeProcessRef._prefix + '.' + RM.formula.formulaBeforeProcess.beforeProcessRef._suffix +'"]').val(obj[0][RM.formula.formulaBeforeProcess.beforeProcessRef._suffix]);
		CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm *[name="'+RM.formula.formulaBeforeProcess.beforeProcessRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm *[name^="'+RM.formula.formulaBeforeProcess.beforeProcessRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm *[name="'+RM.formula.formulaBeforeProcess.beforeProcessRef._prefix + '.' + RM.formula.formulaBeforeProcess.beforeProcessRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formulaBeforeProcess_beforeProcessRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	RM.formula.formulaBeforeProcess.beforeProcessRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaBeforeProcess.beforeProcessRef.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaBeforeProcess.beforeProcessRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formula_formulaBeforeProcess_beforeProcessRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_RM_formula_formulaBeforeProcess_beforeProcessRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('RM.formulaBeforeProcess.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formula_formulaBeforeProcess_beforeProcessRef_callBackFuncName").val() != ""){
				eval(CUI("#RM_formula_formulaBeforeProcess_beforeProcessRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
RM_formula_formulaBeforeProcess_beforeProcessRef_refresh = function(node){
	//var url = "/RM/formula/formulaBeforeProcess/beforeProcessRef-query.action";
	//if(node.layRec){
	//	datatable_ec_RM_formula_formulaBeforeProcess_beforeProcessRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_RM_formula_formulaBeforeProcess_beforeProcessRef_query.setRequestDataUrl(url,'',false);
	//}
	RM.formula.formulaBeforeProcess.beforeProcessRef.node = node;
	RM.formula.formulaBeforeProcess.beforeProcessRef.query("query");
}

RM_formula_formulaBeforeProcess_beforeProcessRef_getList = function() {
	return "RM.formula.formulaBeforeProcess.beforeProcessRef";
}

	RM.formula.formulaBeforeProcess.beforeProcessRef.commonQuery = function(type) {
	  if(typeof RM.formula.formulaBeforeProcess.beforeProcessRef.cancelSelectedNode == 'function') {
	   RM.formula.formulaBeforeProcess.beforeProcessRef.cancelSelectedNode();
	  }
	  RM.formula.formulaBeforeProcess.beforeProcessRef.query(type);
	 };
	
	

RM.formula.formulaBeforeProcess.beforeProcessRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	RM.formula.formulaBeforeProcess.beforeProcessRef.otherParams = {};
	RM.formula.formulaBeforeProcess.beforeProcessRef.otherParams.dialogType = dialogType;
	RM.formula.formulaBeforeProcess.beforeProcessRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formulaBeforeProcess.beforeProcessRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){if($('#' + formId + ' input[name^="beforeProcessID.longTime_start"]').val()!= null && $('#' + formId + ' input[name^="beforeProcessID.longTime_start"]').val()!= ''){if(!isDecimal($('#' + formId + ' input[name^="beforeProcessID.longTime_start"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487292241411')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name^="beforeProcessID.longTime_end"]').val()!= null && $('#' + formId + ' input[name^="beforeProcessID.longTime_end"]').val()!= ''){if(!isDecimal($('#' + formId + ' input[name^="beforeProcessID.longTime_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487292241411')}${getText('ec.list.validate.decimal')}");return false;}}if($('#' + formId + ' input[name="beforeProcessID.longTime_start"]').val()!='' && $('#' + formId + ' input[name="beforeProcessID.longTime_end"]').val()!=''){if(parseInt($('#' + formId + ' input[name="beforeProcessID.longTime_start"]').val()) > parseInt($('#' + formId + ' input[name="beforeProcessID.longTime_end"]').val())){workbenchErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487292241411')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('RM.propertydisplayName.randon1487292241411')}${getText('ec.list.validate.start')}");return false;}}return true;};





	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_beforeProcessRef,js,RM_7.5.0.0_formula_FormulaBeforeProcess,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
