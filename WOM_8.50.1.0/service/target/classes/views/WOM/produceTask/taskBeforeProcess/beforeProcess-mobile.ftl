
<script type="text/javascript">
	CUI.ns("WOM.produceTask.taskBeforeProcess","WOM.produceTask.taskBeforeProcess.beforeProcess");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName" id="WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1489657790851')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" exportUrl="/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action">
		<input type="hidden" reset="false" name="WOM_produceTask_taskBeforeProcess_beforeProcess_condition" id="WOM_produceTask_taskBeforeProcess_beforeProcess_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1489733511072')}_${getText('WOM.viewtitle.randon1489735212863')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" idprefix="ec_WOM_produceTask_taskBeforeProcess_beforeProcess" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_processId_name:WOM.propertydisplayName.randon1489720649125" >
							<#assign processId_name_defaultValue  = ''>
									<#assign processId_name_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_processId_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTaskProcess_name_processId_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.propertydisplayName.randon1489720649125')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="processId.id" name="processId.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('')}"  conditionfunc="WOM.produceTask.taskBeforeProcess.beforeProcess._querycustomFunc('processId_name')" name="processId.name" id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm_processId_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="" clicked=true multiple=false mnewidth=260 formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" searchClick="WOM.produceTask.taskBeforeProcess.beforeProcess.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">
				       	<@querybutton formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" type="search" onclick="WOM.produceTask.taskBeforeProcess.beforeProcess.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm' );
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

ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info={};
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.name"]={};
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.name"].dbColumnType="TEXT";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.name"].layRec="WOM_PRODUCE_TASK_PROCESSES,ID,WOM_TASK_BEFORE_PROCESSES,PROCESS_ID-name";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.name"].columnName="NAME";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.id"]={};
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.id"].dbColumnType="LONG";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.id"].layRec="WOM_PRODUCE_TASK_PROCESSES,ID,WOM_TASK_BEFORE_PROCESSES,PROCESS_ID-name";
ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["processId.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.taskBeforeProcess.beforeProcess.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.produceTask.taskBeforeProcess.beforeProcess.query('query')">
<#assign datatable_dataUrl = "/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query" renderOverEvent="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_RenderOverEvent"  modelCode="WOM_7.5.0.0_produceTask_TaskBeforeProcess" noPermissionKeys="processId.name,processId.longTime,processId.remark" hidekeyPrefix="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','processId.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign processId_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${processId_name_displayDefaultType!}"  key="processId.name"   label="${getText('WOM.propertydisplayName.randon1489720649125')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign processId_longTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${processId_longTime_displayDefaultType!}"  key="processId.longTime"   label="${getText('WOM.propertydisplayName.randon1489720689233')}" textalign="right" decimal="6" width=100   type="decimal"    showFormatFunc=""/>
			<#assign processId_remark_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${processId_remark_displayDefaultType!}"  key="processId.remark"   label="${getText('WOM.propertydisplayName.randon1489720730887')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_produceTask_taskBeforeProcess_beforeProcess_RenderOverEvent(){
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
	 * @method WOM.produceTask.taskBeforeProcess.beforeProcess.query
	 */
	WOM.produceTask.taskBeforeProcess.beforeProcess.query = function(type,pageNo){
		var node = WOM.produceTask.taskBeforeProcess.beforeProcess.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.produceTask.taskBeforeProcess.beforeProcess.node = null;
		if(!checkListValid("ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action";
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_produceTask_beforeProcess";
		condobj.modelAlias="taskBeforeProcess";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_produceTask_taskBeforeProcess_beforeProcess_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_produceTask_taskBeforeProcess_beforeProcess_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_produceTask_beforeProcess';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.produceTask.taskBeforeProcess.beforeProcess._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.produceTask.taskBeforeProcess.beforeProcess._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.produceTask.taskBeforeProcess.beforeProcess._prefix += '.';
			}
			WOM.produceTask.taskBeforeProcess.beforeProcess._prefix += arr[i];
		}
		WOM.produceTask.taskBeforeProcess.beforeProcess._suffix = arr[arr.length -1];
		if(WOM.produceTask.taskBeforeProcess.beforeProcess._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.produceTask.taskBeforeProcess.beforeProcess._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.produceTask.taskBeforeProcess.beforeProcess._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.produceTask.taskBeforeProcess.beforeProcess.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.produceTask.taskBeforeProcess.beforeProcess.getcallBackInfo = function(obj){
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+WOM.produceTask.taskBeforeProcess.beforeProcess._prefix + '.' + WOM.produceTask.taskBeforeProcess.beforeProcess._suffix +'"]').val(obj[0][WOM.produceTask.taskBeforeProcess.beforeProcess._suffix]);
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+WOM.produceTask.taskBeforeProcess.beforeProcess._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name^="'+WOM.produceTask.taskBeforeProcess.beforeProcess._prefix + '."]').unbind("change");
		CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+WOM.produceTask.taskBeforeProcess.beforeProcess._prefix + '.' + WOM.produceTask.taskBeforeProcess.beforeProcess._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_produceTask_taskBeforeProcess_beforeProcess_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.produceTask.taskBeforeProcess.beforeProcess._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.produceTask.taskBeforeProcess.beforeProcess.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.taskBeforeProcess.beforeProcess.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.taskBeforeProcess.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName").val() != ""){
				eval(CUI("#WOM_produceTask_taskBeforeProcess_beforeProcess_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_produceTask_taskBeforeProcess_beforeProcess_refresh = function(node){
	//var url = "/WOM/produceTask/taskBeforeProcess/beforeProcess-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_produceTask_taskBeforeProcess_beforeProcess_query.setRequestDataUrl(url,'',false);
	//}
	WOM.produceTask.taskBeforeProcess.beforeProcess.node = node;
	WOM.produceTask.taskBeforeProcess.beforeProcess.query("query");
}

WOM_produceTask_taskBeforeProcess_beforeProcess_getList = function() {
	return "WOM.produceTask.taskBeforeProcess.beforeProcess";
}

	WOM.produceTask.taskBeforeProcess.beforeProcess.commonQuery = function(type) {
	  if(typeof WOM.produceTask.taskBeforeProcess.beforeProcess.cancelSelectedNode == 'function') {
	   WOM.produceTask.taskBeforeProcess.beforeProcess.cancelSelectedNode();
	  }
	  WOM.produceTask.taskBeforeProcess.beforeProcess.query(type);
	 };
	
	

WOM.produceTask.taskBeforeProcess.beforeProcess.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.produceTask.taskBeforeProcess.beforeProcess.otherParams = {};
	WOM.produceTask.taskBeforeProcess.beforeProcess.otherParams.dialogType = dialogType;
	WOM.produceTask.taskBeforeProcess.beforeProcess.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.produceTask.taskBeforeProcess.beforeProcess.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_produceTask_beforeProcess,js,WOM_7.5.0.0_produceTask_TaskBeforeProcess,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	</script>
  </body>
</html>
