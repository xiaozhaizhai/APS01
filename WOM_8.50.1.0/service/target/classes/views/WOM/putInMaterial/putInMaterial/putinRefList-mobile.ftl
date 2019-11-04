
<script type="text/javascript">
	CUI.ns("WOM.putInMaterial.putInMaterial","WOM.putInMaterial.putInMaterial.putinRefList");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="WOM_putInMaterial_putInMaterial_putinRefList_callBackFuncName" id="WOM_putInMaterial_putInMaterial_putinRefList_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1490604762072')}</span></div>
	</#if>
	<@errorbar id="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm" exportUrl="/WOM/putInMaterial/putInMaterial/putinRefList-pending.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="createPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="createDepartment" />
		<input type="hidden" reset="false" name="WOM_putInMaterial_putInMaterial_putinRefList_condition" id="WOM_putInMaterial_putInMaterial_putinRefList_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1490604832447')}_${getText('WOM.viewtitle.randon1494843227308')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm" formId="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm" idprefix="ec_WOM_putInMaterial_putInMaterial_putinRefList" expandType="all" expand=true fieldcodes="WOM_7_5_0_0_putInMaterial_PutInMaterial_tableNo_tableNo:ec.common.tableNo||WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo:WOM.modelname.randon1489657901718||base_staff_name_putinStaff_name:WOM.staff.dimissionStaff_xls.staffName43566" >
							<#assign tableNo_defaultValue  = ''>
									<#assign tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_putInMaterial_PutInMaterial_tableNo_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_putInMaterial_PutInMaterial_tableNo_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('ec.common.tableNo')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
													<input type="text" class="form-control" name="tableNo" id="tableNo" value="${tableNo_defaultValue!}" deValue="${tableNo_defaultValue!}"   exp="like"/>
											
									</div>			
								</div>
							</div>
							<#assign taskID_tableNo_defaultValue  = ''>
									<#assign taskID_tableNo_defaultValue  = ''>
							<div  field-unique-code="WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "WOM_7_5_0_0_produceTask_ProduceTask_tableNo_taskID_tableNo">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.modelname.randon1489657901718')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="taskID.id" name="taskID.id" value="" />
												<@mneclient mneenable=false isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('WOM.viewtitle.randon1489737198145')}"  conditionfunc="WOM.putInMaterial.putInMaterial.putinRefList._querycustomFunc('taskID_tableNo')" name="taskID.tableNo" id="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm_taskID_tableNo" displayFieldName="tableNo" type="other" exp="like" classStyle="form-control" url="/WOM/produceTask/produceTask/taskRef.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm" searchClick="WOM.putInMaterial.putInMaterial.putinRefList.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign putinStaff_name_defaultValue  = ''>
									<#assign putinStaff_name_defaultValue  = ''>
							<div  field-unique-code="base_staff_name_putinStaff_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "base_staff_name_putinStaff_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('WOM.staff.dimissionStaff_xls.staffName43566')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="putinStaff.id" name="putinStaff.id" value="" />
												<#if (putinStaff_name_defaultValue)=='currentUser'>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany value="${Session.staff.name}" deValue="currentUser" reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.putInMaterial.putInMaterial.putinRefList._querycustomFunc('putinStaff_name')" name="putinStaff.name" id="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm_putinStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm" searchClick="WOM.putInMaterial.putInMaterial.putinRefList.commonQuery('query')" />
													<script type="text/javascript">
													(function($){
														$(function(){
															CUI('#putinStaff.id').val('${Session.staff.id}');
														});
													})(jQuery);
													</script>
												<#else>
													<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('foundation.ec.entity.view.reference')}"  conditionfunc="WOM.putInMaterial.putInMaterial.putinRefList._querycustomFunc('putinStaff_name')" name="putinStaff.name" id="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm_putinStaff_name" displayFieldName="name" type="Staff" exp="like" classStyle="form-control" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm" searchClick="WOM.putInMaterial.putInMaterial.putinRefList.commonQuery('query')" />
												</#if>
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm" type="search" onclick="WOM.putInMaterial.putInMaterial.putinRefList.commonQuery('query')" /> 
				 		<@querybutton formId="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm' );
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

ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info={};
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["tableNo"]={};
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["tableNo"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["tableNo"].layRec="tableNo";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["tableNo"].columnName="TABLE_NO";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["taskID.tableNo"]={};
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["taskID.tableNo"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["taskID.tableNo"].layRec="WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-tableNo";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["taskID.tableNo"].columnName="TABLE_NO";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["taskID.id"]={};
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["taskID.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["taskID.id"].layRec="WOM_PRODUCE_TASKS,ID,WOM_PUT_IN_MATERIALS,TASKID-tableNo";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["taskID.id"].columnName="ID";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["putinStaff.name"]={};
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["putinStaff.name"].dbColumnType="TEXT";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["putinStaff.name"].layRec="base_staff,ID,WOM_PUT_IN_MATERIALS,PUTIN_STAFF-name";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["putinStaff.name"].columnName="NAME";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["putinStaff.id"]={};
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["putinStaff.id"].dbColumnType="LONG";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["putinStaff.id"].layRec="base_staff,ID,WOM_PUT_IN_MATERIALS,PUTIN_STAFF-name";
ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["putinStaff.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterial.putinRefList.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterial/putinRefList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "WOM.putInMaterial.putInMaterial.putinRefList.query('query')">
<#assign datatable_dataUrl = "/WOM/putInMaterial/putInMaterial/putinRefList-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_WOM_putInMaterial_putInMaterial_putinRefList_query" renderOverEvent="ec_WOM_putInMaterial_putInMaterial_putinRefList_RenderOverEvent"  modelCode="WOM_7.5.0.0_putInMaterial_PutInMaterial" noPermissionKeys="tableNo,taskID.tableNo,taskID.productId.productCode,taskID.productId.productName,taskID.productBatchNum,putinStaff.name,remark" hidekeyPrefix="ec_WOM_putInMaterial_putInMaterial_putinRefList_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','taskID.id','taskID.productId.id','putinStaff.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${tableNo_displayDefaultType!}"  key="tableNo"   label="${getText('ec.common.tableNo')}" textalign="center"  width=190   type="textfield"    showFormatFunc=""/>
			<#assign taskID_tableNo_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskID_tableNo_displayDefaultType!}"  key="taskID.tableNo"   label="${getText('WOM.menuInfoname.randon1489670907556')}" textalign="center"  width=190   type="textfield"    click="function(cell){WOM.putInMaterial.putInMaterial.putinRefList.showLinkView('/WOM/produceTask/produceTask/makeTaskView.action?${getPowerCode('','WOM_7.5.0.0_produceTask_makeTaskView')}','taskID.id',cell)}" showFormatFunc=""/>
			<#assign taskID_productId_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskID_productId_productCode_displayDefaultType!}"  key="taskID.productId.productCode"   label="${getText('WOM.propertydisplayName.radion14157726448334334')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign taskID_productId_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskID_productId_productName_displayDefaultType!}"  key="taskID.productId.productName"   label="${getText('WOM.propertydisplayName.radion1415772740737333344')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign taskID_productBatchNum_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${taskID_productBatchNum_displayDefaultType!}"  key="taskID.productBatchNum"   label="${getText('WOM.propertydisplayName.randon1489668325364')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign putinStaff_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${putinStaff_name_displayDefaultType!}"  key="putinStaff.name"   label="${getText('WOM.staff.dimissionStaff_xls.staffName43566')}" textalign="left"  width=80   type="textfield"    showFormatFunc=""/>
			<#assign remark_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${remark_displayDefaultType!}"  key="remark"   label="${getText('WOM.propertydisplayName.randon1490604919519')}" textalign="left"  width=150   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_WOM_putInMaterial_putInMaterial_putinRefList_RenderOverEvent(){
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
	 * @method WOM.putInMaterial.putInMaterial.putinRefList.query
	 */
	WOM.putInMaterial.putInMaterial.putinRefList.query = function(type,pageNo){
		var node = WOM.putInMaterial.putInMaterial.putinRefList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		WOM.putInMaterial.putInMaterial.putinRefList.node = null;
		if(!checkListValid("ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/WOM/putInMaterial/putInMaterial/putinRefList-query.action";
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_putInMaterial_putinRefList";
		condobj.modelAlias="putInMaterial";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm *[name="'+ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_putInMaterial_putInMaterial_putinRefList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_putInMaterial_putInMaterial_putinRefList_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#WOM_putInMaterial_putInMaterial_putinRefList_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_putInMaterial_putinRefList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_WOM_putInMaterial_putInMaterial_putinRefList_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	WOM.putInMaterial.putInMaterial.putinRefList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.putInMaterial.putInMaterial.putinRefList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.putInMaterial.putInMaterial.putinRefList._prefix += '.';
			}
			WOM.putInMaterial.putInMaterial.putinRefList._prefix += arr[i];
		}
		WOM.putInMaterial.putInMaterial.putinRefList._suffix = arr[arr.length -1];
		if(WOM.putInMaterial.putInMaterial.putinRefList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.putInMaterial.putInMaterial.putinRefList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.putInMaterial.putInMaterial.putinRefList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.putInMaterial.putInMaterial.putinRefList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.putInMaterial.putInMaterial.putinRefList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm *[name="'+WOM.putInMaterial.putInMaterial.putinRefList._prefix + '.' + WOM.putInMaterial.putInMaterial.putinRefList._suffix +'"]').val(obj[0][WOM.putInMaterial.putInMaterial.putinRefList._suffix]);
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm *[name="'+WOM.putInMaterial.putInMaterial.putinRefList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm *[name^="'+WOM.putInMaterial.putInMaterial.putinRefList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm *[name="'+WOM.putInMaterial.putInMaterial.putinRefList._prefix + '.' + WOM.putInMaterial.putInMaterial.putinRefList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_putInMaterial_putInMaterial_putinRefList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	WOM.putInMaterial.putInMaterial.putinRefList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.putInMaterial.putInMaterial.putinRefList.query_"+obj+")!='undefined'") ? eval('WOM.putInMaterial.putInMaterial.putinRefList.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_WOM_putInMaterial_putInMaterial_putinRefList_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_WOM_putInMaterial_putInMaterial_putinRefList_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('WOM.putInMaterial.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#WOM_putInMaterial_putInMaterial_putinRefList_callBackFuncName").val() != ""){
				eval(CUI("#WOM_putInMaterial_putInMaterial_putinRefList_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
WOM_putInMaterial_putInMaterial_putinRefList_refresh = function(node){
	//var url = "/WOM/putInMaterial/putInMaterial/putinRefList-query.action";
	//if(node.layRec){
	//	datatable_ec_WOM_putInMaterial_putInMaterial_putinRefList_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_WOM_putInMaterial_putInMaterial_putinRefList_query.setRequestDataUrl(url,'',false);
	//}
	WOM.putInMaterial.putInMaterial.putinRefList.node = node;
	WOM.putInMaterial.putInMaterial.putinRefList.query("query");
}

WOM_putInMaterial_putInMaterial_putinRefList_getList = function() {
	return "WOM.putInMaterial.putInMaterial.putinRefList";
}

	WOM.putInMaterial.putInMaterial.putinRefList.commonQuery = function(type) {
	  if(typeof WOM.putInMaterial.putInMaterial.putinRefList.cancelSelectedNode == 'function') {
	   WOM.putInMaterial.putInMaterial.putinRefList.cancelSelectedNode();
	  }
	  WOM.putInMaterial.putInMaterial.putinRefList.query(type);
	 };
	
	

WOM.putInMaterial.putInMaterial.putinRefList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	WOM.putInMaterial.putInMaterial.putinRefList.otherParams = {};
	WOM.putInMaterial.putInMaterial.putinRefList.otherParams.dialogType = dialogType;
	WOM.putInMaterial.putInMaterial.putinRefList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.putInMaterial.putInMaterial.putinRefList.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-WOM_7.5.0.0_putInMaterial_putinRefList,js,WOM_7.5.0.0_putInMaterial_PutInMaterial,WOM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
