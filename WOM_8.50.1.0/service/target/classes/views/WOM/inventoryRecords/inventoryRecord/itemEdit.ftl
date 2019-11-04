<!-- WOM_7.5.0.0/inventoryRecords/itemEdit -->
<#assign isExtra = true>
<#assign isExtraView = false>
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "WOM_inventoryRecords_inventoryRecord">
	<#assign fileuploadLinkId = id!>
<#assign viewType = "create">
<#assign newObj = editNew!true >
<#if newObj>
<#assign viewType = "create">
<#else>
<#assign viewType = "edit">
</#if>
<#if refId?? && (refId>0)>
	<#assign newObj = false >
</#if>
<#assign userJson= Session.user.toJSON()>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml" style="overflow:auto;">
<head>
	
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('WOM.viewtitle.randon1566900658651')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@extracss /><@editjstop /><@editjs />
		<style>
		body{width:100%;}
		.ewc-dialog-el{height:100%;}
		.flow-height{
			height:94%;
			height:91%\9;
		}
		#WOM_inventoryRecords_inventoryRecord_itemEdit_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		.quick_query_content h4{
			text-align: left;
		}
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.inventoryRecords.inventoryRecord.itemEdit');
			CUI.ns('myCharts');
			WOM.inventoryRecords.inventoryRecord.itemEdit.currentUser = ${userJson};
			WOM.inventoryRecords.inventoryRecord.itemEdit.currentStaff = ${staffJson};
			WOM.inventoryRecords.inventoryRecord.itemEdit.currentDepartment = ${deptJson};
			WOM.inventoryRecords.inventoryRecord.itemEdit.currentPosition = ${postJson};
			WOM.inventoryRecords.inventoryRecord.itemEdit.currentCompany = ${compJson};
		</script>

