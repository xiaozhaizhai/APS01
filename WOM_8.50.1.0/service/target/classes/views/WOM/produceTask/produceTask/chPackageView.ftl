<!-- WOM_7.5.0.0/produceTask/chPackageView -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = produceTask.tableInfoId!>
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
<#assign viewType = "readonly">
<#-- 实体对象 -->
<#assign tableObj = produceTask>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.produceTask.produceTask.chPackageView">
<#-- 模型名称-->
<#assign modelName = "produceTask">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_produceTask_chPackageView">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_produceTask">
<#-- 视图名称-->
<#assign viewName = "chPackageView">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_produceTask_produceTask_chPackageView_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "ProduceTask">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = true>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "WOM_produceTask_produceTask_chPackageView_form">
<#-- 待办状态 -->
<#assign pendingstatus =( produceTask.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "ec.print.controlPrint">
<#-- 批量？？ -->
<#assign isBatch = false>
<#assign payCloseAttention = false>
<#-- 自定义按钮 -->
<#assign operateButtons =[] >
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	
		
	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('WOM.viewtitle.randon1506306728257')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_produceTask_produceTask_chPackageView_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.produceTask.produceTask.chPackageView');
			WOM.produceTask.produceTask.chPackageView.currentUser = ${userJson};
			WOM.produceTask.produceTask.chPackageView.currentStaff = ${staffJson};
			WOM.produceTask.produceTask.chPackageView.currentDepartment = ${deptJson};
			WOM.produceTask.produceTask.chPackageView.currentPosition = ${postJson};
			WOM.produceTask.produceTask.chPackageView.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_chPackageView,head,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="produceTask.bulkProduct.id,produceTask.factoryId.id,produceTask.formularId.id,produceTask.id,produceTask.productId.id,produceTask.bulkBatchNum.id,produceTask.planParId.id," onsubmitMethod="WOM.produceTask.produceTask.chPackageView.beforeSubmitMethod()" id="WOM_produceTask_produceTask_chPackageView_form" namespace="/WOM/produceTask/produceTask/chPackageView" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_produceTask_ProduceTask&_bapFieldPermissonModelName_=ProduceTask&superEdit=${(superEdit!false)?string}" editPageNs="WOM.produceTask.produceTask.chPackageView" callback="WOM.produceTask.produceTask.chPackageView._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_produceTask_produceTask_chPackageView_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_produceTask_produceTask_chPackageView">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="produceTask.bulkProduct.id" value="${(produceTask.bulkProduct.id)!""}" originalvalue="${(produceTask.bulkProduct.id)!""}"/>
					<input type="hidden" name="produceTask.factoryId.id" value="${(produceTask.factoryId.id)!""}" originalvalue="${(produceTask.factoryId.id)!""}"/>
					<input type="hidden" name="produceTask.formularId.id" value="${(produceTask.formularId.id)!""}" originalvalue="${(produceTask.formularId.id)!""}"/>
					<input type="hidden" name="produceTask.id" value="${(produceTask.id)!""}" originalvalue="${(produceTask.id)!""}"/>
					<input type="hidden" name="produceTask.productId.id" value="${(produceTask.productId.id)!""}" originalvalue="${(produceTask.productId.id)!""}"/>
					<input type="hidden" name="produceTask.bulkBatchNum.id" value="${(produceTask.bulkBatchNum.id)!""}" originalvalue="${(produceTask.bulkBatchNum.id)!""}"/>
					<input type="hidden" name="produceTask.planParId.id" value="${(produceTask.planParId.id)!""}" originalvalue="${(produceTask.planParId.id)!""}"/>
		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('WOM.tabname.radion1489731908995')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "WOM_produceTask_produceTask_chPackageView_form"+"_attcount";
