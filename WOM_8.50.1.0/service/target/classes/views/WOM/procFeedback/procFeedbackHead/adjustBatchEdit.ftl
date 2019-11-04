<!-- WOM_7.5.0.0/procFeedback/adjustBatchEdit -->
<#assign isExtra = true>
<#assign isExtraView = false>
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "WOM_procFeedback_procFeedbackHead">
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
        <#assign configTitle = getText('WOM.viewtitle.randon1542185861908')>
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
		#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		.quick_query_content h4{
			text-align: left;
		}
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.procFeedback.procFeedbackHead.adjustBatchEdit');
			CUI.ns('myCharts');
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.currentUser = ${userJson};
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.currentStaff = ${staffJson};
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.currentDepartment = ${deptJson};
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.currentPosition = ${postJson};
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.currentCompany = ${compJson};
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
					$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").css("width",800);
					$(".edit-head").css("width",800);
					$(".edit-workflow").css("width",800);
					$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
				}else{
					$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").css("width",650);
					$(".edit-head").css("width",650);
					$(".edit-workflow").css("width",650);
					$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
				}
			}
			else {
				if (YAHOO.env.ua.ie == "6") {
					$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").css("width",w1);
					$(".edit-workflow").css("width",w1);
				}else{
					$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").css("width","auto");
					$(".edit-workflow").css("width","auto");
				}
				$("body").css({"overflow-x":"hidden"});
				$(".edit-head").css("width","auto");
			}
		});
	});
	</script>
		
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_adjustBatchEdit,head,WOM_7.5.0.0_procFeedback_ProcFeedbackHead,WOM_7.5.0.0) -->
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
		<@s.form errorBarId="workbenchErrorBar" hiddenField="procFeedbackHead.product.id,procFeedbackHead.taskId.id,procFeedbackHead.staffID.id,procFeedbackHead.adjustDealRecord.id," onsubmitMethod="WOM.procFeedback.procFeedbackHead.adjustBatchEdit.beforeSubmitMethod()" id="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" namespace="/WOM/procFeedback/procFeedbackHead/adjustBatchEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_procFeedback_ProcFeedbackHead&_bapFieldPermissonModelName_=ProcFeedbackHead" callback="WOM.procFeedback.procFeedbackHead.adjustBatchEdit._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div">
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
									<#if !((procFeedbackHead.status)?? && procFeedbackHead.status == 77)>
									<#if id?? || isExtraView>
									</#if>
									
									<a class='cui-btn-new' id="edit-save-btn" onclick="WOM.procFeedback.procFeedbackHead.adjustBatchEdit.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
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
												WOM.procFeedback.procFeedbackHead.adjustBatchEdit.submit(true);
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
										<#if auditCheck('WOM_7.5.0.0_procFeedback_adjustBatchEdit') == '1'>
										<li id="fr_audit" ><a title='${getText("foundation.base.audit")}' onclick="WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showAudit()">
										<span class='icon_audit' ></span>
										</a></li>
										</#if>
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form_attcount"></em></i></span>
										</a></li>
									</ul>
								</div>
							</div>
							</#if>
							 
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
							</div>
					</div>
    					<div class="edit-main" id="WOM_procFeedback_procFeedbackHead_adjustBatchEdit">
    						<div class="edit-content">
    							<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="adjustBatchEdit">
								<input type="hidden" name="datagridKey" value="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_datagrids">
								<input type="hidden" name="viewCode" value="WOM_7.5.0.0_procFeedback_adjustBatchEdit">
								<input type="hidden" name="modelName" value="ProcFeedbackHead">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="procFeedbackHead.version" value="${(procFeedbackHead.version)!0}" />
								<input type="hidden" name="procFeedbackHead.extraCol" value='' />
								<input type="hidden" name="operateType" id="operateType" />
								<input type="hidden" name="uploadDocIds" value="${uploadDocIds!''}">
								<input type="hidden" name="refViewRefresh" value=''>
								<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
										<input type="hidden" name="procFeedbackHead.product.id" value="${(procFeedbackHead.product.id)!""}" originalvalue="${(procFeedbackHead.product.id)!""}"/>
										<input type="hidden" name="procFeedbackHead.taskId.id" value="${(procFeedbackHead.taskId.id)!""}" originalvalue="${(procFeedbackHead.taskId.id)!""}"/>
										<input type="hidden" name="procFeedbackHead.staffID.id" value="${(procFeedbackHead.staffID.id)!""}" originalvalue="${(procFeedbackHead.staffID.id)!""}"/>
										<input type="hidden" name="procFeedbackHead.adjustDealRecord.id" value="${(procFeedbackHead.adjustDealRecord.id)!""}" originalvalue="${(procFeedbackHead.adjustDealRecord.id)!""}"/>
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
													$("#ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_tabs-1").height(height);
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
														$("#ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_tabs-1").height(height);
													});	
												});
												</script>
												<div id='ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_tabs-1' style="">
				<script type="text/javascript">
			$(function(){
				$.extraLayout($("#ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_column-10").parent(),{nums:2,method:"column",topBlock:true,bottomBlock:false,topBlockHeight:220,heights:[60,40],layoutType:'classic'});
			});
		</script>
				 <div id="ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_tfixed-2" class='extra-layout tb-fixed' style="border:none; height:220px;width:99%;"> 
			
					
							<script>
								$(function(){
									$("[id='ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_tfixed-2']").css("overflow","auto");
								});
							</script>
							<div style="width:98%;margin-left:2%;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon154095338576111')}" >${getText('WOM.propertydisplayName.randon154095338576111')}</label>
				</td>
				
						<#assign procFeedbackHead_staffID_name_defaultValue  = ''>
												<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${procFeedbackHead_staffID_name_defaultValue!}" conditionfunc="WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc('procFeedbackHead_staffID_name')" view=true  value="${(procFeedbackHead.staffID.name)!}" displayFieldName="name" name="procFeedbackHead.staffID.name" id="procFeedbackHead_staffID_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_procFeedbackHead_staffID_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (procFeedbackHead_staffID_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form',obj, 'procFeedbackHead.staffID', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form', 'procFeedbackHead.staffID',obj,true);
											$('input:hidden[name="procFeedbackHead.staffID.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(procFeedbackHead.id)?? && (procFeedbackHead.staffID.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${procFeedbackHead.staffID.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form',obj, 'procFeedbackHead.staffID', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form', 'procFeedbackHead.staffID',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540953385761112')}" >${getText('WOM.propertydisplayName.randon1540953385761112')}</label>
				</td>
				
						<#assign procFeedbackHead_createTime_defaultValue  = 'currentTime'>
							 					<#if (procFeedbackHead_createTime_defaultValue)?? &&(procFeedbackHead_createTime_defaultValue)?has_content>
							<#assign procFeedbackHead_createTime_defaultValue  = getDefaultDateTime(procFeedbackHead_createTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(procFeedbackHead.createTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="procFeedbackHead.createTime" value="${procFeedbackHead_createTime_defaultValue!}" type="dateTime"  id="procFeedbackHead.createTime"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (procFeedbackHead.createTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="procFeedbackHead.createTime" value="${procFeedbackHead.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="procFeedbackHead.createTime"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="procFeedbackHead.createTime" value="" type="dateTime" id="procFeedbackHead.createTime" cssStyle=""  align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1542192019742')}" >${getText('WOM.propertydisplayName.randon1542192019742')}</label>
				</td>
				
						<#assign procFeedbackHead_adjustDealRecord_processName_defaultValue  = ''>
														<#assign procFeedbackHead_adjustDealRecord_processName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="procFeedbackHead.adjustDealRecord.processName" id="procFeedbackHead_adjustDealRecord_processName"  style=";" originalvalue="<#if !newObj || (procFeedbackHead.adjustDealRecord.processName)?has_content>${(procFeedbackHead.adjustDealRecord.processName?html)!}<#else>${procFeedbackHead_adjustDealRecord_processName_defaultValue!}</#if>" value="<#if !newObj || (procFeedbackHead.adjustDealRecord.processName)?has_content>${(procFeedbackHead.adjustDealRecord.processName?html)!}<#else>${procFeedbackHead_adjustDealRecord_processName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772644833')}" >${getText('WOM.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign procFeedbackHead_product_productCode_defaultValue  = ''>
														<#assign procFeedbackHead_product_productCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="readonly" deValue="${procFeedbackHead_product_productCode_defaultValue!}" conditionfunc="WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc('procFeedbackHead_product_productCode')" view=true  value="${(procFeedbackHead.product.productCode)!}" displayFieldName="productCode" name="procFeedbackHead.product.productCode" id="procFeedbackHead_product_productCode" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname=";_callback_procFeedbackHead_product_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(procFeedbackHead.id)?? && (procFeedbackHead.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${procFeedbackHead.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form',obj, 'procFeedbackHead.product', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form', 'procFeedbackHead.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion14157727407371122')}" >${getText('WOM.propertydisplayName.radion14157727407371122')}</label>
				</td>
				
						<#assign procFeedbackHead_product_productName_defaultValue  = ''>
														<#assign procFeedbackHead_product_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="procFeedbackHead.product.productName" id="procFeedbackHead_product_productName"  style=";" originalvalue="<#if !newObj || (procFeedbackHead.product.productName)?has_content>${(procFeedbackHead.product.productName?html)!}<#else>${procFeedbackHead_product_productName_defaultValue!}</#if>" value="<#if !newObj || (procFeedbackHead.product.productName)?has_content>${(procFeedbackHead.product.productName?html)!}<#else>${procFeedbackHead_product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1542181804390')}" >${getText('WOM.propertydisplayName.randon1542181804390')}</label>
				</td>
				
						<#assign procFeedbackHead_adjustDealRecord_acticeName_defaultValue  = ''>
														<#assign procFeedbackHead_adjustDealRecord_acticeName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1542192090052')}" viewType="readonly" deValue="${procFeedbackHead_adjustDealRecord_acticeName_defaultValue!}" conditionfunc="WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc('procFeedbackHead_adjustDealRecord_acticeName')" view=true  value="${(procFeedbackHead.adjustDealRecord.acticeName)!}" displayFieldName="acticeName" name="procFeedbackHead.adjustDealRecord.acticeName" id="procFeedbackHead_adjustDealRecord_acticeName" type="other" url="/WOM/produceTask/adjustOrTempRecords/adjustActiveRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_produceTask_adjustActiveRef"  onkeyupfuncname=";_callback_procFeedbackHead_adjustDealRecord_acticeName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(procFeedbackHead.id)?? && (procFeedbackHead.adjustDealRecord.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${procFeedbackHead.adjustDealRecord.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form',obj, 'procFeedbackHead.adjustDealRecord', '/WOM/produceTask/adjustOrTempRecords/adjustActiveRef.action');
												CUI.commonFills('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form', 'procFeedbackHead.adjustDealRecord',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('X6Basic.propertydisplayName.radion1398235640483')}" >${getText('X6Basic.propertydisplayName.radion1398235640483')}</label>
				</td>
				
						<#assign procFeedbackHead_product_productBaseUnit_name_defaultValue  = ''>
														<#assign procFeedbackHead_product_productBaseUnit_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="procFeedbackHead.product.productBaseUnit.name" id="procFeedbackHead_product_productBaseUnit_name"  style=";" originalvalue="<#if !newObj || (procFeedbackHead.product.productBaseUnit.name)?has_content>${(procFeedbackHead.product.productBaseUnit.name?html)!}<#else>${procFeedbackHead_product_productBaseUnit_name_defaultValue!}</#if>" value="<#if !newObj || (procFeedbackHead.product.productBaseUnit.name)?has_content>${(procFeedbackHead.product.productBaseUnit.name?html)!}<#else>${procFeedbackHead_product_productBaseUnit_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1542098129762')}" >${getText('WOM.propertydisplayName.randon1542098129762')}</label>
				</td>
				
						<#assign procFeedbackHead_adjustDealRecord_startTime_defaultValue  = ''>
														<#assign procFeedbackHead_adjustDealRecord_startTime_defaultValue  = ''>
					<#if (procFeedbackHead_adjustDealRecord_startTime_defaultValue)?? &&(procFeedbackHead_adjustDealRecord_startTime_defaultValue)?has_content>
							<#assign procFeedbackHead_adjustDealRecord_startTime_defaultValue  = getDefaultDateTime(procFeedbackHead_adjustDealRecord_startTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(procFeedbackHead.adjustDealRecord.startTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="procFeedbackHead.adjustDealRecord.startTime" value="${procFeedbackHead_adjustDealRecord_startTime_defaultValue!}" type="dateTime"  id="procFeedbackHead.adjustDealRecord.startTime"  view=true cssStyle=""  />
								
							<#else>
							<#if (procFeedbackHead.adjustDealRecord.startTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="procFeedbackHead.adjustDealRecord.startTime" value="${procFeedbackHead.adjustDealRecord.startTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="procFeedbackHead.adjustDealRecord.startTime"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="procFeedbackHead.adjustDealRecord.startTime" value="" type="dateTime" id="procFeedbackHead.adjustDealRecord.startTime" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1542098149042')}" >${getText('WOM.propertydisplayName.randon1542098149042')}</label>
				</td>
				
						<#assign procFeedbackHead_adjustDealRecord_endTime_defaultValue  = ''>
														<#assign procFeedbackHead_adjustDealRecord_endTime_defaultValue  = ''>
					<#if (procFeedbackHead_adjustDealRecord_endTime_defaultValue)?? &&(procFeedbackHead_adjustDealRecord_endTime_defaultValue)?has_content>
							<#assign procFeedbackHead_adjustDealRecord_endTime_defaultValue  = getDefaultDateTime(procFeedbackHead_adjustDealRecord_endTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(procFeedbackHead.adjustDealRecord.endTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="procFeedbackHead.adjustDealRecord.endTime" value="${procFeedbackHead_adjustDealRecord_endTime_defaultValue!}" type="dateTime"  id="procFeedbackHead.adjustDealRecord.endTime"  view=true cssStyle=""  />
								
							<#else>
							<#if (procFeedbackHead.adjustDealRecord.endTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="procFeedbackHead.adjustDealRecord.endTime" value="${procFeedbackHead.adjustDealRecord.endTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="procFeedbackHead.adjustDealRecord.endTime"  view=true cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="procFeedbackHead.adjustDealRecord.endTime" value="" type="dateTime" id="procFeedbackHead.adjustDealRecord.endTime" cssStyle=""  view=true/>
								
							</#if>
							</#if>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1542351209071')}" >${getText('WOM.propertydisplayName.randon1542351209071')}</label>
				</td>
				
						<#assign procFeedbackHead_adjustDealRecord_recordDataSource_defaultValue  = ''>
														<#assign procFeedbackHead_adjustDealRecord_recordDataSource_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${procFeedbackHead_adjustDealRecord_recordDataSource_defaultValue!}" formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="procFeedbackHead.adjustDealRecord.recordDataSource.id" code="womActiveSource" value="${(procFeedbackHead.adjustDealRecord.recordDataSource.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="procFeedbackHead.adjustDealRecord.recordDataSource.id" code="womActiveSource" value="${(procFeedbackHead.adjustDealRecord.recordDataSource.id)!}"  />
									
								</#if>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1542182374652')}" >${getText('WOM.propertydisplayName.randon1542182374652')}</label>
				</td>
				
						<#assign procFeedbackHead_adjustDealRecord_activeType_defaultValue  = ''>
														<#assign procFeedbackHead_adjustDealRecord_activeType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${procFeedbackHead_adjustDealRecord_activeType_defaultValue!}" formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="procFeedbackHead.adjustDealRecord.activeType.id" code="activeType" value="${(procFeedbackHead.adjustDealRecord.activeType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="procFeedbackHead.adjustDealRecord.activeType.id" code="activeType" value="${(procFeedbackHead.adjustDealRecord.activeType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1542245224304')}" >${getText('WOM.propertydisplayName.randon1542245224304')}</label>
				</td>
				
						<#assign procFeedbackHead_isAgile_defaultValue  = ''>
							 							<#assign procFeedbackHead_isAgile_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
									<div class="fix-search-click">
										<select property_type="BOOLEAN" class="edit-select" originalvalue="<#if !newObj>${(procFeedbackHead.isAgile!false)?string('true','false')}<#elseif procFeedbackHead_isAgile_defaultValue?has_content>${(procFeedbackHead_isAgile_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj>${(procFeedbackHead.isAgile!false)?string('true','false')}<#else>${(procFeedbackHead_isAgile_defaultValue!true)?string}</#if>" style=";" name="procFeedbackHead.isAgile" > 
											<option value=""></option>
											<#if (newObj?? && !newObj)>
											<#if (procFeedbackHead.isAgile)??>
											<option value="true" <#if (procFeedbackHead.isAgile!false)?string('true','false')=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (procFeedbackHead.isAgile!false)?string('true','false')=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											<#else>
											<option value="true">${getText('ec.select.yes')}</option>
											<option value="false">${getText('ec.select.no')}</option>
											</#if>
											<#else>
											<option value="true" <#if (procFeedbackHead_isAgile_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (procFeedbackHead_isAgile_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</#if>
										</select>
									</div>
									<script type="text/javascript">
										$(function(){
											$('select[name="procFeedbackHead.isAgile"]').disabledSelect();
										});
									</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
						<#assign procFeedbackHead_taskId_manuOrderMain_id_defaultValue  = ''>
														<#assign procFeedbackHead_taskId_manuOrderMain_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="LONG" mneenable=false reftitle="${getText('WOM.viewtitle.randon1489737198145')}" viewType="${viewType!}" deValue="${procFeedbackHead_taskId_manuOrderMain_id_defaultValue!}" conditionfunc="WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc('procFeedbackHead_taskId_manuOrderMain_id')"  value="${(procFeedbackHead.taskId.manuOrderMain.id)!}" displayFieldName="id" name="procFeedbackHead.taskId.manuOrderMain.id" id="procFeedbackHead_taskId_manuOrderMain_id" type="other" url="/WOM/produceTask/produceTask/taskRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_produceTask_taskRef"  onkeyupfuncname=";_callback_procFeedbackHead_taskId_manuOrderMain_id(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(procFeedbackHead.id)?? && (procFeedbackHead.taskId.manuOrderMain.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${procFeedbackHead.taskId.manuOrderMain.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form',obj, 'procFeedbackHead.taskId.manuOrderMain', '/WOM/produceTask/produceTask/taskRef.action');
												CUI.commonFills('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form', 'procFeedbackHead.taskId.manuOrderMain',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1540953226426')}" >${getText('WOM.propertydisplayName.randon1540953226426')}</label>
				</td>
				
						<#assign procFeedbackHead_remark_defaultValue  = ''>
							 							<#assign procFeedbackHead_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="LONGTEXT" id="procFeedbackHead_remark" originalvalue="<#if !newObj || (procFeedbackHead.remark)?has_content>${(procFeedbackHead.remark?html)!}<#else>${procFeedbackHead_remark_defaultValue?html}</#if>"  onpropertychange="setTimeout(function(){autoTextarea('procFeedbackHead_remark',null,null,true)},0)" oninput="setTimeout(function(){autoTextarea('procFeedbackHead_remark',null,null,true)},0)" onkeyup="autoTextarea('procFeedbackHead_remark',null,null,true)" name="procFeedbackHead.remark" class="cui-noborder-textarea cui-textarea-wh" style=";" ><#if !newObj || (procFeedbackHead.remark)?has_content>${(procFeedbackHead.remark)!}<#else>${procFeedbackHead_remark_defaultValue}</#if></textarea></div>
							
							<script type="text/javascript">
								$(function(){
									CUI["procFeedbackHead_remarkcompleteFlag"] = "first";
									autoTextarea("procFeedbackHead_remark");
									//有业务中心的时候,非ie浏览器需要手动再延迟触发一次
									if(YAHOO.env.ua.ie == 0){
										setTimeout(function(){autoTextarea("procFeedbackHead_remark")},200);
									}else{
										setTimeout(function(){autoTextarea("procFeedbackHead_remark")},1000);
									}
								})
							</script>
				</td>
		</tr>
	</table>
							</div>
							 </div>
				 <div id="ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_row-7" class='extra-layout column-fixed' style="border:none; "> 
				<script type="text/javascript">
			$(function(){
				$.extraLayout($("#ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_column-3").parent(),{nums:2,method:"row",leftBlock:false,rightBlock:false,widths:[50,50],layoutType:'classic'});
			});
		</script>
				<div id="ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_row-9" class='extra-layout row-fixed' style=" ">
			
					
			
		
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
	
					<script type="text/javascript">
						function CraftStandards_dg1542186009188_addCraftStandard(event)
												{
	randgeEdit = new CUI.Dialog({
	  title:"工艺参数",
	  formId: "WOM_procFeedback_craftStandards_craftStandardEdit_form",
	  type:2,
	  modal:true,
	  url:'/WOM/procFeedback/craftStandards/craftStandardEdit.action?entityCode=WOM_7.5.0.0_procFeedback',
	  buttons:[
	    { name:"保存",
		    handler:function(){
		    	$('#WOM_procFeedback_craftStandards_craftStandardEdit_form').submit()
		    	$("#CraftRecords_dg1542186009283 .paginatorbar-operatebar a").attr("disabled",true).css("pointer-events","none").find("span").css("color",'grey')
		    }
	    },
	      { name:"取消",
		    handler:function(){
				this.close()
		    }
	    }
	  ]
	 });
	randgeEdit.show();
}
					</script>
					<script type="text/javascript">
						function CraftStandards_dg1542186009188_modifyProcessStandard(event)
												{
	 	if(CraftStandards_dg1542186009188Widget._DT.getSelectedRow().length == 0){
		CUI.Dialog.alert('请选择需要修改的条目！');
		return false;
	}
	randgeEdit = new CUI.Dialog({
	  title:"工艺参数",
	  formId: "WOM_procFeedback_craftStandards_craftStandardEdit_form",
	  type:2,
	  modal:true,
	  url:'/WOM/procFeedback/craftStandards/craftStandardEdit.action?entityCode=WOM_7.5.0.0_procFeedback&id='+CraftStandards_dg1542186009188Widget.getCellValue(CraftStandards_dg1542186009188Widget.getSelectedRow(),'id'),
	  buttons:[
	    { name:"保存",
		    handler:function(){
		    	$('#WOM_procFeedback_craftStandards_craftStandardEdit_form').submit()
		    	CraftRecords_dg1542186009283Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1542186009283.action?procFeedbackHead.id='+$("#id").val() + "&standardID="+0)  
		    	$("#CraftRecords_dg1542186009283 .paginatorbar-operatebar a").attr("disabled",true).css("pointer-events","none").find("span").css("color",'grey');
		    }
	    },
	      { name:"取消",
		    handler:function(){
				this.close()
		    }
	    }
	  ]
	 });
	randgeEdit.show();
}
					</script>
					<script type="text/javascript">
						function CraftStandards_dg1542186009188_deleteRow(event)
												{
		 	if(CraftStandards_dg1542186009188Widget._DT.getSelectedRow().length == 0){
        CUI.Dialog.alert('请选择需要删除的条目！');
		return false;
	}
	var processIds = new Array();
	$.each(CraftStandards_dg1542186009188Widget._DT.getSelectedRow(),function(){
		processIds.push(this.id);
	})
	$.ajax({
	    url : "/WOM/procFeedback/procFeedbackHead/deleteProcessRow.action",
	    type : 'post',
	    async : false,
	    traditional : true,
	    data:{
	        "processIds":processIds,
	    },
	    success : function(data) {
	        if (data.result == "SUCCESS"){
	        	workbenchErrorBarWidget.showMessage('删除成功！','s');
	        	CraftStandards_dg1542186009188Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1542186009188.action?procFeedbackHead.id='+$('#id').val())
				CraftRecords_dg1542186009283Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1542186009283.action?procFeedbackHead.id='+$("#id").val() + "&standardID="+0)
				$("#CraftRecords_dg1542186009283 .paginatorbar-operatebar a").attr("disabled",true).css("pointer-events","none").find("span").css("color",'grey');
	        }           
	    }
	});
}
					</script>
	<#if  refId?? && (refId > 0)>
		<#assign dUrl="/WOM/procFeedback/procFeedbackHead/data-dg1542186009188.action?procFeedbackHead.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009188">
	<#else>
		<#assign dUrl="/WOM/procFeedback/procFeedbackHead/data-dg1542186009188.action?procFeedbackHead.id=${(procFeedbackHead.id)!-1}&datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009188">
	</#if>
	<#assign firstLoad = true>
	<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
		<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1540988105134')}\",handler:function(event){CraftStandards_dg1542186009188_addCraftStandard(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('X6Basic.buttonPropertyshowName.radion1459222528430')}\",handler:function(event){CraftStandards_dg1542186009188_modifyProcessStandard(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.radion1540988470685')}\",handler:function(event){CraftStandards_dg1542186009188_deleteRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
		<#assign canImportExcel=false>
	<#else>
		<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1540988105134')}\",handler:function(event){CraftStandards_dg1542186009188_addCraftStandard(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('X6Basic.buttonPropertyshowName.radion1459222528430')}\",handler:function(event){CraftStandards_dg1542186009188_modifyProcessStandard(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.radion1540988470685')}\",handler:function(event){CraftStandards_dg1542186009188_deleteRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
		<#assign canImportExcel=false>
	</#if>
	
		<#if cpvmInfo?? && cpvmInfo?length gt 0>
			<#assign cpvmInfo = cpvmInfo?substring(1)>
			<input type="hidden" id="dg_cp_info_CraftStandards_dg1542186009188" value="${cpvmInfo!}" />
		</#if>
	
	<input type="hidden" id="dg1542186009188_id" value="CraftStandards_dg1542186009188" />
	
	<input type="hidden" id="dg1542186009188_url" value="${dUrl}" />
	
	<#assign assModelDisplayName = getText('WOM.modelname.randon1540964644168')!>
	<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
	<@exportexcel action="/WOM/procFeedback/procFeedbackHead/data-dg1542186009188.action?operateType=export&datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009188"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="CraftStandards_dg1542186009188" />
	<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="CraftStandards_dg1542186009188" viewType="${viewType}" renderOverEvent="dg1542186009188RenderOverEvent" route="${routeFlag}" formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" noPermissionKeys="craftName,standardValue,remark" modelCode="WOM_7.5.0.0_procFeedback_CraftStandards" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1542186009188" dtPage="dgPage"  hidekeyPrefix="dg1542186009188" hidekey="['id','version'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0  ptRealTimeLoad=1 isExtra=true pageInitMethod="dg1542186009188PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="WOM.buttonPropertyshowName.radion1540988105134,addCraftStandard,add;X6Basic.buttonPropertyshowName.radion1459222528430,modifyProcessStandard,edit;WOM.buttonPropertyshowName.radion1540988470685,deleteRow,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false >
						<@datacolumn key="checkbox" textalign="center" label="" width="30" type="checkbox" checkall="true"/>
					<#assign craftName_displayDefaultType=''>
						<#assign craftName_defaultValue=''>
								<#assign craftName_defaultValue=''>
								  
							<@datacolumn key="craftName"        showFormat="TEXT" defaultValue="${(craftName_defaultValue!)?string}" defaultDisplay="${(craftName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1541034087253')}" width=100 showFormatFunc=""  />
					<#assign standardValue_displayDefaultType=''>
						<#assign standardValue_defaultValue=''>
								<#assign standardValue_defaultValue=''>
								  
							<@datacolumn key="standardValue"        showFormat="TEXT" defaultValue="${(standardValue_defaultValue!)?string}" defaultDisplay="${(standardValue_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1541034112568')}" width=100 showFormatFunc=""  />
					<#assign remark_displayDefaultType=''>
						<#assign remark_defaultValue=''>
								<#assign remark_defaultValue=''>
								  
							<@datacolumn key="remark"        showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1541034061588')}" width=100 showFormatFunc=""  />
	
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
		function CraftStandards_dg1542186009188_check_datagridvalid(){
			//
			var errorObj =CraftStandards_dg1542186009188Widget._DT.testData();
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
		
		function savedg1542186009188DataGrid(){
			<#if  refId?? && (refId gt 0)>
			CraftStandards_dg1542186009188Widget.setAllRowEdited();
			</#if>
			// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
			var changed_pt_name = $('body').data('CHANGED_PT');
			if(changed_pt_name && changed_pt_name.indexOf('CraftStandards_dg1542186009188Widget') > -1) {
				CraftStandards_dg1542186009188Widget.setAllRowEdited();
			}
			var json = CraftStandards_dg1542186009188Widget.parseEditedData();
			$('input[name="dg1542186009188ListJson"]').remove();
			$('input[name="dgLists[\'dg1542186009188\']"]').remove();
			$('input[name="dg1542186009188ModelCode"]').remove();
			$('<input type="hidden" name="dgLists[\'dg1542186009188\']">').val(json).appendTo($('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			$('<input type="hidden" name="dg1542186009188ModelCode">').val('WOM_7.5.0.0_procFeedback_CraftStandards').appendTo($('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			//兼容旧版本提交函数
			$('<input type="hidden" name="dg1542186009188ListJson">').val(json).appendTo($('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
		}
		function DT_CraftStandards_dg1542186009188_deldatagrid(){
			var deleteRows = CraftStandards_dg1542186009188Widget.deleteRows();
			if(!deleteRows || deleteRows.length == 0) {
				CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
				return false;
			}
			var delproperty = "'id','version','procFeedbackID.id','craft.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1542186009188DeletedIds").length>0){
					$("#dg1542186009188DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1542186009188DeletedIds" name="dgDeletedIds[\'dg1542186009188\']" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
				} 
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1542186009188DeletedIds['+CUI('input[name^="dg1542186009188DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			});
			return deleteRows;
		}
		function DT_CraftStandards_dg1542186009188_delTreeNodes(){
			var deleteRows = CraftStandards_dg1542186009188Widget._DT.removeTreeNode();
			if(!deleteRows || deleteRows.length == 0) {
				return false;
			}
			var delproperty = "'id','version','procFeedbackID.id','craft.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1542186009188DeletedIds").length>0){
					$("#dg1542186009188DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1542186009188DeletedIds" name="dgDeletedIds[\'dg1542186009188\']" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
				}
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1542186009188DeletedIds['+CUI('input[name^="dg1542186009188DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			});
		}
		$(function($){
			var datagrids = $('body').data('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_datagrids');
			var length  = 0;
			if(!datagrids) {
				datagrids = [];
			}else{
				length = datagrids.length;
			}
			datagrids[length]=[];
			datagrids[length][0] = 'CraftStandards_dg1542186009188';
			$('body').data('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_datagrids', datagrids);
		});
		var CraftStandards_dg1542186009188_importDialog = null;
		function CraftStandards_dg1542186009188_showImportDialog(){
			try{
				if(CraftStandards_dg1542186009188_importDialog!=null&&CraftStandards_dg1542186009188_importDialog.isShow==1){
					return false;
				}
				var url = "/WOM/procFeedback/procFeedbackHead/initImport.action?datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009188&tid=${id!}&datagridName=dg1542186009188";
					<#if canImportExcel>
						var buttonCode="WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009188_BUTTON_dgImport";
						url+="&buttonCode="+buttonCode;
					</#if>
				CraftStandards_dg1542186009188_importDialog = new CUI.Dialog({
					title: "${getHtmlText('common.button.import')}",
					url:url,
					modal:true,
					description:'',
					height:'330',
					width: '420',
					dragable:true,
					buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("CraftStandards_dg1542186009188"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();CraftStandards_dg1542186009188_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();CraftStandards_dg1542186009188_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
					beforeCloseEvent:function(){$('#importResponse').remove();}
				});
				CraftStandards_dg1542186009188_importDialog.show();
			}catch(e){}
		}	
		
		function CraftStandards_dg1542186009188_downLoadFile(){
			var url = "/WOM/procFeedback/procFeedbackHead/downLoad.action?datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009188&templateRelatedModelCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009188&downloadType=template&fileName=dg1542186009188";
			window.open(url,"","");
		}
		function dg1542186009188RenderOverEvent(){
			checkItemID = 0;
$("#CraftStandards_dg1542186009188_tbody").unbind("click").on("click",'tr',function(){
	$("#CraftRecords_dg1542186009283 .paginatorbar-operatebar a").css("pointer-events",'visiblepainted').find("span").css("color",'black');
    setIndexData()
})

if(!$("#id").val()){
	$("#CraftStandards_dg1542186009188 .paginatorbar-operatebar a").attr("disabled",true).css("pointer-events","none").find("span").css("color",'grey');
}
		}
		function dg1542186009188PageInitMethod(nTabIndex){
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize(nTabIndex);
		}
	</script>
							</div>
				<div id="ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_column-3" class='extra-layout row-fixed' style=" ">
			
					
			
		
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
	
					<script type="text/javascript">
						function CraftRecords_dg1542186009283_addNewRecord(event)
												{
	   var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var browser="";
    if(userAgent.indexOf("Chrome") > -1){
      browser='Chrome';
    }else if(userAgent.indexOf("Firefox") > -1){
      browser="FF";
    }else {
      browser='IE';
    }
    var btColor= $("#CraftRecords_dg1542186009283 .paginatorbar-operatebar a:eq(0) span").css("color");
    if( (browser=='Chrome' || browser=='FF') &&  btColor!="rgb(0, 0, 0)" ){
      return false;
    }else if(  browser=='IE' && btColor!='black'){
        return false;
    }else{
    		  randgeEdit = new CUI.Dialog({
	  title:"工序",
	  formId: "WOM_procFeedback_craftRecords_craftRecordsEdit_form",
	  type:2,
	  modal:true,
	  url:'/WOM/procFeedback/craftRecords/craftRecordsEdit.action?entityCode=WOM_7.5.0.0_procFeedback',
	  buttons:[
	    { name:"保存",
		    handler:function(){
		    	CUI('#WOM_procFeedback_craftRecords_craftRecordsEdit_form').submit();
		    }
	    },
	      { name:"取消",
		    handler:function(){
				this.close()
		    }
	    }
	  ]
	 });
	randgeEdit.show();
}
}
					</script>
					<script type="text/javascript">
						function CraftRecords_dg1542186009283_modifyProcessRecords(event)
												{
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var browser="";
    if(userAgent.indexOf("Chrome") > -1){
      browser='Chrome';
    }else if(userAgent.indexOf("Firefox") > -1){
      browser="FF";
    }else {
      browser='IE';
    }
    var btColor= $("#CraftRecords_dg1542186009283 .paginatorbar-operatebar a:eq(1) span").css("color");
    if( (browser=='Chrome' || browser=='FF') &&  btColor!="rgb(0, 0, 0)" ){
      return false;
    }else if(  browser=='IE' && btColor!='black'){
        return false;
    }else{
    		if (CraftRecords_dg1542186009283Widget._DT.getSelectedRow().length > 1){
		CUI.Dialog.alert('修改操作时不能多选！');
		return false;
	}else if(CraftRecords_dg1542186009283Widget._DT.getSelectedRow().length == 0){
		CUI.Dialog.alert('请选择需要修改的条目！');
		return false;
	}
	randgeEdit = new CUI.Dialog({
	  title:"工艺执行记录",
	  formId: "WOM_procFeedback_craftRecords_craftRecordsEdit_form",
	  type:2,
	  modal:true,
	  url:'/WOM/procFeedback/craftRecords/craftRecordsEdit.action?entityCode=WOM_7.5.0.0_procFeedback&id='+CraftRecords_dg1542186009283Widget.getCellValue(CraftRecords_dg1542186009283Widget.getSelectedRow(),'id'),
	  buttons:[
	    { name:"保存",
		    handler:function(){
		    	$('#WOM_procFeedback_craftRecords_craftRecordsEdit_form').submit()
		    	resetData(CraftRecords_dg1542186009283Widget,"1542186009283",CraftStandards_dg1542186009188Widget.getSelectedRow());
		    }
	    },
	      { name:"取消",
		    handler:function(){
				this.close()
		    }
	    }
	  ]
	 });
	randgeEdit.show();
	}
}
					</script>
					<script type="text/javascript">
						function CraftRecords_dg1542186009283_deleteRow(event)
												{
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var browser="";
    if(userAgent.indexOf("Chrome") > -1){
      browser='Chrome';
    }else if(userAgent.indexOf("Firefox") > -1){
      browser="FF";
    }else {
      browser='IE';
    }
    var btColor= $("#CraftRecords_dg1542186009283 .paginatorbar-operatebar a:eq(2) span").css("color");
    if( (browser=='Chrome' || browser=='FF') &&  btColor!="rgb(0, 0, 0)" ){
      return false;
    }else if(  browser=='IE' && btColor!='black'){
        return false;
    }else{
    	    if (CraftRecords_dg1542186009283Widget._DT.getSelectedRow().length == 0){
        CUI.Dialog.alert('请选择需要删除的条目！');
        return false;
    }
    var recordIds = new Array();
    var processStandardID = CraftStandards_dg1542186009188Widget.getCellValue(CraftStandards_dg1542186009188Widget.getSelectedRow(),'id');
    $.each(CraftRecords_dg1542186009283Widget._DT.getSelectedRow(),function(){
        recordIds.push(this.id);
    })
    $.ajax({
        url : "/WOM/procFeedback/procFeedbackHead/deleteCraftRecord.action",
        type : 'post',
        async : false,
        traditional : true,
        data:{
            "recordIds":recordIds,
        },
        success : function(data) {
            if (data.result == "SUCCESS"){
                workbenchErrorBarWidget.showMessage('删除成功！','s');
                setTimeout(function(){
                    CraftRecords_dg1542186009283Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1542186009283.action?procFeedbackHead.id='+$("#id").val() + "&standardID="+processStandardID)
                    resetData(CraftRecords_dg1542186009283Widget,"1542186009283",processStandardID);
                },300);

            }           
        }
    });
}
}
					</script>
	<#if  refId?? && (refId > 0)>
		<#assign dUrl="/WOM/procFeedback/procFeedbackHead/data-dg1542186009283.action?procFeedbackHead.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009283">
	<#else>
		<#assign dUrl="/WOM/procFeedback/procFeedbackHead/data-dg1542186009283.action?procFeedbackHead.id=${(procFeedbackHead.id)!-1}&datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009283">
	</#if>
	<#assign firstLoad = true>
	<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
		<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1540988105134')}\",handler:function(event){CraftRecords_dg1542186009283_addNewRecord(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('X6Basic.buttonPropertyshowName.radion1459222528430')}\",handler:function(event){CraftRecords_dg1542186009283_modifyProcessRecords(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.radion1541042963306')}\",handler:function(event){CraftRecords_dg1542186009283_deleteRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
		<#assign canImportExcel=false>
	<#else>
		<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1540988105134')}\",handler:function(event){CraftRecords_dg1542186009283_addNewRecord(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('X6Basic.buttonPropertyshowName.radion1459222528430')}\",handler:function(event){CraftRecords_dg1542186009283_modifyProcessRecords(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.radion1541042963306')}\",handler:function(event){CraftRecords_dg1542186009283_deleteRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
		<#assign canImportExcel=false>
	</#if>
	
		<#if cpvmInfo?? && cpvmInfo?length gt 0>
			<#assign cpvmInfo = cpvmInfo?substring(1)>
			<input type="hidden" id="dg_cp_info_CraftRecords_dg1542186009283" value="${cpvmInfo!}" />
		</#if>
	
	<input type="hidden" id="dg1542186009283_id" value="CraftRecords_dg1542186009283" />
	
	<input type="hidden" id="dg1542186009283_url" value="${dUrl}" />
	
	<#assign assModelDisplayName = getText('WOM.modelname.randon1540952446403')!>
	<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
	<@exportexcel action="/WOM/procFeedback/procFeedbackHead/data-dg1542186009283.action?operateType=export&datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009283"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="CraftRecords_dg1542186009283" />
	<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="CraftRecords_dg1542186009283" viewType="${viewType}" renderOverEvent="dg1542186009283RenderOverEvent" route="${routeFlag}" formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" noPermissionKeys="recordStartTime,recordEndTime,actualValue,remark" modelCode="WOM_7.5.0.0_procFeedback_CraftRecords" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1542186009283" dtPage="dgPage"  hidekeyPrefix="dg1542186009283" hidekey="['id','version'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0  ptRealTimeLoad=1 isExtra=true pageInitMethod="dg1542186009283PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="WOM.buttonPropertyshowName.radion1540988105134,addNewRecord,add;X6Basic.buttonPropertyshowName.radion1459222528430,modifyProcessRecords,edit;WOM.buttonPropertyshowName.radion1541042963306,deleteRow,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false >
						<@datacolumn key="checkbox" textalign="center" label="" width="30" type="checkbox" checkall="true"/>
					<#assign recordStartTime_displayDefaultType=''>
						<#assign recordStartTime_defaultValue=''>
								<#assign recordStartTime_defaultValue=''>
								 						<#if (recordStartTime_defaultValue)?? &&(recordStartTime_defaultValue)?has_content>
							<#assign recordStartTime_defaultValue  = getDefaultDateTime(recordStartTime_defaultValue!)?datetime>
						</#if>
 
							<@datacolumn key="recordStartTime"        showFormat="YMD_HMS" defaultValue="${(recordStartTime_defaultValue!)?string}" defaultDisplay="${(recordStartTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1540953974241')}" width=150 showFormatFunc=""  />
					<#assign recordEndTime_displayDefaultType=''>
						<#assign recordEndTime_defaultValue=''>
								<#assign recordEndTime_defaultValue=''>
								 						<#if (recordEndTime_defaultValue)?? &&(recordEndTime_defaultValue)?has_content>
							<#assign recordEndTime_defaultValue  = getDefaultDateTime(recordEndTime_defaultValue!)?datetime>
						</#if>
 
							<@datacolumn key="recordEndTime"        showFormat="YMD_HMS" defaultValue="${(recordEndTime_defaultValue!)?string}" defaultDisplay="${(recordEndTime_displayDefaultType!)?string}" decimal="" editable=false type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1540961339757')}" width=150 showFormatFunc=""  />
					<#assign actualValue_displayDefaultType=''>
						<#assign actualValue_defaultValue=''>
								<#assign actualValue_defaultValue=''>
								  
							<@datacolumn key="actualValue"        showFormat="TEXT" defaultValue="${(actualValue_defaultValue!)?string}" defaultDisplay="${(actualValue_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1540953800378')}" width=100 showFormatFunc=""  />
					<#assign remark_displayDefaultType=''>
						<#assign remark_defaultValue=''>
								<#assign remark_defaultValue=''>
								  
							<@datacolumn key="remark"        showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1540961366516')}" width=100 showFormatFunc=""  />
	
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
		function CraftRecords_dg1542186009283_check_datagridvalid(){
			//
			var errorObj =CraftRecords_dg1542186009283Widget._DT.testData();
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
		
		function savedg1542186009283DataGrid(){
			<#if  refId?? && (refId gt 0)>
			CraftRecords_dg1542186009283Widget.setAllRowEdited();
			</#if>
			// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
			var changed_pt_name = $('body').data('CHANGED_PT');
			if(changed_pt_name && changed_pt_name.indexOf('CraftRecords_dg1542186009283Widget') > -1) {
				CraftRecords_dg1542186009283Widget.setAllRowEdited();
			}
			var json = CraftRecords_dg1542186009283Widget.parseEditedData();
			$('input[name="dg1542186009283ListJson"]').remove();
			$('input[name="dgLists[\'dg1542186009283\']"]').remove();
			$('input[name="dg1542186009283ModelCode"]').remove();
			$('<input type="hidden" name="dgLists[\'dg1542186009283\']">').val(json).appendTo($('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			$('<input type="hidden" name="dg1542186009283ModelCode">').val('WOM_7.5.0.0_procFeedback_CraftRecords').appendTo($('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			//兼容旧版本提交函数
			$('<input type="hidden" name="dg1542186009283ListJson">').val(json).appendTo($('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
		}
		function DT_CraftRecords_dg1542186009283_deldatagrid(){
			var deleteRows = CraftRecords_dg1542186009283Widget.deleteRows();
			if(!deleteRows || deleteRows.length == 0) {
				CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
				return false;
			}
			var delproperty = "'id','version','standardCraft.id','header.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1542186009283DeletedIds").length>0){
					$("#dg1542186009283DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1542186009283DeletedIds" name="dgDeletedIds[\'dg1542186009283\']" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
				} 
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1542186009283DeletedIds['+CUI('input[name^="dg1542186009283DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			});
			return deleteRows;
		}
		function DT_CraftRecords_dg1542186009283_delTreeNodes(){
			var deleteRows = CraftRecords_dg1542186009283Widget._DT.removeTreeNode();
			if(!deleteRows || deleteRows.length == 0) {
				return false;
			}
			var delproperty = "'id','version','standardCraft.id','header.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1542186009283DeletedIds").length>0){
					$("#dg1542186009283DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1542186009283DeletedIds" name="dgDeletedIds[\'dg1542186009283\']" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
				}
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1542186009283DeletedIds['+CUI('input[name^="dg1542186009283DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			});
		}
		$(function($){
			var datagrids = $('body').data('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_datagrids');
			var length  = 0;
			if(!datagrids) {
				datagrids = [];
			}else{
				length = datagrids.length;
			}
			datagrids[length]=[];
			datagrids[length][0] = 'CraftRecords_dg1542186009283';
			$('body').data('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_datagrids', datagrids);
		});
		var CraftRecords_dg1542186009283_importDialog = null;
		function CraftRecords_dg1542186009283_showImportDialog(){
			try{
				if(CraftRecords_dg1542186009283_importDialog!=null&&CraftRecords_dg1542186009283_importDialog.isShow==1){
					return false;
				}
				var url = "/WOM/procFeedback/procFeedbackHead/initImport.action?datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009283&tid=${id!}&datagridName=dg1542186009283";
					<#if canImportExcel>
						var buttonCode="WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009283_BUTTON_dgImport";
						url+="&buttonCode="+buttonCode;
					</#if>
				CraftRecords_dg1542186009283_importDialog = new CUI.Dialog({
					title: "${getHtmlText('common.button.import')}",
					url:url,
					modal:true,
					description:'',
					height:'330',
					width: '420',
					dragable:true,
					buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("CraftRecords_dg1542186009283"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();CraftRecords_dg1542186009283_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();CraftRecords_dg1542186009283_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
					beforeCloseEvent:function(){$('#importResponse').remove();}
				});
				CraftRecords_dg1542186009283_importDialog.show();
			}catch(e){}
		}	
		
		function CraftRecords_dg1542186009283_downLoadFile(){
			var url = "/WOM/procFeedback/procFeedbackHead/downLoad.action?datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009283&templateRelatedModelCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009283&downloadType=template&fileName=dg1542186009283";
			window.open(url,"","");
		}
		function dg1542186009283RenderOverEvent(){
			if (CraftStandards_dg1542186009188Widget.getSelectedRow() == undefined) {
	$("#CraftRecords_dg1542186009283 .paginatorbar-operatebar a").find("span").css("color",'grey');
}
		}
		function dg1542186009283PageInitMethod(nTabIndex){
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize(nTabIndex);
		}
	</script>
							</div>
					 </div>
				 <div id="ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_column-10" class='extra-layout column-fixed' style="border:none; "> 
			
					
			
		
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
	
					<script type="text/javascript">
						function BatchCharge_dg1542186009357_addBatchMaterial(event)
												{
	if ($("#procFeedbackHead_isAgile__jQSelect01 h4").html() == "否"){
		if (!$("input[name='procFeedbackHead.product.productCode']").val()){
			CUI.Dialog.alert("增行前，请先选择投料物品！");
			return false;
		}
		BatchCharge_dg1542186009357Widget.addRow()
		BatchCharge_dg1542186009357Widget.setCellValue(BatchCharge_dg1542186009357Widget.getRowLength()-1,'good.productCode',$("input[name='procFeedbackHead.product.productCode']").val())
		BatchCharge_dg1542186009357Widget.setCellValue(BatchCharge_dg1542186009357Widget.getRowLength()-1,'good.productName',$("input[name='procFeedbackHead.product.productName']").val())
		BatchCharge_dg1542186009357Widget.setCellValue(BatchCharge_dg1542186009357Widget.getRowLength()-1,'good.id',$("input[name='procFeedbackHead.product.id']").val())
		BatchCharge_dg1542186009357Widget.setCellValue(BatchCharge_dg1542186009357Widget.getRowLength()-1,'good.productBaseUnit.name',$("input[name='procFeedbackHead.product.productBaseUnit.name']").val())
		$("input[name='dg1542186009357good.id']").val($("input[name='procFeedbackHead.processActive.productId.id']").val())
		BatchCharge_dg1542186009357Widget.setCellProperty(BatchCharge_dg1542186009357Widget.getRowLength()-1,'good.productCode','readonly',true)
	}else{
		BatchCharge_dg1542186009357Widget.addRow()
		
	}
	
}
					</script>
	<#if  refId?? && (refId > 0)>
		<#assign dUrl="/WOM/procFeedback/procFeedbackHead/data-dg1542186009357.action?procFeedbackHead.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009357">
	<#else>
		<#assign dUrl="/WOM/procFeedback/procFeedbackHead/data-dg1542186009357.action?procFeedbackHead.id=${(procFeedbackHead.id)!-1}&datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009357">
	</#if>
	<#assign firstLoad = true>
	<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
		<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1490410006132')}\",handler:function(event){BatchCharge_dg1542186009357_addBatchMaterial(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.radion1490410053444')}\",handler:function(event){DT_BatchCharge_dg1542186009357_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
		<#assign canImportExcel=false>
	<#else>
		<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1490410006132')}\",handler:function(event){BatchCharge_dg1542186009357_addBatchMaterial(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.radion1490410053444')}\",handler:function(event){DT_BatchCharge_dg1542186009357_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
		<#assign canImportExcel=false>
	</#if>
	
		<#if cpvmInfo?? && cpvmInfo?length gt 0>
			<#assign cpvmInfo = cpvmInfo?substring(1)>
			<input type="hidden" id="dg_cp_info_BatchCharge_dg1542186009357" value="${cpvmInfo!}" />
		</#if>
	
	<input type="hidden" id="dg1542186009357_id" value="BatchCharge_dg1542186009357" />
	
	<input type="hidden" id="dg1542186009357_url" value="${dUrl}" />
	
	<#assign assModelDisplayName = getText('WOM.modelname.randon1540953150452')!>
	<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
	<@exportexcel action="/WOM/procFeedback/procFeedbackHead/data-dg1542186009357.action?operateType=export&datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009357"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="BatchCharge_dg1542186009357" />
	<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="BatchCharge_dg1542186009357" viewType="${viewType}" renderOverEvent="dg1542186009357RenderOverEvent" route="${routeFlag}" formId="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form" noPermissionKeys="good.productCode,good.productName,wareID.wareCode,wareID.wareName,standingCrop.onhand,standingCrop.prepareOrder.outCode,standingCrop.batchText,actualUseNum,good.productBaseUnit.name,putinDate,putinEndDate,standingCrop.availiQuantity,remark,batch" modelCode="WOM_7.5.0.0_procFeedback_BatchCharge" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1542186009357" dtPage="dgPage"  hidekeyPrefix="dg1542186009357" hidekey="['id','version','good.id','good.productCode','good.id','good.productName','wareID.id','wareID.wareCode','wareID.id','wareID.wareName','standingCrop.id','standingCrop.onhand','standingCrop.id','standingCrop.prepareOrder.outCode','standingCrop.id','standingCrop.batchText','good.id','good.productBaseUnit.name','standingCrop.id','standingCrop.availiQuantity'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0  ptRealTimeLoad=1 isExtra=true pageInitMethod="dg1542186009357PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="WOM.buttonPropertyshowName.radion1490410006132,addBatchMaterial,add;WOM.buttonPropertyshowName.radion1490410053444,DELETEROW,del" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false >
						<@datacolumn key="checkbox" textalign="center" label="" width="30" type="checkbox" checkall="true"/>
					<#assign good_productCode_displayDefaultType=''>
						<#assign good_productCode_defaultValue=''>
								<#assign good_productCode_defaultValue=''>
													<#if (good_productCode_defaultValue!)?string=="currentUser">
						<#assign good_productCode_defaultValue='${staffJson!}'>
					<#elseif (good_productCode_defaultValue!)?string=="currentPost">
						<#assign good_productCode_defaultValue='${postJson!}'>
					<#elseif (good_productCode_defaultValue!)?string=="currentDepart">
						<#assign good_productCode_defaultValue='${deptJson!}'>
					<#elseif (good_productCode_defaultValue!)?string=="currentComp">
						<#assign good_productCode_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="good.productCode"        showFormat="SELECTCOMP" defaultValue="${(good_productCode_defaultValue!)?string}" defaultDisplay="${(good_productCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="WOM.procFeedback.procFeedbackHead.adjustBatchEdit"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout.action" viewCode="MESBasic_1_product_refProductLayout" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
					<#assign good_productName_displayDefaultType=''>
						<#assign good_productName_defaultValue=''>
								<#assign good_productName_defaultValue=''>
													<#if (good_productName_defaultValue!)?string=="currentUser">
						<#assign good_productName_defaultValue='${staffJson!}'>
					<#elseif (good_productName_defaultValue!)?string=="currentPost">
						<#assign good_productName_defaultValue='${postJson!}'>
					<#elseif (good_productName_defaultValue!)?string=="currentDepart">
						<#assign good_productName_defaultValue='${deptJson!}'>
					<#elseif (good_productName_defaultValue!)?string=="currentComp">
						<#assign good_productName_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="good.productName"        showFormat="TEXT" defaultValue="${(good_productName_defaultValue!)?string}" defaultDisplay="${(good_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=true   selectCompName="WOM.procFeedback.procFeedbackHead.adjustBatchEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
					<#assign wareID_wareCode_displayDefaultType=''>
						<#assign wareID_wareCode_defaultValue=''>
								<#assign wareID_wareCode_defaultValue=''>
													<#if (wareID_wareCode_defaultValue!)?string=="currentUser">
						<#assign wareID_wareCode_defaultValue='${staffJson!}'>
					<#elseif (wareID_wareCode_defaultValue!)?string=="currentPost">
						<#assign wareID_wareCode_defaultValue='${postJson!}'>
					<#elseif (wareID_wareCode_defaultValue!)?string=="currentDepart">
						<#assign wareID_wareCode_defaultValue='${deptJson!}'>
					<#elseif (wareID_wareCode_defaultValue!)?string=="currentComp">
						<#assign wareID_wareCode_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="wareID.wareCode"        showFormat="SELECTCOMP" defaultValue="${(wareID_wareCode_defaultValue!)?string}" defaultDisplay="${(wareID_wareCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="WOM.procFeedback.procFeedbackHead.adjustBatchEdit"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=true crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('MESBasic.propertydisplayName.randon1484031239866')}" width=100 showFormatFunc=""  />
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

							<@datacolumn key="wareID.wareName"        showFormat="TEXT" defaultValue="${(wareID_wareName_defaultValue!)?string}" defaultDisplay="${(wareID_wareName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=true   selectCompName="WOM.procFeedback.procFeedbackHead.adjustBatchEdit"  textalign="left"  viewUrl="/MESBasic/wareMan/ware/wareRef.action" viewCode="MESBasic_1_wareMan_wareRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1484031981880')}"  label="${getText('MESBasic.propertydisplayName.randon1484031316281')}" width=100 showFormatFunc=""  />
					<#assign standingCrop_onhand_displayDefaultType=''>
						<#assign standingCrop_onhand_defaultValue=''>
								<#assign standingCrop_onhand_defaultValue=''>
													<#if (standingCrop_onhand_defaultValue!)?string=="currentUser">
						<#assign standingCrop_onhand_defaultValue='${staffJson!}'>
					<#elseif (standingCrop_onhand_defaultValue!)?string=="currentPost">
						<#assign standingCrop_onhand_defaultValue='${postJson!}'>
					<#elseif (standingCrop_onhand_defaultValue!)?string=="currentDepart">
						<#assign standingCrop_onhand_defaultValue='${deptJson!}'>
					<#elseif (standingCrop_onhand_defaultValue!)?string=="currentComp">
						<#assign standingCrop_onhand_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="standingCrop.onhand"        showFormat="SELECTCOMP" defaultValue="${(standingCrop_onhand_defaultValue!)?string}" defaultDisplay="${(standingCrop_onhand_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="selectcomp" notnull=true   selectCompName="WOM.procFeedback.procFeedbackHead.adjustBatchEdit"  textalign="right"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumAllRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumAllRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490782884426')}"  label="${getText('WOM.propertydisplayName.randon1490064713692')}" width=100 showFormatFunc=""  />
					<#assign standingCrop_prepareOrder_outCode_displayDefaultType=''>
						<#assign standingCrop_prepareOrder_outCode_defaultValue=''>
								<#assign standingCrop_prepareOrder_outCode_defaultValue=''>
													<#if (standingCrop_prepareOrder_outCode_defaultValue!)?string=="currentUser">
						<#assign standingCrop_prepareOrder_outCode_defaultValue='${staffJson!}'>
					<#elseif (standingCrop_prepareOrder_outCode_defaultValue!)?string=="currentPost">
						<#assign standingCrop_prepareOrder_outCode_defaultValue='${postJson!}'>
					<#elseif (standingCrop_prepareOrder_outCode_defaultValue!)?string=="currentDepart">
						<#assign standingCrop_prepareOrder_outCode_defaultValue='${deptJson!}'>
					<#elseif (standingCrop_prepareOrder_outCode_defaultValue!)?string=="currentComp">
						<#assign standingCrop_prepareOrder_outCode_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="standingCrop.prepareOrder.outCode"        showFormat="SELECTCOMP" defaultValue="${(standingCrop_prepareOrder_outCode_defaultValue!)?string}" defaultDisplay="${(standingCrop_prepareOrder_outCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true  callbackname="callbackPosition(obj)" selectCompName="WOM.procFeedback.procFeedbackHead.adjustBatchEdit"  textalign="left"  viewUrl="/WOM/standingcropRef/standingcropRef/prepareNumRef.action" viewCode="WOM_7.5.0.0_standingcropRef_prepareNumRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1566541491979')}"  label="${getText('WOM.propertyshowName.randon1566961328560.flag')}" width=100 showFormatFunc=""  />
					<#assign standingCrop_batchText_displayDefaultType=''>
						<#assign standingCrop_batchText_defaultValue=''>
								<#assign standingCrop_batchText_defaultValue=''>
													<#if (standingCrop_batchText_defaultValue!)?string=="currentUser">
						<#assign standingCrop_batchText_defaultValue='${staffJson!}'>
					<#elseif (standingCrop_batchText_defaultValue!)?string=="currentPost">
						<#assign standingCrop_batchText_defaultValue='${postJson!}'>
					<#elseif (standingCrop_batchText_defaultValue!)?string=="currentDepart">
						<#assign standingCrop_batchText_defaultValue='${deptJson!}'>
					<#elseif (standingCrop_batchText_defaultValue!)?string=="currentComp">
						<#assign standingCrop_batchText_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="standingCrop.batchText"        showFormat="TEXT" defaultValue="${(standingCrop_batchText_defaultValue!)?string}" defaultDisplay="${(standingCrop_batchText_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.procFeedback.procFeedbackHead.adjustBatchEdit"  textalign="left"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumAllRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumAllRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490782884426')}"  label="${getText('WOM.propertydisplayName.randon1490064501469')}" width=100 showFormatFunc=""  />
					<#assign actualUseNum_displayDefaultType=''>
						<#assign actualUseNum_defaultValue=''>
								<#assign actualUseNum_defaultValue=''>
								  
							<@datacolumn key="actualUseNum"        showFormat="TEXT" defaultValue="${(actualUseNum_defaultValue!)?string}" defaultDisplay="${(actualUseNum_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1540961603371')}" width=100 showFormatFunc=""  />
					<#assign good_productBaseUnit_name_displayDefaultType=''>
						<#assign good_productBaseUnit_name_defaultValue=''>
								<#assign good_productBaseUnit_name_defaultValue=''>
													<#if (good_productBaseUnit_name_defaultValue!)?string=="currentUser">
						<#assign good_productBaseUnit_name_defaultValue='${staffJson!}'>
					<#elseif (good_productBaseUnit_name_defaultValue!)?string=="currentPost">
						<#assign good_productBaseUnit_name_defaultValue='${postJson!}'>
					<#elseif (good_productBaseUnit_name_defaultValue!)?string=="currentDepart">
						<#assign good_productBaseUnit_name_defaultValue='${deptJson!}'>
					<#elseif (good_productBaseUnit_name_defaultValue!)?string=="currentComp">
						<#assign good_productBaseUnit_name_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="good.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(good_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(good_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.procFeedback.procFeedbackHead.adjustBatchEdit"  textalign="left"  viewUrl="/MESBasic/product/product/customRef.action" viewCode="MESBasic_1_product_customRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1506341311049')}"  label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" width=100 showFormatFunc=""  />
					<#assign putinDate_displayDefaultType=''>
						<#assign putinDate_defaultValue=''>
								<#assign putinDate_defaultValue=''>
								 						<#if (putinDate_defaultValue)?? &&(putinDate_defaultValue)?has_content>
							<#assign putinDate_defaultValue  = getDefaultDateTime(putinDate_defaultValue!)?datetime>
						</#if>
 
							<@datacolumn key="putinDate"        showFormat="YMD_HMS" defaultValue="${(putinDate_defaultValue!)?string}" defaultDisplay="${(putinDate_displayDefaultType!)?string}" decimal="" editable=true type="datetime" showType="datetime" notnull=true     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1541469910813')}" width=150 showFormatFunc=""  />
					<#assign putinEndDate_displayDefaultType=''>
						<#assign putinEndDate_defaultValue=''>
								<#assign putinEndDate_defaultValue=''>
								 						<#if (putinEndDate_defaultValue)?? &&(putinEndDate_defaultValue)?has_content>
							<#assign putinEndDate_defaultValue  = getDefaultDateTime(putinEndDate_defaultValue!)?datetime>
						</#if>
 
							<@datacolumn key="putinEndDate"        showFormat="YMD_HMS" defaultValue="${(putinEndDate_defaultValue!)?string}" defaultDisplay="${(putinEndDate_displayDefaultType!)?string}" decimal="" editable=true type="datetime" showType="datetime" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1541469926291')}" width=150 showFormatFunc=""  />
					<#assign standingCrop_availiQuantity_displayDefaultType=''>
						<#assign standingCrop_availiQuantity_defaultValue=''>
								<#assign standingCrop_availiQuantity_defaultValue=''>
													<#if (standingCrop_availiQuantity_defaultValue!)?string=="currentUser">
						<#assign standingCrop_availiQuantity_defaultValue='${staffJson!}'>
					<#elseif (standingCrop_availiQuantity_defaultValue!)?string=="currentPost">
						<#assign standingCrop_availiQuantity_defaultValue='${postJson!}'>
					<#elseif (standingCrop_availiQuantity_defaultValue!)?string=="currentDepart">
						<#assign standingCrop_availiQuantity_defaultValue='${deptJson!}'>
					<#elseif (standingCrop_availiQuantity_defaultValue!)?string=="currentComp">
						<#assign standingCrop_availiQuantity_defaultValue='${compJson!}'>
					</#if>

							<@datacolumn key="standingCrop.availiQuantity"        showFormat="TEXT" defaultValue="${(standingCrop_availiQuantity_defaultValue!)?string}" defaultDisplay="${(standingCrop_availiQuantity_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false   selectCompName="WOM.procFeedback.procFeedbackHead.adjustBatchEdit"  textalign="right" hiddenCol=true viewUrl="/WOM/standingcropRef/standingcropRef/batchNumAllRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumAllRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490782884426')}"  label="${getText('WOM.propertydisplayName.randon1490064478475')}" width=100 showFormatFunc=""  />
					<#assign remark_displayDefaultType=''>
						<#assign remark_defaultValue=''>
								<#assign remark_defaultValue=''>
								  
							<@datacolumn key="remark"        showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1540975964944')}" width=100 showFormatFunc=""  />
					<#assign batch_displayDefaultType=''>
						<#assign batch_defaultValue=''>
								<#assign batch_defaultValue=''>
								  
							<@datacolumn key="batch"        showFormat="TEXT" defaultValue="${(batch_defaultValue!)?string}" defaultDisplay="${(batch_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertyshowName.randon1566961099280.flag')}" width=100 showFormatFunc=""  />
	
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
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.query_dg1542186009357standingCrop_prepareOrder_outCode = function() {
					var nRow = BatchCharge_dg1542186009357Widget.getSelectedRow();
var productCode = BatchCharge_dg1542186009357Widget.getCellValue(nRow, 'good.productCode');
var orderMainId = $('input[name="procFeedbackHead.taskId.manuOrderMain.id"]').val();
return "productCode=" + productCode + "&orderMainId="+orderMainId;
				}
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.query_dg1542186009357standingCrop_batchText = function() {
					var nRow = BatchCharge_dg1542186009357Widget.getSelectedRow();
var productCode = BatchCharge_dg1542186009357Widget.getCellValue(nRow,'good.productCode');
return  "productCode="+productCode ;
				}
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.query_dg1542186009357actualUseNum = function() {
					var nRow = BatchCharge_dg1542248606236Widget.getSelectedRow();
var productCode = BatchCharge_dg1542248606236Widget.getCellValue(nRow,'good.productCode');
return  "productCode="+productCode ;
				}
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.query_dg1542186009357good_productBaseUnit_name = function() {
					var nRow = BatchCharge_dg1542186009357Widget.getSelectedRow();
var productCode = BatchCharge_dg1542186009357Widget.getCellValue(nRow,'good.productCode');
return  "productCode="+productCode ;
				}
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.query_dg1542186009357standingCrop_availiQuantity = function() {
					var nRow = BatchCharge_dg1542186009357Widget.getSelectedRow();
var productCode = BatchCharge_dg1542186009357Widget.getCellValue(nRow,'good.productCode');
return  "productCode="+productCode ;
				}
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
		</script>
		<script type="text/javascript">
			
			//datagrid自定义参数方法
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.query_dg1542186009357batch = function() {
					var nRow = BatchCharge_dg1542248606236Widget.getSelectedRow();
var productCode = BatchCharge_dg1542248606236Widget.getCellValue(nRow,'good.productCode');
return  "productCode="+productCode ;
				}
		</script>
	
	<script type="text/javascript">
		function BatchCharge_dg1542186009357_check_datagridvalid(){
			//
			var errorObj =BatchCharge_dg1542186009357Widget._DT.testData();
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
		
		function savedg1542186009357DataGrid(){
			<#if  refId?? && (refId gt 0)>
			BatchCharge_dg1542186009357Widget.setAllRowEdited();
			</#if>
			// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
			var changed_pt_name = $('body').data('CHANGED_PT');
			if(changed_pt_name && changed_pt_name.indexOf('BatchCharge_dg1542186009357Widget') > -1) {
				BatchCharge_dg1542186009357Widget.setAllRowEdited();
			}
			var json = BatchCharge_dg1542186009357Widget.parseEditedData();
			$('input[name="dg1542186009357ListJson"]').remove();
			$('input[name="dgLists[\'dg1542186009357\']"]').remove();
			$('input[name="dg1542186009357ModelCode"]').remove();
			$('<input type="hidden" name="dgLists[\'dg1542186009357\']">').val(json).appendTo($('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			$('<input type="hidden" name="dg1542186009357ModelCode">').val('WOM_7.5.0.0_procFeedback_BatchCharge').appendTo($('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			//兼容旧版本提交函数
			$('<input type="hidden" name="dg1542186009357ListJson">').val(json).appendTo($('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
		}
		function DT_BatchCharge_dg1542186009357_deldatagrid(){
			var deleteRows = BatchCharge_dg1542186009357Widget.deleteRows();
			if(!deleteRows || deleteRows.length == 0) {
				CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
				return false;
			}
			var delproperty = "'id','version','good.id','headerId.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1542186009357DeletedIds").length>0){
					$("#dg1542186009357DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1542186009357DeletedIds" name="dgDeletedIds[\'dg1542186009357\']" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
				} 
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1542186009357DeletedIds['+CUI('input[name^="dg1542186009357DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			});
			return deleteRows;
		}
		function DT_BatchCharge_dg1542186009357_delTreeNodes(){
			var deleteRows = BatchCharge_dg1542186009357Widget._DT.removeTreeNode();
			if(!deleteRows || deleteRows.length == 0) {
				return false;
			}
			var delproperty = "'id','version','good.id','headerId.id'";
			delproperty= delproperty.split(",")[0].substring(1).replace("'","");
			$.each(deleteRows, function(index, deleteRow){
				var tepID = eval("deleteRow."+delproperty);
				if(tepID==null || tepID == undefined || tepID == '') {
					return true;
				}
				if($("#dg1542186009357DeletedIds").length>0){
					$("#dg1542186009357DeletedIds")[0].value+=","+tepID;
				}else{
					CUI('<input type="hidden" id="dg1542186009357DeletedIds" name="dgDeletedIds[\'dg1542186009357\']" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
				}
				//兼容旧版本提交函数
				CUI('<input type="hidden" name="dg1542186009357DeletedIds['+CUI('input[name^="dg1542186009357DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
			});
		}
		$(function($){
			var datagrids = $('body').data('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_datagrids');
			var length  = 0;
			if(!datagrids) {
				datagrids = [];
			}else{
				length = datagrids.length;
			}
			datagrids[length]=[];
			datagrids[length][0] = 'BatchCharge_dg1542186009357';
			$('body').data('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_datagrids', datagrids);
		});
		var BatchCharge_dg1542186009357_importDialog = null;
		function BatchCharge_dg1542186009357_showImportDialog(){
			try{
				if(BatchCharge_dg1542186009357_importDialog!=null&&BatchCharge_dg1542186009357_importDialog.isShow==1){
					return false;
				}
				var url = "/WOM/procFeedback/procFeedbackHead/initImport.action?datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009357&tid=${id!}&datagridName=dg1542186009357";
					<#if canImportExcel>
						var buttonCode="WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009357_BUTTON_dgImport";
						url+="&buttonCode="+buttonCode;
					</#if>
				BatchCharge_dg1542186009357_importDialog = new CUI.Dialog({
					title: "${getHtmlText('common.button.import')}",
					url:url,
					modal:true,
					description:'',
					height:'330',
					width: '420',
					dragable:true,
					buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("BatchCharge_dg1542186009357"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();BatchCharge_dg1542186009357_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();BatchCharge_dg1542186009357_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
					beforeCloseEvent:function(){$('#importResponse').remove();}
				});
				BatchCharge_dg1542186009357_importDialog.show();
			}catch(e){}
		}	
		
		function BatchCharge_dg1542186009357_downLoadFile(){
			var url = "/WOM/procFeedback/procFeedbackHead/downLoad.action?datagridCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009357&templateRelatedModelCode=WOM_7.5.0.0_procFeedback_adjustBatchEditdg1542186009357&downloadType=template&fileName=dg1542186009357";
			window.open(url,"","");
		}
		function dg1542186009357RenderOverEvent(){
			if ($("input[name='procFeedbackHead.adjustDealRecord.activeType.value']").val() != "投料"){
	$("#ec_WOM_procFeedback_procFeedbackHead_adjustBatchEdit_column-10").hide()
}
		}
		function dg1542186009357PageInitMethod(nTabIndex){
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize(nTabIndex);
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
     	
		<div id="WOM_procFeedback_procFeedbackHead_adjustBatchEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_adjustBatchEdit,html,WOM_7.5.0.0_procFeedback_ProcFeedbackHead,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
		<@errorbar id="workbenchErrorBar" offsetY=42 />
		
		
		</script>
		<script type="text/javascript">
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initCount = 0;
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div .edit-head").height()-$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div .edit-workflow").height()</#if>;
				$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_datagrids');
				var padding_bottom=16;
				//$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div .pd_bottom,#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div .edit-panes-s").each(function(index){
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
									if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initCount <= 2) {
										setTimeout(function(){WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize();}, 200);
										WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initCount++;
									}/* else {
										WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initCount = 0;
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
							if(($("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div .edit-workflow").length > 0) && ($("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.procFeedback.procFeedbackHead.adjustBatchEdit.otherParams = {};
	WOM.procFeedback.procFeedbackHead.adjustBatchEdit.otherParams.dialogType = dialogType;
	WOM.procFeedback.procFeedbackHead.adjustBatchEdit.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};










function callbackPosition(obj){
   console.log(obj);
   var nRow = BatchCharge_dg1542186009357Widget.getSelectedRow();
   BatchCharge_dg1542186009357Widget.setCellValue(nRow,'wareID.id',obj[0].wareID.id);
    BatchCharge_dg1542186009357Widget.setCellValue(nRow,'wareID.wareCode',obj[0].wareID.wareCode);
	 BatchCharge_dg1542186009357Widget.setCellValue(nRow,'wareID.wareName',obj[0].wareID.wareName);
}

(function($){
	$(function(){
		var staffId = WOM.procFeedback.procFeedbackHead.adjustBatchEdit.currentStaff.id
var staffName = WOM.procFeedback.procFeedbackHead.adjustBatchEdit.currentStaff.name
if (staffId && staffName){
    $("input[name='procFeedbackHead.staffID.name']").val(staffName)
    $("#procFeedbackHead_staffID_name_mneTipLabel").html("")
    $("input[name='procFeedbackHead.staffID.id']").val(staffId)
}
if($("#procFeedbackHead_isAgile__jQSelect01 h4").html() == "否" && $("input[name='procFeedbackHead.adjustDealRecord.activeType.value']").val() == "投料"){
	$("input[name='procFeedbackHead.product.productCode']").parents("td").prev("td").css('color',"rgb(179, 3, 3)").addClass("nullalbe")
	$("input[name='procFeedbackHead.product.productName']").parents("td").prev("td").css('color',"rgb(179, 3, 3)").addClass("nullalbe")
}
	});
})(jQuery);			$(function(){
				$('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize();
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
						if(parseInt($("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").css("width"),10)==650){
							$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.procFeedback.procFeedbackHead.adjustBatchEdit.resizeLayout();
						//WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").css("width"),10)==800){
							$("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.procFeedback.procFeedbackHead.adjustBatchEdit.resizeLayout();
						//WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize();
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
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
					$("body").trigger("resize");
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
					$("body").trigger("resize");
				});
				</#if>
				$(window).resize(function(){WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initSize();});
				/*
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.resizeLayout=function(){
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

		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.validate = function(){
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
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.beforeSaveProcess = function(){
			try{eval("savedg1542186009357DataGrid()");}catch(e){}
			try{eval("savedg1542186009188DataGrid()");}catch(e){}
			try{eval("savedg1542186009283DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form').trigger('beforeSubmit');
			//procFeedbackHead.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="procFeedbackHead.extraCol"]').val(extraCol);
		}
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.processDataGrid = function(){
			//此处还有大量代码删减
		};
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.procFeedback.procFeedbackHead.adjustBatchEdit.validate()){return;}
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.beforeSaveProcess();

			//WOM.procFeedback.procFeedbackHead.adjustBatchEdit.processDataGrid();
			$('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form','WOM_procFeedback_procFeedbackHead_adjustBatchEdit_datagrids')) {      
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
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.print = function(){
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
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.saveSetting = function(){
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
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.printSetting = function(){
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
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.settingDialog.show();
			}
		}
		
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit._callBackInfo = function(res){
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
 						window.opener.WOM.procFeedback.procFeedbackHead.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.procFeedback.procFeedbackHead.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._refViewCode_IE = viewCode;
			} else {
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._refViewCode_IE = '';
			}
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.gridEventObj = gridEventObj;
				callbackName = "WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getMultiselectCallBackInfo_DG" : "WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getcallBackInfo_DG";
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._prefix = _prefix.substring(1);
			}
			
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid = oGrid;
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._refViewCode = oColumn.viewCode;
				} else {
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._refViewCode = '';
				}
			} else {
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp = false;
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames = '';
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._refViewCode = '';
			}
			if (WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp == true && WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack = customCallBack;
			}
			if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFuncN == "function") {
				refparam += WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.procFeedback.procFeedbackHead.adjustBatchEdit.query_"+obj+")!='undefined'") ? eval('WOM.procFeedback.procFeedbackHead.adjustBatchEdit.query_'+obj+'()') : null;
			return str;
		};
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getcallBackGroupInfo = function(obj){
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
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit._dialog.close();
		}
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form',obj[0], WOM.procFeedback.procFeedbackHead.adjustBatchEdit._prefix, WOM.procFeedback.procFeedbackHead.adjustBatchEdit._sUrl);
			CUI.commonFills('WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form',WOM.procFeedback.procFeedbackHead.adjustBatchEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.procFeedback.procFeedbackHead.adjustBatchEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack) {
					eval(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack);
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getcallBackInfo_DG_IE = function(obj){
			if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customBeforeCallBack) {
				var flag = eval(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.procFeedback.procFeedbackHead.adjustBatchEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp_IE == true && WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.procFeedback.procFeedbackHead.adjustBatchEdit._sUrl,WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.procFeedback.procFeedbackHead.adjustBatchEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp_IE == true && WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.procFeedback.procFeedbackHead.adjustBatchEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.procFeedback.procFeedbackHead.adjustBatchEdit._refViewCode_IE + '&id=' + id,
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
				if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack) {
					eval(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack);
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._dialog.close();
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
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getcallBackInfo_DG = function(obj){
			if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customBeforeCallBack) {
				var flag = eval(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow).next().length==0){
						WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid.addNewRow();
					}	
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow = $(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow).next();
					$(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow,obj[i], WOM.procFeedback.procFeedbackHead.adjustBatchEdit._prefix, WOM.procFeedback.procFeedbackHead.adjustBatchEdit._sUrl);
				if (WOM.procFeedback.procFeedbackHead.adjustBatchEdit._isObjCustomProp == true && WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow,WOM.procFeedback.procFeedbackHead.adjustBatchEdit._prefix,obj[i],WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid,WOM.procFeedback.procFeedbackHead.adjustBatchEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow,WOM.procFeedback.procFeedbackHead.adjustBatchEdit._prefix,obj[i],WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.procFeedback.procFeedbackHead.adjustBatchEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.procFeedback.procFeedbackHead.adjustBatchEdit._refViewCode + '&id=' + id,
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
									name = WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow, objs, WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack) {
					eval(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack);
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._oGrid, WOM.procFeedback.procFeedbackHead.adjustBatchEdit._currRow, WOM.procFeedback.procFeedbackHead.adjustBatchEdit._key, WOM.procFeedback.procFeedbackHead.adjustBatchEdit._displayFieldName, obj[i])
			}
			try{
				if(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack) {
					eval(WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack);
					WOM.procFeedback.procFeedbackHead.adjustBatchEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit._dialog.close();
			} catch(e){}
		};
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.procFeedback.procFeedbackHead.adjustBatchEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.onloadForProduct();
		});

		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.beforeSubmitMethodSettingInPage = function(){
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.onsaveForProduct();
			var length = BatchCharge_dg1542186009357Widget.getRowLength();
for (var i = 0; i < length; i++) {
  var productCode = BatchCharge_dg1542186009357Widget.getCellValue(i, 'good.productCode');
  var onhand = BatchCharge_dg1542186009357Widget.getCellValue(i, 'standingCrop.onhand');
  var useNum = BatchCharge_dg1542186009357Widget.getCellValue(i, 'actualUseNum');
  useNum = (useNum == undefined || useNum == '') ? 0 : parseFloat(useNum);
  onhand = (onhand == undefined || onhand == '') ? 0 : parseFloat(onhand);
  if (useNum > onhand) {
    workbenchErrorBarWidget.showMessage('配料表体第' + (i + 1) + '行"用料量"不能大于"现存量"');
    return false;
  }
  var id = BatchCharge_dg1542186009357Widget.getCellValue(i, 'standingCrop.id');
  var checkNum = useNum;
  for(var j = 0;j < length; j++) {
    if(j == i) {
      continue;
    }
    if (id == BatchCharge_dg1542186009357Widget.getCellValue(j, 'standingCrop.id')) {
      checkNum += parseFloat(BatchCharge_dg1542186009357Widget.getCellValue(j, 'actualUseNum'));
      if (checkNum > onhand) {
        workbenchErrorBarWidget.showMessage('配料表体中物料编码[' + productCode + ']的"用料量"不能大于"现存量"');
        return false;
      }
    }
  }
}
		};
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.procFeedback.procFeedbackHead.adjustBatchEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").hide();
				},100);
				//CUI("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showThis = function(){
			if(!CUI("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").is(':visible')) {
				CUI("#WOM_procFeedback_procFeedbackHead_adjustBatchEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_procFeedback_procFeedbackHead_adjustBatchEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_procFeedback_ProcFeedbackHead&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.auditDialog.show();
			</#if>
		}
		
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showInfoDialog=function(mode){
			
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_procFeedback_procFeedbackHead_adjustBatchEdit_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_procFeedback");
			}
		}
		
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/procFeedback/procFeedbackHead/dealInfo-list.action&dlTableInfoId=${(procFeedbackHead.tableInfoId)?default('')}");
			}
		}
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
			     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
			    var browser=navigator.appName 
				var b_version=navigator.appVersion 
				var version=b_version.split(";"); 
				var trim_Version=version[1].replace(/[ ]/g,""); 
				if((browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")){
				   CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_procFeedback_ProcFeedbackHead&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(procFeedbackHead.tableInfoId)?default('')}");
				}else{
				   CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_procFeedback_ProcFeedbackHead&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(procFeedbackHead.tableInfoId)?default('')}");
				}		
			}
		}
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.supervision=function(){
			WOM.procFeedback.procFeedbackHead.adjustBatchEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(procFeedbackHead.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.procFeedback.procFeedbackHead.adjustBatchEdit.modifyOwnerStaffDialog.show();
		}
		






function callbackPosition(obj){
   console.log(obj);
   var nRow = BatchCharge_dg1542186009357Widget.getSelectedRow();
   BatchCharge_dg1542186009357Widget.setCellValue(nRow,'wareID.id',obj[0].wareID.id);
    BatchCharge_dg1542186009357Widget.setCellValue(nRow,'wareID.wareCode',obj[0].wareID.wareCode);
	 BatchCharge_dg1542186009357Widget.setCellValue(nRow,'wareID.wareName',obj[0].wareID.wareName);
}

		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_adjustBatchEdit,js,WOM_7.5.0.0_procFeedback_ProcFeedbackHead,WOM_7.5.0.0) */
// 自定义代码
		var checkItemID = 0;
function setIndexData(){
    //获取之前选中的行
    var itemID = checkItemID;
    if(itemID!=0){  //有选中的项目时
        //添加隐藏框用于存放json值
        if($("#dg1542186009283ListJson_"+itemID).length==0){
            $("#CraftRecords_dg1542186009283_tbody").append("<input type=\"hidden\" id=\"dg1542186009283ListJson_"+itemID+"\">");
        }
        //下面pt的长度
        var len  = CraftRecords_dg1542186009283Widget._DT.getAllData().length;
        var ItemIndexObj = $.extend(true,[],CraftRecords_dg1542186009283Widget._DT.getAllData());
        //替换id为字符串，防止后台转换json为obj时报错
        for(var i=0;i<len;i++){
            var id = ItemIndexObj[i].id;
            if(id!=undefined){
                ItemIndexObj[i].id = ""+ id;
            }
                ItemIndexObj[i].rowHtmlObj=null;
        }
       var processJson=JSON.stringify(ItemIndexObj).replace(/null/g,"\"\"");
       $("#dg1542186009283ListJson_"+itemID).val(JSON.stringify(ItemIndexObj).replace(/null/g,"\"\""));
    } 
            
            
    setTimeout(function(){
        var selRow = CraftStandards_dg1542186009188Widget.getSelectedRow();
        var selID = CraftStandards_dg1542186009188Widget.getCellValue(selRow,"id");
    /*if(   checkItemID == selID){  //判断之前选中的测试项目是否与现在选中的一样
            return;
        }*/
        checkItemID = selID;
        bdforeRow=selRow;
        var jsonData = $("#dg1542186009283ListJson_"+selID).val();
        var selectedStandardId = CraftStandards_dg1542186009188Widget.getCellValue(selRow,"id");
        var id = $("#id").val();
        if(jsonData==undefined&&id!=undefined){
            //编辑时，并且第一次点击
            CraftRecords_dg1542186009283Widget._DT.setRequestDataUrl('/WOM/procFeedback/procFeedbackHead/data-dg1542186009283.action?procFeedbackHead.id='+$("#id").val() + "&standardID="+selectedStandardId)
        } else{
            if(jsonData==undefined) jsonData="";
            jsonData = jsonData.replace(/\+/g,"%2b");
            CraftRecords_dg1542186009283Widget._DT.setRequestDataUrl("/WOM/procFeedback/procFeedbackHead/ref-data-dg1542186009283.action?rt=json","dg1542186009283List_Json="+jsonData);    
        }
    },300);
}
	function resetData(tbObj,tableId,processStandardID){
        //添加隐藏框用于存放json值
        if($("#"+tableId+"ListJson_"+processStandardID).length==0){
            $("#CraftRecords_dg"+tableId+"_tbody").append("<input type=\"hidden\" id=\"dg"+tableId+"ListJson_"+processStandardID+"\">");
        }
        //下面pt的长度
        var len  = tbObj._DT.getAllData().length;
        var ItemIndexObj = $.extend(true,[],tbObj._DT.getAllData());
        //替换id为字符串，防止后台转换json为obj时报错
        for(var i=0;i<len;i++){
            var id = ItemIndexObj[i].id;
            if(id!=undefined){
                ItemIndexObj[i].id = ""+ id;
            }
                ItemIndexObj[i].rowHtmlObj=null;
        }
        $("#dg"+tableId+"ListJson_"+processStandardID).val(JSON.stringify(ItemIndexObj).replace(/null/g,"\"\""));
    }
/* CUSTOM CODE END */
		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_adjustBatchEdit,onloadForProduct,WOM_7.5.0.0_procFeedback_ProcFeedbackHead,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.procFeedback.procFeedbackHead.adjustBatchEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_procFeedback_adjustBatchEdit,onsaveForProduct,WOM_7.5.0.0_procFeedback_ProcFeedbackHead,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.procFeedback.procFeedbackHead.adjustBatchEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(procFeedbackHead.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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