<script type="text/javascript">
	$(function(){
		//修复select下拉框不能跟随滚动条一起滚动的bug
		$(".cui-elements").bind("scroll", function(){ 
			$(".edit-select-box").hide();
			$(".select-iframe").hide();     
		});
		$(window).resize(function(){
			//var isoldie = $.browser.msie&&($.browser.version == "6.0")&&!$.support.style;
			//var body = isoldie?(document.documentElement||document.body):document.body;
			var width = parseInt($('html').width(),10);
			var w1 = parseInt($(window).width(),10);
			if($("#edit_sidebar").css("display") == "block"){
				w1 = w1 - 150;
			}
			if (width <= 800) {
				if($("#edit_sidebar").length==0 || $("#edit_sidebar").css("display")=="none"){
					$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").css("width",800);
					$(".edit-head").css("width",800);
					$(".edit-workflow").css("width",800);
					$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
				}else{
					$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").css("width",650);
					$(".edit-head").css("width",650);
					$(".edit-workflow").css("width",650);
					$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
				}
			}
			else {
				if (YAHOO.env.ua.ie == "6") {
					$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").css("width",w1);
					$(".edit-workflow").css("width",w1);
				}else{
					$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").css("width","auto");
					$(".edit-workflow").css("width","auto");
				}
				$("body").css({"overflow-x":"hidden"});
				$(".edit-head").css("width","auto");
			}
		});
	});
	</script>
		
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_inventoryRecords_itemEdit,head,WOM_7.5.0.0_inventoryRecords_InventoryRecord,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body>		
		<@loadpanel/>
		<div id="load_mask_first" class="load_mask_first"></div>
		<iframe id="load_iframe_ie_first" class="load_iframe_ie" style="z-index: 199; display: block;"></iframe>
		<div id="loading_wrap_first" class="loading_wrap_first">
			<div class="loading_process">
				<div class="loading_msg_first">${getText("foundation.common.data.waiting")}</div>
			</div>
		</div>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="WOM.inventoryRecords.inventoryRecord.itemEdit.beforeSubmitMethod()" id="WOM_inventoryRecords_inventoryRecord_itemEdit_form" namespace="/WOM/inventoryRecords/inventoryRecord/itemEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_inventoryRecords_InventoryRecord&_bapFieldPermissonModelName_=InventoryRecord" callback="WOM.inventoryRecords.inventoryRecord.itemEdit._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_inventoryRecords_inventoryRecord_itemEdit_main_div">
					<#assign hasEditHead = true>
					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
    							<script>
									$(function(){
										if($("#top_buttonbar").children("a").length == 0){
											$(".edit-head").hide();
										}										
									});
								</script>
								<div class="fl" id="top_buttonbar">
									<#if !((inventoryRecord.status)?? && inventoryRecord.status == 77)>
									<#if id?? || isExtraView>
									</#if>
									
									<a class='cui-btn-new' id="edit-save-btn" onclick="WOM.inventoryRecords.inventoryRecord.itemEdit.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
									<#if transitions?has_content>
									<#list transitions as t>
										<#if t.cancel??&&t.cancel==1>
											<#if id??>
								    <a class='cui-btn-new' id='edit-${t.name}-btn'><span class='edit-nullify'></span>${getHtmlText('ec.edit.remove')}</a>
									<script type="text/javascript">
										$(function(){
											$('#edit-${t.name}-btn').click(function(){
												if(!confirm("${getText('ec.view.confirm.remove')}"))return;
												$("input[type='radio'][name='workFlowVar.outcome']").prop("checked",false);
												if($("#workflow_outcomes .wfcancel").length == 0) {
													$("#workflow_outcomes").append('<input class="wfcancel" type="hidden" name="workFlowVar.outcome" id="__workflow_outcome_${t.name}" value="${t.name}" />');
													$("#workflow_outcomes").append('<input class="wfcancel"  type="hidden" name="workFlowVarStatus" value="cancel" />');
												}
												var wfcancelArr=new Array();
												var paramObj=new Object();
												paramObj.type='normal';
												paramObj.outcome='${t.name}';
												paramObj.dec='${t.description}';
												wfcancelArr.push(paramObj);
												$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(wfcancelArr));
												WOM.inventoryRecords.inventoryRecord.itemEdit.submit(true);
											});
										});
									</script>
											</#if>
											<#break>
										</#if>
									</#list>
									</#if>

									
									</#if>
									
									 
									<a class='cui-btn-new' id="edit-close-btn" onclick="window.close()"><span class="close"></span>${getHtmlText("foundation.common.closeWindow")}</a>
								</div>
								<div class="fr">
									<ul>
										<#if auditCheck('WOM_7.5.0.0_inventoryRecords_itemEdit') == '1'>
										<li id="fr_audit" ><a title='${getText("foundation.base.audit")}' onclick="WOM.inventoryRecords.inventoryRecord.itemEdit.showAudit()">
										<span class='icon_audit' ></span>
										</a></li>
										</#if>
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="WOM.inventoryRecords.inventoryRecord.itemEdit.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="WOM_inventoryRecords_inventoryRecord_itemEdit_form_attcount"></em></i></span>
										</a></li>
									</ul>
								</div>
							</div>
							</#if>
							 
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
							</div>
					</div>
    					<div class="edit-main" id="WOM_inventoryRecords_inventoryRecord_itemEdit">
    						<div class="edit-content">
    							<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="itemEdit">
								<input type="hidden" name="datagridKey" value="WOM_inventoryRecords_inventoryRecord_itemEdit_datagrids">
								<input type="hidden" name="viewCode" value="WOM_7.5.0.0_inventoryRecords_itemEdit">
								<input type="hidden" name="modelName" value="InventoryRecord">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="inventoryRecord.version" value="${(inventoryRecord.version)!0}" />
								<input type="hidden" name="inventoryRecord.extraCol" value='' />
								<input type="hidden" name="operateType" id="operateType" />
								<input type="hidden" name="uploadDocIds" value="${uploadDocIds!''}">
								<input type="hidden" name="refViewRefresh" value=''>
								<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
								<script>
									//绑定页签点击事件，页签点击的时候，自动触发该页签下面的第一个页签的点击事件
									$(function(){
										$(".edit-content ul.edit-tabs").each(function(){
											var objMe = this;											
											$(objMe).children("li").each(function(index){
												$(this).bind('click',function(){
													var currentBottom = $(objMe).siblings(".edit-panes").children(".pd_bottom:eq("+index+")");
													$("ul.edit-tabs",$(currentBottom)).each(function(){
														if($(this).closest(".pd_bottom").prevAll(".pd_bottom").length == 0 || $(this).closest(".pd_bottom")[0] == currentBottom[0]){
															$("li:eq(0)",$(this)).trigger('click');
														}
													});
												});
											});										
										});
									});
								</script>
																														<script>
												$(function(){
													var height=$(document).height()-7;
													if($(".edit-head")[0]){
														height = height - $(".edit-head")[0].offsetHeight;	//假如是编辑视图，需要减去head块
													}
													var width=$(document).width()- 7 ;
													if($(".edit-sidebar")[0]){
														width = width - $(".edit-sidebar")[0].offsetWidth;
													}else if($("#v3_side")[0]){
														width = width - $("#v3_side")[0].offsetWidth;
													}
													if($(".edit-workflow")[0]){
														height = height - $(".edit-workflow")[0].offsetHeight;
													}
													if($("#dealInfoContain")[0]){
														height = height - $("#dealInfoContain")[0].offsetHeight;
													}
													$("#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_tabs-1").height(height);
													$(window).resize(function() {
														var height=$(document).height() - 5 ;
														if($(".edit-head")[0]){
															height = height - $(".edit-head")[0].offsetHeight;	//假如是编辑视图，需要减去head块
														}
														var width=YUD.getViewportWidth()- 5;//获取窗口可显示宽度
														if($(".edit-sidebar")[0]){
															width = width - $(".edit-sidebar")[0].offsetWidth;
														}
														if($(".edit-workflow")[0]){
															height = height - $(".edit-workflow")[0].offsetHeight;
														}
														if($("#dealInfoContain")[0]){
															height = height - $("#dealInfoContain")[0].offsetHeight;
														}
														$("#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_tabs-1").height(height);
													});	
												});
												</script>
												<div id='ec_WOM_inventoryRecords_inventoryRecord_itemEdit_tabs-1' style="">
				<script type="text/javascript">
			$(function(){
				$.extraLayout($("#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column-3").parent(),{nums:2,method:"column",topBlock:false,bottomBlock:false,heights:[50,50],layoutType:'classic'});
			});
		</script>
				 <div id="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column-2" class='extra-layout column-fixed' style="border:none; "> 
			
						
	<#if businessCenterCode?? >
	<div style="position:relative;z-index:10;">
	<div class="edit-menubar"><span class="title-bar">${getText('WOM.entityname.randon1566887979029')}</span></div>
	<#else>
	<div>
	</#if>
	<@errorbar id="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryFormErrorBar" />
	<div <#if useInBusiness?? && useInBusiness == 'yes'>style="position:relative;*z-index:1;zoom:1;"</#if> onsubmit="return false" id="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm" exportUrl="/WOM/inventoryRecords/inventoryRecord/itemEdit-query.action">
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('WOM.modelname.randon1566888253801')}_${getText('WOM.viewtitle.randon1566900658651')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="fastQueryCond" name="fastQueryCond" />
		<input type="hidden" id="excelQueryCond" name="exportFastQueryCond" />
		<input type="hidden" class="nodeInfo" />
		<input type="hidden" id="treeNodeSelected" name="treeNodeSelected" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColName" name="dataTableSortColName"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
		<input type="hidden" id="currentSqlType"  value="5" />
		<div id="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm_btn_toggle" class="quick-query-btn-toggle quick-query-btn-expand" style="display:none;" title="${getText('ec.view.expandTip')}" onclick="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm_expandAllCondition()" ></div>
		<#assign advFlag = getAdvClassific('WOM_7.5.0.0_inventoryRecords_itemEdit','column-2')>
		<#if advFlag?? && advFlag>
		<@dataclassific id="dataClassific" viewCode="WOM_7.5.0.0_inventoryRecords_itemEdit" formId="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm" dataTableId="" isExtra=true layoutName="column-2" />
		</#if>
					<@quickquery unique="LAST_QUERY_ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm" isExpandAll=true formId="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm" idprefix="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2" expandType="all"  fieldcodes="WOM_7.5.0.0_inventoryRecords_InventoryDetail_batchText_batchText:WOM.propertydisplayName.randon1566888429426" > 
							<#assign batchText_defaultValue  = ''>
									<#assign batchText_defaultValue  = ''>
							<@queryfield formId="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm" code="WOM_7.5.0.0_inventoryRecords_InventoryDetail_batchText" showFormat="TEXT" defaultValue=batchText_defaultValue  divCode="WOM_7.5.0.0_inventoryRecords_InventoryDetail_batchText_batchText" isCustomize=true style="" > 
											<div class="fix-input">
											<input type="text" class="cui-noborder-input" name="batchText" id="batchText" value="${batchText_defaultValue!}" deValue="${batchText_defaultValue!}"   exp="like"  caseSensitive="false"/>
											</div>
							</@queryfield>
							<div class="quick-query-buttonbar" style="margin-bottom:6px;margin-right:12px;">
						       	<@querybutton formId="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm" type="adv" onclick="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2commonQuery('query')" onadvancedclick="column_2advQuery('WOM.inventoryRecords.inventoryRecord.itemEdit.column_2advquery',this)" /> 
						 		<@querybutton formId="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm" type="clear"  />
					 		</div>
					     </@quickquery>
	</div>
</div>
<script type="text/javascript">
ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info={};
ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info["MainTableName"]="WOM_INVENTORY_RECORDS";
ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info["batchText"]={};
ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info["batchText"].dbColumnType="TEXT";
ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info["batchText"].layRec="batchText";
ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info["batchText"].columnName="BATCH_TEXT";
generateChainCond=function(cond,layarr,field){
	if(layarr.length>1){
		var subconds=cond.subconds;
		for(var i=0;i<subconds.length;i++){
			if(subconds[i].type=="2"&&subconds[i].joinInfo==layarr[0]){
				generateChainCond(subconds[i],layarr.slice(1),field);
				return;
			}
		}
		var chain={};
		chain.type="2";
		chain.joinInfo=layarr[0];
		chain.subconds=[];
		cond.subconds.push(chain);
		generateChainCond(chain,layarr.slice(1),field);
	}else{
		cond.subconds.push(field)
	}
}
</script>
								<script type="text/javascript">
									$(function(){		
										$("#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column-2").css({"overflow":"hidden","position":"relative"});		
									});
function ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2CallBackFunc(){
	try{
		var _el = $("#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm");
		var quick_query_node = $( 'div.queryForm-allContainer > div.quick_query_node' , _el );
		if ( quick_query_node.length > 0 ) {
			var container = quick_query_node.eq(0).parents( 'div.queryForm-allContainer' );
			var winWidth = calWidthInPercent(container.parents( 'div.extra-layout' ).eq(0)[0]) - 12;
			container.width( winWidth );
			// 有日期控件时需要保证最小宽度 否则会显示不全
			var nodeWidth = winWidth > ( $( 'input.cui-calpick', container ).length > 0 ? 1185 : 1024 ) ? "33%" : "49%";
			quick_query_node.width( nodeWidth );
			if( YAHOO.env.ua.ie != 6 && quick_query_node.length % ( winWidth > ( $( 'input.cui-calpick', container ).length > 0 ? 1185 : 1024 ) ? 3 : 2 ) != 0 ){
				$( 'div.quick-query-buttonbar', _el ).css( 'margin-top', '-38px' );
			}else{
				$( 'div.quick-query-buttonbar', _el ).css( 'margin-top',  YAHOO.env.ua.ie ? '5px' : 0 );
			}
		}
	}catch(e){}
}

WOM.inventoryRecords.inventoryRecord.itemEdit.column_2commonQuery = function(type) {
  if(typeof WOM.inventoryRecords.inventoryRecord.itemEdit.column_2cancelSelectedNode == 'function') {
   WOM.inventoryRecords.inventoryRecord.itemEdit.column_2cancelSelectedNode();
   WOM.inventoryRecords.inventoryRecord.itemEdit.column_2node = null;
  }
  if(typeof WOM_inventoryRecords_inventoryRecord_itemEdit_cancelSelectedNode == 'function') {
   WOM_inventoryRecords_inventoryRecord_itemEditcolumn_2_cancelSelectedNode();
   WOM.inventoryRecords.inventoryRecord.itemEdit.column_2node = null;
  }
 };
 
/**
 * 查询块的查询条件的组织
 * @method WOM.inventoryRecords.inventoryRecord.itemEdit.column_2QueryCond
 */
WOM.inventoryRecords.inventoryRecord.itemEdit.column_2QueryCond = function(type,pageNo,sortFlag){
	if(type != "adv") {
		$('#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm #advQueryCond').val('');
	}
	var node = WOM.inventoryRecords.inventoryRecord.itemEdit.column_2node;
	var nodeParam = "";
	if(node!=null && node.layRec){
		nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
	}
	var dataPost = "";
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_inventoryRecords_itemEdit";
		condobj.modelAlias="inventoryDetail";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info[fieldName].dbColumnType;
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
									fastColValue += "-" + lastDay + " 23:59:59";
								}
							}
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm *[name="'+ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_quickquery_info[fieldName].layRec;
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
			$('#ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2_queryForm #excelQueryCond').val(JSON.stringify(condobj));
		}
		var pageSize=CUI('input[name="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
			<#if mainBusinessId??>
		 		dataPost += "&mainBusinessId=${mainBusinessId}";	
		 	</#if>
		 	<#if businessCenterCode??>
		 		dataPost += "&businessCenterCode=${businessCenterCode}";	
		 	</#if>
		 	<#if flowBulkFlag??>
		 		dataPost += "&flowBulkFlag=${flowBulkFlag?string('true','false')}";	
		 	</#if>
		 	<#if listCustomCondition?? && listCustomCondition != "">
		 		dataPost += "&${listCustomCondition}";	
		 	</#if>
		
	var queryCondObj = new Array();
	queryCondObj[0] = dataPost;
	queryCondObj[1] = condobj;	
	return queryCondObj;
};