function fileCountSpan(fileuploadLinkId,fileuploadType){
	if(!fileuploadLinkId) {
		fileuploadLinkId = '${fileuploadLinkId!}'
	}
	if(!fileuploadType) {
		fileuploadType = '${fileuploadType!}'
	}
	CUI.ajax({
		type : "POST",
		url : '/foundation/workbench/upload-count.action?linkId=' + fileuploadLinkId + '&type=' + fileuploadType,
		success : function(msg){
			try{
				if(msg!=null) {
					var fileCount = parseInt(msg);
					$('.total').show();
					//去掉两边的括号字符
					CUI('#'+attcountid).html(fileCount);
				}
			} catch(e){}
		}
	});
};
$(function(){
	var fileuploadLinkId= '${fileuploadLinkId!}';
	if(fileuploadLinkId != '') {
		fileCountSpan(fileuploadLinkId, '${fileuploadType}');
	}
	<#if hasAttachment?? && hasAttachment && false>
	$('#attachmentLi').one('click', function(){
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_produceTask', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1505994371242')}" >${getText('WOM.propertydisplayName.randon1505994371242')}</label>
				</td>
				
						<#assign produceTask_planParId_dayPlanInfo_tableNo_defaultValue  = ''>
														<#assign produceTask_planParId_dayPlanInfo_tableNo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1489823707131')}" viewType="${viewType!}" deValue="${produceTask_planParId_dayPlanInfo_tableNo_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.chPackageView._querycustomFunc('produceTask_planParId_dayPlanInfo_tableNo')" view=true  value="${(produceTask.planParId.dayPlanInfo.tableNo)!}" displayFieldName="tableNo" name="produceTask.planParId.dayPlanInfo.tableNo" id="produceTask_planParId_dayPlanInfo_tableNo" type="other" url="/WOM/producePlanRef/dayBatchPlanParts/planRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_chPackageView_form" editCustomCallback="setOtherValue(obj);" refViewCode="WOM_7.5.0.0_producePlanRef_planRef"  onkeyupfuncname="setOtherValue(obj);_callback_produceTask_planParId_dayPlanInfo_tableNo(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTask.id)?? && (produceTask.planParId.dayPlanInfo.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTask.planParId.dayPlanInfo.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTask_chPackageView_form',obj, 'produceTask.planParId.dayPlanInfo', '/WOM/producePlanRef/dayBatchPlanParts/planRef.action');
												CUI.commonFills('WOM_produceTask_produceTask_chPackageView_form', 'produceTask.planParId.dayPlanInfo',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.produceTask.produceTask.chPackageView.query_produceTask_planParId_dayPlanInfo_tableNo = function() {
										return "planWorkType="+"makeTask";
									}
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion141577264483354456')}" >${getText('WOM.propertydisplayName.radion141577264483354456')}</label>
				</td>
				
						<#assign produceTask_productId_productCode_defaultValue  = ''>
														<#assign produceTask_productId_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${produceTask_productId_productCode_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.chPackageView._querycustomFunc('produceTask_productId_productCode')" view=true  value="${(produceTask.productId.productCode)!}" displayFieldName="productCode" name="produceTask.productId.productCode" id="produceTask_productId_productCode" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_chPackageView_form" editCustomCallback="getDefaultFormular(obj);" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname="getDefaultFormular(obj);_callback_produceTask_productId_productCode(obj);" cssStyle="" isEdit=true beforecallback='clearFormular(obj)'    isCrossCompany=false  editLinkCallBack="_callback_produceTask_productId_productCode_edit" delCustomCallback="_del_callback_produceTask_productId_productCode()"/>
								
								
								<script type="text/javascript">
									var _callback_produceTask_productId_productCode_obj;
									
									function _del_callback_produceTask_productId_productCode(){
										var label = $('input[name="produceTask.productId.productCode"]').parents('td').prev().find('label');
										label.html(label.attr("value"));
									}
								
									function _callback_produceTask_productId_productCode_edit(obj){
										var label = $('input[name="produceTask.productId.productCode"]').parents('td').prev().find('label');
										_callback_produceTask_productId_productCode_obj = obj[0];
										if(null != obj[0] && undefined != obj[0] && null != obj[0].id && obj[0].id != "" ){
											label.html("<span class='edit-table-symbol-span' onclick='_opendialog_produceTask_productId_productCode()'>" + label.attr("value") + "</span>");
										} else {
											label.html(label.attr("value"));
										}
									}
									<#if (produceTask.productId.productCode)?? >
									(function(){
										var name = 'produceTask.productId.id';
										var id = $('input[name="'+name+'"]').val();
										if(id != null && id != ""){
											var label = $('input[name="produceTask.productId.productCode"]').parents('td').prev().find('label');
											_callback_produceTask_productId_productCode_obj = new Object();
											_callback_produceTask_productId_productCode_obj.id = id;
											label.html("<span class='edit-table-symbol-span' onclick='_opendialog_produceTask_productId_productCode()'>" + label.attr("value") + "</span>");
										}
									})();
									</#if>
									function _opendialog_produceTask_productId_productCode(){
										var url = "/MESBasic/product/product/productViewnew.action?entityCode=MESBasic_1_product&id="+_callback_produceTask_productId_productCode_obj.id+"&${getPowerCode('','MESBasic_1_product_productViewnew')}";
										if("frame" == "dialog"){
											var buttons = [];
											buttons.push({
												name:"${getText('foundation.common.closed')}",
												type:"cancel"
											});
											_callback_produceTask_productId_productCode_Dlg = new CUI.Dialog({
												title: "${getText('MESBasic.viewtitle.randon1476012501418')}",
												url : url,
												modal: true,
												type : '1',
												buttons:buttons
											});
											_callback_produceTask_productId_productCode_Dlg.show();
										}else{
											openFullScreen(url);
										}
									}
								</script>
								
								<script type="text/javascript">
								<#if !(produceTask.id)?? && (produceTask.productId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTask.productId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTask_chPackageView_form',obj, 'produceTask.productId', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('WOM_produceTask_produceTask_chPackageView_form', 'produceTask.productId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion141577274073745646')}" >${getText('WOM.propertydisplayName.radion141577274073745646')}</label>
				</td>
				
						<#assign produceTask_productId_productName_defaultValue  = ''>
														<#assign produceTask_productId_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.productId.productName" id="produceTask_productId_productName"  style=";" originalvalue="<#if !newObj || (produceTask.productId.productName)?has_content>${(produceTask.productId.productName?html)!}<#else>${produceTask_productId_productName_defaultValue!}</#if>" value="<#if !newObj || (produceTask.productId.productName)?has_content>${(produceTask.productId.productName?html)!}<#else>${produceTask_productId_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion141577262038433')}" >${getText('WOM.propertydisplayName.radion141577262038433')}</label>
				</td>
				
						<#assign produceTask_productId_productSpecif_defaultValue  = ''>
														<#assign produceTask_productId_productSpecif_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.productId.productSpecif" id="produceTask_productId_productSpecif"  style=";" originalvalue="<#if !newObj || (produceTask.productId.productSpecif)?has_content>${(produceTask.productId.productSpecif?html)!}<#else>${produceTask_productId_productSpecif_defaultValue!}</#if>" value="<#if !newObj || (produceTask.productId.productSpecif)?has_content>${(produceTask.productId.productSpecif?html)!}<#else>${produceTask_productId_productSpecif_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion14157725686653224566')}" >${getText('WOM.propertydisplayName.radion14157725686653224566')}</label>
				</td>
				
						<#assign produceTask_productId_productModel_defaultValue  = ''>
														<#assign produceTask_productId_productModel_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.productId.productModel" id="produceTask_productId_productModel"  style=";" originalvalue="<#if !newObj || (produceTask.productId.productModel)?has_content>${(produceTask.productId.productModel?html)!}<#else>${produceTask_productId_productModel_defaultValue!}</#if>" value="<#if !newObj || (produceTask.productId.productModel)?has_content>${(produceTask.productId.productModel?html)!}<#else>${produceTask_productId_productModel_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489658031489')}" >${getText('WOM.propertydisplayName.randon1489658031489')}</label>
				</td>
				
						<#assign produceTask_productNum_defaultValue  = ''>
							 							<#assign produceTask_productNum_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="produceTask.productNum" id="produceTask_productNum"  style=";" originalvalue="<#if newObj&& !(produceTask.productNum)?has_content>${produceTask_productNum_defaultValue!}<#elseif (produceTask.productNum)?has_content>#{(produceTask.productNum)!; m2M2}</#if>" value="<#if newObj&& !(produceTask.productNum)?has_content>${produceTask_productNum_defaultValue!}<#elseif (produceTask.productNum)?has_content>#{(produceTask.productNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randonpl3')}" >${getText('WOM.propertydisplayName.randonpl3')}</label>
				</td>
				
						<#assign produceTask_formularId_code_defaultValue  = ''>
														<#assign produceTask_formularId_code_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" reftitle="${getText('RM.viewtitle.randon1498184485083')}" viewType="${viewType!}" deValue="${produceTask_formularId_code_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.chPackageView._querycustomFunc('produceTask_formularId_code')" view=true  value="${(produceTask.formularId.code)!}" displayFieldName="code" name="produceTask.formularId.code" id="produceTask_formularId_code" type="other" url="/RM/formula/formula/formulaPackTaskRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_chPackageView_form" editCustomCallback="_callback_produceTask(obj);" refViewCode="RM_7.5.0.0_formula_formulaPackTaskRef" onkeyupfuncname="_callback_produceTask(obj);_callback_produceTask_formularId_code(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTask.id)?? && (produceTask.formularId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTask.formularId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTask_chPackageView_form',obj, 'produceTask.formularId', '/RM/formula/formula/formulaPackTaskRef.action');
												CUI.commonFills('WOM_produceTask_produceTask_chPackageView_form', 'produceTask.formularId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.produceTask.produceTask.chPackageView.query_produceTask_formularId_code = function() {
										return "factoryModelId="+$("[name='produceTask.factoryId.id']").val()+"&product="+$("[name='produceTask.productId.id']").val();
									}
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randonpl4')}" >${getText('WOM.propertydisplayName.randonpl4')}</label>
				</td>
				
						<#assign produceTask_formularId_name_defaultValue  = ''>
														<#assign produceTask_formularId_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.formularId.name" id="produceTask_formularId_name"  style=";" originalvalue="<#if !newObj || (produceTask.formularId.name)?has_content>${(produceTask.formularId.name?html)!}<#else>${produceTask_formularId_name_defaultValue!}</#if>" value="<#if !newObj || (produceTask.formularId.name)?has_content>${(produceTask.formularId.name?html)!}<#else>${produceTask_formularId_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1503897133347')}" >${getText('WOM.propertydisplayName.randon1503897133347')}</label>
				</td>
				
						<#assign produceTask_taskType_defaultValue  = 'womTaskType/type7'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTask_taskType_defaultValue!}" formId="WOM_produceTask_produceTask_chPackageView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.taskType.id" code="womTaskType" value="${(produceTask.taskType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTask_chPackageView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.taskType.id" code="womTaskType" value="${(produceTask.taskType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1419232393782efe')}" >${getText('WOM.propertydisplayName.radion1419232393782efe')}</label>
				</td>
				
						<#assign produceTask_factoryId_name_defaultValue  = ''>
														<#assign produceTask_factoryId_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1498043312692')}" viewType="${viewType!}" deValue="${produceTask_factoryId_name_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.chPackageView._querycustomFunc('produceTask_factoryId_name')" view=true  value="${(produceTask.factoryId.name)!}" displayFieldName="name" name="produceTask.factoryId.name" id="produceTask_factoryId_name" type="other" url="/MESBasic/factoryModel/factoryModel/factoryProBatchRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_chPackageView_form" editCustomCallback=";" refViewCode="MESBasic_1_factoryModel_factoryProBatchRef" onkeyupfuncname=";_callback_produceTask_factoryId_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTask.id)?? && (produceTask.factoryId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTask.factoryId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTask_chPackageView_form',obj, 'produceTask.factoryId', '/MESBasic/factoryModel/factoryModel/factoryProBatchRef.action');
												CUI.commonFills('WOM_produceTask_produceTask_chPackageView_form', 'produceTask.factoryId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.produceTask.produceTask.chPackageView.query_produceTask_factoryId_name = function() {
										return "formulaId="+$("[name='produceTask.formularId.id']").val();
									}
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radio3ffffn1415772644833')}" >${getText('WOM.propertydisplayName.radio3ffffn1415772644833')}</label>
				</td>
				
						<#assign produceTask_bulkProduct_productCode_defaultValue  = ''>
														<#assign produceTask_bulkProduct_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="${viewType!}" deValue="${produceTask_bulkProduct_productCode_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.chPackageView._querycustomFunc('produceTask_bulkProduct_productCode')" view=true  value="${(produceTask.bulkProduct.productCode)!}" displayFieldName="productCode" name="produceTask.bulkProduct.productCode" id="produceTask_bulkProduct_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_chPackageView_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_produceTask_bulkProduct_productCode(obj);" cssStyle="" isEdit=true beforecallback='clearBatchText(obj)'    isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTask.id)?? && (produceTask.bulkProduct.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTask.bulkProduct.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTask_chPackageView_form',obj, 'produceTask.bulkProduct', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('WOM_produceTask_produceTask_chPackageView_form', 'produceTask.bulkProduct',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion14157727407372345444')}" >${getText('WOM.propertydisplayName.radion14157727407372345444')}</label>
				</td>
				
						<#assign produceTask_bulkProduct_productName_defaultValue  = ''>
														<#assign produceTask_bulkProduct_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.bulkProduct.productName" id="produceTask_bulkProduct_productName"  style=";" originalvalue="<#if !newObj || (produceTask.bulkProduct.productName)?has_content>${(produceTask.bulkProduct.productName?html)!}<#else>${produceTask_bulkProduct_productName_defaultValue!}</#if>" value="<#if !newObj || (produceTask.bulkProduct.productName)?has_content>${(produceTask.bulkProduct.productName?html)!}<#else>${produceTask_bulkProduct_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion141577262038445436255')}" >${getText('WOM.propertydisplayName.radion141577262038445436255')}</label>
				</td>
				
						<#assign produceTask_bulkProduct_productSpecif_defaultValue  = ''>
														<#assign produceTask_bulkProduct_productSpecif_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.bulkProduct.productSpecif" id="produceTask_bulkProduct_productSpecif"  style=";" originalvalue="<#if !newObj || (produceTask.bulkProduct.productSpecif)?has_content>${(produceTask.bulkProduct.productSpecif?html)!}<#else>${produceTask_bulkProduct_productSpecif_defaultValue!}</#if>" value="<#if !newObj || (produceTask.bulkProduct.productSpecif)?has_content>${(produceTask.bulkProduct.productSpecif?html)!}<#else>${produceTask_bulkProduct_productSpecif_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion14157725686653334556')}" >${getText('WOM.propertydisplayName.radion14157725686653334556')}</label>
				</td>
				
						<#assign produceTask_bulkProduct_productModel_defaultValue  = ''>
														<#assign produceTask_bulkProduct_productModel_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.bulkProduct.productModel" id="produceTask_bulkProduct_productModel"  style=";" originalvalue="<#if !newObj || (produceTask.bulkProduct.productModel)?has_content>${(produceTask.bulkProduct.productModel?html)!}<#else>${produceTask_bulkProduct_productModel_defaultValue!}</#if>" value="<#if !newObj || (produceTask.bulkProduct.productModel)?has_content>${(produceTask.bulkProduct.productModel?html)!}<#else>${produceTask_bulkProduct_productModel_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon14900645014694565652')}" >${getText('WOM.propertydisplayName.randon14900645014694565652')}</label>
				</td>
				
						<#assign produceTask_bulkBatchNum_batchText_defaultValue  = ''>
														<#assign produceTask_bulkBatchNum_batchText_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('WOM.viewtitle.randon1503994294075')}" viewType="${viewType!}" deValue="${produceTask_bulkBatchNum_batchText_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.chPackageView._querycustomFunc('produceTask_bulkBatchNum_batchText')" view=true  value="${(produceTask.bulkBatchNum.batchText)!}" displayFieldName="batchText" name="produceTask.bulkBatchNum.batchText" id="produceTask_bulkBatchNum_batchText" type="other" url="/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_chPackageView_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_standingcropRef_batchNumOneMakeTask" onkeyupfuncname=";_callback_produceTask_bulkBatchNum_batchText(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTask.id)?? && (produceTask.bulkBatchNum.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTask.bulkBatchNum.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTask_chPackageView_form',obj, 'produceTask.bulkBatchNum', '/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action');
												CUI.commonFills('WOM_produceTask_produceTask_chPackageView_form', 'produceTask.bulkBatchNum',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.produceTask.produceTask.chPackageView.query_produceTask_bulkBatchNum_batchText = function() {
										return "goodID="+$("[name='produceTask.bulkProduct.id']").val();
									}
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495854016913')}" >${getText('WOM.propertydisplayName.randon1495854016913')}</label>
				</td>
				
						<#assign produceTask_bulkNum_defaultValue  = ''>
							 							<#assign produceTask_bulkNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="produceTask.bulkNum" id="produceTask_bulkNum"  style=";" originalvalue="<#if newObj&& !(produceTask.bulkNum)?has_content>${produceTask_bulkNum_defaultValue!}<#elseif (produceTask.bulkNum)?has_content>#{(produceTask.bulkNum)!; m2M2}</#if>" value="<#if newObj&& !(produceTask.bulkNum)?has_content>${produceTask_bulkNum_defaultValue!}<#elseif (produceTask.bulkNum)?has_content>#{(produceTask.bulkNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489669409811')}" >${getText('WOM.propertydisplayName.randon1489669409811')}</label>
				</td>
				
						<#assign produceTask_planStartTime_defaultValue  = ''>
							 					<#if (produceTask_planStartTime_defaultValue)?? &&(produceTask_planStartTime_defaultValue)?has_content>
							<#assign produceTask_planStartTime_defaultValue  = getDefaultDateTime(produceTask_planStartTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(produceTask.planStartTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planStartTime" value="${produceTask_planStartTime_defaultValue!}" type="dateTimeMin"  id="produceTask.planStartTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (produceTask.planStartTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planStartTime" value="${produceTask.planStartTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTimeMin"  id="produceTask.planStartTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planStartTime" value="" type="dateTimeMin" id="produceTask.planStartTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489669527423')}" >${getText('WOM.propertydisplayName.randon1489669527423')}</label>
				</td>
				
						<#assign produceTask_planEndTime_defaultValue  = ''>
							 							<#assign produceTask_planEndTime_defaultValue  = ''>
					<#if (produceTask_planEndTime_defaultValue)?? &&(produceTask_planEndTime_defaultValue)?has_content>
							<#assign produceTask_planEndTime_defaultValue  = getDefaultDateTime(produceTask_planEndTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(produceTask.planEndTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planEndTime" value="${produceTask_planEndTime_defaultValue!}" type="dateTimeMin"  id="produceTask.planEndTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (produceTask.planEndTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planEndTime" value="${produceTask.planEndTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTimeMin"  id="produceTask.planEndTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planEndTime" value="" type="dateTimeMin" id="produceTask.planEndTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTask", "WOM_7.5.0.0_produceTask_chPackageView", 'EDIT')>
			<#if customPropList?? && customPropList?size gte 1>
				<table class="edit-table" style="" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td style="width:13%;"></td><td style="width:20%;"></td>
					<td style="width:13%;"></td><td style="width:20%;"></td>
					<td style="width:13%;"></td><td style="width:20%;"></td>
				</tr>
			<tr>
				<#-- 排布自定义字段 -->
				<#assign totalspan = 0>
				<#list customPropList as c>
				<#assign cspan = (c.colspan!1)>
				<#if cspan gt 3>
					<#assign cspan = 3>
				</#if>
				<#if cspan gt 1>
					<#assign colspanVal = cspan * 2 - 1>
				</#if> 
				<#assign cp_index = c_index + totalspan>
				<#if (cp_index + 1) % 3 == 0>
					<#assign restcol = 1>
				<#else>
					<#assign restcol = 3 - (cp_index + 1) % 3 + 1>
				</#if>
				<#if (cp_index gt 0 && ((cp_index + 1) % 3 == 1 || 3 == 1)) || cspan gt restcol>
					<#if cspan gt restcol>
						<#assign totalspan = totalspan + restcol>
					</#if>
				</tr><tr>
				</#if>
				<#assign totalspan = totalspan + cspan - 1>
				<td nullable=<#if (c.nullable!false)>true<#else>false</#if> class="edit-table-symbol" <#if c.fieldType?? && c.fieldType == 'DATATIME'>celltype="DATATIME"</#if> style="text-align:right;">
					<label value="${getText('${c.displayName}')}">${getText('${c.displayName}')}</label>
				</td>
				<td nullable=<#if (c.nullable!false)>true<#else>false</#if> class="edit-table-content" <#if c.fieldType?? && c.fieldType == 'DATATIME'>celltype="DATATIME"</#if> <#if cspan gt 1>colspan="${colspanVal}"</#if> style="text-align:left;">
					<#assign columnType = c.property.type>
					<#assign columnName = c.property.name>
					<#assign decimalNum = (c.property.decimalNum!-1)>
					<#assign elementName = 'produceTask' + "." + columnName>
					<#assign elementId = 'produceTask' + "_" + columnName>
					<#if cpvmInfo?? && c.relatedKey?has_content>
					<#assign cpvmInfo = cpvmInfo + ',' + c.relatedKey + "||" + elementName>
					</#if>
					<#assign fieldType = c.fieldType>
					<#if fieldType == 'TEXTFIELD'>
					<div class="fix-input-readonly">
					<#if columnType == 'DECIMAL'>
						<#if c.precision??>
							<#assign decimalNum =c.precision!>
						</#if>
						<@s.hidden property_type="${columnType}" id="${elementName?replace('.', '_')}_hide" name="${elementName}" />
						<input property_type="${columnType}" type="text" id="${elementName?replace('.', '_')}" name="${elementName?replace('.', '_')}" class="cui-noborder-input numberField" <#if c.align??>style="text-align:${c.align?html};"</#if> readonly="readonly"  />
					<#elseif columnType == 'INTEGER'>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input numberField" cssStyle="text-align:${c.align!}" readonly="true" />
					<#else>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input" cssStyle="text-align:${c.align!}" readonly="true" />
					</#if>
					</div>
					<script type="text/javascript">
						$(function(){
							<#if columnType == 'DECIMAL'>
							var tmpVal = parseFloat($("#${elementName?replace('.', '_')}_hide").val());
							if (!isNaN(tmpVal)) {
								var percision = parseInt("${decimalNum}");
								var countVal = (percision > -1 ? tmpVal.toFixed(percision) : tmpVal);
								$("#${elementName?replace('.', '_')}_hide").val(countVal);
								$("#${elementName?replace('.', '_')}_hide").attr("originalvalue", countVal);
								<#if c.format == 'THOUSAND' || c.format == 'TEN_THOUSAND'>
								countVal = formatMoney(<#if c.format == 'THOUSAND'>3<#elseif c.format = 'TEN_THOUSAND'>4</#if>, countVal);
								<#elseif c.format == 'PERCENT'>
								if (percision > -1) {
									var tmpPercision = percision - 2 >= 0 ? percision - 2 : 0;
									countVal = (countVal * 100).toFixed(tmpPercision) + "%";
								} else {
									countVal = (countVal * 100) + "%";
								}
								</#if>
								$("#${elementName?replace('.', '_')}").val(countVal);
								$("#${elementName?replace('.', '_')}").attr('originalvalue', countVal);
							}
							</#if>
						});
					</script>
					<#elseif fieldType == 'TEXTAREA'>
						<div class="fix-input-readonly fix-ie7-textarea">
							<@s.textarea property_type="${columnType}" id="${elementName?replace('.', '_')}" name="${elementName}" rows="${c.textareaRow!3}" cssClass="cui-textarea-wh" cssStyle="border:0;line-height:16px;padding-left:2px;text-align:${c.align!}" readonly="true" onpropertychange="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" oninput="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" onkeyup="autoTextarea('${elementName?replace('.', '_')}',null,null,true);" />
						</div>
						<script type="text/javascript">
							$(function(){
								CUI["${elementName?replace('.', '_')}completeFlag"] = "first";
								autoTextarea("${elementName?replace('[^a-zA-Z0-9_]', '_', 'r')}");
								//有业务中心的时候,非ie浏览器需要手动再延迟触发一次
								if (YAHOO.env.ua.ie == 0) {
									setTimeout(function(){autoTextarea("${elementName?replace('.', '_')}")}, 200);
								}else{
									setTimeout(function(){autoTextarea("${elementName?replace('.', '_')}")}, 1000);
								}
							});
						</script>
					<#elseif fieldType == 'DATETIME' || fieldType == 'DATE'>
						<#assign dateType = ''>
						<#if c.format == 'YMD_H'>
							<#assign dateType = 'dateTimeHour'>
						<#elseif c.format == 'YMD_HM'>
							<#assign dateType = 'dateTimeMin'>
						<#elseif c.format == 'YMD'>
							<#assign dateType = 'date'>
						<#elseif c.format == 'YM'>
							<#assign dateType = 'yearMonth'>
						<#elseif c.format == 'Y'>
							<#assign dateType = 'year'>
						<#else>
							<#assign dateType = 'dateTime'>
						</#if>
						<#assign dateVal = ''>
						<#if produceTask[columnName]??>
							<#assign dateVal = (produceTask[columnName])?string('yyyy-MM-dd HH:mm:ss')>
						</#if>
						<@datepicker property_type="${columnType}" cssClass="cui-noborder-input" name="${elementName}" id="${elementName?replace('.', '_')}" value=dateVal type="${dateType}" align="${c.align!}" view=true />
					<#elseif fieldType == 'SELECTCOMP'>
						<#if columnType == 'SYSTEMCODE'>
							<#assign isS2 = false>
							<#if c.property.seniorSystemCode?? && c.property.seniorSystemCode>
								<#assign isS2 = true>
							</#if>
							<#assign isMultable = false>
							<#if c.property.multable?? && c.property.multable>
								<#assign isMultable = true>
							</#if>
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_produceTask_produceTask_chPackageView_form" classStyle="cui-noborder-input" view=true cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${produceTask[columnName]!}" seniorSystemCode=isS2 />
						<#else>
							<#assign displayColumnName = columnName + "MainDisplay">
							<#assign viewUrl = (c.refView.url)!''>
							<#assign viewTitle = (c.refView.title)!''>
							<#assign typeVal = ''>
							<#if viewUrl?? && viewUrl?index_of('/foundation/') gte 0 && viewUrl?index_of('/common/') gte 0 >
								<#assign viewSplitArr = viewUrl?split('/')>
								<#assign typeVal = viewSplitArr[2]>
							</#if>
							<#assign pkName = ''>
							<#assign mainDisplayName = ''>
							<#list c.property.associatedProperty.model.properties as p>
								<#if !pkName?has_content && p.isPk?? && p.isPk>
									<#assign pkName = p.name>
								</#if>
								<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
									<#assign mainDisplayName = p.name>
								</#if>
							</#list>
							<#if typeVal?? && typeVal?has_content>
								<#assign mneType = typeVal?cap_first>
							<#else>
								<#assign mneType = 'other'>
							</#if>
							<input type="hidden" iscustom="true" name="${elementName}" value="${produceTask[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${produceTask[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=true value="${produceTask[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_produceTask_produceTask_chPackageView_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
							<script type="text/javascript">
								function callback_obj_cp_${elementName?replace('.', '_')}() {
									if ( $('input:hidden[name="${elementName}.${pkName!'id'}"]').val() ) {
										$('input:hidden[name="${elementName}"]').val( $('input:hidden[name="${elementName}.${pkName!'id'}"]').val() );
									}
								}
								function callback_obj_cp_${elementName?replace('.', '_')}_delete() {
									$('input:hidden[name="${elementName}.${pkName!'id'}"]').val('');
									$('input:hidden[name="${elementName}"]').val('');
									if ( $('#cp_info').length > 0 ) {
											var dg_cp_info = $('#cp_info').val();
											var infoArr = dg_cp_info.split(',');
											for (var n in infoArr) {
												var info = infoArr[n].split('||');
												var name = info[1];
												CUI('input[name="'+ name +'"]').val('');
											}
									}
								}
							</script>
						</#if>
					</#if>
				</td>
				</#list>
					<#if cpvmInfo?? && cpvmInfo?length gt 0>
						<#assign cpvmInfo = cpvmInfo?substring(1)>
						<input type="hidden" id="cp_info" value="${cpvmInfo!}" />
					</#if>
		</tr>
	</table>
	</#if>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489669389730')}" >${getText('WOM.propertydisplayName.randon1489669389730')}</label>
				</td>
				
						<#assign produceTask_remark_defaultValue  = ''>
							 							<#assign produceTask_remark_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.remark" id="produceTask_remark"  style=";" originalvalue="<#if !newObj || (produceTask.remark)?has_content>${(produceTask.remark?html)!}<#else>${produceTask_remark_defaultValue!}</#if>" value="<#if !newObj || (produceTask.remark)?has_content>${(produceTask.remark?html)!}<#else>${produceTask_remark_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490578864812')}" >${getText('RM.propertydisplayName.randon1490578864812')}</label>
				</td>
				
						<#assign produceTask_formularId_setProcess_defaultValue  = ''>
														<#assign produceTask_formularId_setProcess_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTask_formularId_setProcess_defaultValue!}" formId="WOM_produceTask_produceTask_chPackageView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.formularId.setProcess.id" code="formulaProperty" value="${(produceTask.formularId.setProcess.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTask_chPackageView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.formularId.setProcess.id" code="formulaProperty" value="${(produceTask.formularId.setProcess.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1496283447542')}" >${getText('WOM.propertydisplayName.randon1496283447542')}</label>
				</td>
				
						<#assign produceTask_tasksID_defaultValue  = ''>
							 							<#assign produceTask_tasksID_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="produceTask.tasksID" id="produceTask_tasksID"  style=";" originalvalue="<#if !newObj || (produceTask.tasksID)?has_content>${(produceTask.tasksID?html)!}<#else>${produceTask_tasksID_defaultValue!}</#if>" value="<#if !newObj || (produceTask.tasksID)?has_content>${(produceTask.tasksID?html)!}<#else>${produceTask_tasksID_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495090060829')}" >${getText('WOM.propertydisplayName.randon1495090060829')}</label>
				</td>
				
						<#assign produceTask_workType_defaultValue  = ''>
							 							<#assign produceTask_workType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTask_workType_defaultValue!}" formId="WOM_produceTask_produceTask_chPackageView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.workType.id" code="produceType" value="${(produceTask.workType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTask_chPackageView_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.workType.id" code="produceType" value="${(produceTask.workType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1504487938364')}" >${getText('WOM.propertydisplayName.randon1504487938364')}</label>
				</td>
				
						<#assign produceTask_supportEbr_defaultValue  = ''>
							 							<#assign produceTask_supportEbr_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="produceTask.supportEbr_check" originalvalue="<#if !newObj><#if (produceTask.supportEbr)??>${(produceTask.supportEbr!false)?string('true','false')}<#else>false</#if><#elseif produceTask_supportEbr_defaultValue?has_content>${(produceTask_supportEbr_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (produceTask.supportEbr)??>${(produceTask.supportEbr!false)?string('true','false')}<#else>false</#if><#else>${(produceTask_supportEbr_defaultValue!true)?string}</#if>"  disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="produceTask.supportEbr" originalvalue="<#if ((produceTask.supportEbr)?? &&  produceTask.supportEbr)||(produceTask_supportEbr_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((produceTask.supportEbr)?? &&  produceTask.supportEbr)||(produceTask_supportEbr_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="produceTask.supportEbr_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="produceTask.supportEbr"]');
												CUI('input[name="produceTask.supportEbr_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1495867997233')}" >${getText('WOM.propertydisplayName.randon1495867997233')}</label>
				</td>
				
						<#assign produceTask_batchProdTaskID_defaultValue  = ''>
							 							<#assign produceTask_batchProdTaskID_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.batchProdTaskID" id="produceTask_batchProdTaskID"  style=";" originalvalue="<#if !newObj || (produceTask.batchProdTaskID)?has_content>${(produceTask.batchProdTaskID?html)!}<#else>${produceTask_batchProdTaskID_defaultValue!}</#if>" value="<#if !newObj || (produceTask.batchProdTaskID)?has_content>${(produceTask.batchProdTaskID?html)!}<#else>${produceTask_batchProdTaskID_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
</div>				</div>
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				
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
			<#if false>
				<#assign routeFlag = "2">
			<#else>
				<#if false && isIE>
						<#assign routeFlag = "1">
				<#else>
						<#assign routeFlag = "0">
				</#if>
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1506306746525.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746525">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1506306746525.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746525">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceTaskActive_dg1506306746525_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceTaskActive_dg1506306746525_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProduceTaskActive_dg1506306746525" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1506306746525_id" value="ProduceTaskActive_dg1506306746525" />
			
			<input type="hidden" id="dg1506306746525_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1489671093316')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1506306746525.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746525"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProduceTaskActive_dg1506306746525" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProduceTaskActive_dg1506306746525" viewType="${viewType}" renderOverEvent="dg1506306746525RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_chPackageView_form" noPermissionKeys="productId.productCode,productId.id,productId.productName,activeType,property,standardNum,planNum,productId.productBaseUnit.name,isMixQuality,phase,sequence,needWeigh,batchNumObj.batchText,minQuality,maxQuality,lossRate,remark,batchNumObj.id,orderProcessId.id,activeId.id,formulaId.id,processId.id,putBatMateId.id" modelCode="WOM_7.5.0.0_produceTask_ProduceTaskActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1506306746525" dtPage="dgPage"  hidekeyPrefix="dg1506306746525" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.id','productId.id','productId.productName','productId.id','productId.productBaseUnit.name','batchNumObj.id','batchNumObj.batchText','batchNumObj.id','batchNumObj.id','orderProcessId.id','orderProcessId.id','activeId.id','activeId.id','formulaId.id','formulaId.id','processId.id','processId.id','putBatMateId.id','putBatMateId.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1506306746525PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1490443916302')}" activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign productId_productCode_displayDefaultType=''>
								<#assign productId_productCode_defaultValue=''>
										<#assign productId_productCode_defaultValue=''>
																	<#if (productId_productCode_defaultValue!)?string=="currentUser">
								<#assign productId_productCode_defaultValue='${staffJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentPost">
								<#assign productId_productCode_defaultValue='${postJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentDepart">
								<#assign productId_productCode_defaultValue='${deptJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentComp">
								<#assign productId_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout.action" viewCode="MESBasic_1_product_refProductLayout" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  label="${getText('WOM.propertydisplayName.radion14157726448331')}" width=100 showFormatFunc=""  />
							<#assign productId_id_displayDefaultType=''>
								<#assign productId_id_defaultValue=''>
										<#assign productId_id_defaultValue=''>
																	<#if (productId_id_defaultValue!)?string=="currentUser">
								<#assign productId_id_defaultValue='${staffJson!}'>
							<#elseif (productId_id_defaultValue!)?string=="currentPost">
								<#assign productId_id_defaultValue='${postJson!}'>
							<#elseif (productId_id_defaultValue!)?string=="currentDepart">
								<#assign productId_id_defaultValue='${deptJson!}'>
							<#elseif (productId_id_defaultValue!)?string=="currentComp">
								<#assign productId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.id"        showFormat="TEXT" defaultValue="${(productId_id_defaultValue!)?string}" defaultDisplay="${(productId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="center" hiddenCol=true viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.randon1449796384550')}" width=100 showFormatFunc=""  />
							<#assign productId_productName_displayDefaultType=''>
								<#assign productId_productName_defaultValue=''>
										<#assign productId_productName_defaultValue=''>
																	<#if (productId_productName_defaultValue!)?string=="currentUser">
								<#assign productId_productName_defaultValue='${staffJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentPost">
								<#assign productId_productName_defaultValue='${postJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentDepart">
								<#assign productId_productName_defaultValue='${deptJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentComp">
								<#assign productId_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737455')}" width=100 showFormatFunc=""  />
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue='activeType/activeType3'>
										 									<@systemCodeColumn code="activeType" textalign="center" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1489726359628')}" width=100 hiddenCol=true  />
							<#assign property_displayDefaultType=''>
								<#assign property_defaultValue=''>
										<#assign property_defaultValue=''>
										 									<@systemCodeColumn code="RMproperty" textalign="left" defaultValue="${(property_defaultValue!)?string}" key="property.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1503996516434')}" width=80   />
							<#assign standardNum_displayDefaultType=''>
								<#assign standardNum_defaultValue=''>
										<#assign standardNum_defaultValue=''>
										 
									<@datacolumn key="standardNum"        showFormat="TEXT" defaultValue="${(standardNum_defaultValue!)?string}" defaultDisplay="${(standardNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730105405')}" width=80 showFormatFunc=""  />
							<#assign planNum_displayDefaultType=''>
								<#assign planNum_defaultValue=''>
										<#assign planNum_defaultValue=''>
										 
									<@datacolumn key="planNum"        showFormat="TEXT" defaultValue="${(planNum_defaultValue!)?string}" defaultDisplay="${(planNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730174515')}" width=60 showFormatFunc=""  />
							<#assign productId_productBaseUnit_name_displayDefaultType=''>
								<#assign productId_productBaseUnit_name_defaultValue=''>
										<#assign productId_productBaseUnit_name_defaultValue=''>
																	<#if (productId_productBaseUnit_name_defaultValue!)?string=="currentUser">
								<#assign productId_productBaseUnit_name_defaultValue='${staffJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentPost">
								<#assign productId_productBaseUnit_name_defaultValue='${postJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentDepart">
								<#assign productId_productBaseUnit_name_defaultValue='${deptJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentComp">
								<#assign productId_productBaseUnit_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1398235640483')}" width=60 showFormatFunc=""  />
							<#assign isMixQuality_displayDefaultType=''>
								<#assign isMixQuality_defaultValue=''>
										<#assign isMixQuality_defaultValue=''>
										 
									<@datacolumn key="isMixQuality"        showFormat="CHECKBOX" defaultValue="${(isMixQuality_defaultValue!)?string}" defaultDisplay="${(isMixQuality_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729935738')}" width=60 showFormatFunc=""  />
							<#assign phase_displayDefaultType=''>
								<#assign phase_defaultValue=''>
										<#assign phase_defaultValue=''>
										 
									<@datacolumn key="phase"        showFormat="TEXT" defaultValue="${(phase_defaultValue!)?string}" defaultDisplay="${(phase_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503995488887')}" width=60 showFormatFunc=""  />
							<#assign sequence_displayDefaultType=''>
								<#assign sequence_defaultValue=''>
										<#assign sequence_defaultValue=''>
										 
									<@datacolumn key="sequence"        showFormat="TEXT" defaultValue="${(sequence_defaultValue!)?string}" defaultDisplay="${(sequence_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503995517319')}" width=60 showFormatFunc=""  />
							<#assign needWeigh_displayDefaultType=''>
								<#assign needWeigh_defaultValue=''>
										<#assign needWeigh_defaultValue=''>
										 
									<@datacolumn key="needWeigh"        showFormat="CHECKBOX" defaultValue="${(needWeigh_defaultValue!)?string}" defaultDisplay="${(needWeigh_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503995551484')}" width=60 showFormatFunc=""  />
							<#assign batchNumObj_batchText_displayDefaultType=''>
								<#assign batchNumObj_batchText_defaultValue=''>
										<#assign batchNumObj_batchText_defaultValue=''>
																	<#if (batchNumObj_batchText_defaultValue!)?string=="currentUser">
								<#assign batchNumObj_batchText_defaultValue='${staffJson!}'>
							<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentPost">
								<#assign batchNumObj_batchText_defaultValue='${postJson!}'>
							<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentDepart">
								<#assign batchNumObj_batchText_defaultValue='${deptJson!}'>
							<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentComp">
								<#assign batchNumObj_batchText_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="batchNumObj.batchText"        showFormat="SELECTCOMP" defaultValue="${(batchNumObj_batchText_defaultValue!)?string}" defaultDisplay="${(batchNumObj_batchText_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="center"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumOneMakeTask" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1503994294075')}"  label="${getText('WOM.propertydisplayName.randon1490064501469')}" width=100 showFormatFunc=""  />
							<#assign minQuality_displayDefaultType=''>
								<#assign minQuality_defaultValue=''>
										<#assign minQuality_defaultValue=''>
										 
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729953842')}" width=80 showFormatFunc=""  />
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										 
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729974625')}" width=80 showFormatFunc=""  />
							<#assign lossRate_displayDefaultType=''>
								<#assign lossRate_defaultValue=''>
										<#assign lossRate_defaultValue=''>
										 
									<@datacolumn key="lossRate"        showFormat="TEXT" defaultValue="${(lossRate_defaultValue!)?string}" defaultDisplay="${(lossRate_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730189645')}" width=60 showFormatFunc=""  />
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										 
									<@datacolumn key="remark"  popView=true      showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730249805')}" width=200 showFormatFunc=""  />
							<#assign batchNumObj_id_displayDefaultType=''>
								<#assign batchNumObj_id_defaultValue=''>
										<#assign batchNumObj_id_defaultValue=''>
																	<#if (batchNumObj_id_defaultValue!)?string=="currentUser">
								<#assign batchNumObj_id_defaultValue='${staffJson!}'>
							<#elseif (batchNumObj_id_defaultValue!)?string=="currentPost">
								<#assign batchNumObj_id_defaultValue='${postJson!}'>
							<#elseif (batchNumObj_id_defaultValue!)?string=="currentDepart">
								<#assign batchNumObj_id_defaultValue='${deptJson!}'>
							<#elseif (batchNumObj_id_defaultValue!)?string=="currentComp">
								<#assign batchNumObj_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="batchNumObj.id"        showFormat="TEXT" defaultValue="${(batchNumObj_id_defaultValue!)?string}" defaultDisplay="${(batchNumObj_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="center" hiddenCol=true viewUrl="/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumOneMakeTask" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1503994294075')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign orderProcessId_id_displayDefaultType=''>
								<#assign orderProcessId_id_defaultValue=''>
										<#assign orderProcessId_id_defaultValue=''>
																	<#if (orderProcessId_id_defaultValue!)?string=="currentUser">
								<#assign orderProcessId_id_defaultValue='${staffJson!}'>
							<#elseif (orderProcessId_id_defaultValue!)?string=="currentPost">
								<#assign orderProcessId_id_defaultValue='${postJson!}'>
							<#elseif (orderProcessId_id_defaultValue!)?string=="currentDepart">
								<#assign orderProcessId_id_defaultValue='${deptJson!}'>
							<#elseif (orderProcessId_id_defaultValue!)?string=="currentComp">
								<#assign orderProcessId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="orderProcessId.id"        showFormat="TEXT" defaultValue="${(orderProcessId_id_defaultValue!)?string}" defaultDisplay="${(orderProcessId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="center" hiddenCol=true viewUrl="/WOM/produceTask/produceTaskProcess/taskProcessRef.action" viewCode="WOM_7.5.0.0_produceTask_taskProcessRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490685207348')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign activeId_id_displayDefaultType=''>
								<#assign activeId_id_defaultValue=''>
										<#assign activeId_id_defaultValue=''>
																	<#if (activeId_id_defaultValue!)?string=="currentUser">
								<#assign activeId_id_defaultValue='${staffJson!}'>
							<#elseif (activeId_id_defaultValue!)?string=="currentPost">
								<#assign activeId_id_defaultValue='${postJson!}'>
							<#elseif (activeId_id_defaultValue!)?string=="currentDepart">
								<#assign activeId_id_defaultValue='${deptJson!}'>
							<#elseif (activeId_id_defaultValue!)?string=="currentComp">
								<#assign activeId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="activeId.id"        showFormat="TEXT" defaultValue="${(activeId_id_defaultValue!)?string}" defaultDisplay="${(activeId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formulaProcessActive/activeCheckRef.action" viewCode="RM_7.5.0.0_formula_activeCheckRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1497922173328')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign formulaId_id_displayDefaultType=''>
								<#assign formulaId_id_defaultValue=''>
										<#assign formulaId_id_defaultValue=''>
																	<#if (formulaId_id_defaultValue!)?string=="currentUser">
								<#assign formulaId_id_defaultValue='${staffJson!}'>
							<#elseif (formulaId_id_defaultValue!)?string=="currentPost">
								<#assign formulaId_id_defaultValue='${postJson!}'>
							<#elseif (formulaId_id_defaultValue!)?string=="currentDepart">
								<#assign formulaId_id_defaultValue='${deptJson!}'>
							<#elseif (formulaId_id_defaultValue!)?string=="currentComp">
								<#assign formulaId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="formulaId.id"        showFormat="SELECTCOMP" defaultValue="${(formulaId_id_defaultValue!)?string}" defaultDisplay="${(formulaId_id_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formula/formulaTaskRef.action" viewCode="RM_7.5.0.0_formula_formulaTaskRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1498047455529')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign processId_id_displayDefaultType=''>
								<#assign processId_id_defaultValue=''>
										<#assign processId_id_defaultValue=''>
																	<#if (processId_id_defaultValue!)?string=="currentUser">
								<#assign processId_id_defaultValue='${staffJson!}'>
							<#elseif (processId_id_defaultValue!)?string=="currentPost">
								<#assign processId_id_defaultValue='${postJson!}'>
							<#elseif (processId_id_defaultValue!)?string=="currentDepart">
								<#assign processId_id_defaultValue='${deptJson!}'>
							<#elseif (processId_id_defaultValue!)?string=="currentComp">
								<#assign processId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="processId.id"        showFormat="SELECTCOMP" defaultValue="${(processId_id_defaultValue!)?string}" defaultDisplay="${(processId_id_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formulaProcess/processReference.action" viewCode="RM_7.5.0.0_formula_processReference" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488596828660')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign putBatMateId_id_displayDefaultType=''>
								<#assign putBatMateId_id_defaultValue=''>
										<#assign putBatMateId_id_defaultValue=''>
																	<#if (putBatMateId_id_defaultValue!)?string=="currentUser">
								<#assign putBatMateId_id_defaultValue='${staffJson!}'>
							<#elseif (putBatMateId_id_defaultValue!)?string=="currentPost">
								<#assign putBatMateId_id_defaultValue='${postJson!}'>
							<#elseif (putBatMateId_id_defaultValue!)?string=="currentDepart">
								<#assign putBatMateId_id_defaultValue='${deptJson!}'>
							<#elseif (putBatMateId_id_defaultValue!)?string=="currentComp">
								<#assign putBatMateId_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="putBatMateId.id"        showFormat="SELECTCOMP" defaultValue="${(putBatMateId_id_defaultValue!)?string}" defaultDisplay="${(putBatMateId_id_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formulaProcessActive/activeCheckRef.action" viewCode="RM_7.5.0.0_formula_activeCheckRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1497922173328')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function ProduceTaskActive_dg1506306746525_check_datagridvalid(){
					//
					var errorObj =ProduceTaskActive_dg1506306746525Widget._DT.testData();
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
				
				function savedg1506306746525DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProduceTaskActive_dg1506306746525Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProduceTaskActive_dg1506306746525Widget') > -1) {
						ProduceTaskActive_dg1506306746525Widget.setAllRowEdited();
					}
					var json = ProduceTaskActive_dg1506306746525Widget.parseEditedData();
					$('input[name="dg1506306746525ListJson"]').remove();
					$('input[name="dgLists[\'dg1506306746525\']"]').remove();
					$('input[name="dg1506306746525ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1506306746525\']">').val(json).appendTo($('#WOM_produceTask_produceTask_chPackageView_form'));
					$('<input type="hidden" name="dg1506306746525ModelCode">').val('WOM_7.5.0.0_produceTask_ProduceTaskActive').appendTo($('#WOM_produceTask_produceTask_chPackageView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1506306746525ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_chPackageView_form'));
				}
				function DT_ProduceTaskActive_dg1506306746525_deldatagrid(){
					var deleteRows = ProduceTaskActive_dg1506306746525Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id','headID.id','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1506306746525DeletedIds").length>0){
							$("#dg1506306746525DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1506306746525DeletedIds" name="dgDeletedIds[\'dg1506306746525\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_chPackageView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1506306746525DeletedIds['+CUI('input[name^="dg1506306746525DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_chPackageView_form'));
					});
					return deleteRows;
				}
				function DT_ProduceTaskActive_dg1506306746525_delTreeNodes(){
					var deleteRows = ProduceTaskActive_dg1506306746525Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id','headID.id','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1506306746525DeletedIds").length>0){
							$("#dg1506306746525DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1506306746525DeletedIds" name="dgDeletedIds[\'dg1506306746525\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_chPackageView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1506306746525DeletedIds['+CUI('input[name^="dg1506306746525DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_chPackageView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_chPackageView_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<2;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'ProduceTaskActive_dg1506306746525') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProduceTaskActive_dg1506306746525';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProduceTaskActive_dg1506306746525';
					}
					$('body').data('WOM_produceTask_produceTask_chPackageView_datagrids', datagrids);
				});
				
				var ProduceTaskActive_dg1506306746525_importDialog = null;
				function ProduceTaskActive_dg1506306746525_showImportDialog(){
					try{
						if(ProduceTaskActive_dg1506306746525_importDialog!=null&&ProduceTaskActive_dg1506306746525_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746525&tid=${id!}&datagridName=dg1506306746525";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_produceTask_chPackageViewdg1506306746525_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProduceTaskActive_dg1506306746525_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProduceTaskActive_dg1506306746525"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskActive_dg1506306746525_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskActive_dg1506306746525_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProduceTaskActive_dg1506306746525_importDialog.show();
					}catch(e){}
				}	
				
				function ProduceTaskActive_dg1506306746525_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746525&templateRelatedModelCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746525&downloadType=template&fileName=dg1506306746525";
					window.open(url,"","");
				}
				function dg1506306746525RenderOverEvent(){
					//启用物料批次
    if(isProBatch==true){
    	//将复制按钮显示
    	$(".paginatorbar [class='paginatorbar-operatebar'] a:eq(2)").hide().show();
    }else{
    	//复制按钮隐藏
    	$(".paginatorbar [class='paginatorbar-operatebar'] a:eq(2)").hide().hide();
		//隐藏物料批号列
		$( 'td[key="batchNumObj.batchText"]').hide();
		ProduceTaskActive_dg1506306746525Widget._DT._resizeHeight = true;
		ProduceTaskActive_dg1506306746525Widget._DT._initDomElements();
		ProduceTaskActive_dg1506306746525Widget._DT._resizeHeight = false;
    }
    //根据有无表体禁用产品、配方、生产线、生产数量
    if(ProduceTaskActive_dg1506306746525Widget.getRowLength()>0){
    	//禁用生产数量
    	$("[name='produceTask.productNum']").attr("readonly",true);
    	//禁用产品
    	$("#produceTask_productId_productCodediv").removeAttr("onmouseenter");
		$("#produceTask_productId_productCodediv").unbind('mouseenter');
		$("[name='produceTask.productId.productCode']").attr("readonly",true);
		$("#produceTask_productId_productCode_click_button").remove();
		//禁用配方
    	$("#produceTask_formularId_codediv").removeAttr("onmouseenter");
		$("#produceTask_formularId_codediv").unbind('mouseenter');
		$("[name='produceTask.formularId.code']").attr("readonly",true);
		$("#produceTask_formularId_code_click_button").remove();
		//禁用生产线
    	$("#produceTask_factoryId_namediv").removeAttr("onmouseenter");
		$("#produceTask_factoryId_namediv").unbind('mouseenter');
		$("[name='produceTask.factoryId.name']").attr("readonly",true);
		$("#produceTask_factoryId_name_click_button").remove();
		//禁用计划
    	$("#produceTask_planParId_dayPlanInfo_tableNodiv").removeAttr("onmouseenter");
		$("#produceTask_planParId_dayPlanInfo_tableNodiv").unbind('mouseenter');
		$("[name='produceTask.planParId.dayPlanInfo.tableNo']").attr("readonly",true);
		$("#produceTask_planParId_dayPlanInfo_tableNo_click_button").remove();
    }
	
	//获取未删前的html
	lableHtme = $(".dg-hd-tr").html();
	//是否支持EBR
	var supportEBR=$("input[name='produceTask.supportEbr']").val();   

	
	formulaChange1();
	//界面新增打开，隐藏工序、活动、顺序、备料系统、替代料列
	//if($("#id").val()==""){
	//	$( 'td[key="activeType.id"]').hide();//活动类型
	//	easyFormulahide();
	//}
	//修改打开时
	//else{
	//	formulaChange1();
	//}
				}
				function dg1506306746525PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.chPackageView.initSize(nTabIndex);
					$('div .paginatorbar-operatebar:eq(0) a:eq(1)').insertBefore( $('div .paginatorbar-operatebar:eq(0) a:eq(0)') );
if($("[name='produceTask.formularId.id']").val()!=""){
	$(".paginatorbar-operatebar :eq(0)").hide();
	$(".paginatorbar-operatebar :eq(2)").hide();
}
				}
			</script>
			
			
			</div>
		</div>
			<div class="clearfix pd_bottom">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" >
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
</div>				</div>
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				
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
			<#if false>
				<#assign routeFlag = "2">
			<#else>
				<#if false && isIE>
						<#assign routeFlag = "1">
				<#else>
						<#assign routeFlag = "0">
				</#if>
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1506306746606.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746606">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1506306746606.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746606">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceMaterialSum_dg1506306746606_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceMaterialSum_dg1506306746606_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProduceMaterialSum_dg1506306746606" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1506306746606_id" value="ProduceMaterialSum_dg1506306746606" />
			
			<input type="hidden" id="dg1506306746606_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1489671141506')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1506306746606.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746606"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProduceMaterialSum_dg1506306746606" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProduceMaterialSum_dg1506306746606" viewType="${viewType}" renderOverEvent="dg1506306746606RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_chPackageView_form" noPermissionKeys="productId.productCode,productId.productName,property,planNum,productId.productBaseUnit.name,batchNum,headId.formularId.setProcess" modelCode="WOM_7.5.0.0_produceTask_ProduceMaterialSum" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1506306746606" dtPage="dgPage"  hidekeyPrefix="dg1506306746606" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName','productId.id','productId.productBaseUnit.name','headId.id','headId.formularId.setProcess.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=1 pageInitMethod="dg1506306746606PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1490444001342')}" activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign productId_productCode_displayDefaultType=''>
								<#assign productId_productCode_defaultValue=''>
										<#assign productId_productCode_defaultValue=''>
																	<#if (productId_productCode_defaultValue!)?string=="currentUser">
								<#assign productId_productCode_defaultValue='${staffJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentPost">
								<#assign productId_productCode_defaultValue='${postJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentDepart">
								<#assign productId_productCode_defaultValue='${deptJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentComp">
								<#assign productId_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productCode"        showFormat="TEXT" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion14157726448331')}" width=120 showFormatFunc=""  />
							<#assign productId_productName_displayDefaultType=''>
								<#assign productId_productName_defaultValue=''>
										<#assign productId_productName_defaultValue=''>
																	<#if (productId_productName_defaultValue!)?string=="currentUser">
								<#assign productId_productName_defaultValue='${staffJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentPost">
								<#assign productId_productName_defaultValue='${postJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentDepart">
								<#assign productId_productName_defaultValue='${deptJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentComp">
								<#assign productId_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productName"        showFormat="SELECTCOMP" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737334')}" width=120 showFormatFunc=""  />
							<#assign property_displayDefaultType=''>
								<#assign property_defaultValue=''>
										<#assign property_defaultValue=''>
										 									<@systemCodeColumn code="RMproperty" textalign="center" defaultValue="${(property_defaultValue!)?string}" key="property.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1504080330992')}" width=100   />
							<#assign planNum_displayDefaultType=''>
								<#assign planNum_defaultValue=''>
										<#assign planNum_defaultValue=''>
										 
									<@datacolumn key="planNum"        showFormat="TEXT" defaultValue="${(planNum_defaultValue!)?string}" defaultDisplay="${(planNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489671332695')}" width=120 showFormatFunc=""  />
							<#assign productId_productBaseUnit_name_displayDefaultType=''>
								<#assign productId_productBaseUnit_name_defaultValue=''>
										<#assign productId_productBaseUnit_name_defaultValue=''>
																	<#if (productId_productBaseUnit_name_defaultValue!)?string=="currentUser">
								<#assign productId_productBaseUnit_name_defaultValue='${staffJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentPost">
								<#assign productId_productBaseUnit_name_defaultValue='${postJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentDepart">
								<#assign productId_productBaseUnit_name_defaultValue='${deptJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentComp">
								<#assign productId_productBaseUnit_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.chPackageView"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1398235640483')}" width=60 showFormatFunc=""  />
							<#assign batchNum_displayDefaultType=''>
								<#assign batchNum_defaultValue=''>
										<#assign batchNum_defaultValue=''>
										 
									<@datacolumn key="batchNum"        showFormat="TEXT" defaultValue="${(batchNum_defaultValue!)?string}" defaultDisplay="${(batchNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1493086257330')}" width=100 showFormatFunc=""  />
							<#assign headId_formularId_setProcess_displayDefaultType=''>
								<#assign headId_formularId_setProcess_defaultValue=''>
										<#assign headId_formularId_setProcess_defaultValue=''>
																	<#if (headId_formularId_setProcess_defaultValue!)?string=="currentUser">
								<#assign headId_formularId_setProcess_defaultValue='${staffJson!}'>
							<#elseif (headId_formularId_setProcess_defaultValue!)?string=="currentPost">
								<#assign headId_formularId_setProcess_defaultValue='${postJson!}'>
							<#elseif (headId_formularId_setProcess_defaultValue!)?string=="currentDepart">
								<#assign headId_formularId_setProcess_defaultValue='${deptJson!}'>
							<#elseif (headId_formularId_setProcess_defaultValue!)?string=="currentComp">
								<#assign headId_formularId_setProcess_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="formulaProperty" textalign="center" defaultValue="${(headId_formularId_setProcess_defaultValue!)?string}" key="headId.formularId.setProcess.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1490578864812')}" width=100 hiddenCol=true  />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function ProduceMaterialSum_dg1506306746606_check_datagridvalid(){
					//
					var errorObj =ProduceMaterialSum_dg1506306746606Widget._DT.testData();
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
				
				function savedg1506306746606DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProduceMaterialSum_dg1506306746606Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProduceMaterialSum_dg1506306746606Widget') > -1) {
						ProduceMaterialSum_dg1506306746606Widget.setAllRowEdited();
					}
					var json = ProduceMaterialSum_dg1506306746606Widget.parseEditedData();
					$('input[name="dg1506306746606ListJson"]').remove();
					$('input[name="dgLists[\'dg1506306746606\']"]').remove();
					$('input[name="dg1506306746606ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1506306746606\']">').val(json).appendTo($('#WOM_produceTask_produceTask_chPackageView_form'));
					$('<input type="hidden" name="dg1506306746606ModelCode">').val('WOM_7.5.0.0_produceTask_ProduceMaterialSum').appendTo($('#WOM_produceTask_produceTask_chPackageView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1506306746606ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_chPackageView_form'));
				}
				function DT_ProduceMaterialSum_dg1506306746606_deldatagrid(){
					var deleteRows = ProduceMaterialSum_dg1506306746606Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','productId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1506306746606DeletedIds").length>0){
							$("#dg1506306746606DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1506306746606DeletedIds" name="dgDeletedIds[\'dg1506306746606\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_chPackageView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1506306746606DeletedIds['+CUI('input[name^="dg1506306746606DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_chPackageView_form'));
					});
					return deleteRows;
				}
				function DT_ProduceMaterialSum_dg1506306746606_delTreeNodes(){
					var deleteRows = ProduceMaterialSum_dg1506306746606Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','productId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1506306746606DeletedIds").length>0){
							$("#dg1506306746606DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1506306746606DeletedIds" name="dgDeletedIds[\'dg1506306746606\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_chPackageView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1506306746606DeletedIds['+CUI('input[name^="dg1506306746606DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_chPackageView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_chPackageView_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<2;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[1].length>0) {
						for(var i=0;i<datagrids[1].length;i++) {
							if(datagrids[1][i] == 'ProduceMaterialSum_dg1506306746606') {
								break;
							}
							if(i==datagrids[1].length-1) {
								datagrids[1][datagrids[1].length] = 'ProduceMaterialSum_dg1506306746606';
							}
						}
					} else {
						datagrids[1][datagrids[1].length] = 'ProduceMaterialSum_dg1506306746606';
					}
					$('body').data('WOM_produceTask_produceTask_chPackageView_datagrids', datagrids);
				});
				
				var ProduceMaterialSum_dg1506306746606_importDialog = null;
				function ProduceMaterialSum_dg1506306746606_showImportDialog(){
					try{
						if(ProduceMaterialSum_dg1506306746606_importDialog!=null&&ProduceMaterialSum_dg1506306746606_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746606&tid=${id!}&datagridName=dg1506306746606";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_produceTask_chPackageViewdg1506306746606_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProduceMaterialSum_dg1506306746606_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProduceMaterialSum_dg1506306746606"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceMaterialSum_dg1506306746606_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceMaterialSum_dg1506306746606_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProduceMaterialSum_dg1506306746606_importDialog.show();
					}catch(e){}
				}	
				
				function ProduceMaterialSum_dg1506306746606_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746606&templateRelatedModelCode=WOM_7.5.0.0_produceTask_chPackageViewdg1506306746606&downloadType=template&fileName=dg1506306746606";
					window.open(url,"","");
				}
				function dg1506306746606RenderOverEvent(){
					//启用物料批次
    if(!isProBatch || ProduceMaterialSum_dg1506306746606Widget.getCellValue(0,"headId.formularId.setProcess.id")=="formulaProperty/formulaProperty1"){
		//隐藏物料批号列
		$( 'td[key="batchNum"]').hide();
		ProduceMaterialSum_dg1506306746606Widget._DT._resizeHeight = true;
		ProduceMaterialSum_dg1506306746606Widget._DT._initDomElements();
		ProduceMaterialSum_dg1506306746606Widget._DT._resizeHeight = false;
    }
				}
				function dg1506306746606PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.chPackageView.initSize(nTabIndex);
				}
			</script>
			
			
			</div>
		</div>
			</div>
		</div>
	</div>
	<#if (pendingId?? || editNew) && !(superEdit!false)>
	<#include "../../../ec/tableInfo/flowDealContainer_all.ftl">
	</#if>
			
			
