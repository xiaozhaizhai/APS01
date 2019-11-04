<!-- WOM_7.5.0.0/produceTask/otherTaskEdit -->
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
<#-- 实体对象 -->
<#assign tableObj = produceTask>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.produceTask.produceTask.otherTaskEdit">
<#-- 模型名称-->
<#assign modelName = "produceTask">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_produceTask_otherTaskEdit">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_produceTask">
<#-- 视图名称-->
<#assign viewName = "otherTaskEdit">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_produceTask_produceTask_otherTaskEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "ProduceTask">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "WOM_produceTask_produceTask_otherTaskEdit_form">
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
        <#assign configTitle = getText('WOM.viewtitle.randon1505802946483')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_produceTask_produceTask_otherTaskEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.produceTask.produceTask.otherTaskEdit');
			WOM.produceTask.produceTask.otherTaskEdit.currentUser = ${userJson};
			WOM.produceTask.produceTask.otherTaskEdit.currentStaff = ${staffJson};
			WOM.produceTask.produceTask.otherTaskEdit.currentDepartment = ${deptJson};
			WOM.produceTask.produceTask.otherTaskEdit.currentPosition = ${postJson};
			WOM.produceTask.produceTask.otherTaskEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_otherTaskEdit,head,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="produceTask.factoryId.id,produceTask.formularId.id,produceTask.id,produceTask.productId.id,produceTask.planParId.id," onsubmitMethod="WOM.produceTask.produceTask.otherTaskEdit.beforeSubmitMethod()" id="WOM_produceTask_produceTask_otherTaskEdit_form" namespace="/WOM/produceTask/produceTask/otherTaskEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_produceTask_ProduceTask&_bapFieldPermissonModelName_=ProduceTask&superEdit=${(superEdit!false)?string}" editPageNs="WOM.produceTask.produceTask.otherTaskEdit" callback="WOM.produceTask.produceTask.otherTaskEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_produceTask_produceTask_otherTaskEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_produceTask_produceTask_otherTaskEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="produceTask.factoryId.id" value="${(produceTask.factoryId.id)!""}" originalvalue="${(produceTask.factoryId.id)!""}"/>
					<input type="hidden" name="produceTask.formularId.id" value="${(produceTask.formularId.id)!""}" originalvalue="${(produceTask.formularId.id)!""}"/>
					<input type="hidden" name="produceTask.id" value="${(produceTask.id)!""}" originalvalue="${(produceTask.id)!""}"/>
					<input type="hidden" name="produceTask.productId.id" value="${(produceTask.productId.id)!""}" originalvalue="${(produceTask.productId.id)!""}"/>
					<input type="hidden" name="produceTask.planParId.id" value="${(produceTask.planParId.id)!""}" originalvalue="${(produceTask.planParId.id)!""}"/>
		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('WOM.tabname.radion1489731908995')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "WOM_produceTask_produceTask_otherTaskEdit_form"+"_attcount";
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
					
							<label style="width:100%;;" value="${getText('WOM.common.tableNo35756')}" >${getText('WOM.common.tableNo35756')}</label>
				</td>
				
						<#assign produceTask_planParId_dayPlanInfo_tableNo_defaultValue  = ''>
														<#assign produceTask_planParId_dayPlanInfo_tableNo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('WOM.viewtitle.randon1489823707131')}" viewType="${viewType!}" deValue="${produceTask_planParId_dayPlanInfo_tableNo_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc('produceTask_planParId_dayPlanInfo_tableNo')"  value="${(produceTask.planParId.dayPlanInfo.tableNo)!}" displayFieldName="tableNo" name="produceTask.planParId.dayPlanInfo.tableNo" id="produceTask_planParId_dayPlanInfo_tableNo" type="other" url="/WOM/producePlanRef/dayBatchPlanParts/planRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_otherTaskEdit_form" editCustomCallback="setOtherValue(obj);" refViewCode="WOM_7.5.0.0_producePlanRef_planRef"  onkeyupfuncname="setOtherValue(obj);_callback_produceTask_planParId_dayPlanInfo_tableNo(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTask.id)?? && (produceTask.planParId.dayPlanInfo.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTask.planParId.dayPlanInfo.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTask_otherTaskEdit_form',obj, 'produceTask.planParId.dayPlanInfo', '/WOM/producePlanRef/dayBatchPlanParts/planRef.action');
												CUI.commonFills('WOM_produceTask_produceTask_otherTaskEdit_form', 'produceTask.planParId.dayPlanInfo',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.produceTask.produceTask.otherTaskEdit.query_produceTask_planParId_dayPlanInfo_tableNo = function() {
										return "planWorkType="+"otherTask";
									}
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion14157726448334334')}" >${getText('WOM.propertydisplayName.radion14157726448334334')}</label>
				</td>
				
						<#assign produceTask_productId_productCode_defaultValue  = ''>
														<#assign produceTask_productId_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${produceTask_productId_productCode_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc('produceTask_productId_productCode')"  value="${(produceTask.productId.productCode)!}" displayFieldName="productCode" name="produceTask.productId.productCode" id="produceTask_productId_productCode" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_otherTaskEdit_form" editCustomCallback="getDefaultFormular(obj);" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname="getDefaultFormular(obj);_callback_produceTask_productId_productCode(obj);" cssStyle="" isEdit=true beforecallback='clearFormular(obj)'    isCrossCompany=false  editLinkCallBack="_callback_produceTask_productId_productCode_edit" delCustomCallback="_del_callback_produceTask_productId_productCode()"/>
								
								
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
												obj = foundation.common.getObject('WOM_produceTask_produceTask_otherTaskEdit_form',obj, 'produceTask.productId', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('WOM_produceTask_produceTask_otherTaskEdit_form', 'produceTask.productId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion14157727407373333445')}" >${getText('WOM.propertydisplayName.radion14157727407373333445')}</label>
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1415772620384333')}" >${getText('WOM.propertydisplayName.radion1415772620384333')}</label>
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion141577256866534556aasda')}" >${getText('WOM.propertydisplayName.radion141577256866534556aasda')}</label>
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
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1398235640483888')}" >${getText('WOM.propertydisplayName.radion1398235640483888')}</label>
				</td>
				
						<#assign produceTask_productId_productBaseUnit_name_defaultValue  = ''>
														<#assign produceTask_productId_productBaseUnit_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="produceTask.productId.productBaseUnit.name" id="produceTask_productId_productBaseUnit_name"  style=";" originalvalue="<#if !newObj || (produceTask.productId.productBaseUnit.name)?has_content>${(produceTask.productId.productBaseUnit.name?html)!}<#else>${produceTask_productId_productBaseUnit_name_defaultValue!}</#if>" value="<#if !newObj || (produceTask.productId.productBaseUnit.name)?has_content>${(produceTask.productId.productBaseUnit.name?html)!}<#else>${produceTask_productId_productBaseUnit_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489668325364')}" >${getText('WOM.propertydisplayName.randon1489668325364')}</label>
				</td>
				
						<#assign produceTask_productBatchNum_defaultValue  = ''>
							 							<#assign produceTask_productBatchNum_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="BAPCODE" name="produceTask.productBatchNum" id="produceTask_productBatchNum"  style=";" originalvalue="<#if !newObj || (produceTask.productBatchNum)?has_content>${(produceTask.productBatchNum?html)!}<#else>${produceTask_productBatchNum_defaultValue!}</#if>" value="<#if !newObj || (produceTask.productBatchNum)?has_content>${(produceTask.productBatchNum?html)!}<#else>${produceTask_productBatchNum_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
					
							
							<div class="fix-input">
									<input name="produceTask.productNum" id="produceTask_productNum"  style=";" originalvalue="<#if newObj&& !(produceTask.productNum)?has_content>${produceTask_productNum_defaultValue!}<#elseif (produceTask.productNum)?has_content>#{(produceTask.productNum)!; m2M2}</#if>" value="<#if newObj&& !(produceTask.productNum)?has_content>${produceTask_productNum_defaultValue!}<#elseif (produceTask.productNum)?has_content>#{(produceTask.productNum)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#produceTask_productNum').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("WOM.propertydisplayName.randon1489658031489")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1503897133347')}" >${getText('WOM.propertydisplayName.randon1503897133347')}</label>
				</td>
				
						<#assign produceTask_taskType_defaultValue  = 'womTaskType/type6'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTask_taskType_defaultValue!}" formId="WOM_produceTask_produceTask_otherTaskEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.taskType.id" code="womTaskType" value="${(produceTask.taskType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTask_otherTaskEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.taskType.id" code="womTaskType" value="${(produceTask.taskType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randonpl3')}" >${getText('WOM.propertydisplayName.randonpl3')}</label>
				</td>
				
						<#assign produceTask_formularId_code_defaultValue  = ''>
														<#assign produceTask_formularId_code_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" reftitle="${getText('RM.viewtitle.randon1505809226549')}" viewType="${viewType!}" deValue="${produceTask_formularId_code_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc('produceTask_formularId_code')"  value="${(produceTask.formularId.code)!}" displayFieldName="code" name="produceTask.formularId.code" id="produceTask_formularId_code" type="other" url="/RM/formula/formula/formulaOtherRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_otherTaskEdit_form" editCustomCallback="_callback_produceTask(obj);" refViewCode="RM_7.5.0.0_formula_formulaOtherRef" onkeyupfuncname="_callback_produceTask(obj);_callback_produceTask_formularId_code(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTask.id)?? && (produceTask.formularId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTask.formularId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTask_otherTaskEdit_form',obj, 'produceTask.formularId', '/RM/formula/formula/formulaOtherRef.action');
												CUI.commonFills('WOM_produceTask_produceTask_otherTaskEdit_form', 'produceTask.formularId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.produceTask.produceTask.otherTaskEdit.query_produceTask_formularId_code = function() {
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
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.radion1419232393782efe')}" >${getText('WOM.propertydisplayName.radion1419232393782efe')}</label>
				</td>
				
						<#assign produceTask_factoryId_name_defaultValue  = ''>
														<#assign produceTask_factoryId_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1498043312692')}" viewType="${viewType!}" deValue="${produceTask_factoryId_name_defaultValue!}" conditionfunc="WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc('produceTask_factoryId_name')"  value="${(produceTask.factoryId.name)!}" displayFieldName="name" name="produceTask.factoryId.name" id="produceTask_factoryId_name" type="other" url="/MESBasic/factoryModel/factoryModel/factoryProBatchRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_produceTask_produceTask_otherTaskEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_factoryModel_factoryProBatchRef" onkeyupfuncname=";_callback_produceTask_factoryId_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(produceTask.id)?? && (produceTask.factoryId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${produceTask.factoryId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_produceTask_produceTask_otherTaskEdit_form',obj, 'produceTask.factoryId', '/MESBasic/factoryModel/factoryModel/factoryProBatchRef.action');
												CUI.commonFills('WOM_produceTask_produceTask_otherTaskEdit_form', 'produceTask.factoryId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									WOM.produceTask.produceTask.otherTaskEdit.query_produceTask_factoryId_name = function() {
										return "formulaId="+$("[name='produceTask.formularId.id']").val();
									}
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489669409811')}" >${getText('WOM.propertydisplayName.randon1489669409811')}</label>
				</td>
				
						<#assign produceTask_planStartTime_defaultValue  = 'currentTime'>
							 					<#if (produceTask_planStartTime_defaultValue)?? &&(produceTask_planStartTime_defaultValue)?has_content>
							<#assign produceTask_planStartTime_defaultValue  = getDefaultDateTime(produceTask_planStartTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(produceTask.planStartTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planStartTime" value="${produceTask_planStartTime_defaultValue!}" type="dateTime"  id="produceTask.planStartTime"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (produceTask.planStartTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planStartTime" value="${produceTask.planStartTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="produceTask.planStartTime"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planStartTime" value="" type="dateTime" id="produceTask.planStartTime" cssStyle=""  align="left"/>
								
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
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planEndTime" value="${produceTask_planEndTime_defaultValue!}" type="dateTime"  id="produceTask.planEndTime"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (produceTask.planEndTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planEndTime" value="${produceTask.planEndTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="produceTask.planEndTime"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="produceTask.planEndTime" value="" type="dateTime" id="produceTask.planEndTime" cssStyle=""  align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTask", "WOM_7.5.0.0_produceTask_otherTaskEdit", 'EDIT')>
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
					<div class="fix-input">
					<#if columnType == 'DECIMAL'>
						<#if c.precision??>
							<#assign decimalNum =c.precision!>
						</#if>
						<@s.hidden property_type="${columnType}" id="${elementName?replace('.', '_')}_hide" name="${elementName}" />
						<input property_type="${columnType}" type="text" id="${elementName?replace('.', '_')}" name="${elementName?replace('.', '_')}" class="cui-noborder-input numberField" <#if c.align??>style="text-align:${c.align?html};"</#if> <#if (c.readonly!false)>readonly="readonly"</#if>  />
					<#elseif columnType == 'INTEGER'>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input numberField" cssStyle="text-align:${c.align!}" readonly="${(c.readonly!false)?c}" />
					<#else>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input" cssStyle="text-align:${c.align!}" readonly="${(c.readonly!false)?c}" />
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
							<#if c.format == 'THOUSAND' || c.format == 'TEN_THOUSAND'>
							$("#${elementName?replace('.', '_')}").unbind("blur").unbind("focus").bind({
								blur : function() {
									if ( !$(this).val() ) {
										$('#${elementName?replace('.', '_')}_hide').val('');
										return;
									}
									if ( !isDecimal($(this).val()) ) {
										$('#${elementName?replace('.', '_')}_hide').val($(this).val());
										return;
									}
									var temp = $(this).val();
									var percision = parseInt("${decimalNum}");
									if (percision > -1) {
										temp = (temp * 1).toFixed(percision);
									}
									$('#${elementName?replace('.', '_')}_hide').val( temp );
									temp = formatMoney(<#if c.format == 'THOUSAND'>3<#elseif c.format = 'TEN_THOUSAND'>4</#if>, temp);
									$(this).val(temp);
								},
								focus : function() {
									$(this).val($('#${elementName?replace('.', '_')}_hide').val());
								}	
							});
							<#elseif c.format == 'PERCENT'>
							$("#${elementName?replace('.', '_')}").unbind('blur').unbind('focus').bind({
								blur : function() {
									if ( !$(this).val() ) {
										$('#${elementName?replace('.', '_')}_hide').val('');
										return;
									}
									if ( !isDecimal($(this).val()) ) {
										$('#${elementName?replace('.', '_')}_hide').val($(this).val());
										return;
									}
									var percision = parseInt("${decimalNum}");
									if ( percision > -1 ) {
										$('#${elementName?replace('.', '_')}_hide').val( ($(this).val() / 100).toFixed(percision) );
										var num = percision - 2 >= 0 ? percision - 2 : 0;
										var temp = ($(this).val() * 1).toFixed(num) + "%";
										$(this).val(temp);
									} else {
										$('#${elementName?replace('.', '_')}_hide').val( ($(this).val() / 100) );
										$(this).val($(this).val() + "%");
									}
								},
								focus : function() {
									if ( $('#${elementName?replace('.', '_')}_hide').val() ) {
										if ( !isDecimal($('#${elementName?replace('.', '_')}_hide').val()) ) {
											$(this).val( $('#${elementName?replace('.', '_')}_hide').val() );
										} else {
											var percision = parseInt("${decimalNum}");
											if (percision > -1) {
												var num = percision - 2 >= 0 ? percision - 2 : 0;
												$(this).val( ($('#${elementName?replace('.', '_')}_hide').val() * 100).toFixed(num) );
											} else {
												$(this).val( ($('#${elementName?replace('.', '_')}_hide').val() * 100) );
											}
										}
									} else {
										$(this).val('');
									}
								}
							});
							<#else>
							$('#${elementName?replace('.', '_')}').unbind('blur').bind('blur', function(){
								if ( !$(this).val() ) {
									$('#${elementName?replace('.', '_')}_hide').val('');
									return;
								}
								if ( !isDecimal($(this).val()) ) {
									$('#${elementName?replace('.', '_')}_hide').val( $(this).val() );
									return;
								}
								var percision = parseInt("${decimalNum}");
								if (percision > -1) {
									$(this).val( ($(this).val() * 1).toFixed(percision) );
								}
								$('#${elementName?replace('.', '_')}_hide').val( $(this).val() );
							});
							</#if>
							</#if>
						});
					</script>
					<#elseif fieldType == 'TEXTAREA'>
						<div class="fix-input fix-ie7-textarea">
							<@s.textarea property_type="${columnType}" id="${elementName?replace('.', '_')}" name="${elementName}" rows="${c.textareaRow!3}" cssClass="cui-textarea-wh" cssStyle="border:0;line-height:16px;padding-left:2px;text-align:${c.align!}" readonly="${(c.readonly!false)?c}" onpropertychange="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" oninput="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" onkeyup="autoTextarea('${elementName?replace('.', '_')}',null,null,true);" />
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
						<@datepicker property_type="${columnType}" cssClass="cui-noborder-input" name="${elementName}" id="${elementName?replace('.', '_')}" value=dateVal type="${dateType}" align="${c.align!}" view=(c.readonly!false) />
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_produceTask_produceTask_otherTaskEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${produceTask[columnName]!}" seniorSystemCode=isS2 />
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
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${produceTask[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_produceTask_produceTask_otherTaskEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="produceTask.remark" id="produceTask_remark"  style=";" originalvalue="<#if !newObj || (produceTask.remark)?has_content>${(produceTask.remark?html)!}<#else>${produceTask_remark_defaultValue!}</#if>" value="<#if !newObj || (produceTask.remark)?has_content>${(produceTask.remark?html)!}<#else>${produceTask_remark_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTask_formularId_setProcess_defaultValue!}" formId="WOM_produceTask_produceTask_otherTaskEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.formularId.setProcess.id" code="formulaProperty" value="${(produceTask.formularId.setProcess.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTask_otherTaskEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.formularId.setProcess.id" code="formulaProperty" value="${(produceTask.formularId.setProcess.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1496283447542')}" >${getText('WOM.propertydisplayName.randon1496283447542')}</label>
				</td>
				
						<#assign produceTask_tasksID_defaultValue  = ''>
							 							<#assign produceTask_tasksID_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="produceTask.tasksID" id="produceTask_tasksID"  style=";" originalvalue="<#if !newObj || (produceTask.tasksID)?has_content>${(produceTask.tasksID?html)!}<#else>${produceTask_tasksID_defaultValue!}</#if>" value="<#if !newObj || (produceTask.tasksID)?has_content>${(produceTask.tasksID?html)!}<#else>${produceTask_tasksID_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
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
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${produceTask_workType_defaultValue!}" formId="WOM_produceTask_produceTask_otherTaskEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.workType.id" code="produceType" value="${(produceTask.workType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_produceTask_produceTask_otherTaskEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="produceTask.workType.id" code="produceType" value="${(produceTask.workType.id)!}"  />
									
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
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="produceTask.batchProdTaskID" id="produceTask_batchProdTaskID"  style=";" originalvalue="<#if !newObj || (produceTask.batchProdTaskID)?has_content>${(produceTask.batchProdTaskID?html)!}<#else>${produceTask_batchProdTaskID_defaultValue!}</#if>" value="<#if !newObj || (produceTask.batchProdTaskID)?has_content>${(produceTask.batchProdTaskID?html)!}<#else>${produceTask_batchProdTaskID_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
			
							<script type="text/javascript">
								function ProduceTaskActive_dg1505802969630_addNewRow(event)
																{
	ProduceTaskActive_dg1505802969630Widget.addRow();
	$( 'td[key="standardNum"]').hide();
	$( 'td[key="isMixQuality"]').hide();
	$( 'td[key="phase"]').hide();
	$( 'td[key="sequence"]').hide();
	$( 'td[key="needWeigh"]').hide();
	if(isProBatch==true){
	$( 'td[key="batchNumObj.batchText"]').show();//批号显示	
	}else{
	$( 'td[key="batchNumObj.batchText"]').hide();//批号隐藏
	}
	//表体滚动条bug修改
	ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = true;
	ProduceTaskActive_dg1505802969630Widget._DT._initDomElements();
	ProduceTaskActive_dg1505802969630Widget.setCellValue(ProduceTaskActive_dg1505802969630Widget.getRowLength()-1,'property.id',"RMproperty/property1");
}
							</script>
							<script type="text/javascript">
								function ProduceTaskActive_dg1505802969630_copyNewRowDataFunc(event)
																{
	//获得选中行
	var selectRow = ProduceTaskActive_dg1505802969630Widget.getSelectedRow();
	if(selectRow!=undefined){
	CUI.Dialog.confirm("${getText('WOM.confirmcontent.radion1504182834291')}",
		function(){
					//新增一行
			ProduceTaskActive_dg1505802969630Widget.addRow();
					//启用物料批次
			if(isProBatch==true){
				//将按钮显示
				$(".paginatorbar :eq(7)").show();
			}else{
				//将按钮隐藏
				$(".paginatorbar :eq(7)").hide();
				//隐藏物料批号列
				$( 'td[key="batchNumObj.batchText"]').hide();
				ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = true;
				ProduceTaskActive_dg1505802969630Widget._DT._initDomElements();
				ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = false;
			}
			//获取未删前的html
			lableHtme = $(".dg-hd-tr").html();
			//界面新增打开，隐藏工序、活动、顺序、备料系统、替代料列
			if($("#id").val()==""|| $("[name='produceTask.formularId.id']").val()==""){
				$( 'td[key="isMixQuality"]').hide();//固定数量
				$( 'td[key="standardNum"]').hide();//理论用量  
				$( 'td[key="activeType.id"]').hide();//活动类型
				easyFormulahide();
				$(".edit-tabs li:eq(1)").show();//显示用料汇总页签
				//指令单启用物料批号
				if(isProBatch==true){
					$( 'td[key="batchNumObj.batchText"]').show();//显示物料批号
				}else{//指令单不启用物料批号，隐藏物料批号列
					$(".paginatorbar-operatebar :eq(4)").hide();//隐藏复制按钮
					$( 'td[key="batchNumObj.batchText"]').hide();//隐藏物料批号
					ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = true;
					ProduceTaskActive_dg1505802969630Widget._DT._initDomElements();
					ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = false;
				}
			
			
			}//修改打开时
			else{
				formulaChange1();
			}
			var newRow = ProduceTaskActive_dg1505802969630Widget.getRowLength()-1;//新行号
			//赋值
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"productId.productCode",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"productId.productCode"));//物品编码
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"productId.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"productId.id"));//物品id
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"productId.productName",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"productId.productName"));//物品名称
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"orderProcessId.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"orderProcessId.id"));//工序名称id
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"orderProcessId.name",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"orderProcessId.name"));//工序名称
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"name",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"name"));//活动名称
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"activeType.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"activeType.id"));//活动类型
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"exeSystem.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"exeSystem.id"));//执行系统
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"isReplace",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"isReplace"));//替代料
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"property.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"property.id"));//性质
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"standardNum",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"standardNum"));//理论用量			 
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"planNum",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"planNum"));//计划用量	  
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"productId.productBaseUnit.name",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"productId.productBaseUnit.name"));	//单位 
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"isMixQuality",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"isMixQuality"));//固定数量
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"phase",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"phase"));//阶段
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"sequence",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"sequence"));//次序号
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"needWeigh",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"needWeigh"));//是否需要称重
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"batchNumObj.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"batchNumObj.id"));//物料批号id	
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"batchNumObj.batchText",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"batchNumObj.batchText"));//物料批号
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"minQuality",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"minQuality"));//理论下限
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"maxQuality",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"maxQuality"));//理论上限
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"lossRate",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"lossRate"));//损耗率  
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"activeId.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"activeId.id"));//活动id	
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"formulaId.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"formulaId.id"));//配方id  
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"processId.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"processId.id"));//工序id		
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"putBatMateId.id",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"putBatMateId.id"));//投配料活动id	
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"offerOrder",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"offerOrder"));//配料顺序
			ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"actOrder",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"actOrder"));//投料顺序	
			if(ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"remark")==undefined){
				ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"remark","");//备注
			}else{
				ProduceTaskActive_dg1505802969630Widget.setCellValue(newRow,"remark",ProduceTaskActive_dg1505802969630Widget.getCellValue(selectRow,"remark"));//备注
			}					

		}
	);
	}else{
		workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000013')}");
	}
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1505802969630.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969630">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1505802969630.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969630">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceTaskActive_dg1505802969630_deldatagrid();}},{text:\"${getText('WOM.buttonPropertyshowName.radion1505441258642')}\",handler:function(event){ProduceTaskActive_dg1505802969630_addNewRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.radion1503995839036')}\",handler:function(event){ProduceTaskActive_dg1505802969630_copyNewRowDataFunc(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceTaskActive_dg1505802969630_deldatagrid();}},{text:\"${getText('WOM.buttonPropertyshowName.radion1505441258642')}\",handler:function(event){ProduceTaskActive_dg1505802969630_addNewRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('WOM.buttonPropertyshowName.radion1503995839036')}\",handler:function(event){ProduceTaskActive_dg1505802969630_copyNewRowDataFunc(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProduceTaskActive_dg1505802969630" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1505802969630_id" value="ProduceTaskActive_dg1505802969630" />
			
			<input type="hidden" id="dg1505802969630_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1489671093316')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1505802969630.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969630"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProduceTaskActive_dg1505802969630" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProduceTaskActive_dg1505802969630" viewType="${viewType}" renderOverEvent="dg1505802969630RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_otherTaskEdit_form" noPermissionKeys="productId.productCode,productId.id,productId.productName,activeType,property,standardNum,planNum,productId.productBaseUnit.name,isMixQuality,phase,sequence,needWeigh,batchNumObj.batchText,minQuality,maxQuality,lossRate,remark,batchNumObj.id,orderProcessId.id,activeId.id,formulaId.id,processId.id,putBatMateId.id" modelCode="WOM_7.5.0.0_produceTask_ProduceTaskActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1505802969630" dtPage="dgPage"  hidekeyPrefix="dg1505802969630" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.id','productId.id','productId.productName','productId.id','productId.productBaseUnit.name','batchNumObj.id','batchNumObj.batchText','batchNumObj.id','batchNumObj.id','orderProcessId.id','orderProcessId.id','activeId.id','activeId.id','formulaId.id','formulaId.id','processId.id','processId.id','putBatMateId.id','putBatMateId.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1505802969630PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1490443916302')}" activexButton="WOM.buttonPropertyshowName.radion1505441258642,addNewRow,add;WOM.buttonPropertyshowName.radion1503995839036,copyNewRowDataFunc,add" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
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

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false  callbackname="clearBatchNum()" selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout.action" viewCode="MESBasic_1_product_refProductLayout" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  label="${getText('WOM.propertydisplayName.radion14157726448331')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="productId.id"        showFormat="TEXT" defaultValue="${(productId_id_defaultValue!)?string}" defaultDisplay="${(productId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="center" hiddenCol=true viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.randon1449796384550')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737455')}" width=100 showFormatFunc=""  />
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue='activeType/activeType3'>
										 									<@systemCodeColumn code="activeType" textalign="center" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1489726359628')}" width=100 hiddenCol=true  />
							<#assign property_displayDefaultType=''>
								<#assign property_defaultValue=''>
										<#assign property_defaultValue=''>
										 									<@systemCodeColumn code="RMproperty" textalign="center" defaultValue="${(property_defaultValue!)?string}" key="property.id" editable=true type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1503996516434')}" width=80   />
							<#assign standardNum_displayDefaultType=''>
								<#assign standardNum_defaultValue=''>
										<#assign standardNum_defaultValue=''>
										  
									<@datacolumn key="standardNum"        showFormat="TEXT" defaultValue="${(standardNum_defaultValue!)?string}" defaultDisplay="${(standardNum_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730105405')}" width=80 showFormatFunc=""  />
							<#assign planNum_displayDefaultType=''>
								<#assign planNum_defaultValue=''>
										<#assign planNum_defaultValue=''>
										  
									<@datacolumn key="planNum"        showFormat="TEXT" defaultValue="${(planNum_defaultValue!)?string}" defaultDisplay="${(planNum_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730174515')}" width=60 showFormatFunc=""  />
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

									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1398235640483')}" width=60 showFormatFunc=""  />
							<#assign isMixQuality_displayDefaultType=''>
								<#assign isMixQuality_defaultValue=''>
										<#assign isMixQuality_defaultValue=''>
										  
									<@datacolumn key="isMixQuality"        showFormat="CHECKBOX" defaultValue="${(isMixQuality_defaultValue!)?string}" defaultDisplay="${(isMixQuality_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729935738')}" width=80 showFormatFunc=""  />
							<#assign phase_displayDefaultType=''>
								<#assign phase_defaultValue=''>
										<#assign phase_defaultValue=''>
										  
									<@datacolumn key="phase"        showFormat="TEXT" defaultValue="${(phase_defaultValue!)?string}" defaultDisplay="${(phase_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503995488887')}" width=60 showFormatFunc=""  />
							<#assign sequence_displayDefaultType=''>
								<#assign sequence_defaultValue=''>
										<#assign sequence_defaultValue=''>
										  
									<@datacolumn key="sequence"        showFormat="TEXT" defaultValue="${(sequence_defaultValue!)?string}" defaultDisplay="${(sequence_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503995517319')}" width=60 showFormatFunc=""  />
							<#assign needWeigh_displayDefaultType=''>
								<#assign needWeigh_defaultValue=''>
										<#assign needWeigh_defaultValue=''>
										  
									<@datacolumn key="needWeigh"        showFormat="CHECKBOX" defaultValue="${(needWeigh_defaultValue!)?string}" defaultDisplay="${(needWeigh_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1503995551484')}" width=80 showFormatFunc=""  />
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

									<@datacolumn key="batchNumObj.batchText"        showFormat="SELECTCOMP" defaultValue="${(batchNumObj_batchText_defaultValue!)?string}" defaultDisplay="${(batchNumObj_batchText_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="left"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumOneMakeTask" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1503994294075')}"  label="${getText('WOM.propertydisplayName.randon1490064501469')}" width=100 showFormatFunc=""  />
							<#assign minQuality_displayDefaultType=''>
								<#assign minQuality_defaultValue=''>
										<#assign minQuality_defaultValue=''>
										  
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729953842')}" width=80 showFormatFunc=""  />
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										  
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729974625')}" width=80 showFormatFunc=""  />
							<#assign lossRate_displayDefaultType=''>
								<#assign lossRate_defaultValue=''>
										<#assign lossRate_defaultValue=''>
										  
									<@datacolumn key="lossRate"        showFormat="TEXT" defaultValue="${(lossRate_defaultValue!)?string}" defaultDisplay="${(lossRate_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730189645')}" width=60 showFormatFunc=""  />
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										  
									<@datacolumn key="remark"  popView=true      showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730249805')}" width=200 showFormatFunc=""  />
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

									<@datacolumn key="batchNumObj.id"        showFormat="TEXT" defaultValue="${(batchNumObj_id_defaultValue!)?string}" defaultDisplay="${(batchNumObj_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="center" hiddenCol=true viewUrl="/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumOneMakeTask" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1503994294075')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="orderProcessId.id"        showFormat="TEXT" defaultValue="${(orderProcessId_id_defaultValue!)?string}" defaultDisplay="${(orderProcessId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="center" hiddenCol=true viewUrl="/WOM/produceTask/produceTaskProcess/taskProcessRef.action" viewCode="WOM_7.5.0.0_produceTask_taskProcessRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490685207348')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="activeId.id"        showFormat="TEXT" defaultValue="${(activeId_id_defaultValue!)?string}" defaultDisplay="${(activeId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formulaProcessActive/activeCheckRef.action" viewCode="RM_7.5.0.0_formula_activeCheckRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1497922173328')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="formulaId.id"        showFormat="SELECTCOMP" defaultValue="${(formulaId_id_defaultValue!)?string}" defaultDisplay="${(formulaId_id_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formula/formulaTaskRef.action" viewCode="RM_7.5.0.0_formula_formulaTaskRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1498047455529')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="processId.id"        showFormat="SELECTCOMP" defaultValue="${(processId_id_defaultValue!)?string}" defaultDisplay="${(processId_id_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formulaProcess/processReference.action" viewCode="RM_7.5.0.0_formula_processReference" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488596828660')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="putBatMateId.id"        showFormat="SELECTCOMP" defaultValue="${(putBatMateId_id_defaultValue!)?string}" defaultDisplay="${(putBatMateId_id_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formulaProcessActive/activeCheckRef.action" viewCode="RM_7.5.0.0_formula_activeCheckRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1497922173328')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
			
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
				function ProduceTaskActive_dg1505802969630_check_datagridvalid(){
					//
					var errorObj =ProduceTaskActive_dg1505802969630Widget._DT.testData();
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
				
				function savedg1505802969630DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProduceTaskActive_dg1505802969630Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProduceTaskActive_dg1505802969630Widget') > -1) {
						ProduceTaskActive_dg1505802969630Widget.setAllRowEdited();
					}
					var json = ProduceTaskActive_dg1505802969630Widget.parseEditedData();
					$('input[name="dg1505802969630ListJson"]').remove();
					$('input[name="dgLists[\'dg1505802969630\']"]').remove();
					$('input[name="dg1505802969630ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1505802969630\']">').val(json).appendTo($('#WOM_produceTask_produceTask_otherTaskEdit_form'));
					$('<input type="hidden" name="dg1505802969630ModelCode">').val('WOM_7.5.0.0_produceTask_ProduceTaskActive').appendTo($('#WOM_produceTask_produceTask_otherTaskEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1505802969630ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_otherTaskEdit_form'));
				}
				function DT_ProduceTaskActive_dg1505802969630_deldatagrid(){
					var deleteRows = ProduceTaskActive_dg1505802969630Widget.deleteRows();
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
						if($("#dg1505802969630DeletedIds").length>0){
							$("#dg1505802969630DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1505802969630DeletedIds" name="dgDeletedIds[\'dg1505802969630\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_otherTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1505802969630DeletedIds['+CUI('input[name^="dg1505802969630DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_otherTaskEdit_form'));
					});
					return deleteRows;
				}
				function DT_ProduceTaskActive_dg1505802969630_delTreeNodes(){
					var deleteRows = ProduceTaskActive_dg1505802969630Widget._DT.removeTreeNode();
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
						if($("#dg1505802969630DeletedIds").length>0){
							$("#dg1505802969630DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1505802969630DeletedIds" name="dgDeletedIds[\'dg1505802969630\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_otherTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1505802969630DeletedIds['+CUI('input[name^="dg1505802969630DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_otherTaskEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_otherTaskEdit_datagrids');
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
							if(datagrids[0][i] == 'ProduceTaskActive_dg1505802969630') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProduceTaskActive_dg1505802969630';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProduceTaskActive_dg1505802969630';
					}
					$('body').data('WOM_produceTask_produceTask_otherTaskEdit_datagrids', datagrids);
				});
				
				var ProduceTaskActive_dg1505802969630_importDialog = null;
				function ProduceTaskActive_dg1505802969630_showImportDialog(){
					try{
						if(ProduceTaskActive_dg1505802969630_importDialog!=null&&ProduceTaskActive_dg1505802969630_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969630&tid=${id!}&datagridName=dg1505802969630";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969630_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProduceTaskActive_dg1505802969630_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProduceTaskActive_dg1505802969630"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskActive_dg1505802969630_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskActive_dg1505802969630_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProduceTaskActive_dg1505802969630_importDialog.show();
					}catch(e){}
				}	
				
				function ProduceTaskActive_dg1505802969630_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969630&templateRelatedModelCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969630&downloadType=template&fileName=dg1505802969630";
					window.open(url,"","");
				}
				function dg1505802969630RenderOverEvent(){
					//启用物料批次
    if(isProBatch==true){
    	//将复制按钮显示
    	$(".paginatorbar [class='paginatorbar-operatebar'] a:eq(2)").hide().show();
    }else{
    	//复制按钮隐藏
    	$(".paginatorbar [class='paginatorbar-operatebar'] a:eq(2)").hide().hide();
		//隐藏物料批号列
		$( 'td[key="batchNumObj.batchText"]').hide();
		ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = true;
		ProduceTaskActive_dg1505802969630Widget._DT._initDomElements();
		ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = false;
    }
    //根据有无表体禁用产品、配方、生产线、生产数量
    if(ProduceTaskActive_dg1505802969630Widget.getRowLength()>0 && $("[name='produceTask.formularId.code']").val()!=""){
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
				function dg1505802969630PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.otherTaskEdit.initSize(nTabIndex);
					$('div .paginatorbar-operatebar:eq(0) a:eq(1)').insertBefore( $('div .paginatorbar-operatebar:eq(0) a:eq(0)') );
if($("[name='produceTask.formularId.id']").val()!=""){
	$(".paginatorbar-operatebar :eq(0)").hide();
	$(".paginatorbar-operatebar :eq(2)").hide();
}
$("#ProduceTaskActive_dg1505802969630 .paginatorbar-operatebar span:eq(2)").attr('class','buttonbar-button cui-btn-copy');
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
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1505802969738.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969738">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1505802969738.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969738">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceMaterialSum_dg1505802969738_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceMaterialSum_dg1505802969738_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProduceMaterialSum_dg1505802969738" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1505802969738_id" value="ProduceMaterialSum_dg1505802969738" />
			
			<input type="hidden" id="dg1505802969738_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1489671141506')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1505802969738.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969738"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProduceMaterialSum_dg1505802969738" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProduceMaterialSum_dg1505802969738" viewType="${viewType}" renderOverEvent="dg1505802969738RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_otherTaskEdit_form" noPermissionKeys="productId.productCode,productId.productName,property,planNum,productId.productBaseUnit.name,batchNum,headId.formularId.setProcess" modelCode="WOM_7.5.0.0_produceTask_ProduceMaterialSum" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1505802969738" dtPage="dgPage"  hidekeyPrefix="dg1505802969738" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName','productId.id','productId.productBaseUnit.name','headId.id','headId.formularId.setProcess.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=1 pageInitMethod="dg1505802969738PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1490444001342')}" activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
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

									<@datacolumn key="productId.productCode"        showFormat="TEXT" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion14157726448331')}" width=120 showFormatFunc=""  />
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

									<@datacolumn key="productId.productName"        showFormat="SELECTCOMP" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737334')}" width=120 showFormatFunc=""  />
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

									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.otherTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1398235640483')}" width=60 showFormatFunc=""  />
							<#assign batchNum_displayDefaultType=''>
								<#assign batchNum_defaultValue=''>
										<#assign batchNum_defaultValue=''>
										 
									<@datacolumn key="batchNum"        showFormat="TEXT" defaultValue="${(batchNum_defaultValue!)?string}" defaultDisplay="${(batchNum_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.modelname.randon1490066410355875847')}" width=100 showFormatFunc=""  />
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
				function ProduceMaterialSum_dg1505802969738_check_datagridvalid(){
					//
					var errorObj =ProduceMaterialSum_dg1505802969738Widget._DT.testData();
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
				
				function savedg1505802969738DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProduceMaterialSum_dg1505802969738Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProduceMaterialSum_dg1505802969738Widget') > -1) {
						ProduceMaterialSum_dg1505802969738Widget.setAllRowEdited();
					}
					var json = ProduceMaterialSum_dg1505802969738Widget.parseEditedData();
					$('input[name="dg1505802969738ListJson"]').remove();
					$('input[name="dgLists[\'dg1505802969738\']"]').remove();
					$('input[name="dg1505802969738ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1505802969738\']">').val(json).appendTo($('#WOM_produceTask_produceTask_otherTaskEdit_form'));
					$('<input type="hidden" name="dg1505802969738ModelCode">').val('WOM_7.5.0.0_produceTask_ProduceMaterialSum').appendTo($('#WOM_produceTask_produceTask_otherTaskEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1505802969738ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_otherTaskEdit_form'));
				}
				function DT_ProduceMaterialSum_dg1505802969738_deldatagrid(){
					var deleteRows = ProduceMaterialSum_dg1505802969738Widget.deleteRows();
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
						if($("#dg1505802969738DeletedIds").length>0){
							$("#dg1505802969738DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1505802969738DeletedIds" name="dgDeletedIds[\'dg1505802969738\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_otherTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1505802969738DeletedIds['+CUI('input[name^="dg1505802969738DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_otherTaskEdit_form'));
					});
					return deleteRows;
				}
				function DT_ProduceMaterialSum_dg1505802969738_delTreeNodes(){
					var deleteRows = ProduceMaterialSum_dg1505802969738Widget._DT.removeTreeNode();
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
						if($("#dg1505802969738DeletedIds").length>0){
							$("#dg1505802969738DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1505802969738DeletedIds" name="dgDeletedIds[\'dg1505802969738\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_otherTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1505802969738DeletedIds['+CUI('input[name^="dg1505802969738DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_otherTaskEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_otherTaskEdit_datagrids');
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
							if(datagrids[1][i] == 'ProduceMaterialSum_dg1505802969738') {
								break;
							}
							if(i==datagrids[1].length-1) {
								datagrids[1][datagrids[1].length] = 'ProduceMaterialSum_dg1505802969738';
							}
						}
					} else {
						datagrids[1][datagrids[1].length] = 'ProduceMaterialSum_dg1505802969738';
					}
					$('body').data('WOM_produceTask_produceTask_otherTaskEdit_datagrids', datagrids);
				});
				
				var ProduceMaterialSum_dg1505802969738_importDialog = null;
				function ProduceMaterialSum_dg1505802969738_showImportDialog(){
					try{
						if(ProduceMaterialSum_dg1505802969738_importDialog!=null&&ProduceMaterialSum_dg1505802969738_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969738&tid=${id!}&datagridName=dg1505802969738";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969738_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProduceMaterialSum_dg1505802969738_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProduceMaterialSum_dg1505802969738"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceMaterialSum_dg1505802969738_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceMaterialSum_dg1505802969738_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProduceMaterialSum_dg1505802969738_importDialog.show();
					}catch(e){}
				}	
				
				function ProduceMaterialSum_dg1505802969738_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969738&templateRelatedModelCode=WOM_7.5.0.0_produceTask_otherTaskEditdg1505802969738&downloadType=template&fileName=dg1505802969738";
					window.open(url,"","");
				}
				function dg1505802969738RenderOverEvent(){
					//启用物料批次
    if(!isProBatch || ProduceMaterialSum_dg1505802969738Widget.getCellValue(0,"headId.formularId.setProcess.id")=="formulaProperty/formulaProperty1"){
		//隐藏物料批号列
		$( 'td[key="batchNum"]').hide();
		ProduceMaterialSum_dg1505802969738Widget._DT._resizeHeight = true;
		ProduceMaterialSum_dg1505802969738Widget._DT._initDomElements();
		ProduceMaterialSum_dg1505802969738Widget._DT._resizeHeight = false;
    }
				}
				function dg1505802969738PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.otherTaskEdit.initSize(nTabIndex);
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
     	
		<div id="WOM_produceTask_produceTask_otherTaskEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.produceTask.produceTask.otherTaskEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.produceTask.produceTask.otherTaskEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.produceTask.produceTask.otherTaskEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_otherTaskEdit,html,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	.cui-btn-putin {
    	background: url('/bap/static/WOM/img/icon_jxtl.png') no-repeat;
	}
    .cui-btn-inspect {
    	background: url('/bap/static/WOM/img/icon_fqqj.png') no-repeat;
	}
	.cui-btn-taskReport {
    	background: url('/bap/static/WOM/img/icon_jxbg.png') no-repeat;
	}
	.cui-btn-cdsz {
    	background: url('/bap/static/WOM/img/icon_cdsz.png') no-repeat;
	}
	.cui-btn-copy {
    	background: url('/bap/static/WOM/img/icon_copy.png') no-repeat;
	}
	.cui-btn-end {
    	background: url('/bap/static/WOM/img/icon_end.png') no-repeat;
	}
	.cui-btn-gdtpl {
    	background: url('/bap/static/WOM/img/icon_gdtpl.png') no-repeat;
	}
	.cui-btn-hdsz {
    	background: url('/bap/static/WOM/img/icon_hdsz.png') no-repeat;
	}
	.cui-btn-jxps {
    	background: url('/bap/static/WOM/img/icon_jxps.png') no-repeat;
	}
	.cui-btn-plwc {
    	background: url('/bap/static/WOM/img/icon_plwc.png') no-repeat;
	}
	.cui-btn-print {
    	background: url('/bap/static/WOM/img/icon_print.png') no-repeat;
	}
	.cui-btn-sgtpl {
    	background: url('/bap/static/WOM/img/icon_sgtpl.png') no-repeat;
	}
	.cui-btn-wlszyck {
    	background: url('/bap/static/WOM/img/icon_wlszyck.png') no-repeat;
	}
	.cui-btn-xtdbd {
    	background: url('/bap/static/WOM/img/icon_xtdbd.png') no-repeat;
	}
	.cui-btn-zdsc {
    	background: url('/bap/static/WOM/img/icon_zdsc.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}

</style>
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
						$("#WOM_produceTask_produceTask_otherTaskEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_produceTask_produceTask_otherTaskEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_produceTask_produceTask_otherTaskEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_produceTask_produceTask_otherTaskEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.produceTask.produceTask.otherTaskEdit.initCount = 0;
			WOM.produceTask.produceTask.otherTaskEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_produceTask_produceTask_otherTaskEdit_main_div .edit-head").height()-$("#WOM_produceTask_produceTask_otherTaskEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_produceTask_produceTask_otherTaskEdit_main_div .edit-workflow").height()</#if>;
				$("#WOM_produceTask_produceTask_otherTaskEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_produceTask_produceTask_otherTaskEdit_datagrids');
				var padding_bottom=16;
				$("#WOM_produceTask_produceTask_otherTaskEdit_main_div .pd_bottom,#WOM_produceTask_produceTask_otherTaskEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_produceTask_produceTask_otherTaskEdit_main_div .edit-panes-s").each(function(index){
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
									if(WOM.produceTask.produceTask.otherTaskEdit.initCount <= 2) {
										setTimeout(function(){WOM.produceTask.produceTask.otherTaskEdit.initSize();}, 200);
										WOM.produceTask.produceTask.otherTaskEdit.initCount++;
									}/* else {
										WOM.produceTask.produceTask.otherTaskEdit.initCount = 0;
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
							if(($("#WOM_produceTask_produceTask_otherTaskEdit_main_div .edit-workflow").length > 0) && ($("#WOM_produceTask_produceTask_otherTaskEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#WOM_produceTask_produceTask_otherTaskEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.produceTask.produceTask.otherTaskEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.produceTask.produceTask.otherTaskEdit.initSize();
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
						if(parseInt($("#WOM_produceTask_produceTask_otherTaskEdit_main_div").css("width"),10)==650){
							$("#WOM_produceTask_produceTask_otherTaskEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.produceTask.produceTask.otherTaskEdit.resizeLayout();
						//WOM.produceTask.produceTask.otherTaskEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_produceTask_produceTask_otherTaskEdit_main_div").css("width"),10)==800){
							$("#WOM_produceTask_produceTask_otherTaskEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.produceTask.produceTask.otherTaskEdit.resizeLayout();
						//WOM.produceTask.produceTask.otherTaskEdit.initSize();
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
					WOM.produceTask.produceTask.otherTaskEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.produceTask.produceTask.otherTaskEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.produceTask.produceTask.otherTaskEdit.initSize();});
				/*
				WOM.produceTask.produceTask.otherTaskEdit.resizeLayout=function(){
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
			WOM.produceTask.produceTask.otherTaskEdit.setDepartment();
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

		WOM.produceTask.produceTask.otherTaskEdit.validate = function(){
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
		WOM.produceTask.produceTask.otherTaskEdit.beforeSaveProcess = function(){
			try{eval("savedg1505802969630DataGrid()");}catch(e){}
			try{eval("savedg1505802969738DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#WOM_produceTask_produceTask_otherTaskEdit_form').trigger('beforeSubmit');
			//produceTask.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="produceTask.extraCol"]').val(extraCol);
		}
		WOM.produceTask.produceTask.otherTaskEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_otherTaskEdit_form').append(ProduceTaskActive_dg1505802969630Widget._DT.createInputs('dg1505802969630List'));
										</#if>
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_otherTaskEdit_form').append(ProduceMaterialSum_dg1505802969738Widget._DT.createInputs('dg1505802969738List'));
										</#if>
		};
		WOM.produceTask.produceTask.otherTaskEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.produceTask.produceTask.otherTaskEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.produceTask.produceTask.otherTaskEdit.beforeSaveProcess();

			//WOM.produceTask.produceTask.otherTaskEdit.processDataGrid();
			$('#WOM_produceTask_produceTask_otherTaskEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_produceTask_produceTask_otherTaskEdit_form','WOM_produceTask_produceTask_otherTaskEdit_datagrids')) {      
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
		WOM.produceTask.produceTask.otherTaskEdit.print = function(){
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
		
		WOM.produceTask.produceTask.otherTaskEdit.saveSetting = function(){
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
		
		WOM.produceTask.produceTask.otherTaskEdit.printSetting = function(){
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
				WOM.produceTask.produceTask.otherTaskEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.produceTask.produceTask.otherTaskEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.produceTask.produceTask.otherTaskEdit.settingDialog.show();
			}
		}
		
		
		
		WOM.produceTask.produceTask.otherTaskEdit.reject = function(){
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
			WOM.produceTask.produceTask.otherTaskEdit.submit();
		}
		
		WOM.produceTask.produceTask.otherTaskEdit.submit = function(uncheck){
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
			if(!WOM.produceTask.produceTask.otherTaskEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.produceTask.produceTask.otherTaskEdit.beforeSaveProcess();
			
			//WOM.produceTask.produceTask.otherTaskEdit.processDataGrid();
			
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
			$('#WOM_produceTask_produceTask_otherTaskEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.produceTask.produceTask.otherTaskEdit.recall = function(){
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
		WOM.produceTask.produceTask.otherTaskEdit._callBackInfo = function(res){
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
		WOM.produceTask.produceTask.otherTaskEdit.setDepartment = function(){
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
				WOM.produceTask.produceTask.otherTaskEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.produceTask.produceTask.otherTaskEdit._refViewCode_IE = viewCode;
			} else {
				WOM.produceTask.produceTask.otherTaskEdit._refViewCode_IE = '';
			}
			WOM.produceTask.produceTask.otherTaskEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.produceTask.produceTask.otherTaskEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.produceTask.produceTask.otherTaskEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.produceTask.produceTask.otherTaskEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.produceTask.produceTask.otherTaskEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.produceTask.produceTask.otherTaskEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.produceTask.produceTask.otherTaskEdit.gridEventObj = gridEventObj;
				callbackName = "WOM.produceTask.produceTask.otherTaskEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.produceTask.produceTask.otherTaskEdit.getMultiselectCallBackInfo_DG" : "WOM.produceTask.produceTask.otherTaskEdit.getcallBackInfo_DG";
				WOM.produceTask.produceTask.otherTaskEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.produceTask.produceTask.otherTaskEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.produceTask.produceTask.otherTaskEdit._prefix = _prefix.substring(1);
			}
			
			WOM.produceTask.produceTask.otherTaskEdit._oGrid = oGrid;
			WOM.produceTask.produceTask.otherTaskEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.produceTask.produceTask.otherTaskEdit._refViewCode = oColumn.viewCode;
				} else {
					WOM.produceTask.produceTask.otherTaskEdit._refViewCode = '';
				}
			} else {
				WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp = false;
				WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames = '';
				WOM.produceTask.produceTask.otherTaskEdit._refViewCode = '';
			}
			if (WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp == true && WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.produceTask.produceTask.otherTaskEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.produceTask.produceTask.otherTaskEdit._customCallBack = customCallBack;
			}
			if(WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.produceTask.produceTask.otherTaskEdit._querycustomFuncN == "function") {
				refparam += WOM.produceTask.produceTask.otherTaskEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.produceTask.produceTask.otherTaskEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.otherTaskEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.produceTask.produceTask.otherTaskEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.produceTask.produceTask.otherTaskEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.otherTaskEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.produceTask.produceTask.otherTaskEdit.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.produceTask.otherTaskEdit.query_'+obj+'()') : null;
			return str;
		};
		WOM.produceTask.produceTask.otherTaskEdit.getcallBackGroupInfo = function(obj){
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
			WOM.produceTask.produceTask.otherTaskEdit._dialog.close();
		}
		WOM.produceTask.produceTask.otherTaskEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_produceTask_produceTask_otherTaskEdit_form',obj[0], WOM.produceTask.produceTask.otherTaskEdit._prefix, WOM.produceTask.produceTask.otherTaskEdit._sUrl);
			CUI.commonFills('WOM_produceTask_produceTask_otherTaskEdit_form',WOM.produceTask.produceTask.otherTaskEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.produceTask.produceTask.otherTaskEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.produceTask.produceTask.otherTaskEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.otherTaskEdit._customCallBack);
					WOM.produceTask.produceTask.otherTaskEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.otherTaskEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.produceTask.produceTask.otherTaskEdit.getcallBackInfo_DG_IE = function(obj){
			if(WOM.produceTask.produceTask.otherTaskEdit._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.otherTaskEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.produceTask.produceTask.otherTaskEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp_IE == true && WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.otherTaskEdit._sUrl,WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.otherTaskEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp_IE == true && WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.produceTask.produceTask.otherTaskEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.produceTask.produceTask.otherTaskEdit._refViewCode_IE + '&id=' + id,
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
				if(WOM.produceTask.produceTask.otherTaskEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.otherTaskEdit._customCallBack);
					WOM.produceTask.produceTask.otherTaskEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.otherTaskEdit._dialog.close();
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
		
		WOM.produceTask.produceTask.otherTaskEdit.getcallBackInfo_DG = function(obj){
			if(WOM.produceTask.produceTask.otherTaskEdit._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.otherTaskEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.produceTask.produceTask.otherTaskEdit._currRow).next().length==0){
						WOM.produceTask.produceTask.otherTaskEdit._oGrid.addNewRow();
					}	
					WOM.produceTask.produceTask.otherTaskEdit._currRow = $(WOM.produceTask.produceTask.otherTaskEdit._currRow).next();
					$(WOM.produceTask.produceTask.otherTaskEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.produceTask.produceTask.otherTaskEdit._currRow,obj[i], WOM.produceTask.produceTask.otherTaskEdit._prefix, WOM.produceTask.produceTask.otherTaskEdit._sUrl);
				if (WOM.produceTask.produceTask.otherTaskEdit._isObjCustomProp == true && WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.produceTask.produceTask.otherTaskEdit._currRow,WOM.produceTask.produceTask.otherTaskEdit._prefix,obj[i],WOM.produceTask.produceTask.otherTaskEdit._oGrid,WOM.produceTask.produceTask.otherTaskEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.produceTask.produceTask.otherTaskEdit._currRow,WOM.produceTask.produceTask.otherTaskEdit._prefix,obj[i],WOM.produceTask.produceTask.otherTaskEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.produceTask.produceTask.otherTaskEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.produceTask.produceTask.otherTaskEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.produceTask.produceTask.otherTaskEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.produceTask.produceTask.otherTaskEdit._refViewCode + '&id=' + id,
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
									name = WOM.produceTask.produceTask.otherTaskEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.produceTask.produceTask.otherTaskEdit._currRow, objs, WOM.produceTask.produceTask.otherTaskEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.produceTask.produceTask.otherTaskEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.otherTaskEdit._customCallBack);
					WOM.produceTask.produceTask.otherTaskEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.otherTaskEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.produceTask.produceTask.otherTaskEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.produceTask.produceTask.otherTaskEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.produceTask.produceTask.otherTaskEdit._oGrid, WOM.produceTask.produceTask.otherTaskEdit._currRow, WOM.produceTask.produceTask.otherTaskEdit._key, WOM.produceTask.produceTask.otherTaskEdit._displayFieldName, obj[i])
			}
			try{
				if(WOM.produceTask.produceTask.otherTaskEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.otherTaskEdit._customCallBack);
					WOM.produceTask.produceTask.otherTaskEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.otherTaskEdit._dialog.close();
			} catch(e){}
		};
		
		WOM.produceTask.produceTask.otherTaskEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.produceTask.produceTask.otherTaskEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_produceTask_produceTask_otherTaskEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.produceTask.produceTask.otherTaskEdit.onloadForProduct();
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

		WOM.produceTask.produceTask.otherTaskEdit.beforeSubmitMethodSettingInPage = function(){
			WOM.produceTask.produceTask.otherTaskEdit.onsaveForProduct();
		};
		WOM.produceTask.produceTask.otherTaskEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.produceTask.produceTask.otherTaskEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.produceTask.produceTask.otherTaskEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_produceTask_produceTask_otherTaskEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_produceTask_produceTask_otherTaskEdit_main_div").hide();
				},100);
				//CUI("#WOM_produceTask_produceTask_otherTaskEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.produceTask.produceTask.otherTaskEdit.showThis = function(){
			if(!CUI("#WOM_produceTask_produceTask_otherTaskEdit_main_div").is(':visible')) {
				CUI("#WOM_produceTask_produceTask_otherTaskEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.produceTask.produceTask.otherTaskEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.produceTask.produceTask.otherTaskEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_produceTask_produceTask_otherTaskEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_produceTask_ProduceTask&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.otherTaskEdit.auditDialog.show();
			</#if>
		}
		
		
		WOM.produceTask.produceTask.otherTaskEdit.showInfoDialog=function(mode){
			
			WOM.produceTask.produceTask.otherTaskEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_produceTask_produceTask_otherTaskEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.otherTaskEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.produceTask.produceTask.otherTaskEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_produceTask");
			}
		}
		
		WOM.produceTask.produceTask.otherTaskEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/produceTask/produceTask/dealInfo-list.action&dlTableInfoId=${(produceTask.tableInfoId)?default('')}");
			}
		}
		WOM.produceTask.produceTask.otherTaskEdit.showFlowInfo=function(){
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
		WOM.produceTask.produceTask.otherTaskEdit.supervision=function(){
			WOM.produceTask.produceTask.otherTaskEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(produceTask.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.produceTask.produceTask.otherTaskEdit.modifyOwnerStaffDialog.show();
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
function _callback_produceTask(obj){
			//console.log(obj);
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
		var length=ProduceTaskActive_dg1505802969630Widget.getRowLength();//pt长度
		if(length>0){
			//清空pt数据
			ProduceTaskActive_dg1505802969630Widget._DT.delAllRows();
		}
		var dlength=$("#ProduceMaterialSum_dg1505802969738_tbody").length;
		if(dlength==0){
			//清空用料汇总表体记录
			var headId=$("#id").val(); 
			if(headId!=""){
				$.ajax({
					url:'/WOM/produceTask/produceMaterialSum/deleteByheadId.action',
					type:'post',
					async:false,
					data:'headId='+headId,
					dataType:'json',
					success:function(res){
						if(res.dealSuccessFlag==true){
							return true;
						}
					}
				});
			}
		}else{
			ProduceMaterialSum_dg1505802969738Widget._DT.delAllRows();
		}
		formulaChange1();
	
}
function getDefaultFormular(obj){
	//获取样品ID
	var productID = obj[0].id;
	var line=$("[name='produceTask.factoryId.name']").val();
	if(line==""){
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
			  $("[name='produceTask.supportEbr']").val(res.supportEbr+'');//EBR赋值
			}
		}
	});
	
	//如果默认配方不等于空
	if($("[name='produceTask.formularId.code']").val()!=""){
		//增删行按钮隐藏
		$(".paginatorbar-operatebar :eq(0)").hide();
		$(".paginatorbar-operatebar :eq(2)").hide();
		var length=ProduceTaskActive_dg1505802969630Widget.getRowLength();//pt长度
		if(length>0){
			//清空pt数据
			ProduceTaskActive_dg1505802969630Widget._DT.delAllRows();
		}
		var dlength=$("#ProduceMaterialSum_dg1505802969738_tbody").length;
		if(dlength==0){
			//清空用料汇总表体记录
			var headId=$("#id").val(); 
			if(headId!=""){
				$.ajax({
					url:'/WOM/produceTask/produceMaterialSum/deleteByheadId.action',
					type:'post',
					async:false,
					data:'headId='+headId,
					dataType:'json',
					success:function(res){
						if(res.dealSuccessFlag==true){
							return true;
						}
					}
				});
			}
		}else{
			ProduceMaterialSum_dg1505802969738Widget._DT.delAllRows();
		}
		formulaChange1();
	}	
	}

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


function clearBatchNum(){
		var nRow=ProduceTaskActive_dg1505802969630Widget.getSelectedRow();
			//批号清空
		ProduceTaskActive_dg1505802969630Widget.setCellValue(nRow,"batchNumObj.id","");
		ProduceTaskActive_dg1505802969630Widget.setCellValue(nRow,"batchNumObj.batchText","");
	}



		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_otherTaskEdit,js,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码
 var isProBatch="";

	//获取未删前的html
	var lableHtme;
	function easyFormulahide(){
      	$( 'td[key="orderProcessId.name"]').hide();
		$( 'td[key="name"]').hide();
		$( 'td[key="actOrder"]').hide();
		$( 'td[key="exeSystem.id"]').hide();
      	$( 'td[key="isReplace"]').hide();
      	//隐藏阶段，次序，需要称重 工序名称 活动 执行系统 替代料
		$( 'td[key="phase"]').hide();
		$( 'td[key="sequence"]').hide();
		$( 'td[key="needWeigh"]').hide();
		$( 'td[key="orderProcessId.name"]').hide();
		$( 'td[key="name"]').hide();	
		$( 'td[key="exeSystem.id"]').hide();
		$( 'td[key="isReplace"]').hide();	
      	//表体滚动条bug修改
      	ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = true;
		ProduceTaskActive_dg1505802969630Widget._DT._initDomElements();
      	//隐藏业签
		$(".edit-tabs li:eq(1)").hide();
		$(".edit-tabs li:eq(2)").hide();
	}
	
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
            ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = true;
            ProduceTaskActive_dg1505802969630Widget._DT._initDomElements();
        }
        //不启用ebr
        else if(supportEBR=='false'){
            $( 'td[key="standardNum"]').show();
            $( 'td[key="isMixQuality"]').show();
            $( 'td[key="phase"]').hide();
            $( 'td[key="sequence"]').hide();
            $( 'td[key="needWeigh"]').hide();
            //表体滚动条bug修改
            ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = true;
            ProduceTaskActive_dg1505802969630Widget._DT._initDomElements();
            isproBatch();
        }
        //启用ebr
        else if(supportEBR=='true'){
			$( 'td[key="standardNum"]').show();
            $( 'td[key="isMixQuality"]').show();
            $( 'td[key="phase"]').show();
            $( 'td[key="sequence"]').show();
            $( 'td[key="needWeigh"]').show();
            //表体滚动条bug修改
            ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = true;
            ProduceTaskActive_dg1505802969630Widget._DT._initDomElements();
            isproBatch();
        }
    }


	function produceTask_planParId_dayPlanInfo_tableNo_delete(){
	   produceTask_planParId_dayPlanInfo_tableNo_prefix = '',
	   //$("#WOM_produceTask_produceTask_makeTaskEdit_form #produceTask_planParId_dayPlanInfo_tableNo").val('');
	   //var arr="produceTask.planParId.dayPlanInfo.tableNo".split('.');
	   //for(var i=0;i<arr.length-1;i++) {
	   //	if(i!=0) {
	   //		produceTask_planParId_dayPlanInfo_tableNo_prefix += '.';
	   //	}
	   //	produceTask_planParId_dayPlanInfo_tableNo_prefix += arr[i];
	   //}
	   //CUI('#WOM_produceTask_produceTask_makeTaskEdit_form input[name="'+produceTask_planParId_dayPlanInfo_tableNo_prefix + '.id"]').val('');
	   CUI.clearInput("produceTask.planParId.dayPlanInfo.tableNo");
	   CUI("#WOM_produceTask_produceTask_makeTaskEdit_form #produceTask_planParId_dayPlanInfo_tableNo").attr('valuebak','');
	   CUI('#WOM_produceTask_produceTask_makeTaskEdit_form input[name="'+produceTask_planParId_dayPlanInfo_tableNo_prefix + '.id"]').attr('valuebak','');
	   //清空指令单id
       CUI('#WOM_produceTask_produceTask_makeTaskEdit_form input[name="produceTask.planParId.id"]').attr('valuebak','');
	   CUI('#WOM_produceTask_produceTask_makeTaskEdit_form input[name="produceTask.planParId.id"]').attr('value','');
	}
	//配方扫把重写
	function produceTask_formularId_code_delete(){
	   	produceTask_formularId_code_prefix = '',
	  	//$("#WOM_produceTask_produceTask_makeTaskEdit_form #produceTask_formularId_code").val('');
	  	//var arr="produceTask.formularId.code".split('.');
	   	//for(var i=0;i<arr.length-1;i++) {
	   	//	if(i!=0) {
	   	//		produceTask_formularId_code_prefix += '.';
	   	//	}
	   	//	produceTask_formularId_code_prefix += arr[i];
	   	//}
	   	//CUI('#WOM_produceTask_produceTask_makeTaskEdit_form input[name="'+produceTask_formularId_code_prefix + '.id"]').val('');
	   	CUI.clearInput("produceTask.formularId.code");
	   	CUI("#WOM_produceTask_produceTask_makeTaskEdit_form #produceTask_formularId_code").attr('valuebak','');
	   	CUI('#WOM_produceTask_produceTask_makeTaskEdit_form input[name="'+produceTask_formularId_code_prefix + '.id"]').attr('valuebak','');
	   	CUI.restoreMneTips($("#WOM_produceTask_produceTask_makeTaskEdit_form #produceTask_formularId_code"),'produceTask_formularId_code_mneTipLabel','WOM_produceTask_produceTask_makeTaskEdit_form');
	   	//_del_callback_produceTask_formularId_code();
      	//删除产品性质
      	$("[name='produceTask.workType.id']").val("");
		$("[name='produceTask.workType.value']").val("");
      
      	//清空物品
      	//produceTask_productId_productCode_delete();
      
		$( 'td[key="standardNum"]').hide();
        $( 'td[key="isMixQuality"]').hide();
        $( 'td[key="phase"]').hide();
        $( 'td[key="sequence"]').hide();
        $( 'td[key="needWeigh"]').hide();
        //表体滚动条bug修改
        ProduceTaskActive_dg1505802969630Widget._DT._resizeHeight = true;
        ProduceTaskActive_dg1505802969630Widget._DT._initDomElements();
      
      	//增删行按钮显示
		$(".paginatorbar-operatebar :eq(0)").show();
		$(".paginatorbar-operatebar :eq(2)").show();
		ProduceTaskActive_dg1505802969630Widget._DT.configs.checkEditCondition = function( key, nRow){
			if(key=="planNum"){//计划用量
				return true;//返回false不可编辑，返回true可编辑  
			}			
			if(key=="batchNumObj.batchText"){//物料批号
				return true;
			}
			if(key=="minQuality"){//理论下限
				return true;
			}
			if(key=="maxQuality"){//理论上限
				return true;
			}
			if(key=="lossRate"){//损耗率
				return true;//返回false不可编辑，返回true可编辑
			}
			if(key=="remark"){//备注
				return true;//返回false不可编辑，返回true可编辑
			}
			if(key=="productId.productCode"){//物品编码
				return true;//返回false不可编辑，返回true可编辑
			}
			if(key=="property.id"){//性质
				return true;//返回false不可编辑，返回true可编辑
			}
			return false;
		}
	}

      function isproBatch(){
     		ProduceTaskActive_dg1505802969630Widget._DT.configs.checkEditCondition = function( key, nRow){
				if(key=="planNum"){//计划用量
					return true;//返回false不可编辑，返回true可编辑  
				}			
				if(key=="batchNumObj.batchText"){//物料批号
					return true;
				}
				if(key=="minQuality"){//理论下限
					return true;
				}
				if(key=="maxQuality"){//理论上限
					return true;
				}
				if(key=="lossRate"){//损耗率
					return true;//返回false不可编辑，返回true可编辑
				}
				if(key=="remark"){//备注
					return true;//返回false不可编辑，返回true可编辑
				}
				return false;
			}
		}
   
        //重写 by  pl
        WOM.produceTask.produceTask.otherTaskEdit._callBackInfo = function(res){
          console.log(res);
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
							window.opener.location.reload();
						}catch(e3){}
					}
				};
                var tasksID=$('input[name="produceTask.tasksID"]').val();
				<#if !(superEdit!false)>
 				if(res.operateType == 'save'){
                    var powerCode=gerPowerCode('makeTaskFlow');
                    var url='';
                    if(tasksID!=''){
                      <#if tableInfoId??>
                         url='/WOM/produceTask/produceTask/makeTaskEdit.action?&tableInfoId='+${tableInfoId!''}+'&entityCode=WOM_7.5.0.0_produceTask&id='+${id!''}+'&__pc__='+powerCode;
                       </#if>        
                    }else{
                   	   url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=WOM_7.5.0.0_produceTask";
                    }			
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




            function gerPowerCode(change){

                var deploymentId="";  //流程部署id
                var powerCode = "";   //权限code（_pc_）
                CUI.ajax({
                    url: "/ec/workflow/getCurrentDeployment.action?processKey="+change, //change为工作流key
                    type: 'post',
                    async: false,
                    success: function(msg) {
                           deploymentId = msg.deploymentId;
                }
                });
                if(deploymentId==undefined || deploymentId===""){
                    CUI.Dialog.alert("工作流配置有问题，请联系管理员！");
                    return false;
                }
                CUI.ajax({
                    url: "/ec/workflow/getStartActivePowerCode.action?deploymentId="+deploymentId,
                    type: 'post',
                    async: false,
                    success: function(msg) {
                    powerCode = msg.powerCode;
                }
                });

                return powerCode;
            }

	function produceTask_productId_productCode_delete(){
	   produceTask_productId_productCode_prefix = '',
	   //$("#WOM_produceTask_produceTask_makeTaskEdit_form #produceTask_productId_productCode").val('');
	   //var arr="produceTask.productId.productCode".split('.');
	   //for(var i=0;i<arr.length-1;i++) {
	   //	if(i!=0) {
	   //		produceTask_productId_productCode_prefix += '.';
	   //	}
	   //	produceTask_productId_productCode_prefix += arr[i];
	   //}
	   //CUI('#WOM_produceTask_produceTask_makeTaskEdit_form input[name="'+produceTask_productId_productCode_prefix + '.id"]').val('');
	   CUI.clearInput("produceTask.productId.productCode");
	   CUI("#WOM_produceTask_produceTask_makeTaskEdit_form #produceTask_productId_productCode").attr('valuebak','');
	   CUI('#WOM_produceTask_produceTask_makeTaskEdit_form input[name="'+produceTask_productId_productCode_prefix + '.id"]').attr('valuebak','');
	   CUI.restoreMneTips($("#WOM_produceTask_produceTask_makeTaskEdit_form #produceTask_productId_productCode"),'produceTask_productId_productCode_mneTipLabel','WOM_produceTask_produceTask_makeTaskEdit_form');
	   _del_callback_produceTask_productId_productCode();
      	$("[name='produceTask.formularId.code']").val("");
		$("[name='produceTask.formularId.id']").val("");
		$("[name='produceTask.formularId.name']").val("");
		$("[name='produceTask.workType.value']").val("");
		$("[name='produceTask.workType.id']").val("");
      	produceTask_formularId_code_delete();
	}


	//重写配方放大镜方法
	function _callback_produceTask_formularId_code(obj) {
		// 编辑页面中，当有值输入时，触发页面的resize事件，重新计算高度，避免换行时，页面变形
		try{
			$('body').trigger('resize');
			$('body').trigger('dialog.resize');
		} catch(e) {
			if(false) {throw e;}
		}
		if(produceTask_formularId_code_dialog) {
			produceTask_formularId_code_dialog.close();
		}
		CUI.clearMneTips('produceTask_formularId_code_mneTipLabel','WOM_produceTask_produceTask_otherTaskEdit_form');
		if(ProduceTaskActive_dg1505802969630Widget.getRowLength()!=0 &&  $("[name='produceTask.formularId.id']").val()!=obj[0].id){
			CUI.Dialog.confirm(  '更改配方将清空表体数据，是否继续？',  // 提示消息
				function(){
					var arr = 'produceTask.formularId.code'.split('.');
					obj[0] = foundation.common.getObject('WOM_produceTask_produceTask_otherTaskEdit_form',obj[0], arr[0]+'.'+arr[1], '/RM/formula/formula/formulaOtherRef.action');
					if(null != obj[0].id && obj[0].id != ""){
						CUI.commonFills('WOM_produceTask_produceTask_otherTaskEdit_form',(arr.length == 2) ? arr[0] : arr[0]+'.'+arr[1],obj[0]);
						//自定义字段回填
						CUI.commonFills_CP(obj[0].id,'/RM/formula/formula/formulaOtherRef.action');
					} else {
						CUI.clearInput('produceTask.formularId.code');
					}
						_callback_produceTask(obj);
				},//确定后事件
				 function(){}, // 取消后事件
					'提示',  // 标题
					70,
					400				
			)
		}else if(ProduceTaskActive_dg1505802969630Widget.getRowLength()==0 &&  $("[name='produceTask.formularId.id']").val()!=obj[0].id){
				var arr = 'produceTask.formularId.code'.split('.');
		obj[0] = foundation.common.getObject('WOM_produceTask_produceTask_otherTaskEdit_form',obj[0], arr[0]+'.'+arr[1], '/RM/formula/formula/formulaOtherRef.action');
		if(null != obj[0].id && obj[0].id != ""){
			CUI.commonFills('WOM_produceTask_produceTask_otherTaskEdit_form',(arr.length == 2) ? arr[0] : arr[0]+'.'+arr[1],obj[0]);
			//自定义字段回填
			CUI.commonFills_CP(obj[0].id,'/RM/formula/formula/formulaOtherRef.action');
		} else {
			CUI.clearInput('produceTask.formularId.code');
		}		
		_callback_produceTask(obj);
		}
		else{
				var arr = 'produceTask.formularId.code'.split('.');
		obj[0] = foundation.common.getObject('WOM_produceTask_produceTask_otherTaskEdit_form',obj[0], arr[0]+'.'+arr[1], '/RM/formula/formula/formulaOtherRef.action');
		if(null != obj[0].id && obj[0].id != ""){
			CUI.commonFills('WOM_produceTask_produceTask_otherTaskEdit_form',(arr.length == 2) ? arr[0] : arr[0]+'.'+arr[1],obj[0]);
			//自定义字段回填
			CUI.commonFills_CP(obj[0].id,'/RM/formula/formula/formulaOtherRef.action');
		} else {
			CUI.clearInput('produceTask.formularId.code');
		}
		}
	}

	//制造指令单产品过滤物料批号
	WOM.produceTask.produceTask.otherTaskEdit.query_dg1505802969630batchNumObj_batchText= function(){
		var product=ProduceTaskActive_dg1505802969630Widget.getCellValue(ProduceTaskActive_dg1505802969630Widget.getSelectedRow(),"productId.id");
		return "goodID="+product;
	}
/* CUSTOM CODE END */
		WOM.produceTask.produceTask.otherTaskEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_otherTaskEdit,onloadForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.produceTask.produceTask.otherTaskEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_otherTaskEdit,onsaveForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.produceTask.produceTask.otherTaskEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.produceTask.produceTask.otherTaskEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(produceTask.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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