/**
 * 组织选中的dataTable
 * @method WOM.inventoryRecords.inventoryRecord.itemEdit.column_2buildDataTableId
 */
WOM.inventoryRecords.inventoryRecord.itemEdit.column_2buildDataTableId = function(){
	var dataTableId = "";
	return dataTableId;
};

/**
 * 新布局数据分类的查询
 * @method WOM.inventoryRecords.inventoryRecord.itemEdit.column_2extraClassificQuery
 */
WOM.inventoryRecords.inventoryRecord.itemEdit.column_2extraClassificQuery = function(){
	var dataTableId = "";
	return dataTableId;
};

								</script>
																	<@newExtraAdvQueryJs viewCode='WOM_7.5.0.0_inventoryRecords_itemEdit' url="/WOM/inventoryRecords/inventoryRecord/itemEdit1566901228089.action" ns="WOM.inventoryRecords.inventoryRecord" idprefix='ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column_2' layoutName='column_2'  queryFunc="WOM.inventoryRecords.inventoryRecord.itemEdit.column_2commonQuery" ns="WOM.inventoryRecords.inventoryRecord.itemEdit" />
									<#include "itemEdit-advQuery-itemEdit1566901228089.ftl" />
															 </div>
				 <div id="ec_WOM_inventoryRecords_inventoryRecord_itemEdit_column-3" class='extra-layout column-fixed' style="border:none; "> 
			
					
		
			<#if  refId?? && (refId > 0)>
				<#assign nodeExpanded = true>
			<#else>
				<#assign nodeExpanded = false>
			</#if>
			
		<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
		<#assign exportExcel=false>
		<#else>
		<#assign exportExcel=false>
		</#if>
	<#if false && isIE>
			<#assign routeFlag = "1">
	<#else>
			<#assign routeFlag = "0">
	</#if>	
	
	<#assign cpObjHideKey = '' >
	<#assign cpvmInfo = ''>
		<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
	
	<#if  refId?? && (refId > 0)>
		<#assign dUrl="/WOM/inventoryRecords/inventoryRecord/data-dg1566900683310.action?inventoryRecord.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_inventoryRecords_itemEditdg1566900683310">
	<#else>
		<#assign dUrl="/WOM/inventoryRecords/inventoryRecord/data-dg1566900683310.action?inventoryRecord.id=${(inventoryRecord.id)!-1}&datagridCode=WOM_7.5.0.0_inventoryRecords_itemEditdg1566900683310">
	</#if>
	<#assign firstLoad = true>
	<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
		<#assign buttons="[]">
		<#assign canImportExcel=false>
	<#else>
		<#assign buttons="[]">
		<#assign canImportExcel=false>
	</#if>
	
		<#if cpvmInfo?? && cpvmInfo?length gt 0>
			<#assign cpvmInfo = cpvmInfo?substring(1)>
			<input type="hidden" id="dg_cp_info_InventoryDetail_dg1566900683310" value="${cpvmInfo!}" />
		</#if>
	
	<input type="hidden" id="dg1566900683310_id" value="InventoryDetail_dg1566900683310" />
	
	<input type="hidden" id="dg1566900683310_url" value="${dUrl}" />
	
	<#assign assModelDisplayName = getText('WOM.modelname.randon1566888284025')!>
	<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
	<@exportexcel action="/WOM/inventoryRecords/inventoryRecord/data-dg1566900683310.action?operateType=export&datagridCode=WOM_7.5.0.0_inventoryRecords_itemEditdg1566900683310"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="InventoryDetail_dg1566900683310" />
	<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="InventoryDetail_dg1566900683310" viewType="${viewType}" renderOverEvent="dg1566900683310RenderOverEvent" route="${routeFlag}" formId="WOM_inventoryRecords_inventoryRecord_itemEdit_form" noPermissionKeys="manulOrder.manulOrderNum,material.productName,material.productCode,batchText,wareID.wareName,onhand,material.storeUnit.name" modelCode="WOM_7.5.0.0_inventoryRecords_InventoryDetail" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1566900683310" dtPage="dgPage"  hidekeyPrefix="dg1566900683310" hidekey="['id','version','manulOrder.id','manulOrder.manulOrderNum','material.id','material.productName','material.id','material.productCode','wareID.id','wareID.wareName','material.id','material.storeUnit.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}"  noPadding=true isEdit=true tabViewIndex=0  ptRealTimeLoad=1 isExtra=true pageInitMethod="dg1566900683310PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false >
					<#assign manulOrder_manulOrderNum_displayDefaultType=''>
						<#assign manulOrder_manulOrderNum_defaultValue=''>
								<#assign manulOrder_manulOrderNum_defaultValue=''>
													<#if (manulOrder_manulOrderNum_defaultValue!)?string=="currentUser">
						<#assign manulOrder_manulOrderNum_defaultValue='${staffJson!}'>
					<#elseif (manulOrder_manulOrderNum_defaultValue!)?string=="currentPost">
						<#assign manulOrder_manulOrderNum_defaultValue='${postJson!}'>
					<#elseif (manulOrder_manulOrderNum_defaultValue!)?string=="currentDepart">
						<#assign manulOrder_manulOrderNum_defaultValue='${deptJson!}'>
					<#elseif (manulOrder_manulOrderNum_defaultValue!)?string=="currentComp">
						<#assign manulOrder_manulOrderNum_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="manulOrder.manulOrderNum"        showFormat="SELECTCOMP" defaultValue="${(manulOrder_manulOrderNum_defaultValue!)?string}" defaultDisplay="${(manulOrder_manulOrderNum_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.inventoryRecords.inventoryRecord.itemEdit"  textalign="left"  viewUrl="/WOM/manulOrder/manulOrderMain/manulOrdersRef.action" viewCode="WOM_7.5.0.0_manulOrder_manulOrdersRef"  crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1563350015905')}"  label="${getText('WOM.propertydisplayName.randon1563193157341')}" width=100 showFormatFunc=""  />
					<#assign material_productName_displayDefaultType=''>
						<#assign material_productName_defaultValue=''>
								<#assign material_productName_defaultValue=''>
													<#if (material_productName_defaultValue!)?string=="currentUser">
						<#assign material_productName_defaultValue='${staffJson!}'>
					<#elseif (material_productName_defaultValue!)?string=="currentPost">
						<#assign material_productName_defaultValue='${postJson!}'>
					<#elseif (material_productName_defaultValue!)?string=="currentDepart">
						<#assign material_productName_defaultValue='${deptJson!}'>
					<#elseif (material_productName_defaultValue!)?string=="currentComp">
						<#assign material_productName_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="material.productName"        showFormat="TEXT" defaultValue="${(material_productName_defaultValue!)?string}" defaultDisplay="${(material_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.inventoryRecords.inventoryRecord.itemEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef"  crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
					<#assign material_productCode_displayDefaultType=''>
						<#assign material_productCode_defaultValue=''>
								<#assign material_productCode_defaultValue=''>
													<#if (material_productCode_defaultValue!)?string=="currentUser">
						<#assign material_productCode_defaultValue='${staffJson!}'>
					<#elseif (material_productCode_defaultValue!)?string=="currentPost">
						<#assign material_productCode_defaultValue='${postJson!}'>
					<#elseif (material_productCode_defaultValue!)?string=="currentDepart">
						<#assign material_productCode_defaultValue='${deptJson!}'>
					<#elseif (material_productCode_defaultValue!)?string=="currentComp">
						<#assign material_productCode_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="material.productCode"        showFormat="SELECTCOMP" defaultValue="${(material_productCode_defaultValue!)?string}" defaultDisplay="${(material_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.inventoryRecords.inventoryRecord.itemEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef"  crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
					<#assign batchText_displayDefaultType=''>
						<#assign batchText_defaultValue=''>
								<#assign batchText_defaultValue=''>
								 
							<@datacolumn key="batchText"        showFormat="TEXT" defaultValue="${(batchText_defaultValue!)?string}" defaultDisplay="${(batchText_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1566888429426')}" width=100 showFormatFunc=""  />
					<#assign wareID_wareName_displayDefaultType=''>
						<#assign wareID_wareName_defaultValue=''>
								<#assign wareID_wareName_defaultValue=''>
													<#if (wareID_wareName_defaultValue!)?string=="currentUser">
						<#assign wareID_wareName_defaultValue='${staffJson!}'>
					<#elseif (wareID_wareName_defaultValue!)?string=="currentPost">
						<#assign wareID_wareName_defaultValue='${postJson!}'>
					<#elseif (wareID_wareName_defaultValue!)?string=="currentDepart">
						<#assign wareID_wareName_defaultValue='${deptJson!}'>
					<#elseif (wareID_wareName_defaultValue!)?string=="currentComp">
						<#assign wareID_wareName_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="wareID.wareName"        showFormat="SELECTCOMP" defaultValue="${(wareID_wareName_defaultValue!)?string}" defaultDisplay="${(wareID_wareName_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.inventoryRecords.inventoryRecord.itemEdit"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('WOM.propertyshowName.randon1566899675218.flag')}" width=100 showFormatFunc=""  />
					<#assign onhand_displayDefaultType=''>
						<#assign onhand_defaultValue=''>
								<#assign onhand_defaultValue=''>
								 
							<@datacolumn key="onhand"        showFormat="TEXT" defaultValue="${(onhand_defaultValue!)?string}" defaultDisplay="${(onhand_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1566888673309')}" width=100 showFormatFunc=""  />
					<#assign material_storeUnit_name_displayDefaultType=''>
						<#assign material_storeUnit_name_defaultValue=''>
								<#assign material_storeUnit_name_defaultValue=''>
													<#if (material_storeUnit_name_defaultValue!)?string=="currentUser">
						<#assign material_storeUnit_name_defaultValue='${staffJson!}'>
					<#elseif (material_storeUnit_name_defaultValue!)?string=="currentPost">
						<#assign material_storeUnit_name_defaultValue='${postJson!}'>
					<#elseif (material_storeUnit_name_defaultValue!)?string=="currentDepart">
						<#assign material_storeUnit_name_defaultValue='${deptJson!}'>
					<#elseif (material_storeUnit_name_defaultValue!)?string=="currentComp">
						<#assign material_storeUnit_name_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="material.storeUnit.name"        showFormat="TEXT" defaultValue="${(material_storeUnit_name_defaultValue!)?string}" defaultDisplay="${(material_storeUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.inventoryRecords.inventoryRecord.itemEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef"  crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" width=100 showFormatFunc=""  />
	
	</@datagrid>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
	
	<script type="text/javascript">
		function InventoryDetail_dg1566900683310_check_datagridvalid(){
			//
			var errorObj =InventoryDetail_dg1566900683310Widget._DT.testData();
			var errorContent='';
			if(errorObj!=null){
			  for(var i=0;i<errorObj.length;i++){
				var obj1=errorObj[i];
				if(obj1.errorType=='date'){
				  errorContent+=obj1.label+'必须为日期类型！';
				  break;
				}else if(obj1.errorType=='integer'){
				  errorContent+=obj1.label+'必须为数字类型！';
				  break;
				}else if(obj1.errorType=='decimal'){
				  errorContent+=obj1.label+'必须为整数类型！';
				  break;
				}else if(obj1.errorType=='notnull'){
				   errorContent+=obj1.label+'不能为空';
				   break;
				}else if(obj1.errorType=='toolong'){
				   errorContent+=obj1.label+'字段长度不能超过'+obj1.length+'字节(注：英文字母占1个字节，中文字占3个字节)！';
				   break;
				}
			  }
			  if(errorContent!=""){
				hasErr = true;
			  }
			  if(hasErr){
				EditDialogErrorBarWidget.show(errorContent);
				return false;
			  }
			}
			return true;
		}
		
		function savedg1566900683310DataGrid(){
			<#if  refId?? && (refId gt 0)>
			InventoryDetail_dg1566900683310Widget.setAllRowEdited();
			</#if>
			// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
			var changed_pt_name = $('body').data('CHANGED_PT');
			if(changed_pt_name && changed_pt_name.indexOf('InventoryDetail_dg1566900683310Widget') > -1) {
				InventoryDetail_dg1566900683310Widget.setAllRowEdited();
			}
			var json = InventoryDetail_dg1566900683310Widget.parseEditedData();
			$('input[name="dg1566900683310ListJson"]').remove();
			$('input[name="dgLists[\'dg1566900683310\']"]').remove();
			$('input[name="dg1566900683310ModelCode"]').remove();
			$('<input type="hidden" name="dgLists[\'dg1566900683310\']">').val(json).appendTo($('#WOM_inventoryRecords_inventoryRecord_itemEdit_form'));
			$('<input type="hidden" name="dg1566900683310ModelCode">').val('WOM_7.5.0.0_inventoryRecords_InventoryDetail').appendTo($('#WOM_inventoryRecords_inventoryRecord_itemEdit_form'));
			//兼容旧版本提交函数
			$('<input type="hidden" name="dg1566900683310ListJson">').val(json).appendTo($('#WOM_inventoryRecords_inventoryRecord_itemEdit_form'));
		}
		function DT_InventoryDetail_dg1566900683310_deldatagrid(){
			var deleteRows = InventoryDetail_dg1566900683310Widget.deleteRows();
			if(!deleteRows || deleteRows.length == 0) {
				CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
				return false;
			}
			var delproperty = "'id','version','head.id','material.id','wareID.id','applyStaff.id','manulOrder.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1566900683310DeletedIds").length>0){
					$("#dg1566900683310DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1566900683310DeletedIds" name="dgDeletedIds[\'dg1566900683310\']" value="'+tepID+'">').appendTo(CUI('#WOM_inventoryRecords_inventoryRecord_itemEdit_form'));
				} 
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1566900683310DeletedIds['+CUI('input[name^="dg1566900683310DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_inventoryRecords_inventoryRecord_itemEdit_form'));
			});
			return deleteRows;
		}
		function DT_InventoryDetail_dg1566900683310_delTreeNodes(){
			var deleteRows = InventoryDetail_dg1566900683310Widget._DT.removeTreeNode();
			if(!deleteRows || deleteRows.length == 0) {
				return false;
			}
			var delproperty = "'id','version','head.id','material.id','wareID.id','applyStaff.id','manulOrder.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1566900683310DeletedIds").length>0){
					$("#dg1566900683310DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1566900683310DeletedIds" name="dgDeletedIds[\'dg1566900683310\']" value="'+tepID+'">').appendTo(CUI('#WOM_inventoryRecords_inventoryRecord_itemEdit_form'));
				}
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1566900683310DeletedIds['+CUI('input[name^="dg1566900683310DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_inventoryRecords_inventoryRecord_itemEdit_form'));
			});
		}
		$(function($){
			var datagrids = $('body').data('WOM_inventoryRecords_inventoryRecord_itemEdit_datagrids');
			var length  = 0;
			if(!datagrids) {
				datagrids = [];
			}else{
				length = datagrids.length;
			}
			datagrids[length]=[];
			datagrids[length][0] = 'InventoryDetail_dg1566900683310';
			$('body').data('WOM_inventoryRecords_inventoryRecord_itemEdit_datagrids', datagrids);
		});
		var InventoryDetail_dg1566900683310_importDialog = null;
		function InventoryDetail_dg1566900683310_showImportDialog(){
			try{
				if(InventoryDetail_dg1566900683310_importDialog!=null&&InventoryDetail_dg1566900683310_importDialog.isShow==1){
					return false;
				}
				var url = "/WOM/inventoryRecords/inventoryRecord/initImport.action?datagridCode=WOM_7.5.0.0_inventoryRecords_itemEditdg1566900683310&tid=${id!}&datagridName=dg1566900683310";
					<#if canImportExcel>
						var buttonCode="WOM_7.5.0.0_inventoryRecords_itemEditdg1566900683310_BUTTON_dgImport";
						url+="&buttonCode="+buttonCode;
					</#if>
				InventoryDetail_dg1566900683310_importDialog = new CUI.Dialog({
					title: "${getHtmlText('common.button.import')}",
					url:url,
					modal:true,
					description:'',
					height:'330',
					width: '420',
					dragable:true,
					buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("InventoryDetail_dg1566900683310"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();InventoryDetail_dg1566900683310_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();InventoryDetail_dg1566900683310_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
					beforeCloseEvent:function(){$('#importResponse').remove();}
				});
				InventoryDetail_dg1566900683310_importDialog.show();
			}catch(e){}
		}	
		
		function InventoryDetail_dg1566900683310_downLoadFile(){
			var url = "/WOM/inventoryRecords/inventoryRecord/downLoad.action?datagridCode=WOM_7.5.0.0_inventoryRecords_itemEditdg1566900683310&templateRelatedModelCode=WOM_7.5.0.0_inventoryRecords_itemEditdg1566900683310&downloadType=template&fileName=dg1566900683310";
			window.open(url,"","");
		}
		function dg1566900683310RenderOverEvent(){
		}
		function dg1566900683310PageInitMethod(nTabIndex){
			WOM.inventoryRecords.inventoryRecord.itemEdit.initSize(nTabIndex);
		}
	</script>
							 </div>
		
													</div>
							</div>
						</div>
    	</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="WOM_inventoryRecords_inventoryRecord_itemEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.inventoryRecords.inventoryRecord.itemEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_inventoryRecords_itemEdit,html,WOM_7.5.0.0_inventoryRecords_InventoryRecord,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
		<@errorbar id="workbenchErrorBar" offsetY=42 />
		
		
		</script>
		<script type="text/javascript">
			WOM.inventoryRecords.inventoryRecord.itemEdit.initCount = 0;
			WOM.inventoryRecords.inventoryRecord.itemEdit.initSize = function(nTabIndex){
				var panesHeight;
				var thisHeight;
				var h = $(window).height();
			    var w = $(window).width();
			    var width_ = 0;
			    if($('#edit_side_btn').length > 0){
				 $('#edit_side_btn').hasClass('edit-side-btn-r') ? width_ = 0 : width_ = 145;			
				}
				<#if businessCenterList??&&businessCenterList?size gt 0 >
				if($("#edit_sidebar").css("display") === "none"){
					$("div.edit-workflow").css("left",1);
				}else{
					$("div.edit-workflow").css("left",145);
				}
				$("#edit_sidebar").height(h);
				$("div.edit-sidebar-inner").height(h);
				$("#edit_side_btn").css("top",(h-50)/2);
				CUI('div[id^="otherContentDiv_"]').height(h);
				</#if>
				var conHeight = h-$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div .edit-head").height()-$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div .edit-workflow").height()</#if>;
				$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_inventoryRecords_inventoryRecord_itemEdit_datagrids');
				var padding_bottom=16;
				//$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div .pd_bottom,#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div .edit-panes-s").each(function(index){
					//多页签切换时只计算本页签下的PT高度
					if(nTabIndex != undefined && typeof(nTabIndex) == 'number' && index != nTabIndex){
						return;
					}
					thisHeight = $(this).height();
					var datatableHeight = conHeight - panesHeight;
					if(datagrids&&datagrids.length>index&&datagrids[index].length>0) {
						if(thisHeight > panesHeight) {
							$(this).parent().height(panesHeight);
							$(this).parent().css("overflow-y","auto");
						} else {
							$(this).parent().height(thisHeight);			//解决存在存在pt的情况，当页面resize时，造成的高度设定不正确问题， BugID=27472			--fukun
							datatableHeight = conHeight - thisHeight;
						}
					} else {
						if(thisHeight > conHeight) {
							$(this).parent().height(conHeight);
							$(this).parent().css("overflow-y","auto");
						} else if(thisHeight && thisHeight > 0) {
							$(this).parent().height(conHeight);  //如果实际高度小于分配给它的高度，就使用分配给它的高度 BugID=18196     --xudihui
						}
					}
					if(datagrids && datagrids.length > 0) {
						if(datagrids[index].length > 0) {
							datatableHeight = datatableHeight; 
							var perHeight = datatableHeight/datagrids[index].length;
							for(var dg=0;dg<datagrids[index].length;dg++) {
								
								var dgwidget = eval(datagrids[index][dg]+'Widget');
								
								if(dgwidget) {
									var dg_container = dgwidget._DT ? ( dgwidget.isJS ? dgwidget._DT.container :  dgwidget._DT.oGridDiv ) : dgwidget.container;
									if ( $( dg_container ).is( ':visible' ) ) {
									   	 if( dgwidget._oGrid || dgwidget._DT._oGrid ){
                                          dgwidget.setHeight(perHeight - 78); 
										  if ( $('._DT_blank','#' + datagrids[index] + '_wrapper').length == 0 ) {
										     $('#' + datagrids[index] + '_wrapper').append('<div style="height:11px" class="_DT_blank" ></div>')  //当使用控件PT的时候，为底部增加10px的div，  xudihui  2015.01.27
										   } 
                                         }
									     else{
									      dgwidget.setHeight(perHeight - 68);
									     }	
									}
								} else {
									if(WOM.inventoryRecords.inventoryRecord.itemEdit.initCount <= 2) {
										setTimeout(function(){WOM.inventoryRecords.inventoryRecord.itemEdit.initSize();}, 200);
										WOM.inventoryRecords.inventoryRecord.itemEdit.initCount++;
									}/* else {
										WOM.inventoryRecords.inventoryRecord.itemEdit.initCount = 0;
									}*/
								}
							}
						}
					} else {
						if(thisHeight < conHeight){ //当此页签下面的实际内容高度小于分配给它的高度
						    $(this).parent().height(conHeight);
						}
						else{     //当此页签下面的实际内容高度大于分配给它的高度
							$(this).parent().height(conHeight);
							if(($("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div .edit-workflow").length > 0) && ($("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
							 $(this).parent().height(conHeight-14); //有处理结果浮动层的时候，底部留白14像素
							}	
							$(this).parent().css("overflow-y","auto");
						}
					}
					/*
					// 文档申明换成更标准的之后,这个问题不会出现在真实的ie8及以上的浏览器中, 这里的算法会产生其他问题BugID=18197,先注释掉这段代码，后面如果有需要再调整这块代码 ———— lidong
					if($(this).parent().css("overflow-y")=="auto"){  //IE7 下面当内容出现滚动条的时候，不会主动去腾出滚动条的宽度，需要手动计算
						if(YAHOO.env.ua.ie < 8 ){
	                         var width = parseInt($(window).width());
							if($("#edit_side_btn").length>0){
							   $("#edit_side_btn").hasClass('edit-side-btn-r') ? width = width : width = width-145;
							}
							if($('.edit-tabs').length>0){
							   width = width*0.98; //IE7下面把总宽度的98%赋值给它的分配宽度，保持跟IE高版本一致
							}
							var style = ';width:' + (width-48) + 'px;';  //IE7下面把它的分配宽度再减去右侧滚动条的宽度
							$(this).attr('style',style);
							$(this).parent().parent().find('.edit-datatable').each(function(){ //IE7下面如果pt内容为空，直接隐藏，不然会有一个默认高度
								if($(this).html() ==''){$(this).css('display','none');}
							});
						}					
					}
					*/						
				});
			}