</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="WOM_produceTask_produceTask_chPackageView_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if ((produceTask.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.produceTask.produceTask.chPackageView.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.produceTask.produceTask.chPackageView.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.produceTask.produceTask.chPackageView.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if ((produceTask.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_chPackageView,html,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
		<@errorbar id="workbenchErrorBar" offsetY=42 />
		
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
						$("#WOM_produceTask_produceTask_chPackageView_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_produceTask_produceTask_chPackageView_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_produceTask_produceTask_chPackageView_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_produceTask_produceTask_chPackageView_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.produceTask.produceTask.chPackageView.initCount = 0;
			WOM.produceTask.produceTask.chPackageView.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_produceTask_produceTask_chPackageView_main_div .edit-head").height()-$("#WOM_produceTask_produceTask_chPackageView_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_produceTask_produceTask_chPackageView_main_div .edit-workflow").height()</#if>;
				$("#WOM_produceTask_produceTask_chPackageView_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_produceTask_produceTask_chPackageView_datagrids');
				var padding_bottom=16;
				$("#WOM_produceTask_produceTask_chPackageView_main_div .pd_bottom,#WOM_produceTask_produceTask_chPackageView_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_produceTask_produceTask_chPackageView_main_div .edit-panes-s").each(function(index){
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
									if(WOM.produceTask.produceTask.chPackageView.initCount <= 2) {
										setTimeout(function(){WOM.produceTask.produceTask.chPackageView.initSize();}, 200);
										WOM.produceTask.produceTask.chPackageView.initCount++;
									}/* else {
										WOM.produceTask.produceTask.chPackageView.initCount = 0;
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
							if(($("#WOM_produceTask_produceTask_chPackageView_main_div .edit-workflow").length > 0) && ($("#WOM_produceTask_produceTask_chPackageView_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
			$(function(){
				$('#WOM_produceTask_produceTask_chPackageView_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.produceTask.produceTask.chPackageView.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.produceTask.produceTask.chPackageView.initSize();
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
								CUI.DataTable.Arrays.splice(i, 1);
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#WOM_produceTask_produceTask_chPackageView_main_div").css("width"),10)==650){
							$("#WOM_produceTask_produceTask_chPackageView_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.produceTask.produceTask.chPackageView.resizeLayout();
						//WOM.produceTask.produceTask.chPackageView.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_produceTask_produceTask_chPackageView_main_div").css("width"),10)==800){
							$("#WOM_produceTask_produceTask_chPackageView_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.produceTask.produceTask.chPackageView.resizeLayout();
						//WOM.produceTask.produceTask.chPackageView.initSize();
						$('body').trigger('resize');
					});
				<#else>	
					$(".main-wrap").css("margin-left",0);
					$(".col-sub").width(0);
					$("#edit_side_btn").css("left",0);
					$(".edit-workflow").css("left",1);
					
				</#if>

				if($("ul.edit-tabs li").length > 0) {
			     	$("ul.edit-tabs").tabs("div.edit-panes > div");
			    }
				var datatableHeight;
				var bh = $(".edit-workflow tr:gt(0)").height();
				<#if pendingId?? || editNew>
				$("#workflow_toggle").toggle(function(){
					$(".edit-workflow tr:gt(0)").hide();
					WOM.produceTask.produceTask.chPackageView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.produceTask.produceTask.chPackageView.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.produceTask.produceTask.chPackageView.initSize();});
				/*
				WOM.produceTask.produceTask.chPackageView.resizeLayout=function(){
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
			<#if editNew>
			WOM.produceTask.produceTask.chPackageView.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${produceTask.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/WOM/produceTask/produceTask/dealInfo-list.action&enableSimpleDealInfo=false");
			</#if>
			//解决合并单元格后，同行（tr）内的所有td跨行数（rowspan）相同时,组态期表现为tr占n行单元格，在运行期错乱的bug
			var editContainer = $( 'div.edit-container' );
		    var editTr=editContainer.find(".edit-table tr");
		    $.each(editTr,function(i,item){
		        var editTd=$(item).find("td");
		        var isSameRowSpan=true;//单元格跨行数是否相等
		        var rsTemp;//跨行数
		        var csTemp=0;//跨列数（需累加）
		        for(var k=0;k<editTd.length;k++){
		           var ele=editTd[k];
		           var rowspan=$(ele).attr("rowspan");
		           var colspan=$(ele).attr("colspan");
		           if(!rowspan||rowspan=="") rowspan=1;
		           if(!colspan||colspan=="") colspan=1;
		           csTemp+=Number(colspan);
		           if(!rsTemp){
		              rsTemp=Number(rowspan);
		           }else{
		              if(rsTemp!=rowspan){
		                 isSameRowSpan=false;
		              }
		           }  
		        }
		        //单元格跨行数相等且不为1的情况下，重组本行内容
		        if(isSameRowSpan&&rsTemp!=1){
		           recombineTr(item,rsTemp,csTemp);
		        }
		    });
		    //对满足条件的行进行跨行重组
		    function recombineTr(editTr,rsNum,csNum){
		        var editTd=$(editTr).find("td");
		        $.each(editTd,function(i,item){
		           $(item).attr({"rowspan":"1","data-row":rsNum});
		        });
		        var appendTr="";
		        for(var i=0;i<rsNum-1;i++){
		          appendTr+="<tr data-tag='appendrow'><td class='edit-table-symbol' colspan='"+csNum+"'>&nbsp;</td></tr>";
		        }
		        $(appendTr).insertAfter(editTr);
		    }
		});

		WOM.produceTask.produceTask.chPackageView.validate = function(){
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
		WOM.produceTask.produceTask.chPackageView.beforeSaveProcess = function(){
			$('input[name="produceTask.extraCol"]').remove();
		}
		WOM.produceTask.produceTask.chPackageView.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_chPackageView_form').append(ProduceTaskActive_dg1506306746525Widget._DT.createInputs('dg1506306746525List'));
										</#if>
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_chPackageView_form').append(ProduceMaterialSum_dg1506306746606Widget._DT.createInputs('dg1506306746606List'));
										</#if>
		};
		WOM.produceTask.produceTask.chPackageView.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.produceTask.produceTask.chPackageView.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.produceTask.produceTask.chPackageView.beforeSaveProcess();

			//WOM.produceTask.produceTask.chPackageView.processDataGrid();
			$('#WOM_produceTask_produceTask_chPackageView_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_produceTask_produceTask_chPackageView_form','WOM_produceTask_produceTask_chPackageView_datagrids')) {      
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
		WOM.produceTask.produceTask.chPackageView.print = function(){
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
		
		WOM.produceTask.produceTask.chPackageView.saveSetting = function(){
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
		
		WOM.produceTask.produceTask.chPackageView.printSetting = function(){
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
				WOM.produceTask.produceTask.chPackageView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.produceTask.produceTask.chPackageView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.produceTask.produceTask.chPackageView.settingDialog.show();
			}
		}
		
		
		
		WOM.produceTask.produceTask.chPackageView.reject = function(){
			var rejectDiv = $("div.deal-result[id^='reject_']");
			if(rejectDiv.length == 1 && $($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).prop('checked') == false){
				$($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).prop('checked',true);
				$($('input[name="workFlowVar.outcome"][rejectFlag="1"]')[0]).click();
			} else {
				if(undefined == $('input[name="workFlowVar.outcome"][rejectFlag="1"]:checked').val()){
					workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.reject.select')}");
					return;
				}
			}
			$('#operateType').val("reject");
			WOM.produceTask.produceTask.chPackageView.submit();
		}
		
		WOM.produceTask.produceTask.chPackageView.submit = function(uncheck){
			if(uncheck){
			
			} else {
				var operateType = $('#operateType').val();
				if(operateType == "reject"){
					$('#operateType').val("submit");
				} else {
					var normalActives = $('input[name="workFlowVar.outcome"]').not('[rejectFlag="1"]');
					if(null != normalActives && undefined != normalActives && normalActives.length == 1 && $(normalActives[0]).prop('checked') == false){ //普通活动只有一个
						$(normalActives[0]).prop('checked',true);
						$(normalActives[0]).click();
					} else {//多个普通活动
						if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').not('[rejectFlag="1"]').val())){
							workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
							return;
						}
					}
				}
			}
			$('#operateType').val("submit");
			if(!WOM.produceTask.produceTask.chPackageView.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.produceTask.produceTask.chPackageView.beforeSaveProcess();
			
			//WOM.produceTask.produceTask.chPackageView.processDataGrid();
			
			var array=new Array();
			
			var requiredStaff=false;
			var outcomeDesc="";
			$('input[name="workFlowVar.outcome"]:checked').each(function(){
				var checkNull=CUI(this).attr("checkNull");
				
				var paramObj=new Object();
				paramObj.type='normal';
				paramObj.outcome=$(this).val();
				paramObj.dec=$(this).attr("dec");
				outcomeDesc=$(this).attr("dec");
				var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
				var values=$(id).val();
				var checkNull=$(this).attr("checkNull");
				if(checkNull=='true'&&values==''){
					requiredStaff=true;
					return ;
				}
				paramObj.assignUser=values;
				array.push(paramObj);
			
			})
			
			
			$('input[id*="__workflow_outcome_nodification_"]:checked').each(function(){
				var paramObj1=new Object();
				paramObj1.type='notification';
				paramObj1.outcome=$(this).val();
				paramObj1.dec=$(this).attr("dec");
				if(outcomeDesc!=""){
					outcomeDesc+=","+$(this).attr("dec");
				}else{
					outcomeDesc=$(this).attr("dec");
				}
				var id="#assignStaffSelect_"+$(this).val()+"MultiIDs";
				var values1=CUI(id).val();
				var checkNull1=$(this).attr("checkNull");
				if(checkNull1=='true'&&values1==''){
					requiredStaff=true;
					return ;
				}
				paramObj1.assignUser=values1;
				array.push(paramObj1);
			
			})
			if(requiredStaff){
				workbenchErrorBarWidget.showMessage(outcomeDesc+"${getText("ec.flow.outcome.assStaffNull")}");
				return ;
			}
			if(array.length>0){
				$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(array));
			}else if($('#__workflow_outcome_countersign').prop("checked")){
				var paramObj1=new Object();
				paramObj1.type='countersignAssign';
				paramObj1.outcome="countersignAssign";
				paramObj1.dec="countersignAssign";
				var countersignUsers=CUI('#countersignUsersMultiIDs').val();
				
				if(countersignUsers==''){
					workbenchErrorBarWidget.showMessage(outcomeDesc+"您勾选了转发，请指定转发人员！");
					return ;
				}
				
				array.push(paramObj1);
				$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(array));
			}
			$('#WOM_produceTask_produceTask_chPackageView_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.produceTask.produceTask.chPackageView.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/WOM/produceTask/produceTask/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(produceTask.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(produceTask.tableInfoId)?default('')}&id=${(produceTask.id)?default('')}&entityCode=WOM_7.5.0.0_produceTask";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.WOM.produceTask.produceTask.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.WOM.produceTask.produceTask.callBackInfo(res);
										<#else>
										window.opener.location.reload();
										</#if>
									}catch(e3){}
								}
							};

		 					setTimeout(function(){
		 						window.onbeforeunload = null;
								document.location.href=url;
		 					}, 1000);
						}
					}
				});
			});
		}
		WOM.produceTask.produceTask.chPackageView._callBackInfo = function(res){
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
 						window.opener.WOM.produceTask.produceTask.editCallBackInfo(res); 						
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
				<#if !(superEdit!false)>
 				if(res.operateType == 'save'){
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=WOM_7.5.0.0_produceTask";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.produceTask.produceTask.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		<#if editNew>
		WOM.produceTask.produceTask.chPackageView.setDepartment = function(){
			var o = $('#creatorPosition').find("option[selected]");
			if(o && o.length == 1) {
				$('#creatorDepartmentName').text(o.attr('departmentName'));
				$('#creatorDepartmentId').val(o.attr('departmentId'));
				$('#positionLayRec').val(o.attr('layRec'));
			}
		};
		</#if>
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				WOM.produceTask.produceTask.chPackageView._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.produceTask.produceTask.chPackageView._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.produceTask.produceTask.chPackageView._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.produceTask.produceTask.chPackageView._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.produceTask.produceTask.chPackageView._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.produceTask.produceTask.chPackageView._refViewCode_IE = viewCode;
			} else {
				WOM.produceTask.produceTask.chPackageView._refViewCode_IE = '';
			}
			WOM.produceTask.produceTask.chPackageView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.produceTask.produceTask.chPackageView.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.produceTask.produceTask.chPackageView._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.produceTask.produceTask.chPackageView._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.produceTask.produceTask.chPackageView.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.produceTask.produceTask.chPackageView._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.produceTask.produceTask.chPackageView._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.produceTask.produceTask.chPackageView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.produceTask.produceTask.chPackageView._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.produceTask.produceTask.chPackageView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.produceTask.produceTask.chPackageView.gridEventObj = gridEventObj;
				callbackName = "WOM.produceTask.produceTask.chPackageView.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.produceTask.produceTask.chPackageView.getMultiselectCallBackInfo_DG" : "WOM.produceTask.produceTask.chPackageView.getcallBackInfo_DG";
				WOM.produceTask.produceTask.chPackageView._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.produceTask.produceTask.chPackageView.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.produceTask.produceTask.chPackageView._prefix = _prefix.substring(1);
			}
			
			WOM.produceTask.produceTask.chPackageView._oGrid = oGrid;
			WOM.produceTask.produceTask.chPackageView._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.produceTask.produceTask.chPackageView._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.produceTask.produceTask.chPackageView._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.produceTask.produceTask.chPackageView._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.produceTask.produceTask.chPackageView._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.produceTask.produceTask.chPackageView._refViewCode = oColumn.viewCode;
				} else {
					WOM.produceTask.produceTask.chPackageView._refViewCode = '';
				}
			} else {
				WOM.produceTask.produceTask.chPackageView._isObjCustomProp = false;
				WOM.produceTask.produceTask.chPackageView._objCustomPropNames = '';
				WOM.produceTask.produceTask.chPackageView._refViewCode = '';
			}
			if (WOM.produceTask.produceTask.chPackageView._isObjCustomProp == true && WOM.produceTask.produceTask.chPackageView._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.produceTask.produceTask.chPackageView._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.produceTask.produceTask.chPackageView._customCallBack = customCallBack;
			}
			if(WOM.produceTask.produceTask.chPackageView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.chPackageView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.produceTask.produceTask.chPackageView._querycustomFuncN == "function") {
				refparam += WOM.produceTask.produceTask.chPackageView._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.produceTask.produceTask.chPackageView._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.chPackageView._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.produceTask.produceTask.chPackageView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.chPackageView._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.produceTask.produceTask.chPackageView._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.produceTask.produceTask.chPackageView.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.chPackageView._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.produceTask.produceTask.chPackageView.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.produceTask.chPackageView.query_'+obj+'()') : null;
			return str;
		};
		WOM.produceTask.produceTask.chPackageView.getcallBackGroupInfo = function(obj){
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
			WOM.produceTask.produceTask.chPackageView._dialog.close();
		}
		WOM.produceTask.produceTask.chPackageView.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_produceTask_produceTask_chPackageView_form',obj[0], WOM.produceTask.produceTask.chPackageView._prefix, WOM.produceTask.produceTask.chPackageView._sUrl);
			CUI.commonFills('WOM_produceTask_produceTask_chPackageView_form',WOM.produceTask.produceTask.chPackageView._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.produceTask.produceTask.chPackageView._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.produceTask.produceTask.chPackageView._customCallBack) {
					eval(WOM.produceTask.produceTask.chPackageView._customCallBack);
					WOM.produceTask.produceTask.chPackageView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.chPackageView._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.produceTask.produceTask.chPackageView.getcallBackInfo_DG_IE = function(obj){
			if(WOM.produceTask.produceTask.chPackageView._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.chPackageView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.produceTask.produceTask.chPackageView.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.produceTask.produceTask.chPackageView._isObjCustomProp_IE == true && WOM.produceTask.produceTask.chPackageView._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.chPackageView._sUrl,WOM.produceTask.produceTask.chPackageView._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.chPackageView._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.produceTask.produceTask.chPackageView._isObjCustomProp_IE == true && WOM.produceTask.produceTask.chPackageView._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.produceTask.produceTask.chPackageView._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.produceTask.produceTask.chPackageView._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.produceTask.produceTask.chPackageView._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.produceTask.produceTask.chPackageView._refViewCode_IE + '&id=' + id,
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
				if(WOM.produceTask.produceTask.chPackageView._customCallBack) {
					eval(WOM.produceTask.produceTask.chPackageView._customCallBack);
					WOM.produceTask.produceTask.chPackageView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.chPackageView._dialog.close();
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
		
		WOM.produceTask.produceTask.chPackageView.getcallBackInfo_DG = function(obj){
			if(WOM.produceTask.produceTask.chPackageView._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.chPackageView._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.produceTask.produceTask.chPackageView._currRow).next().length==0){
						WOM.produceTask.produceTask.chPackageView._oGrid.addNewRow();
					}	
					WOM.produceTask.produceTask.chPackageView._currRow = $(WOM.produceTask.produceTask.chPackageView._currRow).next();
					$(WOM.produceTask.produceTask.chPackageView._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.produceTask.produceTask.chPackageView._currRow,obj[i], WOM.produceTask.produceTask.chPackageView._prefix, WOM.produceTask.produceTask.chPackageView._sUrl);
				if (WOM.produceTask.produceTask.chPackageView._isObjCustomProp == true && WOM.produceTask.produceTask.chPackageView._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.produceTask.produceTask.chPackageView._currRow,WOM.produceTask.produceTask.chPackageView._prefix,obj[i],WOM.produceTask.produceTask.chPackageView._oGrid,WOM.produceTask.produceTask.chPackageView._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.produceTask.produceTask.chPackageView._currRow,WOM.produceTask.produceTask.chPackageView._prefix,obj[i],WOM.produceTask.produceTask.chPackageView._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.produceTask.produceTask.chPackageView._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.produceTask.produceTask.chPackageView._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.produceTask.produceTask.chPackageView._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.produceTask.produceTask.chPackageView._refViewCode + '&id=' + id,
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
									name = WOM.produceTask.produceTask.chPackageView._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.produceTask.produceTask.chPackageView._currRow, objs, WOM.produceTask.produceTask.chPackageView._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.produceTask.produceTask.chPackageView._customCallBack) {
					eval(WOM.produceTask.produceTask.chPackageView._customCallBack);
					WOM.produceTask.produceTask.chPackageView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.chPackageView._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.produceTask.produceTask.chPackageView._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.produceTask.produceTask.chPackageView.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.produceTask.produceTask.chPackageView._oGrid, WOM.produceTask.produceTask.chPackageView._currRow, WOM.produceTask.produceTask.chPackageView._key, WOM.produceTask.produceTask.chPackageView._displayFieldName, obj[i])
			}
			try{
				if(WOM.produceTask.produceTask.chPackageView._customCallBack) {
					eval(WOM.produceTask.produceTask.chPackageView._customCallBack);
					WOM.produceTask.produceTask.chPackageView._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.chPackageView._dialog.close();
			} catch(e){}
		};
		
		WOM.produceTask.produceTask.chPackageView.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.produceTask.produceTask.chPackageView.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_produceTask_produceTask_chPackageView_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.produceTask.produceTask.chPackageView.onloadForProduct();
			var url="/WOM/produceTask/produceTask/getIsProBatch.action";
    $.ajax({
        type:'POST',
        url:url,
        async : false,
        success:function(msg){
            if(msg!=null){
	            isProBatch=msg.result;
            }
        }
    });
	
	//如果是根据批量指令的指令单，将提交的url改变，用自定义的提交url,并将表头字段设置为只读
	var tasksID=$('input[name="produceTask.tasksID"]').val();
	if(tasksID!=''){
		var url=$('#WOM_produceTask_produceTask_otherTaskEdit_form').attr('action');
		url=url.replace('submit.action','batchTaskSubmit.action')
		$("#WOM_produceTask_produceTask_otherTaskEdit_form").attr("action", url);
		$('#edit-submit-btn').hide()
		$('#edit-remind-btn').hide()
		$('#fr_flow').hide()
		$('#fr_fileUpload').hide()
		$('#fr_dealInfo').hide()

        //禁用生产数量
    	$("[name='produceTask.productNum']").attr("readonly",true);
    	//禁用产品
    	$("#produceTask_productId_productCodediv").removeAttr("onmouseenter");
		$("#produceTask_productId_productCodediv").unbind('mouseenter');
		$("[name='produceTask.productId.productCode']").attr("readonly",true);
		$("#produceTask_productId_productCode_click_button").remove();
		//禁用配方
    	$("#produceTask_formularId_codediv").removeAttr("onmouseenter");
		$("#produceTask_formularId_codediv").unbind('mouseenter');
		$("[name='produceTask.formularId.code']").attr("readonly",true);
		$("#produceTask_formularId_code_click_button").remove();
		//禁用生产线
    	$("#produceTask_factoryId_namediv").removeAttr("onmouseenter");
		$("#produceTask_factoryId_namediv").unbind('mouseenter');
		$("[name='produceTask.factoryId.name']").attr("readonly",true);
		$("#produceTask_factoryId_name_click_button").remove();
		//禁用计划
    	$("#produceTask_planParId_dayPlanInfo_tableNodiv").removeAttr("onmouseenter");
		$("#produceTask_planParId_dayPlanInfo_tableNodiv").unbind('mouseenter');
		$("[name='produceTask.planParId.dayPlanInfo.tableNo']").attr("readonly",true);
		$("#produceTask_planParId_dayPlanInfo_tableNo_click_button").remove();	
	
		//禁用批号
    	$("[name='produceTask.productBatchNum']").attr("readonly",true);
		//禁用开始时间
    	$("[name='produceTask.planEndTime']").attr("readonly",true);
		$("[name='produceTask.planEndTime']").next().hide()
		//禁用结束时间
    	$("[name='produceTask.planStartTime']").attr("readonly",true);
		$("[name='produceTask.planStartTime']").next().hide()
		//禁用批控设置
    	$("[name='produceTask.batchContral_check']").attr("disabled",true);
		//禁用备注
    	$("[name='produceTask.remark']").attr("readonly",true);
	}
	
	var batchProdTaskID = $("#produceTask_batchProdTaskID").val();
	if(batchProdTaskID != '' ){
		$('input[name="produceTask.batchContral_check"]').prop("disabled",true);
	}
		});

		WOM.produceTask.produceTask.chPackageView.beforeSubmitMethodSettingInPage = function(){
			WOM.produceTask.produceTask.chPackageView.onsaveForProduct();
		};
		WOM.produceTask.produceTask.chPackageView.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.produceTask.produceTask.chPackageView.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.produceTask.produceTask.chPackageView.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_produceTask_produceTask_chPackageView_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_produceTask_produceTask_chPackageView_main_div").hide();
				},100);
				//CUI("#WOM_produceTask_produceTask_chPackageView_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.produceTask.produceTask.chPackageView.showThis = function(){
			if(!CUI("#WOM_produceTask_produceTask_chPackageView_main_div").is(':visible')) {
				CUI("#WOM_produceTask_produceTask_chPackageView_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.produceTask.produceTask.chPackageView.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.produceTask.produceTask.chPackageView.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_produceTask_produceTask_chPackageView_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_produceTask_ProduceTask&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.chPackageView.auditDialog.show();
			</#if>
		}
		
		
		WOM.produceTask.produceTask.chPackageView.showInfoDialog=function(mode){
			
			WOM.produceTask.produceTask.chPackageView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_produceTask_produceTask_chPackageView_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.chPackageView.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.produceTask.produceTask.chPackageView.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_produceTask");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_produceTask");
			</#if>
			}
		}
		
		WOM.produceTask.produceTask.chPackageView.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/produceTask/produceTask/dealInfo-list.action&dlTableInfoId=${(produceTask.tableInfoId)?default('')}");
			}
		}
		WOM.produceTask.produceTask.chPackageView.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_produceTask_ProduceTask&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(produceTask.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_produceTask_ProduceTask&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(produceTask.tableInfoId)?default('')}");
				}		
			}else{
			  if(!isIE8){
			    //h5展现的情况下需重新适应视图大小
			    setTimeout(function(){
			      $("#flowH5Frame").contents().find("#resetFitView").trigger("click");//视图自适应容器大小 
			    },100); 
			  } 
			}
		}
		WOM.produceTask.produceTask.chPackageView.supervision=function(){
			WOM.produceTask.produceTask.chPackageView.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(produceTask.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.produceTask.produceTask.chPackageView.modifyOwnerStaffDialog.show();
		}
		
function clearFormular(obj){
	//获取样品ID
	var productID = obj[0].id;
	
	var old = $("[name='produceTask.productId.id']").val();
	if(old!=productID){
		$("[name='produceTask.formularId.code']").val("");
		$("[name='produceTask.formularId.id']").val("");
		$("[name='produceTask.formularId.name']").val("");
		$("[name='produceTask.workType.value']").val("");
		$("[name='produceTask.workType.id']").val("");
	}

}
function clearBatchText(obj){
	//获取样品ID
	var productID = obj[0].id;
	
	var old = $("[name='produceTask.bulkProduct.id']").val();
	if(old!=productID){
		$("[name='produceTask.bulkBatchNum.batchText']").val("");
		$("[name='produceTask.bulkBatchNum.id']").val("");
	}

}
function _callback_produceTask(obj){
		console.log(obj);
		//将产品赋值
		$('input[name="produceTask.productId.id"]').val(obj[0].product.id);
		$('input[name="produceTask.productId.productCode"]').val(obj[0].product.productCode);
		$('input[name="produceTask.productId.productName"]').val(obj[0].product.productName);
		$('input[name="produceTask.productId.productSpecif"]').val(obj[0].product.productSpecif);
		$('input[name="produceTask.productId.productModel"]').val(obj[0].product.productModel);
		$('input[name="produceTask.productId.productBaseUnit.name"]').val(obj[0].product.productBaseUnit.name)
		$('#produceTask_productId_productCode_mneTipLabel').hide();
		$("[name='produceTask.workType.id']").val(obj[0].produceType.id);
		$("[name='produceTask.workType.value']").val(obj[0].produceType.value);
		$("[name='produceTask.supportEbr']").val(obj[0].supportEbr+'');
		
		//增删行按钮隐藏
		$(".paginatorbar-operatebar :eq(0)").hide();
		$(".paginatorbar-operatebar :eq(2)").hide();
		var length=ProduceTaskActive_dg1506060049547Widget.getRowLength();//pt长度
		if(length>0){
			//清空pt数据
			ProduceTaskActive_dg1506060049547Widget._DT.delAllRows();
		}
		formulaChange1();
	
}
function getDefaultFormular(obj){
	//获取样品ID
	var productID = obj[0].id;

	//通过样品id查找默认配方
	$.ajax({
		url : "/WOM/produceTask/produceTask/getDefaultFormular.action",
		type : 'post',
		traditional: true,
		async : false,
		data:{"productID":productID,"taskType":"otherTask"},
		success : function(res) {
			if(res.dealSuccessFlag==true){
			  $('input[name="produceTask.formularId.id"]').val(res.formularID)
			  $('input[name="produceTask.formularId.code"]').val(res.formularCode)
			  $('input[name="produceTask.formularId.name"]').val(res.formularName)
			  $('#produceTask_formularId_code_mneTipLabel').hide()
			}
		}
	});

}
function setOtherValue(obj){
  console.log(obj)
  //产品
  var proId=obj[0].productId.id
  var proCode=obj[0].productId.productCode
  var proName=obj[0].productId.productName
  var productSpecif=obj[0].productId.productSpecif
  var productModel=obj[0].productId.productModel
  var unitName=obj[0].productId.productBaseUnit.name
  var produceTypeId=obj[0].formularID.produceType.id
  var produceType=obj[0].formularID.produceType.value
  
  //批号与数量
  var batchNum=obj[0].batchNum
  var quantity=obj[0].quantity
  //配方
  var formularId=obj[0].formularID.id
  var formularCode=obj[0].formularID.code
  var formularName=obj[0].formularID.name
  //生产线
  var factoryId=obj[0].factoryCode.id
  var factoryName=obj[0].factoryCode.name
  //开始与结束时间
  var startTime=obj[0].startTime
  var endTime=obj[0].endTime
  
  $('input[name="produceTask.productId.id"]').val(proId)
  $('input[name="produceTask.productId.productCode"]').val(proCode)
  $('input[name="produceTask.productId.productName"]').val(proName)
  $('input[name="produceTask.productId.productSpecif"]').val(productSpecif)
  $('input[name="produceTask.productId.productModel"]').val(productModel)
  $('input[name="produceTask.productId.productBaseUnit.name"]').val(unitName)
  $('#produceTask_productId_productCode_mneTipLabel').hide()
  
  $('input[name="produceTask.productBatchNum"]').val(batchNum)
  $('input[name="produceTask.productNum"]').val(quantity)
  
  $('input[name="produceTask.formularId.id"]').val(formularId)
  $('input[name="produceTask.formularId.code"]').val(formularCode)
  $('input[name="produceTask.formularId.name"]').val(formularName)
  $('#produceTask_formularId_code_mneTipLabel').hide()
  
  $('input[name="produceTask.factoryId.id"]').val(factoryId)
  $('input[name="produceTask.factoryId.name"]').val(factoryName)
  $('#produceTask_factoryId_name_mneTipLabel').hide()
  
  $('input[name="produceTask.planStartTime"]').val(startTime)
  $('input[name="produceTask.planEndTime"]').val(endTime)
  //类型
   $('input[name="produceTask.workType.id"]').val(produceTypeId)
  $('input[name="produceTask.workType.value"]').val(produceType)
  //配方支持EBR
  $("[name='produceTask.supportEbr']").val(obj[0].formularID.supportEbr+'');
  $("[name='produceTask.formularId.setProcess.id']").val(obj[0].formularID.setProcess.id);
  //改变表体
  formulaChange1();	

}





		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_chPackageView,js,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
	//判断是否启用配置项
	var url="/WOM/produceTask/produceTask/getIsProBatch.action";
    var isProBatch="";
    $.ajax({
        type:'POST',
        url:url,
        async : false,
        success:function(msg){
            if(msg!=null){
	            isProBatch=msg.result;
            }
        }
    });
 	function formulaChange1(){
        //是否支持EBR
        var supportEBR=$("input[name='produceTask.supportEbr']").val();   
        //不选配放
        if($("[name='produceTask.formularId.id']").val()==""){
            $( 'td[key="standardNum"]').hide();
            $( 'td[key="isMixQuality"]').hide();
            $( 'td[key="phase"]').hide();
            $( 'td[key="sequence"]').hide();
            $( 'td[key="needWeigh"]').hide();
            //表体滚动条bug修改
            ProduceTaskActive_dg1506306746525Widget._DT._resizeHeight = true;
            ProduceTaskActive_dg1506306746525Widget._DT._initDomElements();
        }
        //不启用ebr
        else if(supportEBR=='false'){
            $( 'td[key="standardNum"]').show();
            $( 'td[key="isMixQuality"]').show();
            $( 'td[key="phase"]').hide();
            $( 'td[key="sequence"]').hide();
            $( 'td[key="needWeigh"]').hide();
            //表体滚动条bug修改
            ProduceTaskActive_dg1506306746525Widget._DT._resizeHeight = true;
            ProduceTaskActive_dg1506306746525Widget._DT._initDomElements();
        }
        //启用ebr
        else if(supportEBR=='true'){
			$( 'td[key="standardNum"]').show();
            $( 'td[key="isMixQuality"]').show();
            $( 'td[key="phase"]').show();
            $( 'td[key="sequence"]').show();
            $( 'td[key="needWeigh"]').show();
            //表体滚动条bug修改
            ProduceTaskActive_dg1506306746525Widget._DT._resizeHeight = true;
            ProduceTaskActive_dg1506306746525Widget._DT._initDomElements();
        }
    }
/* CUSTOM CODE END */
		WOM.produceTask.produceTask.chPackageView.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_chPackageView,onloadForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.produceTask.produceTask.chPackageView.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-WOM_7.5.0.0_produceTask_chPackageView,onsaveForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
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
			})
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.produceTask.produceTask.chPackageView.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.produceTask.produceTask.chPackageView.showBusinessList('${l.relatingModel.code.replace('.','')}',${(produceTask.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
							</#if>
						</li>
					    </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
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