WOM.inventoryRecords.inventoryRecord.itemEdit.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.inventoryRecords.inventoryRecord.itemEdit.otherParams = {};
	WOM.inventoryRecords.inventoryRecord.itemEdit.otherParams.dialogType = dialogType;
	WOM.inventoryRecords.inventoryRecord.itemEdit.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.inventoryRecords.inventoryRecord.itemEdit.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};









(function($){
	$(function(){
	});
})(jQuery);			$(function(){
				$('#WOM_inventoryRecords_inventoryRecord_itemEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.inventoryRecords.inventoryRecord.itemEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.inventoryRecords.inventoryRecord.itemEdit.initSize();
				if(YAHOO.env.ua.ie == 6){
					$("#loading_wrap_first").css("display","block");
				}
				$("#load_mask_first").remove();
				$("#load_iframe_ie_first").remove();
				$("#loading_wrap_first").remove();
				<#if businessCenterList??&&businessCenterList?size gt 0 >
					$(window).resize(function(){
						for(var i=0; i<CUI.DataTable.Arrays.length; i++){
							if( CUI.DataTable.Arrays[i] && document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) &&  $( CUI.DataTable.Arrays[i].container ).is(':visible') ){
								CUI.DataTable.Arrays[i]._initDomElements();
							}else if( CUI.DataTable.Arrays[i] && !document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) ){
								CUI.DataTable.Arrays[i] = null;
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").css("width"),10)==650){
							$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.inventoryRecords.inventoryRecord.itemEdit.resizeLayout();
						//WOM.inventoryRecords.inventoryRecord.itemEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").css("width"),10)==800){
							$("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.inventoryRecords.inventoryRecord.itemEdit.resizeLayout();
						//WOM.inventoryRecords.inventoryRecord.itemEdit.initSize();
						$('body').trigger('resize');
					});
				<#else>	
					$(".main-wrap").css("margin-left",0);
					$(".col-sub").width(0);
					$("#edit_side_btn").css("left",0);
					$(".edit-workflow").css("left",1);
					
				</#if>

				if($("[id$='_dealInfo'] ul.edit-tabs li").length > 0) {
			     	$("[id$='_dealInfo']  ul.edit-tabs").tabs("[id$='_dealInfo']  div.edit-panes > div");
			    }
				var datatableHeight;
				var bh = $(".edit-workflow tr:gt(0)").height();
				<#if pendingId?? || editNew>
				$("#workflow_toggle").toggle(function(){
					$(".edit-workflow tr:gt(0)").hide();
					WOM.inventoryRecords.inventoryRecord.itemEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
					$("body").trigger("resize");
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.inventoryRecords.inventoryRecord.itemEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
					$("body").trigger("resize");
				});
				</#if>
				$(window).resize(function(){WOM.inventoryRecords.inventoryRecord.itemEdit.initSize();});
				/*
				WOM.inventoryRecords.inventoryRecord.itemEdit.resizeLayout=function(){
					CUI("div[class='elm-layout-doc elm-layout-doc-in-wrap']").each(function(){
						var id=CUI(this).attr("id");
						var layoutObj=eval(id+"Widget");
						layoutObj.resize();
					})
				}
				*/
			});
		</script>
		<script type="text/javascript">
		
		$(function(){
		});

		WOM.inventoryRecords.inventoryRecord.itemEdit.validate = function(){
		    <#if dealSet?? && dealSet == 1>
			var cancelItem = $('input[name="workFlowVarStatus"]');
	        validateRequiredFlag = $('input[name="operateType"]').val()=='submit' && (!cancelItem || cancelItem.length == 0 || !(cancelItem.val()=='cancel'));
			if(validateRequiredFlag){
				var comments = $.trim(CUI("#workflow_comments").val());
			 	if(comments != null && comments == ""){
		        	workbenchErrorBarWidget.showMessage("${getText('ec.property.dealinfo.isNotNull')}", 'f');
		        	return false;
				}
			}
		    </#if>
		    return true;
		}
		WOM.inventoryRecords.inventoryRecord.itemEdit.beforeSaveProcess = function(){
			try{eval("savedg1566900683310DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#WOM_inventoryRecords_inventoryRecord_itemEdit_form').trigger('beforeSubmit');
			//inventoryRecord.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="inventoryRecord.extraCol"]').val(extraCol);
		}
		WOM.inventoryRecords.inventoryRecord.itemEdit.processDataGrid = function(){
			//此处还有大量代码删减
		};
		WOM.inventoryRecords.inventoryRecord.itemEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.inventoryRecords.inventoryRecord.itemEdit.validate()){return;}
			WOM.inventoryRecords.inventoryRecord.itemEdit.beforeSaveProcess();

			//WOM.inventoryRecords.inventoryRecord.itemEdit.processDataGrid();
			$('#WOM_inventoryRecords_inventoryRecord_itemEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_inventoryRecords_inventoryRecord_itemEdit_form','WOM_inventoryRecords_inventoryRecord_itemEdit_datagrids')) {      
		            return "${getText('ec.view.losedata')}";      
		        }else{
		        	 if($('#workflow_comments').length!=0){
			        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
			        		return "${getText('ec.view.losedata')}";
			        	}
				     }  
		        }   
	    });
		<#else>
		$(window).bind('beforeunload',function(){
		        if($('#workflow_comments').length!=0){
		        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
		        		return "${getText('ec.view.losedata')}";
		        	}
		        }  		  
		});		
		</#if>
		//打印
		WOM.inventoryRecords.inventoryRecord.itemEdit.print = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				var data="";
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i];
						if(data!=""){
							data = data + "&" + item;
						}else{
							data = item;
						}
					}
				}else{
					data = "mainContent=true&attachmentInfo=true&dealInfo=true";
				}
				data += "&dealInfoGroup=" + $('#dealInfoGroup').val();

				var url = document.location.href;
				// TODO 去掉url后的'#'，将来页面上有锚点时，在打印可能也会有问题
				while(url.endsWith('#')) {
					url = url.substring(0, url.length - 1);
				}
				if(url!=undefined && url != null && url !=''){
					var index = url.indexOf(".action");
					var index0 = url.indexOf(".action?");
					if(index0 != -1){
						data = "&" + data;
					}else{
						data = "?" + data;
					}
					if(index != -1){
						var newUrl = url.substring(0,index) + "Print" + url.substring(index) + data;
						window.open(newUrl);
					}
				}
			}
		}
		
		WOM.inventoryRecords.inventoryRecord.itemEdit.saveSetting = function(){
			var url = "/ec/print/saveSetting.action";
			var value = "mainContent="+$('#mainContent').prop('checked')+ "|attachmentInfo="+$('#attachmentInfo').prop('checked') +  "|dealInfo="+$('#dealInfo').prop('checked');
			var flag = false;
			$.ajax({
				url : url,
				type : 'post',
				async : false,
				data:{"printCookie.value": value, "printCookie.type":$('input[name="viewCode"]').val(),"printCookie.id":$('#printCookie_id').val(),"printCookie.version":$('#printCookie_version').val()},
				success : function(json) {flag = true;}
			});
			return flag;
		}
		
		WOM.inventoryRecords.inventoryRecord.itemEdit.printSetting = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i].split("=");
						if(item[1]=='true'){
							$('#' + item[0]).prop('checked',true);
						}else{
							$('#' + item[0]).prop('checked',false);
						}
					}
				}else{
					$('#mainContent').prop('checked',true);
					$('#dealInfo').prop('checked',true);
					$('#attachmentInfo').prop('checked',true);
				}
				<#if isWorkflow?? && isWorkflow>
				$('td[name="deal"]').show();
				<#else>
				$('td[name="deal"]').hide();
				$('#dealInfo').prop('checked',false);
				</#if>
				<#if isAttachment?? && isAttachment>
				$('td[name="att"]').show();
				<#else>
				$('td[name="att"]').hide();
				$('#attachmentInfo').prop('checked',false);
				</#if>
				WOM.inventoryRecords.inventoryRecord.itemEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.inventoryRecords.inventoryRecord.itemEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.inventoryRecords.inventoryRecord.itemEdit.settingDialog.show();
			}
		}
		
		
		WOM.inventoryRecords.inventoryRecord.itemEdit._callBackInfo = function(res){
			if(res.dealSuccessFlag){
					var showMsg ;
				if(res.operateType == 'save'){
					showMsg = "${getText("ec.common.savesuccessful")}";
				}else{
					showMsg = "${getText("ec.common.saveandclosesuccessful")}";
				}
				
				//提交成功时隐藏之前的错误信息
				workbenchErrorBarWidget.close();
				
				if(containerLoadPanelWidget && containerLoadPanelWidget.loading && YUD.get("loading_wrap")){
 					YUD.get("loading_wrap").innerHTML = "<div class='success-middle'></div>" ;
 				}

 				try{
					window.opener.refreshPortal('workflow');
					window.opener.timeData();
				}catch(e){
					try{
 						window.opener.WOM.inventoryRecords.inventoryRecord.editCallBackInfo(res); 						
					}catch(e2){
						try{
							if(typeof window.opener.refViewRefresh == 'function'){
								window.opener.refViewRefresh()
							} else {
								window.opener.location.reload();
							}
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.inventoryRecords.inventoryRecord.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.inventoryRecords.inventoryRecord.itemEdit._refViewCode_IE = viewCode;
			} else {
				WOM.inventoryRecords.inventoryRecord.itemEdit._refViewCode_IE = '';
			}
			WOM.inventoryRecords.inventoryRecord.itemEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.inventoryRecords.inventoryRecord.itemEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.inventoryRecords.inventoryRecord.itemEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.inventoryRecords.inventoryRecord.itemEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.inventoryRecords.inventoryRecord.itemEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.inventoryRecords.inventoryRecord.itemEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.inventoryRecords.inventoryRecord.itemEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.inventoryRecords.inventoryRecord.itemEdit.gridEventObj = gridEventObj;
				callbackName = "WOM.inventoryRecords.inventoryRecord.itemEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.inventoryRecords.inventoryRecord.itemEdit.getMultiselectCallBackInfo_DG" : "WOM.inventoryRecords.inventoryRecord.itemEdit.getcallBackInfo_DG";
				WOM.inventoryRecords.inventoryRecord.itemEdit._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.inventoryRecords.inventoryRecord.itemEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.inventoryRecords.inventoryRecord.itemEdit._prefix = _prefix.substring(1);
			}
			
			WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid = oGrid;
			WOM.inventoryRecords.inventoryRecord.itemEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.inventoryRecords.inventoryRecord.itemEdit._refViewCode = oColumn.viewCode;
				} else {
					WOM.inventoryRecords.inventoryRecord.itemEdit._refViewCode = '';
				}
			} else {
				WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp = false;
				WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames = '';
				WOM.inventoryRecords.inventoryRecord.itemEdit._refViewCode = '';
			}
			if (WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp == true && WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.inventoryRecords.inventoryRecord.itemEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack = customCallBack;
			}
			if(WOM.inventoryRecords.inventoryRecord.itemEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.inventoryRecords.inventoryRecord.itemEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.inventoryRecords.inventoryRecord.itemEdit._querycustomFuncN == "function") {
				refparam += WOM.inventoryRecords.inventoryRecord.itemEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.inventoryRecords.inventoryRecord.itemEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.inventoryRecords.inventoryRecord.itemEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.inventoryRecords.inventoryRecord.itemEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.inventoryRecords.inventoryRecord.itemEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.inventoryRecords.inventoryRecord.itemEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.inventoryRecords.inventoryRecord.itemEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.inventoryRecords.inventoryRecord.itemEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.inventoryRecords.inventoryRecord.itemEdit.query_"+obj+")!='undefined'") ? eval('WOM.inventoryRecords.inventoryRecord.itemEdit.query_'+obj+'()') : null;
			return str;
		};
		WOM.inventoryRecords.inventoryRecord.itemEdit.getcallBackGroupInfo = function(obj){
			var ids = "";
			var names = "";
			for(var i = 0 ; i < obj.length; i++){
				ids += "," + obj[i].id;
				names += "," + obj[i].name;
			}
			if(ids){ids = ids.substring(1);}
			if(names){names = names.substring(1);}
			$('#groupInfoIds').val(ids);
			$('#groupInfos').val(names);
			WOM.inventoryRecords.inventoryRecord.itemEdit._dialog.close();
		}
		WOM.inventoryRecords.inventoryRecord.itemEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_inventoryRecords_inventoryRecord_itemEdit_form',obj[0], WOM.inventoryRecords.inventoryRecord.itemEdit._prefix, WOM.inventoryRecords.inventoryRecord.itemEdit._sUrl);
			CUI.commonFills('WOM_inventoryRecords_inventoryRecord_itemEdit_form',WOM.inventoryRecords.inventoryRecord.itemEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.inventoryRecords.inventoryRecord.itemEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack) {
					eval(WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack);
					WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.inventoryRecords.inventoryRecord.itemEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.inventoryRecords.inventoryRecord.itemEdit.getcallBackInfo_DG_IE = function(obj){
			if(WOM.inventoryRecords.inventoryRecord.itemEdit._customBeforeCallBack) {
				var flag = eval(WOM.inventoryRecords.inventoryRecord.itemEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.inventoryRecords.inventoryRecord.itemEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp_IE == true && WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.inventoryRecords.inventoryRecord.itemEdit._sUrl,WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.inventoryRecords.inventoryRecord.itemEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp_IE == true && WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if ( tagName == (rootKey + 'MainDisplay') ) {
						try{
							var showVal = eval('jsonObj.' + showName);
						}catch(e){
							var showVal = eval('jsonObj["' + showName + '"]');
						}
						if (showVal != undefined ) {
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,showVal);
						} else {
							try {
								var trueVal = eval('jsonObj.' + trueName);
							} catch(e) {
								var trueVal = eval('jsonObj["' + trueName + '"]');
							}
							trueVal = ( trueVal != undefined ? trueVal : '' );
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
						}
					} else if ( tagName == rootKey ) {
						try{
							var trueVal = eval('jsonObj.' + trueName);
						}catch(e){
							var trueVal = eval('jsonObj["' + trueName + '"]');
						}
						trueVal = ( trueVal != undefined ? trueVal : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
					}
				}
			} else {
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if( tagName.indexOf(rootKey) == 0 ){
						try{
							var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
						}catch(e){
							var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
						}
						//判断符合条件的key是否存在
						value = ( value != undefined ? value : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);			
					}
				}
			}
			// 自定义字段参照回填
			if ( $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).length > 0 ) {
				var dg_cp_info = $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).val();
				var id = jsonObj.id;
				var relationMap;
				if (dg_cp_info && id && WOM.inventoryRecords.inventoryRecord.itemEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.inventoryRecords.inventoryRecord.itemEdit._refViewCode_IE + '&id=' + id,
						success : function(res){
							if (res.dealSuccessFlag && res.relationMap) {
								relationMap = res.relationMap;
							}
						}
					});
					if (relationMap) {
						var objs = new Object();
						var infoArr = dg_cp_info.split(',');
						for (var n in infoArr) {
							var info = infoArr[n].split('||');
							var key = info[0];
							var name = info[1];
							var propCode = '';
							if (info.length > 2) {
								propCode = info[2];
							}
							var val = relationMap[key];
							if (val) {
								objs[name] = val;
								if (propCode) {
									$.ajax({
										async   : false,
										type    : 'POST',
										url     : '/foundation/customProp/getMainDisplayValue.action',
										data    : 'code=' + propCode + '&id=' + val,
										success : function(res){
											if (res.dealSuccessFlag && res.displayValue) {
												var displayName = name + 'MainDisplay';
												objs[displayName] = res.displayValue;
											}
										}
									});
								}
							}
						}
						// console.log(objs);
						if (objs) {
							for( var i = 0; i < xmlHead.children().length; i++ ){
								var tagName = xmlHead.children()[i].tagName;
								try{
									var value = eval('objs.' + tagName);
								}catch(e){
									var value = eval('objs["' + tagName + '"]');
								}
								if( value != undefined ){
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}else if( objs.hasOwnProperty(  tagName  ) ){
									value = '';
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}								
							}
						}
					}
				}
			}
			try{
				if(WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack) {
					eval(WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack);
					WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.inventoryRecords.inventoryRecord.itemEdit._dialog.close();
			} catch(e){}
			
			try{
				var errorMsg = ''
				for ( var item in  CUI.error_msg_DG_CP_map ){
					errorMsg += ( '<b>' + gridEventObj.oGrid._DT._oGrid.ColGetProperty(item,'caption') +  '</b>第<b>' + ( gridEventObj.nRow + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
				}
				if( errorMsg ){
					workbenchErrorBarWidget.showMessage( errorMsg );
				}	
			}catch(e){};
			
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		WOM.inventoryRecords.inventoryRecord.itemEdit.getcallBackInfo_DG = function(obj){
			if(WOM.inventoryRecords.inventoryRecord.itemEdit._customBeforeCallBack) {
				var flag = eval(WOM.inventoryRecords.inventoryRecord.itemEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.inventoryRecords.inventoryRecord.itemEdit._currRow).next().length==0){
						WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid.addNewRow();
					}	
					WOM.inventoryRecords.inventoryRecord.itemEdit._currRow = $(WOM.inventoryRecords.inventoryRecord.itemEdit._currRow).next();
					$(WOM.inventoryRecords.inventoryRecord.itemEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.inventoryRecords.inventoryRecord.itemEdit._currRow,obj[i], WOM.inventoryRecords.inventoryRecord.itemEdit._prefix, WOM.inventoryRecords.inventoryRecord.itemEdit._sUrl);
				if (WOM.inventoryRecords.inventoryRecord.itemEdit._isObjCustomProp == true && WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.inventoryRecords.inventoryRecord.itemEdit._currRow,WOM.inventoryRecords.inventoryRecord.itemEdit._prefix,obj[i],WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid,WOM.inventoryRecords.inventoryRecord.itemEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.inventoryRecords.inventoryRecord.itemEdit._currRow,WOM.inventoryRecords.inventoryRecord.itemEdit._prefix,obj[i],WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.inventoryRecords.inventoryRecord.itemEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.inventoryRecords.inventoryRecord.itemEdit._refViewCode + '&id=' + id,
							success : function(res){
								if (res.dealSuccessFlag && res.relationMap) {
									relationMap = res.relationMap;
								}
							}
						});
						if (relationMap) {
							var objs = new Object();
							var infoArr = dg_cp_info.split(',');
							for (var n in infoArr) {
								var info = infoArr[n].split('||');
								var key = info[0];
								var name = info[1];
								var propCode = '';
								if (info.length > 2) {
									propCode = info[2];
								}
								var val = relationMap[key];
								if (val) {
									name = WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid.configs.hidekeyPrefix + name;
									objs[name] = val;
									if (propCode) {
										$.ajax({
											async   : false,
											type    : 'POST',
											url     : '/foundation/customProp/getMainDisplayValue.action',
											data    : 'code=' + propCode + '&id=' + val,
											success : function(res){
												if (res.dealSuccessFlag && res.displayValue) {
													var displayName = name + 'MainDisplay';
													objs[displayName] = res.displayValue;
												}
											}
										});
									}
								}
							}
							// console.log(objs);
							if (objs) {
								CUI.commonFills_DG_CP(WOM.inventoryRecords.inventoryRecord.itemEdit._currRow, objs, WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack) {
					eval(WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack);
					WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.inventoryRecords.inventoryRecord.itemEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.inventoryRecords.inventoryRecord.itemEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.inventoryRecords.inventoryRecord.itemEdit._oGrid, WOM.inventoryRecords.inventoryRecord.itemEdit._currRow, WOM.inventoryRecords.inventoryRecord.itemEdit._key, WOM.inventoryRecords.inventoryRecord.itemEdit._displayFieldName, obj[i])
			}
			try{
				if(WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack) {
					eval(WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack);
					WOM.inventoryRecords.inventoryRecord.itemEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.inventoryRecords.inventoryRecord.itemEdit._dialog.close();
			} catch(e){}
		};
		
		WOM.inventoryRecords.inventoryRecord.itemEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.inventoryRecords.inventoryRecord.itemEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_inventoryRecords_inventoryRecord_itemEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.inventoryRecords.inventoryRecord.itemEdit.onloadForProduct();
		});

		WOM.inventoryRecords.inventoryRecord.itemEdit.beforeSubmitMethodSettingInPage = function(){
			WOM.inventoryRecords.inventoryRecord.itemEdit.onsaveForProduct();
		};
		WOM.inventoryRecords.inventoryRecord.itemEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.inventoryRecords.inventoryRecord.itemEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.inventoryRecords.inventoryRecord.itemEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
			var id="#otherContentDiv_"+relatingModelCode;
			if(url.indexOf('?')==-1){
				url+="?mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}else{
				url+="&mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}
			if(showType == 'PART') {
				url += "&viewShowType=" + showType;
			}
			url += "&useInBusiness=yes";
			$('div[id^="otherContentDiv_"]').each(function(){
				CUI(this).hide();
			});
			CUI(id).show();
			if(CUI(id).html() == null || $.trim(CUI(id).html()) == ""){
				CUI(id).load(url);
				setTimeout(function(){
					CUI("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").hide();
				},100);
				//CUI("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.inventoryRecords.inventoryRecord.itemEdit.showThis = function(){
			if(!CUI("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").is(':visible')) {
				CUI("#WOM_inventoryRecords_inventoryRecord_itemEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.inventoryRecords.inventoryRecord.itemEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.inventoryRecords.inventoryRecord.itemEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_inventoryRecords_inventoryRecord_itemEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_inventoryRecords_InventoryRecord&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.inventoryRecords.inventoryRecord.itemEdit.auditDialog.show();
			</#if>
		}
		
		
		WOM.inventoryRecords.inventoryRecord.itemEdit.showInfoDialog=function(mode){
			
			WOM.inventoryRecords.inventoryRecord.itemEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_inventoryRecords_inventoryRecord_itemEdit_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.inventoryRecords.inventoryRecord.itemEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.inventoryRecords.inventoryRecord.itemEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_inventoryRecords");
			}
		}
		
		WOM.inventoryRecords.inventoryRecord.itemEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/inventoryRecords/inventoryRecord/dealInfo-list.action&dlTableInfoId=${(inventoryRecord.tableInfoId)?default('')}");
			}
		}
		WOM.inventoryRecords.inventoryRecord.itemEdit.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
			     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
			    var browser=navigator.appName 
				var b_version=navigator.appVersion 
				var version=b_version.split(";"); 
				var trim_Version=version[1].replace(/[ ]/g,""); 
				if((browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")){
				   CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_inventoryRecords_InventoryRecord&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(inventoryRecord.tableInfoId)?default('')}");
				}else{
				   CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_inventoryRecords_InventoryRecord&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(inventoryRecord.tableInfoId)?default('')}");
				}		
			}
		}
		WOM.inventoryRecords.inventoryRecord.itemEdit.supervision=function(){
			WOM.inventoryRecords.inventoryRecord.itemEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(inventoryRecord.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.inventoryRecords.inventoryRecord.itemEdit.modifyOwnerStaffDialog.show();
		}
		





		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_inventoryRecords_itemEdit,js,WOM_7.5.0.0_inventoryRecords_InventoryRecord,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		WOM.inventoryRecords.inventoryRecord.itemEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_inventoryRecords_itemEdit,onloadForProduct,WOM_7.5.0.0_inventoryRecords_InventoryRecord,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.inventoryRecords.inventoryRecord.itemEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_inventoryRecords_itemEdit,onsaveForProduct,WOM_7.5.0.0_inventoryRecords_InventoryRecord,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}
		


		</script>
		<script type="text/javascript">
		
		var __last_click_item = null;
		$(".edit-tabs li").click(function(){
			var li = $(this);
			var ul=$("#flowHead").parent()[0];
			if(__last_click_item != null){
				$(ul).children().eq(__last_click_item).next().addClass("bar");
			}
			if(__last_click_item == null){
				__last_click_item = li.index();
			}
			__last_click_item = li.index();
			if(li.index() == ($(".edit-tabs li").length-1)){
			}else{
				li.next().removeClass("bar");
			}
			if(li.index() != 0){
				li.addClass("bar");
			}
			// 触发 resize 事件, 解决用户在其他页签下缩放窗口后，再切换回来时pt等元素宽度会对不上
			setTimeout( function(){
				$(window).trigger('resize');
			}, 100)
		})
		
		</script>
		<script type="text/javascript">
			$(function(){
				$(".edit-btn").hover(
				  function () {
					$(this).addClass("edit-btn-hover");
				  },
				  function () {
					$(this).removeClass("edit-btn-hover");
				  });
				  $(".edit-btn").mousedown(
				  function () {
					$(this).addClass("edit-btn-click");
				  });
				  $(".edit-btn").mouseup(
				  function () {
					$(this).removeClass("edit-btn-click");
				  });
			});
			function calWidthInPercent(el) {
			    var w = 0;
			    if (typeof getComputedStyle === 'function') {
			        w = getComputedStyle(el).getPropertyValue('width');
			    } else if (el.currentStyle) {
			        w = el.currentStyle.width;
			    }
			    if (/%$/.test(w)) {
			    	var parentW = calWidthInPercent($(el).parent()[0]);
			        w = parseFloat(w) * parentW / 100;
			        w = Math.floor(w);
			    } else if (/px$/.test(w)) {
			        w = parseFloat(w);
			    }  else if (w === 'auto') {
					w = $(el).width();
				}
			    return w;
			}
			
			YAHOO.util.Event.onDOMReady(function() {
				//自动触发当前页签下面的页签的第一个li
				$(".edit-content ul.edit-tabs:eq(0)").each(function(){
					$(this).children("li:eq(0)").trigger('click');		
				});
			});
		</script>
		
		</@s.form>
		<#if businessCenterList??&&businessCenterList?size gt 0 >
		<script type="text/javascript">
			$(function(){
				$(".col-sub").css("display","block");
				$(".main-wrap").css("margin-left",145);
			})
		</script>
		<div class="col-sub">
			<div id="edit_side_btn" class="edit-side-btn"></div>
			<div class="edit-sidebar" id="edit_sidebar" style='height:1000px;'>
			<div class="edit-sidebar-inner" style='height:1000px;'>
				<div class="sidebar-top"><a href="#"  onclick="WOM.inventoryRecords.inventoryRecord.itemEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.inventoryRecords.inventoryRecord.itemEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(inventoryRecord.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
							</#if>
						</li>
					    </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
		<div id="extraAdvQuery" style="display:none;"></div>
	<div id="printSettingDiv" style="display:none;width:100%;height:100%;text-align:center">
		<input type="hidden" id="printCookie_id" />
		<input type="hidden" id="printCookie_version" />
		<table width="100%" height="100%" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="td_right">
					<input type="checkbox" name="mainContent" id="mainContent" checked="checked" />
				</td>
				<td class="td_left">
					<label>正文</label>
				</td>
				<td class="td_right" name="att">
					<input type="checkbox" name="attachmentInfo" id="attachmentInfo" checked="checked"/>
				</td>
				<td class="td_left" name="att">
					<label>附件信息</label>
				</td>
				<td class="td_right" name="deal">
					<input type="checkbox" name="dealInfo" id="dealInfo" checked="checked"/>
				</td>
				<td class="td_left" name="deal">
					<label>处理意见</label>
				</td>
			</tr>
		</table>
	</div>
		<!--[if IE 6]><div style="clear:both;"></div><![endif]-->
		<iframe style="display:none;" id="downloadFrame" src="about:blank"/>
	</body>
</html>