<!-- RM_7.5.0.0/formula/formulaEdit -->
<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = formula.tableInfoId!>
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
<#assign tableObj = formula>
<#-- 命名空间 -->
<#assign editPageNs = "RM.formula.formula.formulaEdit">
<#-- 模型名称-->
<#assign modelName = "formula">
<#-- 视图编码-->
<#assign viewCode = "RM_7.5.0.0_formula_formulaEdit">
<#-- 实体编码-->
<#assign entity_code = "RM_7.5.0.0_formula">
<#-- 视图名称-->
<#assign viewName = "formulaEdit">
<#-- datagrid编码-->
<#assign datagridCode = "RM_formula_formula_formulaEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "Formula">
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
<#assign editFormId = "RM_formula_formula_formulaEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( formula.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "ec.print.controlPrint">
<#-- 批量？？ -->
<#assign isBatch = false>
<#assign payCloseAttention = false>
<#-- 自定义按钮 -->
<#assign operateButtons =[{"operateButtonId":"synBatch","permissionCode":"","ispermission":false,"isHide":false,"regionType":"BUTTON","funcname":"onclick='addBatch()'","namekey":"RM.buttonPropertyshowName.radion1508813533288"}] >
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	
		
	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('RM.viewtitle.randon1487138651371')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#RM_formula_formula_formulaEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('RM.formula.formula.formulaEdit');
			RM.formula.formula.formulaEdit.currentUser = ${userJson};
			RM.formula.formula.formulaEdit.currentStaff = ${staffJson};
			RM.formula.formula.formulaEdit.currentDepartment = ${deptJson};
			RM.formula.formula.formulaEdit.currentPosition = ${postJson};
			RM.formula.formula.formulaEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_formulaEdit,head,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="formula.mainMetarial.id,formula.product.id,formula.batchFormula.id,formula.formulaType.id,formula.id," onsubmitMethod="RM.formula.formula.formulaEdit.beforeSubmitMethod()" id="RM_formula_formula_formulaEdit_form" namespace="/RM/formula/formula/formulaEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_formula_Formula&_bapFieldPermissonModelName_=Formula&superEdit=${(superEdit!false)?string}" editPageNs="RM.formula.formula.formulaEdit" callback="RM.formula.formula.formulaEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_formula_formula_formulaEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="RM_formula_formula_formulaEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="formula.mainMetarial.id" value="${(formula.mainMetarial.id)!""}" originalvalue="${(formula.mainMetarial.id)!""}"/>
					<input type="hidden" name="formula.product.id" value="${(formula.product.id)!""}" originalvalue="${(formula.product.id)!""}"/>
					<input type="hidden" name="formula.batchFormula.id" value="${(formula.batchFormula.id)!""}" originalvalue="${(formula.batchFormula.id)!""}"/>
					<input type="hidden" name="formula.formulaType.id" value="${(formula.formulaType.id)!""}" originalvalue="${(formula.formulaType.id)!""}"/>
					<input type="hidden" name="formula.id" value="${(formula.id)!""}" originalvalue="${(formula.id)!""}"/>
		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('RM.tabname.radion1487242783079')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "RM_formula_formula_formulaEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=RM_7.5.0.0_formula', null, function(){
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
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488246312092')}" >${getText('RM.propertydisplayName.randon1488246312092')}</label>
				</td>
				
						<#assign formula_code_defaultValue  = ''>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="BAPCODE" name="formula.code" id="formula_code"  style=";" originalvalue="<#if !newObj || (formula.code)?has_content>${(formula.code?html)!}<#else>${formula_code_defaultValue!}</#if>" value="<#if !newObj || (formula.code)?has_content>${(formula.code?html)!}<#else>${formula_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487075823790')}" >${getText('RM.propertydisplayName.randon1487075823790')}</label>
				</td>
				
						<#assign formula_name_defaultValue  = ''>
							 							<#assign formula_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formula.name" id="formula_name"  style=";" originalvalue="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" value="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " onchange='nameChange()'/>
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertyshowName.randon1564731637500.flag')}" >${getText('RM.propertyshowName.randon1564731637500.flag')}</label>
				</td>
				
						<#assign formula_editions_defaultValue  = ''>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formula.editions" id="formula_editions"  style=";" originalvalue="<#if !newObj || (formula.editions)?has_content>${(formula.editions?html)!}<#else>${formula_editions_defaultValue!}</#if>" value="<#if !newObj || (formula.editions)?has_content>${(formula.editions?html)!}<#else>${formula_editions_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.radion141577264483332')}" >${getText('RM.propertydisplayName.radion141577264483332')}</label>
				</td>
				
						<#assign formula_product_productCode_defaultValue  = ''>
														<#assign formula_product_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${formula_product_productCode_defaultValue!}" conditionfunc="RM.formula.formula.formulaEdit._querycustomFunc('formula_product_productCode')"  value="${(formula.product.productCode)!}" displayFieldName="productCode" name="formula.product.productCode" id="formula_product_productCode" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_formulaEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname=";_callback_formula_product_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_formulaEdit_form',obj, 'formula.product', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('RM_formula_formula_formulaEdit_form', 'formula.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.radion1415772740737')}" >${getText('RM.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign formula_product_productName_defaultValue  = ''>
														<#assign formula_product_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.product.productName" id="formula_product_productName"  style=";" originalvalue="<#if !newObj || (formula.product.productName)?has_content>${(formula.product.productName?html)!}<#else>${formula_product_productName_defaultValue!}</#if>" value="<#if !newObj || (formula.product.productName)?has_content>${(formula.product.productName?html)!}<#else>${formula_product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076555894')}" >${getText('RM.propertydisplayName.randon1487076555894')}</label>
				</td>
				
						<#assign formula_produceType_defaultValue  = 'produceType/produceType1'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="typeOnChange()"  viewType="${viewType!}" deValue="${formula_produceType_defaultValue!}" formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.produceType.id" code="produceType" value="${(formula.produceType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="typeOnChange()"  viewType="${viewType!}"  formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.produceType.id" code="produceType" value="${(formula.produceType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076506987')}" >${getText('RM.propertydisplayName.randon1487076506987')}</label>
				</td>
				
						<#assign formula_usedFor_defaultValue  = 'usedFor/userFor4'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_usedFor_defaultValue!}" formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.usedFor.id" code="usedFor" value="${(formula.usedFor.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.usedFor.id" code="usedFor" value="${(formula.usedFor.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490578864812')}" >${getText('RM.propertydisplayName.randon1490578864812')}</label>
				</td>
				
						<#assign formula_setProcess_defaultValue  = 'formulaProperty/formulaProperty1'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_setProcess_defaultValue!}" formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.setProcess.id" code="formulaProperty" value="${(formula.setProcess.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.setProcess.id" code="formulaProperty" value="${(formula.setProcess.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1563258689755')}" >${getText('RM.propertydisplayName.randon1563258689755')}</label>
				</td>
				
						<#assign formula_yieldRange_defaultValue  = ''>
							 							<#assign formula_yieldRange_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formula.yieldRange" id="formula_yieldRange"  style=";" originalvalue="<#if !newObj || (formula.yieldRange)?has_content>${(formula.yieldRange?html)!}<#else>${formula_yieldRange_defaultValue!}</#if>" value="<#if !newObj || (formula.yieldRange)?has_content>${(formula.yieldRange?html)!}<#else>${formula_yieldRange_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490010654922')}" >${getText('RM.propertydisplayName.randon1490010654922')}</label>
				</td>
				
						<#assign formula_state_defaultValue  = 'RMstate/state1'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_state_defaultValue!}" formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.state.id" code="RMstate" value="${(formula.state.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.state.id" code="RMstate" value="${(formula.state.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1539745788276')}" >${getText('RM.propertydisplayName.randon1539745788276')}</label>
				</td>
				
						<#assign formula_feedingMode_defaultValue  = 'RMfixAmount/01'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_feedingMode_defaultValue!}" formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.feedingMode.id" code="RMfixAmount" value="${(formula.feedingMode.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.feedingMode.id" code="RMfixAmount" value="${(formula.feedingMode.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1539745697761')}" >${getText('RM.propertydisplayName.randon1539745697761')}</label>
				</td>
				
						<#assign formula_autoReportOnFinish_defaultValue  = 'autoReportOnFinish/03'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_autoReportOnFinish_defaultValue!}" formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.autoReportOnFinish.id" code="autoReportOnFinish" value="${(formula.autoReportOnFinish.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.autoReportOnFinish.id" code="autoReportOnFinish" value="${(formula.autoReportOnFinish.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1539745679956')}" >${getText('RM.propertydisplayName.randon1539745679956')}</label>
				</td>
				
						<#assign formula_advanceCharge_defaultValue  = ''>
							 							<#assign formula_advanceCharge_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.advanceCharge_check" originalvalue="<#if !newObj><#if (formula.advanceCharge)??>${(formula.advanceCharge!false)?string('true','false')}<#else>false</#if><#elseif formula_advanceCharge_defaultValue?has_content>${(formula_advanceCharge_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formula.advanceCharge)??>${(formula.advanceCharge!false)?string('true','false')}<#else>false</#if><#else>${(formula_advanceCharge_defaultValue!true)?string}</#if>" onclick='advanceChargeOnchange()' />
								
								<input property_type="BOOLEAN" type="hidden" name="formula.advanceCharge" originalvalue="<#if ((formula.advanceCharge)?? &&  formula.advanceCharge)||(formula_advanceCharge_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.advanceCharge)?? &&  formula.advanceCharge)||(formula_advanceCharge_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.advanceCharge_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.advanceCharge"]');
												CUI('input[name="formula.advanceCharge_check"]').each(function(){
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
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1539745761905')}" >${getText('RM.propertydisplayName.randon1539745761905')}</label>
				</td>
				
						<#assign formula_feedCondition_defaultValue  = ''>
							 							<#assign formula_feedCondition_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formula.feedCondition" id="formula_feedCondition"  style=";" originalvalue="<#if !newObj || (formula.feedCondition)?has_content>${(formula.feedCondition?html)!}<#else>${formula_feedCondition_defaultValue!}</#if>" value="<#if !newObj || (formula.feedCondition)?has_content>${(formula.feedCondition?html)!}<#else>${formula_feedCondition_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("RM_7.5.0.0_formula_Formula", "RM_7.5.0.0_formula_formulaEdit", 'EDIT')>
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
					<#assign elementName = 'formula' + "." + columnName>
					<#assign elementId = 'formula' + "_" + columnName>
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
						<#if formula[columnName]??>
							<#assign dateVal = (formula[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${formula[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${formula[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${formula[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${formula[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="RM_formula_formula_formulaEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;width:180px;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076858348')}" >${getText('RM.propertydisplayName.randon1487076858348')}</label>
				</td>
				
						<#assign formula_description_defaultValue  = ''>
							 							<#assign formula_description_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="formula_description" originalvalue="<#if !newObj || (formula.description)?has_content>${(formula.description?html)!}<#else>${formula_description_defaultValue?html}</#if>"  name="formula.description" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (formula.description)?has_content>${(formula.description)!}<#else>${formula_description_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
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
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon14975782324784345')}" >${getText('RM.propertydisplayName.randon14975782324784345')}</label>
				</td>
				
						<#assign formula_formulaType_name_defaultValue  = ''>
														<#assign formula_formulaType_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1497851445735')}" viewType="${viewType!}" deValue="${formula_formulaType_name_defaultValue!}" conditionfunc="RM.formula.formula.formulaEdit._querycustomFunc('formula_formulaType_name')"  value="${(formula.formulaType.name)!}" displayFieldName="name" name="formula.formulaType.name" id="formula_formulaType_name" type="other" url="/RM/formulaType/formulaType/typeRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_formulaEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_formulaType_typeRef"  onkeyupfuncname=";_callback_formula_formulaType_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.formulaType.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.formulaType.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_formulaEdit_form',obj, 'formula.formulaType', '/RM/formulaType/formulaType/typeRef.action');
												CUI.commonFills('RM_formula_formula_formulaEdit_form', 'formula.formulaType',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1493778012133')}" >${getText('RM.propertydisplayName.randon1493778012133')}</label>
				</td>
				
						<#assign formula_batchFormulaID_defaultValue  = ''>
							 							<#assign formula_batchFormulaID_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formula.batchFormulaID" id="formula_batchFormulaID"  style=";" originalvalue="<#if !newObj || (formula.batchFormulaID)?has_content>${(formula.batchFormulaID?html)!}<#else>${formula_batchFormulaID_defaultValue!}</#if>" value="<#if !newObj || (formula.batchFormulaID)?has_content>${(formula.batchFormulaID?html)!}<#else>${formula_batchFormulaID_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1546416592946')}" >${getText('RM.propertydisplayName.randon1546416592946')}</label>
				</td>
				
						<#assign formula_batchFormulaEdition_defaultValue  = ''>
							 							<#assign formula_batchFormulaEdition_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formula.batchFormulaEdition" id="formula_batchFormulaEdition"  style=";" originalvalue="<#if newObj&& !(formula.batchFormulaEdition)?has_content>${formula_batchFormulaEdition_defaultValue!}<#elseif (formula.batchFormulaEdition)?has_content>#{(formula.batchFormulaEdition)!; m6M6}</#if>" value="<#if newObj&& !(formula.batchFormulaEdition)?has_content>${formula_batchFormulaEdition_defaultValue!}<#elseif (formula.batchFormulaEdition)?has_content>#{(formula.batchFormulaEdition)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formula_batchFormulaEdition').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1546416592946")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487300944071')}" >${getText('RM.propertydisplayName.randon1487300944071')}</label>
				</td>
				
						<#assign formula_saveFlag_defaultValue  = 'false'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.saveFlag_check" originalvalue="<#if !newObj><#if (formula.saveFlag)??>${(formula.saveFlag!false)?string('true','false')}<#else>false</#if><#elseif formula_saveFlag_defaultValue?has_content>${(formula_saveFlag_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formula.saveFlag)??>${(formula.saveFlag!false)?string('true','false')}<#else>false</#if><#else>${(formula_saveFlag_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="formula.saveFlag" originalvalue="<#if ((formula.saveFlag)?? &&  formula.saveFlag)||(formula_saveFlag_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.saveFlag)?? &&  formula.saveFlag)||(formula_saveFlag_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.saveFlag_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.saveFlag"]');
												CUI('input[name="formula.saveFlag_check"]').each(function(){
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487297292230')}" >${getText('RM.propertydisplayName.randon1487297292230')}</label>
				</td>
				
						<#assign formula_processTableId_defaultValue  = ''>
							 							<#assign formula_processTableId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="formula.processTableId" id="formula_processTableId"  style=";" originalvalue="<#if !newObj || (formula.processTableId)?has_content>${(formula.processTableId?html)!}<#else>${formula_processTableId_defaultValue!}</#if>" value="<#if !newObj || (formula.processTableId)?has_content>${(formula.processTableId?html)!}<#else>${formula_processTableId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1508738820280')}" >${getText('RM.propertydisplayName.randon1508738820280')}</label>
				</td>
				
						<#assign formula_batchFormulaCode_defaultValue  = ''>
							 							<#assign formula_batchFormulaCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.batchFormulaCode" id="formula_batchFormulaCode"  style=";" originalvalue="<#if !newObj || (formula.batchFormulaCode)?has_content>${(formula.batchFormulaCode?html)!}<#else>${formula_batchFormulaCode_defaultValue!}</#if>" value="<#if !newObj || (formula.batchFormulaCode)?has_content>${(formula.batchFormulaCode?html)!}<#else>${formula_batchFormulaCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076796673')}" >${getText('RM.propertydisplayName.randon1487076796673')}</label>
				</td>
				
						<#assign formula_yieldFormula_defaultValue  = ''>
							 							<#assign formula_yieldFormula_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formula.yieldFormula" id="formula_yieldFormula"  style=";" originalvalue="<#if !newObj || (formula.yieldFormula)?has_content>${(formula.yieldFormula?html)!}<#else>${formula_yieldFormula_defaultValue!}</#if>" value="<#if !newObj || (formula.yieldFormula)?has_content>${(formula.yieldFormula?html)!}<#else>${formula_yieldFormula_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td nullable=false class="edit-table-symbol"  colspan="3" align="left" style="text-align: left;color:#B30303;;" >
							<label style="width:100%;padding-left:5px;;" value="${getText('公式需按一定格式填写：如x/ny,其中n为数字， x代表产量，y代表主原料用量')}" >${getText('公式需按一定格式填写：如x/ny,其中n为数字， x代表产量，y代表主原料用量')}</label>
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490150691044')}" >${getText('RM.propertydisplayName.randon1490150691044')}</label>
				</td>
				
						<#assign formula_longTime_defaultValue  = ''>
							 							<#assign formula_longTime_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formula.longTime" id="formula_longTime"  style=";" originalvalue="<#if newObj&& !(formula.longTime)?has_content>${formula_longTime_defaultValue!}<#elseif (formula.longTime)?has_content>#{(formula.longTime)!; m2M2}</#if>" value="<#if newObj&& !(formula.longTime)?has_content>${formula_longTime_defaultValue!}<#elseif (formula.longTime)?has_content>#{(formula.longTime)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formula_longTime').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1490150691044")}')}");
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.radion141577264483323232332')}" >${getText('RM.propertydisplayName.radion141577264483323232332')}</label>
				</td>
				
						<#assign formula_mainMetarial_productCode_defaultValue  = ''>
														<#assign formula_mainMetarial_productCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${formula_mainMetarial_productCode_defaultValue!}" conditionfunc="RM.formula.formula.formulaEdit._querycustomFunc('formula_mainMetarial_productCode')"  value="${(formula.mainMetarial.productCode)!}" displayFieldName="productCode" name="formula.mainMetarial.productCode" id="formula_mainMetarial_productCode" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_formulaEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname=";_callback_formula_mainMetarial_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.mainMetarial.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.mainMetarial.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_formulaEdit_form',obj, 'formula.mainMetarial', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('RM_formula_formula_formulaEdit_form', 'formula.mainMetarial',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.radion1415772740737323')}" >${getText('RM.propertydisplayName.radion1415772740737323')}</label>
				</td>
				
						<#assign formula_mainMetarial_productName_defaultValue  = ''>
														<#assign formula_mainMetarial_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.mainMetarial.productName" id="formula_mainMetarial_productName"  style=";" originalvalue="<#if !newObj || (formula.mainMetarial.productName)?has_content>${(formula.mainMetarial.productName?html)!}<#else>${formula_mainMetarial_productName_defaultValue!}</#if>" value="<#if !newObj || (formula.mainMetarial.productName)?has_content>${(formula.mainMetarial.productName?html)!}<#else>${formula_mainMetarial_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490065103051')}" >${getText('RM.propertydisplayName.randon1490065103051')}</label>
				</td>
				
						<#assign formula_theoreYield_defaultValue  = ''>
							 							<#assign formula_theoreYield_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="right" style="text-align: right;;" >
					
							
							<div class="fix-input">
									<input name="formula.theoreYield" id="formula_theoreYield"  style=";" originalvalue="<#if newObj&& !(formula.theoreYield)?has_content>${formula_theoreYield_defaultValue!}<#elseif (formula.theoreYield)?has_content>#{(formula.theoreYield)!; m2M2}</#if>" value="<#if newObj&& !(formula.theoreYield)?has_content>${formula_theoreYield_defaultValue!}<#elseif (formula.theoreYield)?has_content>#{(formula.theoreYield)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" onblur='check()'/>
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formula_theoreYield').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1490065103051")}')}");
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490150767011')}" >${getText('RM.propertydisplayName.randon1490150767011')}</label>
				</td>
				
						<#assign formula_supportEbr_defaultValue  = ''>
							 							<#assign formula_supportEbr_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.supportEbr_check" originalvalue="<#if !newObj><#if (formula.supportEbr)??>${(formula.supportEbr!false)?string('true','false')}<#else>false</#if><#elseif formula_supportEbr_defaultValue?has_content>${(formula_supportEbr_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formula.supportEbr)??>${(formula.supportEbr!false)?string('true','false')}<#else>false</#if><#else>${(formula_supportEbr_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="formula.supportEbr" originalvalue="<#if ((formula.supportEbr)?? &&  formula.supportEbr)||(formula_supportEbr_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.supportEbr)?? &&  formula.supportEbr)||(formula_supportEbr_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.supportEbr_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.supportEbr"]');
												CUI('input[name="formula.supportEbr_check"]').each(function(){
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076528539231111')}" >${getText('RM.propertydisplayName.randon1487076528539231111')}</label>
				</td>
				
						<#assign formula_isForProduct_defaultValue  = 'true'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.isForProduct_check" originalvalue="<#if !newObj><#if (formula.isForProduct)??>${(formula.isForProduct!false)?string('true','false')}<#else>false</#if><#elseif formula_isForProduct_defaultValue?has_content>${(formula_isForProduct_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formula.isForProduct)??>${(formula.isForProduct!false)?string('true','false')}<#else>false</#if><#else>${(formula_isForProduct_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="formula.isForProduct" originalvalue="<#if ((formula.isForProduct)?? &&  formula.isForProduct)||(formula_isForProduct_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.isForProduct)?? &&  formula.isForProduct)||(formula_isForProduct_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.isForProduct_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.isForProduct"]');
												CUI('input[name="formula.isForProduct_check"]').each(function(){
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
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1546051384996123')}" >${getText('RM.propertydisplayName.randon1546051384996123')}</label>
				</td>
				
						<#assign formula_batchFormula_batchFormulaId_defaultValue  = ''>
														<#assign formula_batchFormula_batchFormulaId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1546052079715')}" viewType="${viewType!}" deValue="${formula_batchFormula_batchFormulaId_defaultValue!}" conditionfunc="RM.formula.formula.formulaEdit._querycustomFunc('formula_batchFormula_batchFormulaId')"  value="${(formula.batchFormula.batchFormulaId)!}" displayFieldName="batchFormulaId" name="formula.batchFormula.batchFormulaId" id="formula_batchFormula_batchFormulaId" type="other" url="/RM/batchFormula/batchFormulaMain/batchFormulaRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_formulaEdit_form" editCustomCallback="batchFormulaCustomCallBack(obj);" refViewCode="RM_7.5.0.0_batchFormula_batchFormulaRef"  onkeyupfuncname="batchFormulaCustomCallBack(obj);_callback_formula_batchFormula_batchFormulaId(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.batchFormula.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.batchFormula.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_formulaEdit_form',obj, 'formula.batchFormula', '/RM/batchFormula/batchFormulaMain/batchFormulaRef.action');
												CUI.commonFills('RM_formula_formula_formulaEdit_form', 'formula.batchFormula',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1508738820280')}" >${getText('RM.propertydisplayName.randon1508738820280')}</label>
				</td>
				
						<#assign formula_batchFormula_formulaCode_defaultValue  = ''>
														<#assign formula_batchFormula_formulaCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.batchFormula.formulaCode" id="formula_batchFormula_formulaCode"  style=";" originalvalue="<#if !newObj || (formula.batchFormula.formulaCode)?has_content>${(formula.batchFormula.formulaCode?html)!}<#else>${formula_batchFormula_formulaCode_defaultValue!}</#if>" value="<#if !newObj || (formula.batchFormula.formulaCode)?has_content>${(formula.batchFormula.formulaCode?html)!}<#else>${formula_batchFormula_formulaCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1546416592946')}" >${getText('RM.propertydisplayName.randon1546416592946')}</label>
				</td>
				
						<#assign formula_batchFormula_edition_defaultValue  = ''>
														<#assign formula_batchFormula_edition_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="INTEGER" name="formula.batchFormula.edition" id="formula_batchFormula_edition"  style=";" originalvalue="<#if !newObj || (formula.batchFormula.edition)?has_content>${(formula.batchFormula.edition?html)!}<#else>${formula_batchFormula_edition_defaultValue!}</#if>" value="<#if !newObj || (formula.batchFormula.edition)?has_content>${(formula.batchFormula.edition?html)!}<#else>${formula_batchFormula_edition_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076619868')}" >${getText('RM.propertydisplayName.randon1487076619868')}</label>
				</td>
				
						<#assign formula_batchContral_defaultValue  = 'false'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.batchContral_check" originalvalue="<#if !newObj><#if (formula.batchContral)??>${(formula.batchContral!false)?string('true','false')}<#else>false</#if><#elseif formula_batchContral_defaultValue?has_content>${(formula_batchContral_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formula.batchContral)??>${(formula.batchContral!false)?string('true','false')}<#else>false</#if><#else>${(formula_batchContral_defaultValue!true)?string}</#if>" onclick='checkbatch()' disabled=true/>
								
								<input property_type="BOOLEAN" type="hidden" name="formula.batchContral" originalvalue="<#if ((formula.batchContral)?? &&  formula.batchContral)||(formula_batchContral_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.batchContral)?? &&  formula.batchContral)||(formula_batchContral_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.batchContral_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.batchContral"]');
												CUI('input[name="formula.batchContral_check"]').each(function(){
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1504141732718')}" >${getText('RM.propertydisplayName.randon1504141732718')}</label>
				</td>
				
						<#assign formula_interfaceUrl_defaultValue  = ''>
							 							<#assign formula_interfaceUrl_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_interfaceUrl_defaultValue!}" formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.interfaceUrl.id" code="serviceUrl" value="${(formula.interfaceUrl.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.interfaceUrl.id" code="serviceUrl" value="${(formula.interfaceUrl.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1539746774380')}" >${getText('RM.propertydisplayName.randon1539746774380')}</label>
				</td>
				
						<#assign formula_batchOverOnFinish_defaultValue  = ''>
							 							<#assign formula_batchOverOnFinish_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.batchOverOnFinish_check" originalvalue="<#if !newObj><#if (formula.batchOverOnFinish)??>${(formula.batchOverOnFinish!false)?string('true','false')}<#else>false</#if><#elseif formula_batchOverOnFinish_defaultValue?has_content>${(formula_batchOverOnFinish_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formula.batchOverOnFinish)??>${(formula.batchOverOnFinish!false)?string('true','false')}<#else>false</#if><#else>${(formula_batchOverOnFinish_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="formula.batchOverOnFinish" originalvalue="<#if ((formula.batchOverOnFinish)?? &&  formula.batchOverOnFinish)||(formula_batchOverOnFinish_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.batchOverOnFinish)?? &&  formula.batchOverOnFinish)||(formula_batchOverOnFinish_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.batchOverOnFinish_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.batchOverOnFinish"]');
												CUI('input[name="formula.batchOverOnFinish_check"]').each(function(){
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
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487139592239')}" >${getText('RM.propertydisplayName.randon1487139592239')}</label>
				</td>
				
						<#assign formula_edition_defaultValue  = ''>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formula.edition" id="formula_edition"  style=";" originalvalue="<#if newObj&& !(formula.edition)?has_content>${formula_edition_defaultValue!}<#elseif (formula.edition)?has_content>#{(formula.edition)!; m2M2}</#if>" value="<#if newObj&& !(formula.edition)?has_content>${formula_edition_defaultValue!}<#elseif (formula.edition)?has_content>#{(formula.edition)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formula_edition').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487139592239")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
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
								<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaBom", "RM_7.5.0.0_formula_formulaEditdg1503551511011", "DATAGRID", "formulaBom")>
								<#list customPropViewMappings as cpvm>
									<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
										<#assign cpObjHideKey = cpObjHideKey + ",'" + cpvm.propertyLayRec + "'">
									</#if>
									<#if cpvm.propertyLayRec?index_of('.') lt 0 && cpvm.relatedKey?has_content>
										<#assign cpvmInfo = cpvmInfo + ',' + cpvm.relatedKey + "||" + cpvm.propertyLayRec>
										<#if cpvm.property.type == 'OBJECT'>
											<#assign cpvmInfo = cpvmInfo + "||" + cpvm.property.code>	
										</#if>
									</#if>
								</#list>
			
							<script type="text/javascript">
								function FormulaBom_dg1503551511011_processActiveSet(event)
																{
	if($("input[name='formula.product.productCode']").val()==""){
		workbenchErrorBarWidget.showMessage("${getText('RM.formlula.randon741852963')}");
		return false;
	}
	//物料清单的行数
	var length=FormulaBom_dg1503551511011Widget.getRowLength();
	//如果物料清单的数量大于0，弹出提示是否覆盖之前的数据
	if(Number(length)>0){
		CUI.Dialog.confirm(  
			'${getText("RM.formula.randon14769606212342")}',  // 提示消息  
			function(){ 
				var formulaId=$('#id').val();
				var url = "/RM/formula/formulaBom/autoProduce.action?formulaId="+formulaId;
				var isEBR="";
				$.ajax({
					url : url,
					type : 'get',
					async : false,
					success : function(msg) {
						if(msg!=null){
							isEBR = msg.result;
							//workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
							FormulaBom_dg1503551511011Widget._DT.setRequestDataUrl(FormulaBom_dg1503551511011Widget._DT.requestUrl);  
						}
					}
				});			
			},// 确定后事件  
			function(){}, // 取消后事件  
			'${getText("RM.formula.randon14769606212312")}',  // 标题  
			0,  // 高度, 可选, 默认70  
			400  // 宽度, 可选, 默认400  
		); 
	}else{
		var formulaId=$('#id').val();
		var url = "/RM/formula/formulaBom/autoProduce.action?formulaId="+formulaId;
		var isEBR="";
		$.ajax({
			url : url,
			type : 'get',
			async : false,
			success : function(msg) {
				if(msg!=null){
					isEBR = msg.result;
					//workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
					FormulaBom_dg1503551511011Widget._DT.setRequestDataUrl(FormulaBom_dg1503551511011Widget._DT.requestUrl);  
				}
			}
		});		
	}
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formula/data-dg1503551511011.action?formula.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_formulaEditdg1503551511011">
			<#else>
				<#assign dUrl="/RM/formula/formula/data-dg1503551511011.action?formula.id=${(formula.id)!-1}&datagridCode=RM_7.5.0.0_formula_formulaEditdg1503551511011">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion148885407198123')}\",handler:function(event){FormulaBom_dg1503551511011_processActiveSet(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion148885407198123')}\",handler:function(event){FormulaBom_dg1503551511011_processActiveSet(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaBom_dg1503551511011" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1503551511011_id" value="FormulaBom_dg1503551511011" />
			
			<input type="hidden" id="dg1503551511011_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487243065955')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formula/data-dg1503551511011.action?operateType=export&datagridCode=RM_7.5.0.0_formula_formulaEditdg1503551511011"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaBom_dg1503551511011" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FormulaBom_dg1503551511011" viewType="${viewType}" renderOverEvent="dg1503551511011RenderOverEvent" route="${routeFlag}" formId="RM_formula_formula_formulaEdit_form" noPermissionKeys="property,productId.productCode,productId.productName,productId.productBaseUnit.name,isMixQuality,unitQuality,minQuality,maxQuality" modelCode="RM_7.5.0.0_formula_FormulaBom" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1503551511011" dtPage="dgPage"  hidekeyPrefix="dg1503551511011" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName','productId.id','productId.productBaseUnit.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1503551511011PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('RM.dataGriddataGridName.radion15057043689284565')}" activexButton="RM.buttonPropertyshowName.radion148885407198123,processActiveSet,edit" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign property_displayDefaultType=''>
								<#assign property_defaultValue=''>
										<#assign property_defaultValue=''>
										 									<@systemCodeColumn code="RMproperty" textalign="center" defaultValue="${(property_defaultValue!)?string}" key="property.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1490010423584')}" width=100   />
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

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formula.formulaEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formula.formulaEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formula.formulaEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" width=100 showFormatFunc=""  />
							<#assign isMixQuality_displayDefaultType=''>
								<#assign isMixQuality_defaultValue=''>
										<#assign isMixQuality_defaultValue=''>
										  
									<@datacolumn key="isMixQuality"        showFormat="CHECKBOX" defaultValue="${(isMixQuality_defaultValue!)?string}" defaultDisplay="${(isMixQuality_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852241781')}" width=80 showFormatFunc=""  />
							<#assign unitQuality_displayDefaultType=''>
								<#assign unitQuality_defaultValue=''>
										<#assign unitQuality_defaultValue=''>
										  
									<@datacolumn key="unitQuality"        showFormat="TEXT" defaultValue="${(unitQuality_defaultValue!)?string}" defaultDisplay="${(unitQuality_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487243139091')}" width=80 showFormatFunc=""  />
							<#assign minQuality_displayDefaultType=''>
								<#assign minQuality_defaultValue=''>
										<#assign minQuality_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" onchange="FormulaBom_dg1503551511011Widget.evalCustomFunction(nRow,sFieldName,'minQuaChange(nRow,sFieldName)')" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852437576')}" width=80 showFormatFunc=""  />
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" onchange="FormulaBom_dg1503551511011Widget.evalCustomFunction(nRow,sFieldName,'maxQuaChange(nRow,sFieldName)')" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852460357')}" width=80 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaBom", "RM_7.5.0.0_formula_formulaEditdg1503551511011", "DATAGRID", "formulaBom")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = true>
								<#if cpEditable && cpvmKey?index_of('.') gt -1>
									<#assign cpEditable = false>
								</#if>
								<#if cpvm.readonly!false>
									<#assign cpEditable = false>
								</#if>
								<#assign cpvmNotNull = false>
								<#if cpEditable && !(cpvm.nullable!true)>
									<#assign cpvmNotNull = true>
								</#if>
								<#assign cpDecimal = ''>
								<#if cpvm.property.type == 'DECIMAL'>
									<#assign cpDecimal = (cpvm.property.decimalNum!0)>
									<#if cpvm.precision??>
										<#assign cpDecimal =cpvm.precision!>
									</#if>
								</#if>
								<#assign cpvmWidth = 100>
								<#if cpvmColumnType == 'DATETIME'>
									<#assign cpvmWidth = 130>
								</#if>
								<#if cpvm.fieldType == 'TEXTAREA'>
									<#assign cpvmWidth = 200>
								</#if>
								
								<#if cpvmColumnType == 'TEXT'>
									<#assign cpvmType = 'textfield'>
								<#elseif cpvmColumnType == 'DATETIME' || cpvmColumnType == 'SYSTEMCODE' || cpvmColumnType == 'OBJECT'>
									<#assign cpvmType = cpvm.fieldType?lower_case>
								</#if>
								
								<#if cpvmColumnType == 'SYSTEMCODE'>
									<#assign cpvmSeniorSystemCode = false>
									<#if cpvm.property.seniorSystemCode?? && cpvm.property.seniorSystemCode>
										<#assign cpvmSeniorSystemCode = true>
									</#if>
									<#assign systemEntityCode = cpvm.property.fillcontentMap.fillContent>
									<#assign systemEntity = getSystemCode(systemEntityCode)>
									<#assign systemCodelistType = systemEntity.listType>
									<#if cpvm.property.multable?? && cpvm.property.multable && systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true isMultTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif cpvm.property.multable?? && cpvm.property.multable>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isMultable=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/multiCodeList.action?systemEntityCode=${systemEntityCode}"/>
									<#elseif systemCodelistType?? && systemCodelistType == 'TREE'>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode isTree=true systemEntityCode=systemEntityCode systemCodeUrl="/foundation/systemCode/singleCodeTree.action?systemEntityCode=${systemEntityCode}"/>
									<#else>
										<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey isCustom=true editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode/>
									</#if>
								<#else>
									<#assign viewUrl = ''>
									<#assign viewTitle = ''>
									<#assign viewCode = ''>
									<#assign selectCompName = ''>
									<#assign isObjCustomProp = false>
									<#assign objCustomPropNames = ''>
									<#if cpvmColumnType == 'OBJECT'>
										<#if cpvm.refView??>
											<#assign viewUrl = (cpvm.refView.url)!''>
											<#assign viewTitle = (cpvm.refView.title)!''>
											<#assign viewCode = (cpvm.refView.code)!''>
											<#assign selectCompName = 'RM.formula.formula.formulaEdit'>
										</#if>
										<#assign pkName = ''>
										<#assign mainDisplayName = ''>
										<#list cpvm.property.associatedProperty.model.properties as p>
											<#if !pkName?has_content && p.isPk?? && p.isPk>
												<#assign pkName = p.name>
											</#if>
											<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
												<#assign mainDisplayName = p.name>
											</#if>
										</#list>
										<#assign cpvmKey = cpvmKey + 'MainDisplay'>
										<#assign isObjCustomProp = true>
										<#assign objCustomPropNames = (mainDisplayName!'name') + ',' + (pkName!'id')> 
									</#if>
									
									<#if cpvm.align??>
										<#assign columnAlign = cpvm.align >						
									<#elseif (cpvm.property.type=='INTEGER' || cpvm.property.type=='DECIMAL')>
										<#assign columnAlign = 'right'>
									<#else>
										<#assign columnAlign = 'left' >
									</#if>
						
									<@datacolumn key=cpvmKey width=cpvmWidth showFormat="${cpvm.format!'TEXT'}" decimal="${cpDecimal}" editable=cpEditable type=cpvmType showType="${cpvm.fieldType}" notnull=cpvmNotNull callbackname="" selectCompName=selectCompName viewUrl="${viewUrl!}" viewCode="${viewCode!}" crossCompany=false viewTitle="${getText('${viewTitle!}')}" label="${getText('${cpvm.displayName}')}" isObjCustomProp=isObjCustomProp objCustomPropNames="${objCustomPropNames}" textalign="${columnAlign}" />
								</#if>
							</#list>
			
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
				function FormulaBom_dg1503551511011_check_datagridvalid(){
					//
					var errorObj =FormulaBom_dg1503551511011Widget._DT.testData();
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
				
				function savedg1503551511011DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaBom_dg1503551511011Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaBom_dg1503551511011Widget') > -1) {
						FormulaBom_dg1503551511011Widget.setAllRowEdited();
					}
					var json = FormulaBom_dg1503551511011Widget.parseEditedData();
					$('input[name="dg1503551511011ListJson"]').remove();
					$('input[name="dgLists[\'dg1503551511011\']"]').remove();
					$('input[name="dg1503551511011ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1503551511011\']">').val(json).appendTo($('#RM_formula_formula_formulaEdit_form'));
					$('<input type="hidden" name="dg1503551511011ModelCode">').val('RM_7.5.0.0_formula_FormulaBom').appendTo($('#RM_formula_formula_formulaEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1503551511011ListJson">').val(json).appendTo($('#RM_formula_formula_formulaEdit_form'));
				}
				function DT_FormulaBom_dg1503551511011_deldatagrid(){
					var deleteRows = FormulaBom_dg1503551511011Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1503551511011DeletedIds").length>0){
							$("#dg1503551511011DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1503551511011DeletedIds" name="dgDeletedIds[\'dg1503551511011\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1503551511011DeletedIds['+CUI('input[name^="dg1503551511011DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaEdit_form'));
					});
					return deleteRows;
				}
				function DT_FormulaBom_dg1503551511011_delTreeNodes(){
					var deleteRows = FormulaBom_dg1503551511011Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1503551511011DeletedIds").length>0){
							$("#dg1503551511011DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1503551511011DeletedIds" name="dgDeletedIds[\'dg1503551511011\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1503551511011DeletedIds['+CUI('input[name^="dg1503551511011DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formula_formulaEdit_datagrids');
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
							if(datagrids[0][i] == 'FormulaBom_dg1503551511011') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'FormulaBom_dg1503551511011';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'FormulaBom_dg1503551511011';
					}
					$('body').data('RM_formula_formula_formulaEdit_datagrids', datagrids);
				});
				
				var FormulaBom_dg1503551511011_importDialog = null;
				function FormulaBom_dg1503551511011_showImportDialog(){
					try{
						if(FormulaBom_dg1503551511011_importDialog!=null&&FormulaBom_dg1503551511011_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formula/initImport.action?datagridCode=RM_7.5.0.0_formula_formulaEditdg1503551511011&tid=${id!}&datagridName=dg1503551511011";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_formulaEditdg1503551511011_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						FormulaBom_dg1503551511011_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaBom_dg1503551511011"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaBom_dg1503551511011_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaBom_dg1503551511011_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaBom_dg1503551511011_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaBom_dg1503551511011_downLoadFile(){
					var url = "/RM/formula/formula/downLoad.action?datagridCode=RM_7.5.0.0_formula_formulaEditdg1503551511011&templateRelatedModelCode=RM_7.5.0.0_formula_formulaEditdg1503551511011&downloadType=template&fileName=dg1503551511011";
					window.open(url,"","");
				}
				function dg1503551511011RenderOverEvent(){
					if($("#id").val()==""){
	$("#FormulaBom_dg1503551511011 .paginatorbar-operatebar").hide()
}
				}
				function dg1503551511011PageInitMethod(nTabIndex){
					RM.formula.formula.formulaEdit.initSize(nTabIndex);
					$("#FormulaBom_dg1503551511011 .paginatorbar-operatebar span:eq(0)").attr('class','buttonbar-button cui-btn-xtdbd');
				}
			</script>
			
			

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
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
			
							<script type="text/javascript">
								function FormulaProcess_dg1487242802285_processAdd(event)
																{
 if($("[name='formula.batchContral']").val()=='true'){
		CUI.Dialog.alert("${getText('RM.formula.cannotchange')}");
		return false;
	}
 randgeEdit = new CUI.Dialog({
  title:"工序",
  formId: "RM_formula_formulaProcess_processEdit_form",
  type:2,
  modal:true,
  url:'/RM/formula/formulaProcess/processEdit.action?entityCode=RM_7.5.0.0_formula',
  buttons:[
    { name:"${getText("common.button.saveadd")}",
    handler:function(){
    $('input[name="formula.saveFlag"]').val(true);
    CUI('#RM_formula_formulaProcess_processEdit_form').submit();
    }
    },
      { name:"${getText("foundation.common.save")}",
    handler:function(){
    $('input[name="formula.saveFlag"]').val(false);
    CUI('#RM_formula_formulaProcess_processEdit_form').submit();
    }
    },
    { name:"${getText("foundation.common.closed")}",
     handler:function(){this.close()}
    }
  ]
 });
randgeEdit.show();

}
							</script>
							<script type="text/javascript">
								function FormulaProcess_dg1487242802285_delRow(event)
																{
	//如果没有选中，则提示先选中
	if($("[name='formula.batchContral']").val()=='true'){
		CUI.Dialog.alert("${getText('RM.formula.cannotchange')}");
	}else if(FormulaProcess_dg1487242802285Widget.getSelectedRow()==null){
		CUI.Dialog.alert("${getText('ec.common.checkselected')}");
	}else{
		//checkTrue为全局变量，初始值为true,在点击确定时赋值为false，点击取消时赋值为true
					    CUI.Dialog.confirm(  
   							'${getText("RM.processDel.randon1231231234")}',  // 提示消息  
   								function(){ 
            										processDel();
   								     },// 确定后事件  
                       function(){processDelete=true;}, // 取消后事件  
                                    '${getText("RM.processDel.randon14769606223242")}',  // 标题  
   							        70,  // 高度, 可选, 默认70  
                         400  // 宽度, 可选, 默认400  
                    ); 
              return false;
	}
  				  
  }
							</script>
							<script type="text/javascript">
								function FormulaProcess_dg1487242802285_processActiveSet(event)
																{
	var row=FormulaProcess_dg1487242802285Widget.getSelectedRow();
	if(row==undefined){
		workbenchErrorBarWidget.showMessage("${getText('RM.custom.randon1551921770189')}","f");
	}
	else{
		 var processId=FormulaProcess_dg1487242802285Widget.getCellValue(FormulaProcess_dg1487242802285Widget.getSelectedRow(),'id');
 var tableInfoId=$('#processTableId').val();
 var formulaId=$('#id').val();
	url = "/RM/formula/formulaProcess/processActiveEdit.action?__pc__=${(Parameters.__pc__)!}&workFlowMenuCode=RM_7.5.0.0_formula_formulaProcess_processActiveEdit&openType=page&id="+processId+"&tableInfoId="+tableInfoId+"&formulaId="+formulaId;
 
  if(url!=""){
   openFullScreen(url);
}
	}

}
							</script>
							<script type="text/javascript">
								function FormulaProcess_dg1487242802285_otherActive(event)
																{
	var row=FormulaProcess_dg1487242802285Widget.getSelectedRow();
	if(row==undefined){
		workbenchErrorBarWidget.showMessage("${getText('RM.custom.randon1551921770189')}","f");
	}
	else{
		var processId=FormulaProcess_dg1487242802285Widget.getCellValue(FormulaProcess_dg1487242802285Widget.getSelectedRow(),'id');
		var tableInfoId=$('#processTableId').val();
		var formulaId=$('#id').val();
		otherEdit = new CUI.Dialog({
			title:"其他活动",
  			formId: "RM_formula_formulaProcess_otherProcessEdit_form",
 			type:5,
			modal:true,
     		url:'/RM/formula/formulaProcess/otherProcessEdit.action?entityCode=RM_7.5.0.0_formula&id='+processId,
			buttons:[
            { 	name:"${getText("foundation.common.save")}",
                handler:function(){
					$('input[name="formula.saveFlag"]').val(false);
					var length = FormulaProcessActive_dg1509082857052Widget.getRowLength();
					for(var i = 0 ; i < length ; i++){
						if(FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"name")==""  || FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"name")==null){
							RM_formula_formulaProcess_otherProcessEdit_formDialogErrorBarWidget.showMessage('第'+(i+1)+'行，活动名称不允许为空','f');
							return false;
						}
						if(FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"activeType.id")==""){
							RM_formula_formulaProcess_otherProcessEdit_formDialogErrorBarWidget.showMessage('第'+(i+1)+'行，类型不允许为空','f');
							return false;
						}else if (FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"activeType.id")=="activeType/activeType3"){
						//投料
							if(FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"isAgile")==true || FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"isAgile")=='true'){
								if(FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"product.id")!=""){
									RM_formula_formulaProcess_otherProcessEdit_formDialogErrorBarWidget.showMessage('灵活投料时，物料不能被填写','f');
									FormulaProcessActive_dg1509082857052Widget.setCellValue( i, "product.productCode","");
									FormulaProcessActive_dg1509082857052Widget.setCellValue( i, "product.productName","");
									FormulaProcessActive_dg1509082857052Widget.setCellValue( i, "product.id","");
									return false;
								}
							}else{
								if(FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"product.id")==""){
									RM_formula_formulaProcess_otherProcessEdit_formDialogErrorBarWidget.showMessage('第'+(i+1)+'行，活动类型为投料,灵活投料不勾选时，物料必须填写','f');
									return false;
								}
							}
						}else if (FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"activeType.id")=="activeType/activeType5"){
						//检验
							if(FormulaProcessActive_dg1509082857052Widget.getCellValue(i,"qualityStandard.name")==""){
								RM_formula_formulaProcess_otherProcessEdit_formDialogErrorBarWidget.showMessage('第'+(i+1)+'行，活动类型为检验时，质量标准必须填写','f');
								return false;
							}
						}
					}
					CUI('#RM_formula_formulaProcess_otherProcessEdit_form').submit();
					RM_formula_formulaProcess_otherProcessEdit_formDialogErrorBarWidget.showMessage('保存成功','s');
					setTimeout(function(){
						otherEdit.close();
					},1000);
				}
			},
			{ 	name:"${getText("foundation.common.closed")}",
                handler:function(){this.close()}
			}
			]
         });
	
		otherEdit.show();
	}
}
							</script>
							<script type="text/javascript">
								function FormulaProcess_dg1487242802285_formulaActiveRef(event)
																{
    openProcessRef();
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formula/data-dg1487242802285.action?formula.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_formulaEditdg1487242802285">
			<#else>
				<#assign dUrl="/RM/formula/formula/data-dg1487242802285.action?formula.id=${(formula.id)!-1}&datagridCode=RM_7.5.0.0_formula_formulaEditdg1487242802285">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1487242824199')}\",handler:function(event){FormulaProcess_dg1487242802285_processAdd(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion14872955636562')}\",handler:function(event){FormulaProcess_dg1487242802285_delRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion148755702326911')}\",handler:function(event){FormulaProcess_dg1487242802285_processActiveSet(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1509070630737')}\",handler:function(event){FormulaProcess_dg1487242802285_otherActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1540176006590')}\",handler:function(event){FormulaProcess_dg1487242802285_formulaActiveRef(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1487242824199')}\",handler:function(event){FormulaProcess_dg1487242802285_processAdd(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion14872955636562')}\",handler:function(event){FormulaProcess_dg1487242802285_delRow(event)},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion148755702326911')}\",handler:function(event){FormulaProcess_dg1487242802285_processActiveSet(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1509070630737')}\",handler:function(event){FormulaProcess_dg1487242802285_otherActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1540176006590')}\",handler:function(event){FormulaProcess_dg1487242802285_formulaActiveRef(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaProcess_dg1487242802285" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1487242802285_id" value="FormulaProcess_dg1487242802285" />
			
			<input type="hidden" id="dg1487242802285_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487140927408')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formula/data-dg1487242802285.action?operateType=export&datagridCode=RM_7.5.0.0_formula_formulaEditdg1487242802285"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaProcess_dg1487242802285" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FormulaProcess_dg1487242802285" viewType="${viewType}" renderOverEvent="dg1487242802285RenderOverEvent" route="${routeFlag}" formId="RM_formula_formula_formulaEdit_form" noPermissionKeys="processCode,name,processType.name,longTime,isFirstProcess,isLastProcess,cmdType,procSort,meno,batchUnitID,formulaId.id,persistMode,transTime" modelCode="RM_7.5.0.0_formula_FormulaProcess" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1487242802285" dtPage="dgPage"  hidekeyPrefix="dg1487242802285" hidekey="['id','version','processType.id','processType.name','formulaId.id','formulaId.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=1 pageInitMethod="dg1487242802285PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('RM.dataGriddataGridName.radion1488242183783')}" activexButton="RM.buttonPropertyshowName.radion1487242824199,processAdd,add;RM.buttonPropertyshowName.radion14872955636562,delRow,del;RM.buttonPropertyshowName.radion148755702326911,processActiveSet,edit;RM.buttonPropertyshowName.radion1509070630737,otherActive,add;RM.buttonPropertyshowName.radion1540176006590,formulaActiveRef,add" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign processCode_displayDefaultType=''>
								<#assign processCode_defaultValue=''>
										<#assign processCode_defaultValue=''>
										  
									<@datacolumn key="processCode"        showFormat="TEXT" defaultValue="${(processCode_defaultValue!)?string}" defaultDisplay="${(processCode_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=true     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1572485872996')}" width=100 showFormatFunc=""  />
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										 									
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=true     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487295011793')}" width=100 showFormatFunc=""  />
							<#assign processType_name_displayDefaultType=''>
								<#assign processType_name_defaultValue=''>
										<#assign processType_name_defaultValue=''>
																	<#if (processType_name_defaultValue!)?string=="currentUser">
								<#assign processType_name_defaultValue='${staffJson!}'>
							<#elseif (processType_name_defaultValue!)?string=="currentPost">
								<#assign processType_name_defaultValue='${postJson!}'>
							<#elseif (processType_name_defaultValue!)?string=="currentDepart">
								<#assign processType_name_defaultValue='${deptJson!}'>
							<#elseif (processType_name_defaultValue!)?string=="currentComp">
								<#assign processType_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="processType.name"        showFormat="SELECTCOMP" defaultValue="${(processType_name_defaultValue!)?string}" defaultDisplay="${(processType_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formula.formulaEdit"  textalign="left"  viewUrl="/RM/processType/processType/processTypeRef.action" viewCode="RM_7.5.0.0_processType_processTypeRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487220867598')}"  label="${getText('RM.propertydisplayName.randon1487074387497232432')}" width=100 showFormatFunc=""  />
							<#assign longTime_displayDefaultType=''>
								<#assign longTime_defaultValue=''>
										<#assign longTime_defaultValue=''>
										  
									<@datacolumn key="longTime"        showFormat="TEXT" defaultValue="${(longTime_defaultValue!)?string}" defaultDisplay="${(longTime_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487292241411')}" width=100 showFormatFunc=""  />
							<#assign isFirstProcess_displayDefaultType=''>
								<#assign isFirstProcess_defaultValue=''>
										<#assign isFirstProcess_defaultValue=''>
										  
									<@datacolumn key="isFirstProcess"        showFormat="CHECKBOX" defaultValue="${(isFirstProcess_defaultValue!)?string}" defaultDisplay="${(isFirstProcess_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1540176861060')}" width=100 showFormatFunc=""  />
							<#assign isLastProcess_displayDefaultType=''>
								<#assign isLastProcess_defaultValue=''>
										<#assign isLastProcess_defaultValue=''>
										  
									<@datacolumn key="isLastProcess"        showFormat="CHECKBOX" defaultValue="${(isLastProcess_defaultValue!)?string}" defaultDisplay="${(isLastProcess_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1497849146067')}" width=100 showFormatFunc=""  />
							<#assign cmdType_displayDefaultType=''>
								<#assign cmdType_defaultValue='RM_cmdType/02'>
										<#assign cmdType_defaultValue='RM_cmdType/02'>
										 									<@systemCodeColumn code="RM_cmdType" textalign="center" defaultValue="${(cmdType_defaultValue!)?string}" key="cmdType.id" editable=true type="selectcomp" notnull=true     label="${getText('RM.propertydisplayName.randon1572836173031')}" width=100   />
							<#assign procSort_displayDefaultType=''>
								<#assign procSort_defaultValue=''>
										<#assign procSort_defaultValue=''>
										  
									<@datacolumn key="procSort"        showFormat="TEXT" defaultValue="${(procSort_defaultValue!)?string}" defaultDisplay="${(procSort_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=true     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1539849930820')}" width=100 showFormatFunc=""  />
							<#assign meno_displayDefaultType=''>
								<#assign meno_defaultValue=''>
										<#assign meno_defaultValue=''>
										  
									<@datacolumn key="meno"        showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487292273721')}" width=200 showFormatFunc=""  />
							<#assign batchUnitID_displayDefaultType=''>
								<#assign batchUnitID_defaultValue=''>
										<#assign batchUnitID_defaultValue=''>
										  
									<@datacolumn key="batchUnitID"        showFormat="TEXT" defaultValue="${(batchUnitID_defaultValue!)?string}" defaultDisplay="${(batchUnitID_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="center" hiddenCol=true viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1493729983867')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="formulaId.id"        showFormat="SELECTCOMP" defaultValue="${(formulaId_id_defaultValue!)?string}" defaultDisplay="${(formulaId_id_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formula.formulaEdit"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formula/formulaForSuitLine.action" viewCode="RM_7.5.0.0_formula_formulaForSuitLine" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1514372721087')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign persistMode_displayDefaultType=''>
								<#assign persistMode_defaultValue=''>
										<#assign persistMode_defaultValue=''>
										 									<@systemCodeColumn code="RM_persistMode" textalign="center" defaultValue="${(persistMode_defaultValue!)?string}" key="persistMode.id" editable=true type="selectcomp" notnull=true     label="${getText('RM.propertydisplayName.randon1572329228696')}" width=100   />
							<#assign transTime_displayDefaultType=''>
								<#assign transTime_defaultValue=''>
										<#assign transTime_defaultValue=''>
										  
									<@datacolumn key="transTime"        showFormat="TEXT" defaultValue="${(transTime_defaultValue!)?string}" defaultDisplay="${(transTime_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1572329252195')}" width=100 showFormatFunc=""  />
			
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
				function FormulaProcess_dg1487242802285_check_datagridvalid(){
					//
					var errorObj =FormulaProcess_dg1487242802285Widget._DT.testData();
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
				
				function savedg1487242802285DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaProcess_dg1487242802285Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaProcess_dg1487242802285Widget') > -1) {
						FormulaProcess_dg1487242802285Widget.setAllRowEdited();
					}
					var json = FormulaProcess_dg1487242802285Widget.parseEditedData();
					$('input[name="dg1487242802285ListJson"]').remove();
					$('input[name="dgLists[\'dg1487242802285\']"]').remove();
					$('input[name="dg1487242802285ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1487242802285\']">').val(json).appendTo($('#RM_formula_formula_formulaEdit_form'));
					$('<input type="hidden" name="dg1487242802285ModelCode">').val('RM_7.5.0.0_formula_FormulaProcess').appendTo($('#RM_formula_formula_formulaEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1487242802285ListJson">').val(json).appendTo($('#RM_formula_formula_formulaEdit_form'));
				}
				function DT_FormulaProcess_dg1487242802285_deldatagrid(){
					var deleteRows = FormulaProcess_dg1487242802285Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','formulaId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487242802285DeletedIds").length>0){
							$("#dg1487242802285DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487242802285DeletedIds" name="dgDeletedIds[\'dg1487242802285\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487242802285DeletedIds['+CUI('input[name^="dg1487242802285DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaEdit_form'));
					});
					return deleteRows;
				}
				function DT_FormulaProcess_dg1487242802285_delTreeNodes(){
					var deleteRows = FormulaProcess_dg1487242802285Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','formulaId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487242802285DeletedIds").length>0){
							$("#dg1487242802285DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487242802285DeletedIds" name="dgDeletedIds[\'dg1487242802285\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487242802285DeletedIds['+CUI('input[name^="dg1487242802285DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formula_formulaEdit_datagrids');
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
							if(datagrids[1][i] == 'FormulaProcess_dg1487242802285') {
								break;
							}
							if(i==datagrids[1].length-1) {
								datagrids[1][datagrids[1].length] = 'FormulaProcess_dg1487242802285';
							}
						}
					} else {
						datagrids[1][datagrids[1].length] = 'FormulaProcess_dg1487242802285';
					}
					$('body').data('RM_formula_formula_formulaEdit_datagrids', datagrids);
				});
				
				var FormulaProcess_dg1487242802285_importDialog = null;
				function FormulaProcess_dg1487242802285_showImportDialog(){
					try{
						if(FormulaProcess_dg1487242802285_importDialog!=null&&FormulaProcess_dg1487242802285_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formula/initImport.action?datagridCode=RM_7.5.0.0_formula_formulaEditdg1487242802285&tid=${id!}&datagridName=dg1487242802285";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_formulaEditdg1487242802285_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						FormulaProcess_dg1487242802285_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaProcess_dg1487242802285"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcess_dg1487242802285_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcess_dg1487242802285_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaProcess_dg1487242802285_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaProcess_dg1487242802285_downLoadFile(){
					var url = "/RM/formula/formula/downLoad.action?datagridCode=RM_7.5.0.0_formula_formulaEditdg1487242802285&templateRelatedModelCode=RM_7.5.0.0_formula_formulaEditdg1487242802285&downloadType=template&fileName=dg1487242802285";
					window.open(url,"","");
				}
				function dg1487242802285RenderOverEvent(){
					$("#FormulaProcess_dg1487242802285 .paginatorbar-operatebar :eq(2) span").attr("class","buttonbar-button cui-btn-del");
var processInfoId = decodeURI(window.location.search.substr(1).match(new RegExp("(^|&)tableInfoId=([^&]*)(&|$)"))[2]);
if (processInfoId != null && processInfoId != '') {
	$('#processTableId').val(processInfoId);
}

//添加双击事件
$("#FormulaProcess_dg1487242802285_tbody tr td").not("td[key='procSort']").dblclick(function(){
    var SelectedRow = FormulaProcess_dg1487242802285Widget.getSelectedRow();
    var standid = FormulaProcess_dg1487242802285Widget.getCellValue(SelectedRow,"id");
    randgeEdit = new CUI.Dialog({
		title:"工序",
		formId: "RM_formula_formulaProcess_processEdit_form",
		type:2,
		modal:true,
		url:'/RM/formula/formulaProcess/processEdit.action?entityCode=RM_7.5.0.0_formula&id='+standid,
		buttons:[
			{ 
			name:"${getText("common.button.saveadd")}",
			handler:function(){
				$('input[name="formula.saveFlag"]').val(true);
					CUI('#RM_formula_formulaProcess_processEdit_form').submit();
				}
			},
			{ 
			name:"${getText("foundation.common.save")}",
			handler:function(){
				$('input[name="formula.saveFlag"]').val(false);
					CUI('#RM_formula_formulaProcess_processEdit_form').submit();
				}
			},
			{ name:"${getText("foundation.common.closed")}",
			 handler:function(){this.close()}
			}
		]
	});
	randgeEdit.show();
});

var length = FormulaProcess_dg1487242802285Widget.getRowLength();
if($("input[name='formula.batchContral_check']").val() == 'false'){//非批控配方才需要设置顺序
$("#FormulaProcess_dg1487242802285_tbody td[key='procSort']").click(function(event){
	var td = this;
	var selectedValue =  $(td).find("div").html();
	var width=$(td).find("div").css("width")
	if (selectedValue.indexOf("<select")!=-1){
		return;
	}
	if(length){
		var options = "<option value =\"\"></option>";
		for (var i = 1; i <= length; i++) {
			if (selectedValue && selectedValue == i ) {
				options += "<option value =\"" + i + "\" selected>" + i + "</option>"
			}else{
				options += "<option value =\"" + i + "\">" + i + "</option>"
			}
		}

		$(td).html(
			"<div style=\"width:"+width+"\"><select class=\"td-select\" style=\"margin-top:-2px;margin-bottom:-2px;width:"+width+";border-width:0px;outline:0px;\">"+
			  options+
			"</select></div>"
		)
		$(".td-select").focus()
			
		$(".td-select").click(function(event){
			return false;
		}).change(function(){
			console.log($(this));
			console.log(FormulaProcess_dg1487242802285Widget._DT.getSelectedRow()[0].procSort)
			var procSort = $(this).find("option:selected").html();
			var processId = FormulaProcess_dg1487242802285Widget._DT.getSelectedRow()[0].id;
			var formuId = FormulaProcess_dg1487242802285Widget._DT.getSelectedRow()[0].formulaId.id;
			//工序为修改时 
			if(id!= undefined &&id!='' && formuId!=undefined){
				$.ajax({
					url : "/RM/formula/formula/saveProcSort.action",
					type : 'post',
					async : true,
					data:{
						"processID":processId,"formulaId":formuId ,"procSort":procSort
					},
					success : function(data) {
		FormulaProcess_dg1487242802285Widget._DT.setRequestDataUrl(FormulaProcess_dg1487242802285Widget._DT.requestUrl);				
					}
				});
			}FormulaProcess_dg1487242802285Widget.setCellValue(FormulaProcess_dg1487242802285Widget.getSelectedRow(),'procSort',$(this).find("option:selected").html())
			$("td[key='procSort'] div").css("text-align",'center')
			tableSort(FormulaProcess_dg1487242802285Widget,'procSort',"asc")
		}).blur(function(){
			FormulaProcess_dg1487242802285Widget.setCellValue(FormulaProcess_dg1487242802285Widget.getSelectedRow(),'procSort',$(this).find("option:selected").html())
			$("td[key='procSort'] div").css("text-align",'center')
		})
	}
})
}
tableSort(FormulaProcess_dg1487242802285Widget,'procSort',"asc")
				}
				function dg1487242802285PageInitMethod(nTabIndex){
					RM.formula.formula.formulaEdit.initSize(nTabIndex);
					//获取批控
var batchControl = $("[name='formula.batchContral_check']").attr("value");;
if(batchControl == true || batchControl == 'true' ){
	//隐藏增加、删行按钮 - added 2018.5.25
	$('.paginatorbar .paginatorbar-operatebar:eq(1) a:eq(0)').hide();
	$('.paginatorbar .paginatorbar-operatebar:eq(1) a:eq(1)').hide();
}

$("#FormulaProcess_dg1487242802285 .paginatorbar-operatebar span:eq(2)").attr('class','buttonbar-button cui-btn-edit');
$("#FormulaProcess_dg1487242802285 .paginatorbar-operatebar span:eq(3)").attr('class','buttonbar-button cui-btn-edit');
$("#FormulaProcess_dg1487242802285 .paginatorbar-operatebar span:eq(4)").attr('class','buttonbar-button cui-btn-hdsz');
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
     	
		<div id="RM_formula_formula_formulaEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="RM.formula.formula.formulaEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.formula.formula.formulaEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="RM.formula.formula.formulaEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_formulaEdit,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->
<div id="EBRid" style=" clear: both; height: 257px; width: 1382px;">
<style type="text/css">
	.cui-btn-putin {
    	background: url('/bap/static/RM/img/icon_jxtl.png') no-repeat;
	}
    .cui-btn-inspect {
    	background: url('/bap/static/RM/img/icon_fqqj.png') no-repeat;
	}
	.cui-btn-taskReport {
    	background: url('/bap/static/RM/img/icon_jxbg.png') no-repeat;
	}
	.cui-btn-cdsz {
    	background: url('/bap/static/RM/img/icon_cdsz.png') no-repeat;
	}
	.cui-btn-copy {
    	background: url('/bap/static/RM/img/icon_copy.png') no-repeat;
	}
	.cui-btn-end {
    	background: url('/bap/static/RM/img/icon_end.png') no-repeat;
	}
	.cui-btn-gdtpl {
    	background: url('/bap/static/RM/img/icon_gdtpl.png') no-repeat;
	}
	.cui-btn-hdsz {
    	background: url('/bap/static/RM/img/icon_hdsz.png') no-repeat;
	}
	.cui-btn-jxps {
    	background: url('/bap/static/RM/img/icon_jxps.png') no-repeat;
	}
	.cui-btn-plwc {
    	background: url('/bap/static/RM/img/icon_plwc.png') no-repeat;
	}
	.cui-btn-print {
    	background: url('/bap/static/RM/img/icon_print.png') no-repeat;
	}
	.cui-btn-sgtpl {
    	background: url('/bap/static/RM/img/icon_sgtpl.png') no-repeat;
	}
	.cui-btn-wlszyck {
    	background: url('/bap/static/RM/img/icon_wlszyck.png') no-repeat;
	}
	.cui-btn-xtdbd {
    	background: url('/bap/static/RM/img/icon_xtdbd.png') no-repeat;
	}
	.cui-btn-zdsc {
    	background: url('/bap/static/RM/img/icon_zdsc.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}

</style>
</div>
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
						$("#RM_formula_formula_formulaEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_formula_formula_formulaEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_formula_formula_formulaEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_formula_formula_formulaEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.formula.formula.formulaEdit.initCount = 0;
			RM.formula.formula.formulaEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_formula_formula_formulaEdit_main_div .edit-head").height()-$("#RM_formula_formula_formulaEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_formula_formula_formulaEdit_main_div .edit-workflow").height()</#if>;
				$("#RM_formula_formula_formulaEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_formula_formula_formulaEdit_datagrids');
				var padding_bottom=16;
				$("#RM_formula_formula_formulaEdit_main_div .pd_bottom,#RM_formula_formula_formulaEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_formula_formula_formulaEdit_main_div .edit-panes-s").each(function(index){
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
									if(RM.formula.formula.formulaEdit.initCount <= 2) {
										setTimeout(function(){RM.formula.formula.formulaEdit.initSize();}, 200);
										RM.formula.formula.formulaEdit.initCount++;
									}/* else {
										RM.formula.formula.formulaEdit.initCount = 0;
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
							if(($("#RM_formula_formula_formulaEdit_main_div .edit-workflow").length > 0) && ($("#RM_formula_formula_formulaEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#RM_formula_formula_formulaEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				RM.formula.formula.formulaEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.formula.formula.formulaEdit.initSize();
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
						if(parseInt($("#RM_formula_formula_formulaEdit_main_div").css("width"),10)==650){
							$("#RM_formula_formula_formulaEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.formula.formula.formulaEdit.resizeLayout();
						//RM.formula.formula.formulaEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_formula_formula_formulaEdit_main_div").css("width"),10)==800){
							$("#RM_formula_formula_formulaEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.formula.formula.formulaEdit.resizeLayout();
						//RM.formula.formula.formulaEdit.initSize();
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
					RM.formula.formula.formulaEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.formula.formula.formulaEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.formula.formula.formulaEdit.initSize();});
				/*
				RM.formula.formula.formulaEdit.resizeLayout=function(){
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
			RM.formula.formula.formulaEdit.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${formula.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/RM/formula/formula/dealInfo-list.action&enableSimpleDealInfo=false");
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

		RM.formula.formula.formulaEdit.validate = function(){
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
		RM.formula.formula.formulaEdit.beforeSaveProcess = function(){
			try{eval("savedg1487242802285DataGrid()");}catch(e){}
			try{eval("savedg1503551511011DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#RM_formula_formula_formulaEdit_form').trigger('beforeSubmit');
			//formula.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="formula.extraCol"]').val(extraCol);
		}
		RM.formula.formula.formulaEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#RM_formula_formula_formulaEdit_form').append(FormulaBom_dg1503551511011Widget._DT.createInputs('dg1503551511011List'));
										</#if>
										<#if false && isIE>
										$('#RM_formula_formula_formulaEdit_form').append(FormulaProcess_dg1487242802285Widget._DT.createInputs('dg1487242802285List'));
										</#if>
		};
		RM.formula.formula.formulaEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.formula.formula.formulaEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//RM.formula.formula.formulaEdit.beforeSaveProcess();

			//RM.formula.formula.formulaEdit.processDataGrid();
			$('#RM_formula_formula_formulaEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_formula_formula_formulaEdit_form','RM_formula_formula_formulaEdit_datagrids')) {      
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
		RM.formula.formula.formulaEdit.print = function(){
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
		
		RM.formula.formula.formulaEdit.saveSetting = function(){
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
		
		RM.formula.formula.formulaEdit.printSetting = function(){
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
				RM.formula.formula.formulaEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formula.formulaEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.formula.formula.formulaEdit.settingDialog.show();
			}
		}
		
		
		
		RM.formula.formula.formulaEdit.reject = function(){
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
			RM.formula.formula.formulaEdit.submit();
		}
		
		RM.formula.formula.formulaEdit.submit = function(uncheck){
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
			if(!RM.formula.formula.formulaEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			RM.formula.formula.formulaEdit.beforeSaveProcess();
			
			//RM.formula.formula.formulaEdit.processDataGrid();
			
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
			$('#RM_formula_formula_formulaEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		RM.formula.formula.formulaEdit.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/RM/formula/formula/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(formula.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(formula.tableInfoId)?default('')}&id=${(formula.id)?default('')}&entityCode=RM_7.5.0.0_formula";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.RM.formula.formula.editCallBackInfo(res); 						
								}catch(e2){
									try{
										<#if calltype??&&calltype=='ref'>
										window.opener.RM.formula.formula.callBackInfo(res);
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
		RM.formula.formula.formulaEdit._callBackInfo = function(res){
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
 						window.opener.RM.formula.formula.editCallBackInfo(res); 						
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
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=RM_7.5.0.0_formula";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.formula.formula.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
		RM.formula.formula.formulaEdit.setDepartment = function(){
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
				RM.formula.formula.formulaEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.formula.formula.formulaEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.formula.formula.formulaEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.formula.formula.formulaEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.formula.formula.formulaEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.formula.formula.formulaEdit._refViewCode_IE = viewCode;
			} else {
				RM.formula.formula.formulaEdit._refViewCode_IE = '';
			}
			RM.formula.formula.formulaEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.formula.formula.formulaEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.formula.formula.formulaEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.formula.formula.formulaEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.formula.formula.formulaEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.formula.formula.formulaEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.formula.formula.formulaEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.formula.formula.formulaEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(RM.formula.formula.formulaEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(RM.formula.formula.formulaEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				RM.formula.formula.formulaEdit.gridEventObj = gridEventObj;
				callbackName = "RM.formula.formula.formulaEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.formula.formula.formulaEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formula.formulaEdit.getcallBackInfo_DG";
				RM.formula.formula.formulaEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.formula.formula.formulaEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.formula.formula.formulaEdit._prefix = _prefix.substring(1);
			}
			
			RM.formula.formula.formulaEdit._oGrid = oGrid;
			RM.formula.formula.formulaEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.formula.formula.formulaEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.formula.formula.formulaEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.formula.formula.formulaEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.formula.formula.formulaEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.formula.formula.formulaEdit._refViewCode = oColumn.viewCode;
				} else {
					RM.formula.formula.formulaEdit._refViewCode = '';
				}
			} else {
				RM.formula.formula.formulaEdit._isObjCustomProp = false;
				RM.formula.formula.formulaEdit._objCustomPropNames = '';
				RM.formula.formula.formulaEdit._refViewCode = '';
			}
			if (RM.formula.formula.formulaEdit._isObjCustomProp == true && RM.formula.formula.formulaEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.formula.formula.formulaEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.formula.formula.formulaEdit._customCallBack = customCallBack;
			}
			if(RM.formula.formula.formulaEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formula.formulaEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.formula.formula.formulaEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formula.formulaEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.formula.formula.formulaEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formula.formulaEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.formula.formula.formulaEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formula.formulaEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.formula.formula.formulaEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.formula.formula.formulaEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formula.formulaEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.formula.formula.formulaEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.formulaEdit.query_'+obj+'()') : null;
			return str;
		};
		RM.formula.formula.formulaEdit.getcallBackGroupInfo = function(obj){
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
			RM.formula.formula.formulaEdit._dialog.close();
		}
		RM.formula.formula.formulaEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_formula_formula_formulaEdit_form',obj[0], RM.formula.formula.formulaEdit._prefix, RM.formula.formula.formulaEdit._sUrl);
			CUI.commonFills('RM_formula_formula_formulaEdit_form',RM.formula.formula.formulaEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.formula.formula.formulaEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.formula.formula.formulaEdit._customCallBack) {
					eval(RM.formula.formula.formulaEdit._customCallBack);
					RM.formula.formula.formulaEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.formulaEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.formula.formula.formulaEdit.getcallBackInfo_DG_IE = function(obj){
			if(RM.formula.formula.formulaEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formula.formulaEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.formula.formula.formulaEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.formula.formula.formulaEdit._isObjCustomProp_IE == true && RM.formula.formula.formulaEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.formula.formula.formulaEdit._sUrl,RM.formula.formula.formulaEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formula.formulaEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.formula.formula.formulaEdit._isObjCustomProp_IE == true && RM.formula.formula.formulaEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.formula.formula.formulaEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.formula.formula.formulaEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.formula.formula.formulaEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.formula.formula.formulaEdit._refViewCode_IE + '&id=' + id,
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
				if(RM.formula.formula.formulaEdit._customCallBack) {
					eval(RM.formula.formula.formulaEdit._customCallBack);
					RM.formula.formula.formulaEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.formulaEdit._dialog.close();
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
		
		RM.formula.formula.formulaEdit.getcallBackInfo_DG = function(obj){
			if(RM.formula.formula.formulaEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formula.formulaEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.formula.formula.formulaEdit._currRow).next().length==0){
						RM.formula.formula.formulaEdit._oGrid.addNewRow();
					}	
					RM.formula.formula.formulaEdit._currRow = $(RM.formula.formula.formulaEdit._currRow).next();
					$(RM.formula.formula.formulaEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.formula.formula.formulaEdit._currRow,obj[i], RM.formula.formula.formulaEdit._prefix, RM.formula.formula.formulaEdit._sUrl);
				if (RM.formula.formula.formulaEdit._isObjCustomProp == true && RM.formula.formula.formulaEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.formula.formula.formulaEdit._currRow,RM.formula.formula.formulaEdit._prefix,obj[i],RM.formula.formula.formulaEdit._oGrid,RM.formula.formula.formulaEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.formula.formula.formulaEdit._currRow,RM.formula.formula.formulaEdit._prefix,obj[i],RM.formula.formula.formulaEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.formula.formula.formulaEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.formula.formula.formulaEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.formula.formula.formulaEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.formula.formula.formulaEdit._refViewCode + '&id=' + id,
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
									name = RM.formula.formula.formulaEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.formula.formula.formulaEdit._currRow, objs, RM.formula.formula.formulaEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.formula.formula.formulaEdit._customCallBack) {
					eval(RM.formula.formula.formulaEdit._customCallBack);
					RM.formula.formula.formulaEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.formulaEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.formula.formula.formulaEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.formula.formula.formulaEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.formula.formula.formulaEdit._oGrid, RM.formula.formula.formulaEdit._currRow, RM.formula.formula.formulaEdit._key, RM.formula.formula.formulaEdit._displayFieldName, obj[i])
			}
			try{
				if(RM.formula.formula.formulaEdit._customCallBack) {
					eval(RM.formula.formula.formulaEdit._customCallBack);
					RM.formula.formula.formulaEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.formulaEdit._dialog.close();
			} catch(e){}
		};
		
		RM.formula.formula.formulaEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.formula.formula.formulaEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formula_formulaEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			RM.formula.formula.formulaEdit.onloadForProduct();
			//状态未启用
$("#formulastateid").disabledSelect();
// 中间接口服务地址 设为不可编辑
$('[name="formula.interfaceUrl.id"]').disabledSelect();
	
//创建批控配方按钮隐藏-目前版本中批控配方不由mes创建，而直接通过获取批控配方获得
$("#edit-btn-synBatch").hide();

$("#RM_formula_formula_formulaEdit div").append("<input type=\"hidden\" id=\"processTableId\">");
var formulaId=$('#id').val();
//已生成物料清单则产品不能填写
if($("#FormulaBom_dg1487243609586_tbody").children().children().length!=0){
	//产品编码为空
	$("input[name='formula.product.productCode']").val("");
	//参照按钮不显示
	$("#formula_product_productCode_click_button").css("display","none");
	//$("#formula_product_productCode_click_button").attr("disabled",true);
	//产品编码只读
	$("input[name='formula.product.productCode']").attr("readonly","readonly");
	//产品名称为空
	$("#formula_product_productName").val("");
}else{
	//产品编码可填写
	$("#formula_product_productCode_click_button").css("display","block");
	$("input[name='formula.product.productCode']").prop("readonly",false);
}

//如果配方信息保存则工序页签显示否则不显示
if(formulaId!=null && formulaId!=""){
	//工序显示
	$('.edit-tabs li:eq(1)').show();
	//物品清单显示
	$('.edit-tabs li:eq(2)').show();
}else{
	//工序隐藏
	$('.edit-tabs li:eq(1)').hide();
	//物品清单隐藏
	$('.edit-tabs li:eq(2)').hide();
}

//获取批控
var url = "/RM/formula/formula/getBatchControl.action";
var batchControl="";
$.ajax({
	url : url,
	type : 'get',
	async : false,
	success : function(msg) {
		if(msg!=null){
			batchControl = msg.result;
		}
	}
});
if(batchControl==true){
	
}else{
	//隐藏批控配方
	$("[name='formula.batchFormula.batchFormulaId']").parent().parent().parent().hide();
	$("[name='formula.batchFormula.batchFormulaId']").parent().parent().parent().prev().hide();
	//隐藏批控配方
	$("[name='formula.batchFormula.formulaCode']").parent().parent().hide();
	$("[name='formula.batchFormula.formulaCode']").parent().parent().prev().hide();
	//隐藏批控版本
	$("[name='formula.batchFormula.edition']").parent().parent().hide();
	$("[name='formula.batchFormula.edition']").parent().parent().prev().hide();
	//隐藏批控配方
	$("[name='formula.batchFormula.batchFormulaId']").parent().parent().parent().hide();
	$("[name='formula.batchFormula.batchFormulaId']").parent().parent().parent().prev().hide();
	//批控去掉勾选，隐藏
	$("[name='formula.batchContral_check']").attr("value",'false');
	$("[name='formula.batchContral_check']").parent().prev().hide();
	$("[name='formula.batchContral_check']").parent().hide();
	//中间服务地址隐藏
	$("#formula_interfaceUrl_id__jQSelect56").parent().parent().prev().hide();
	$("#formula_interfaceUrl_id__jQSelect56").parent().parent().hide();
}

//$($(".edit-table").children().children()[8]).css("display","none");
$('#RM_formula_formula_formulaEdit_form tbody tr:eq(6) td:eq(3)').children().children().attr("style","color:rgb(179,3,3);");


var isFirstEdit="${(isFirstEdit)!}";
var tabID=$('#id').val();
if( tabID.length == 0 ){
	//第一次新增，创建批控配方按钮隐藏
	$("#edit-btn-synBatch").hide();
	//默认"勾选允许提前放料"复选框
	$("input[name='formula.advanceCharge_check']").attr('checked', true);
	$("input[name='formula.advanceCharge']").val(true);
	// 初始化打开时设置放料条件为可编辑
	$('[name="formula.feedCondition"]').removeAttr("readonly");
}

if( tabID.length>0  &&  isFirstEdit.length<=0   ){
	$("[name='formula.code']").attr("readonly",true);
	$("[name='formula.name']").attr("readonly",true);
	$("[name='formula.edition']").attr("readonly",true);

	//禁用产品
	$("#formula_product_productCodediv").removeAttr("onmouseenter");
	$("#formula_product_productCodediv").unbind('mouseenter');
	$("[name='formula.product.productCode']").attr("readonly",true);
	$("#formula_product_productCode_click_button").remove();

	$('#formulaproduceTypeid').disabledSelect();
	$('#formulausedForid').disabledSelect();
	$("[name='formula.isForProduct_check']").attr("disabled",true);
	//$('#formulainterfaceUrlid').disabledSelect();

	$("[name='formula.longTime']").attr("readonly",true);

	//禁用主原料
	$("#formula_mainMetarial_productCodediv").removeAttr("onmouseenter");
	$("#formula_mainMetarial_productCodediv").unbind('mouseenter');
	$("[name='formula.mainMetarial.productCode']").attr("readonly",true);
	$("#formula_mainMetarial_productCode_click_button").remove();


	$("[name='formula.theoreYield']").attr("readonly",true);
	$("[name='formula.batchContral_check']").attr("disabled",true);
	$("[name='formula.supportEbr_check']").attr("disabled",true);

	$("[name='formula.yieldFormula']").attr("readonly",true);
	$("[name='formula.description']").attr("readonly",true);
	
	//配方类型
	$("#formula_formulaType_namediv").removeAttr("onmouseenter");
	$("#formula_formulaType_namediv").unbind('mouseenter');
	$("[name='formula.formulaType.name']").attr("readonly",true);
	$("#formula_formulaType_name_click_button").remove();
	
}

//如果batchFormulaID 不为空，说明配方已经同步过到批控，则类型不允许修改了
var  batchFormulaID=$('input[name="formula.batchFormulaID"]').val()
if(batchFormulaID!=null && batchFormulaID!=""){
    //配方类型
	$("#formula_formulaType_namediv").removeAttr("onmouseenter");
	$("#formula_formulaType_namediv").unbind('mouseenter');
	$("[name='formula.formulaType.name']").attr("readonly",true);
	$("#formula_formulaType_name_click_button").remove();
	//已经同步过到批控，则是否批控不允许修改了
	$("[name='formula.batchContral_check']").attr("disabled",true);
	//已经同步过到批控，中间服务器地址不允许修改
	//$('#formulainterfaceUrlid').disabledSelect();
}else{
	//批控配方id为空只读批控结束即完成按钮
	$("[name='formula.batchOverOnFinish_check']").attr("disabled",true);
}

code = $("#formula_code").val();//编码
name = $("#formula_name").val();//名称
edition = $("#formula_edition").val();//版本
productCode = $("#formula_product_productCode").val();//产品编码
productType = $("#formulaproduceTypeid").val();//生产性质
useFor = $("#formulausedForid").val();//用途
isForProduct = $("input[name='formula.isForProduct']").val();//生产配方
formulaType = $("#formula_formulaType_name").val();//配方类型
batchContral = $("input[name='formula.batchContral']").val();//批控
interfaceUrlid = $("#formulainterfaceUrlid").val();//中间服务器地址
		});

		RM.formula.formula.formulaEdit.beforeSubmitMethodSettingInPage = function(){
			RM.formula.formula.formulaEdit.onsaveForProduct();
			var type = $("#operateType").val();
var type1=$("input[name='workFlowVarStatus']").val();

if(  type =='submit' && type1!='reject' &&  type1!='cancel'  ){
    if(type =='submit') {
        var formulaId=$('#id').val();
				var url = "/RM/formula/formulaBom/autoProduce.action?formulaId="+formulaId;
				var isEBR="";
				$.ajax({
					url : url,
					type : 'get',
					async : false,
					success : function(msg) {
						if(msg!=null){
							isEBR = msg.result;
							FormulaBom_dg1503551511011Widget._DT.setRequestDataUrl(FormulaBom_dg1503551511011Widget._DT.requestUrl);  
						}
					}
				});	
    }
	var batchContralBeforeSubmit = $("input[name='formula.batchContral']").val();	
	var batchIdBeforeSubmit = $("#formula_batchFormulaID").val();
	if(batchContralBeforeSubmit == 'true' && batchIdBeforeSubmit == ''){
		workbenchErrorBarWidget.showMessage('配方勾选批控，但未关联批控配方，请指定批控配方后提交','f');
		return false;
	}	
}
		};
		RM.formula.formula.formulaEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.formula.formula.formulaEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.formula.formula.formulaEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_formula_formula_formulaEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_formula_formula_formulaEdit_main_div").hide();
				},100);
				//CUI("#RM_formula_formula_formulaEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.formula.formula.formulaEdit.showThis = function(){
			if(!CUI("#RM_formula_formula_formulaEdit_main_div").is(':visible')) {
				CUI("#RM_formula_formula_formulaEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.formula.formula.formulaEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.formula.formula.formulaEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_formula_formula_formulaEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_formula_Formula&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formula.formulaEdit.auditDialog.show();
			</#if>
		}
		
		
		RM.formula.formula.formulaEdit.showInfoDialog=function(mode){
			
			RM.formula.formula.formulaEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_formula_formula_formulaEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formula.formulaEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.formula.formula.formulaEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_formula");
			}
		}
		
		RM.formula.formula.formulaEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/formula/formula/dealInfo-list.action&dlTableInfoId=${(formula.tableInfoId)?default('')}");
			}
		}
		RM.formula.formula.formulaEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=RM_7.5.0.0_formula_Formula&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(formula.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=RM_7.5.0.0_formula_Formula&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(formula.tableInfoId)?default('')}");
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
		RM.formula.formula.formulaEdit.supervision=function(){
			RM.formula.formula.formulaEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(formula.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.formula.formula.formulaEdit.modifyOwnerStaffDialog.show();
		}
		
function nameChange(){
/**
	var versionName=$('input[name="formula.edition"]').val();
	var flagName=$('input[name="formula.name"]').val();
	if(versionName!=null && versionName!='' && flagName!=null  && flagName!=''){
				$('input[name="formula.code"]').val(flagName+'-'+versionName);
	}
	*/
}
function typeOnChange(){
	//获取类型的值
	var produceType=$('#formulaproduceTypeid').val();
	//类型值为制造时，批控字段可编辑，其它情况则不可编辑
	if(produceType=="produceType/produceType1"){
		//$('input[name="formula.batchContral_check"]').prop("disabled",false);
	}else{
		//将批控的值赋值为false
		$('input[name="formula.batchContral_check"]').attr("checked",false);
		$('input[name="formula.batchContral"]').val(false);
		$('input[name="formula.batchContral_check"]').prop("disabled",true);
	}
}
function advanceChargeOnchange(){
	var advanceCharge = $("input[name='formula.advanceCharge_check']").attr('checked');
	if (advanceCharge == "checked") {
		$("#formula_feedCondition").removeAttr("readonly");
	}else{
		$("#formula_feedCondition").val("");
		$("#formula_feedCondition").attr("readonly",true);
	}
}
function check(){
	if(Number($("#formula_theoreYield").val())>100 ||Number($("#formula_theoreYield").val())<0){
	    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon145236987')}");
		$("#formula_theoreYield").val("");
	    return false;
    }
}
function checkbatch(){
	if($("[name='formula.id']").val()!=''&&$("[name='formula.id']").val()!=undefined){
		CUI.ajax({
			type : "POST",
			url : '/RM/formula/formulaProcess/isMESProcess.action?formulaId=' + $("[name='formula.id']").val(),
			success : function(msg){
				if(msg!=null){
					if(msg.success==true&&$("[name='formula.batchContral']").val()=='true'){
					workbenchErrorBarWidget.showMessage('${getText("RM.process.cannotsave")}','f');
					$("[name='formula.batchContral_check']").attr('checked',false);
					$("[name='formula.batchContral']").val('false')
					}
				}
				return true;
			}
		});
	}

	if($("[name='formula.batchContral']").val() == 'true'){
		$('#formulainterfaceUrlid').disabledSelect();
		$("#formulainterfaceUrlid").setValue("");
	}else{
		$('#formulainterfaceUrlid').unDisabledSelect();
	}
}
function batchFormulaCustomCallBack(obj){
	
	var batchFormulaCode = obj[0].formulaCode || "";
	$('#formula_batchFormulaCode').val(batchFormulaCode); // 批控配方编码
	$('#formula_batchFormulaEdition').val(obj[0].edition || ""); // 批控配方版本
	$('#formula_batchFormulaID').val(obj[0].batchFormulaId || ""); // 批控配方id
	$('[name="formula.interfaceUrl.id"]').val(obj[0].origin.id);
	$('[name="formula.interfaceUrl.value"]').val(obj[0].origin.value);
	//$("#formulainterfaceUrlid").setValue(obj[0].origin!=null?obj[0].origin.id:""); // 中间接口服务地址
	$("#formulafeedingModeid").setValue(obj[0].runMode=="2"?"RMfixAmount/02":"RMfixAmount/01"); // 投料模式
	//$('[name="formula.batchFormula.id"]').val(obj[0].id);
	var result = '';
	var productId = '';
	$.ajax({
		url: "/RM/batchFormula/batchFormulaMain/getProduct.action?name="+obj[0].productName,
		type: 'post',
		asynch: false,
		success: function(msg){
			console.log(msg);
			if(msg!=null){
				var prod = JSON.parse(msg).productInfo;
				//回填产品信息
				$('#formula_product_productCode_mneTipLabel').css('display','none');
				$('[name="formula.product.productCode"]').val(prod["productCode"]);
				$('[name="formula.product.productCode"]').attr('valuebak', prod["productCode"]);
				$('[name="formula.product.id"]').val(prod["productId"]);
				$('#formula_product_productCode').val(prod["productCode"]);
				$('#formula_product_productName').val(prod["productName"]);
				$('[name="formula.interfaceUrl.id"]').disabledSelect();// 中间接口服务地址 设为不可编辑
				getLatestFormulaEdition(prod["productId"]);
			}
		}
	});
	
	// 配方表头编码、标识和版本为空时，才回填
	if($('#formula_code').val()==null || $('#formula_code').val().length==0 && $('#formula_name').val()==null && $('#formula_name').val().length==0 && $('#formula_edition').val()==null || $('#formula_edition').val().length==0){
		$('#formula_code').val(batchFormulaCode); //编码
		$('#formula_name').val(batchFormulaCode.substr(0,batchFormulaCode.indexOf('_'))); //标识
		//$('#formula_edition').val(batchFormulaCode.substr(batchFormulaCode.lastIndexOf('_')+1)); //版本
		
	}
	
	//勾选批控
	$("[name='formula.batchContral_check']").attr('checked', 'checked');
	$("[name='formula.batchContral']").val(true);
	// 默认选择批量制造
	$('#formulaproduceTypeid').setValue('produceType/produceType1');
	//批控结束即完成
	$("input[name='formula.batchOverOnFinish_check']").attr('disabled',false);

	// 获取最新的配方版本号
	var getLatestFormulaEdition = function(productId){
		if(productId){
			var url = "/RM/formula/formula/getLatestEdition.action?productId=" + productId;
			$.post(url, function(msg){
				if(msg.result != null){
					var edition = msg.result;
					$('[name="formula.edition"]').val((parseFloat(edition)+0.1).toFixed(2));
				}else{
					$('[name="formula.edition"]').val(parseFloat(1));
				}
			});
		}
	}

}




function minQuaChange(nRow,sFieldName){
	var row=nRow;
   var standQua=Number(FormulaBom_dg1487243609586Widget.getCellValue(row,"unitQuality"));
    var maxQua=Number(FormulaBom_dg1487243609586Widget.getCellValue(row,"maxQuality"));
    var minQua=Number(FormulaBom_dg1487243609586Widget.getCellValue(row,"minQuality"));
  //区间下限不允许大于区间上限
  
	if(  minQua!="" && minQua!=undefined){
			if(maxQua!="" && maxQua!=undefined){
					if(Number(minQua)>Number(maxQua)){
	        workbenchErrorBarWidget.showMessage("${getText('RM.buttonPropertyshowName.radion14222322342342')}");
	        FormulaBom_dg1487243609586Widget.setCellValue(row,"minQuality","");
	        return false;
        }
			}
	    
        //区间上限不允许大于单位数量
	   if(Number(minQua)>Number(standQua)){
	   		 workbenchErrorBarWidget.showMessage("${getText('RM.buttonPropertyshowName.radion142223223423')}");
	        FormulaBom_dg1487243609586Widget.setCellValue(row,"minQuality","");
	        return false;
	   }
    }
}
function maxQuaChange(nRow,sFieldName){
	var row=nRow;
   var standQua=Number(FormulaBom_dg1487243609586Widget.getCellValue(row,"unitQuality"));
    var maxQua=Number(FormulaBom_dg1487243609586Widget.getCellValue(row,"maxQuality"));
    var minQua=Number(FormulaBom_dg1487243609586Widget.getCellValue(row,"minQuality"));
  //区间上限不允许小于区间下限
	if(maxQua!="" && maxQua!=undefined){
			if(minQua!="" && minQua!=undefined){
					 if(Number(minQua)>Number(maxQua)){
	        workbenchErrorBarWidget.showMessage("${getText('RM.buttonPropertyshowName.radion142223242345')}");
	        FormulaBom_dg1487243609586Widget.setCellValue(row,"maxQuality","");
	        return false;
        }
			}
        //区间上限不允许小于单位数量
	   if(Number(standQua)>Number(maxQua)){
	   		 workbenchErrorBarWidget.showMessage("${getText('RM.buttonPropertyshowName.radion1422233434')}");
	        FormulaBom_dg1487243609586Widget.setCellValue(row,"maxQuality","");
	        return false;
	   }
    }
}

		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_formulaEdit,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
var processDelete = true; // 定义全局变量，默认为true
var randgeEdit = null;
$(function(){
randgeEdit =new CUI.Dialog({
  title:"工序",
  type:2,
  modal:true,
  url:'/RM/formula/formulaProcess/formulaProcessEdit.action?entityCode=entityCode=RM_7.5.0.0_formula',
  buttons:[
    { name:"${getText("foundation.common.save")}",
    handler:function(){CUI('#RM_formula_formulaProcess_formulaProcessEdit_form').submit();}
    },
    { name:"${getText("foundation.common.closed")}",
     handler:function(){this.close()}
    }
  ]
 });
 //设置测试项目回调方法
  	RM.formula.formulaProcess = RM.formula.formula.formulaEdit;
     RM.formula.formulaProcess.callBackInfo=function(){                    
             CUI.Dialog.toggleAllButton();
       var saveFlag=$('input[name="formula.saveFlag"]').val();
             if(saveFlag=='false'){
           randgeEdit.close();
           }else{
                    //将工序id清空
                    $($("#RM_formula_formulaProcess_processEdit_form").children()[5]).val("");
                    //将隐藏框的值清空
                    $("#proName").val("");
             		//将备注置为空
             		//$('input[name="formulaProcess.meno"]').val('');
                    $("#formulaProcess_meno").val('');
             		//将标准时间置为空
             		$('input[name="formulaProcess.longTime"]').val('');
                    //将工序类型id清空
                    $("input[name='formulaProcess.processType.id']").val('');
             		//将工序类型置为空
             		$('input[name="formulaProcess.processType.name"]').val('');
             		//将工序名称置为空
             		$('input[name="formulaProcess.name"]').val('');
                    //将前置工序清空
                    $("#formulaProcess_processIdBeforeProcessIDAddIds").val("");
             		$('#formulaProcess_processIdBeforeProcessIDMultiIDsContainer span').remove();
             }
          FormulaProcess_dg1487242802285Widget._DT.setRequestDataUrl(FormulaProcess_dg1487242802285Widget._DT.requestUrl);  
            
        }
     
     
      
		RM.formula.formula.formulaEdit.query_dg1487242802285processIdBeforeProcessID=function(){
        //工序Id
          
          var formulaId=$('#id').val();
			//工序选中的行
			var selectRow=FormulaProcess_dg1487242802285Widget.getSelectedRow();
			var processId=FormulaProcess_dg1487242802285Widget.getCellValue(selectRow,'id');
   		return "formulaId="+formulaId+"&processId="+processId;
        
        }
        
        typeOnChange();
		var batchFormulaID=$('#formula_batchFormulaID').val();
		if(batchFormulaID!=""&&batchFormulaID!=null){
			$('input[name="formula.batchContral_check"]').prop("disabled",true);
		}
	})
     
      function processDel(){
  					var selectRow=FormulaProcess_dg1487242802285Widget.getSelectedRow();
  					var processId=FormulaProcess_dg1487242802285Widget.getCellValue(selectRow,'id');
  				var url = "/RM/formula/formulaProcess/processDelete.action?processID="+processId;
        $.ajax({
	        url : url,
	        type : 'get',
	        async : false,
	        success : function(msg) {
		     if(msg!=null){
			  var  value = msg.result;
			  if(value==true){
			  		//重新加载工序
			  		FormulaProcess_dg1487242802285Widget._DT.setRequestDataUrl(FormulaProcess_dg1487242802285Widget._DT.requestUrl);
              }
		     }
		     }
            });
  		
  }


//新打开界面
function newInit(){
	//删除下拉框批次系统选项
	$("#formulaProcessActiveexeSystemid option[value='RMsystem/system1']").remove();

	//完工检验
	$("[name='formulaProcessActive.finalInspection_check']").attr("disabled",true);
	$('input[name="formulaProcessActive.finalInspection_check"]').attr("checked",false);
	$('input[name="formulaProcessActive.finalInspection"]').val(false);
	//投料顺序
	$("[name='formulaProcessActive.actOrder']").attr("readonly",true);
	$("[name='formulaProcessActive.actOrder']").val("");		
			
	//物品只读
	$("input[name='formulaProcessActive.product.productCode']").attr("readonly",true);
	$("#formulaProcessActive_product_productCode_click_button").css("display","none");
	$("#formulaProcessActive_product_productCode_mneTipLabel").css("display","none");
	//选择类型之前替代料不可编辑
	$('input[name="formulaProcessActive.isReplace_check"]').attr("disabled","disabled");
	$('input[name="formulaProcessActive.isMixQuality_check"]').attr("disabled","disabled");
	//选择类型之前固定数量不可编辑
	$('input[name="formulaProcessActive.isMixQuality"]').disabledSelect();
	//选择类型之前单位数量不可编辑
	$("#formulaProcessActive_standardQuantity").attr("readonly",true);
	//选择类型之前损耗率不可编辑
	$("#formulaProcessActive_lossRate").attr("readonly",true);
	//选择类型之前上限不可编辑
	$("#formulaProcessActive_maxQuality").attr("readonly",true);
	//选择类型之前下限不可编辑
	$("#formulaProcessActive_minQuality").attr("readonly",true);
	//选择类型之前检测方案不可编辑
	$("input[name='formulaProcessActive.testProduct.name']").attr("readonly",true);
	$("#formulaProcessActive_testProduct_name_click_button").css("display","none");
	//选择类型之前采样点不可编辑
	$("#formulaProcessActive_pickSite_name").attr("readonly",true);
	$("#formulaProcessActive_pickSite_name_click_button").css("display","none");
	//禁用机动投料
	$("[name='formulaProcessActive.isAgile_check']").attr("disabled",true);
	//去除lable
	$("#formulaProcessActive_testProduct_name_mneTipLabel").css("display","none");
	//选择类型之前质量标准不可编辑
	$("#formulaProcessActive_qualityStandard_name_click_button").css("display","none");
}

//控制系统执行
function autoOperate(){
	var autoValue=$('input[name="formulaProcessActive.auto"]').val();
	setTimeout(function(){
		if(autoValue=='true'){
			$("#formulaProcessActiveexeSystemid").disabledSelect(); 
		}
	},300);
	$('#formulaProcessActiveexeSystemid').disabledSelect();
	if(autoValue=='true'){
		//不可选
		$('#formulaProcessActiveexeSystemid').disabledSelect();
		//如果自动为false，将批控选项删掉
		$('#formulaProcessActiveexeSystemid').setValue('RMsystem/system1');
		//移动端
		$("[name='formulaProcessActive.mobileTerminal_check']").attr("disabled",true);
		//投料顺序
		$("[name='formulaProcessActive.actOrder']").attr("readonly",true);
		$("[name='formulaProcessActive.actOrder']").val("");
		$("#formulaProcessActive_actOrder").parents("td").prev().css({color:"#000000"})						  
	}else if(autoValue=='false'){
		$("#formulaProcessActiveexeSystemid option[value='RMsystem/system1']").remove();
		//移动端
		$("[name='formulaProcessActive.mobileTerminal_check']").attr("disabled",false);
	}
}


	var code;//编码
	var name;//名称
	var edition;//版本
	var productCode;//产品编码
	var productType;//生产性质
	var useFor;//用途
	var isForProduct;//生产配方
	var formulaType;//配方类型
	var batchContral;//批孔
	var interfaceUrlid;//中间服务器地址

	// 自定义批控配方扫把按钮调用的函数
	function formula_batchFormula_batchFormulaId_delete(){
		$('input[name="formula.batchFormula.batchFormulaId"]').val('');
		$('#formula_batchFormula_formulaCode').val('');
		$('#formula_batchFormula_edition').val('');
		$('#formula_batchFormulaID').val('');
		$('input[name="formula.batchFormula.id"]').val('');
		
		$('#formula_code').val(''); //编码
		$('#formula_name').val(''); //标识
		$('#formula_edition').val(''); //版本
		
		//中间服务接口地址清空
		$('[name="formula.interfaceUrl.id"]').val('');
		$('[name="formula.interfaceUrl.value"]').val('');
		
		//去掉勾选批控，设为不可编辑
		$("[name='formula.batchContral_check']").removeAttr('checked');
		$("[name='formula.batchContral']").val(false);
		$("[name='formula.batchContral_check']").attr("disabled", 'true');
		$("[name='formula.batchOverOnFinish_check']").removeAttr('checked');
		$("[name='formula.batchOverOnFinish']").val(false);
		$("input[name='formula.batchOverOnFinish_check']").attr('disabled','true');
	}

/************************************************配方活动复制start*********************************************************/
var processRef_processId = '';
function openProcessRef(){
	var row = FormulaProcess_dg1487242802285Widget.getSelectedRow();
	if(undefined == row){
		workbenchErrorBarWidget.showMessage("${getText('RM.custom.randon1551921770189')}","f");
	}else{
		processRef_processId = FormulaProcess_dg1487242802285Widget.getCellValue(row,'id');
		var formulaId = FormulaProcess_dg1487242802285Widget.getCellValue(row,'formulaId.id');//配方id
	    var refUrl = "/RM/formula/formulaProcess/formulaProcessRef.action";
	    var refParam = "formulaId="+formulaId;
	    //打开'工序参照'视图
	    processDialogShow('other',refUrl,'工序参照',refParam);
	}
}
    
var process_dialog;
function processDialogShow(type,url,title,refparam){
    process_dialog = foundation.common.select({
        pageType : type,
        closePage : false,
        callBackFuncName : '_process_Callback',
        url : url,
        title : title,
        params : refparam
    });
}

function _process_Callback(obj){
	var selectedRow = ec_RM_formula_formulaProcess_formulaProcessRef_queryWidget.getSelectedRow()[0];//当前选中行
	var refProcessId = selectedRow.id;//工序id
	var processName = selectedRow.name;//工序名称
	var formulaCode = selectedRow.formulaId.code;//配方编码
	var refUrl = "/RM/formula/formula/copyFormulaProcessActivity.action";
	var refParam = "processId="+processRef_processId+"&refProcessId="+refProcessId;
	console.log(refParam);

	$.ajax({
		url: refUrl+"?"+refParam,
		type: 'GET',
		success: function(msg){
			var result=msg.flag;
			if(result==''){
				RM_formula_formulaProcess_formulaProcessRefErrorbarWidget.showMessage('添加成功！正在关闭窗口...','s');
				setTimeout(function(){process_dialog.close();},500);
              	// 设置参照过工序标志
              	$('input[name="formula.isCopyActivity_check"]').attr("checked",true);
				$('input[name="formula.isCopyActivity"]').attr("value",true);
              	// 因为在后台更新了isCopyActivity字段, 所以要同时更新前台页面的version, 以保持和数据库里的version一致
              	//var currentVersion = parseInt($('input[name="formula.version"]').val());
              	//$('input[name="formula.version"]').val(currentVersion + 1);
			}else{
				RM_formula_formulaProcess_formulaProcessRefErrorbarWidget.showMessage(result,'f');
			}
		}
	});
	//打开'活动参照'视图
	//activeDialogShow('other',refUrl,'活动参照',refParam);
    //process_dialog.close();
}

var active_dialog;
function activeDialogShow(type,url,title,refparam){
    active_dialog = foundation.common.select({
        pageType : type,
        closePage : true,
        callBackFuncName : '_active_Callback',
        url : url,
        title : title,
        params : refparam
    });
}

function _active_Callback(obj){

	var rows = ec_RM_formula_formulaProcessActive_formulaActiveRef_queryWidget.getSelectedRow();
	var formulaId = rows[0].formulaId.id;//配方id
	var processId = rows[0].processId.id;//工序id
	var batchPhaseIDs = [];
	var ids = [];
	var originBatchPhaseIDs = [];
	
	for(var i=0; i<FormulaProcessActive_dg1487554913298Widget.getRowLength(); i++){
		originBatchPhaseIDs.push(FormulaProcessActive_dg1487554913298Widget.getCellValue(i,'batchPhaseID'));
	}

	for(var i=0; i<rows.length; i++){
		//console.log(rows[i].batchPhaseID);
		//batchPhaseIDs += rows[i].batchPhaseID + ",";
		batchPhaseIDs.push(rows[i].batchPhaseID);
		//ids += rows[i].id + ",";
		ids.push(rows[i].id);
	}
	console.log('参照的活动ID: '+ids);
	console.log('参照的活动PhaseID: '+batchPhaseIDs);
	console.log('原有的活动PhaseID: '+originBatchPhaseIDs);
	batchPhaseIDs = deleteRepetion(batchPhaseIDs);
	originBatchPhaseIDs = deleteRepetion(originBatchPhaseIDs);
	console.log('过滤后,参照的活动PhaseID: '+batchPhaseIDs);
	console.log('过滤后,原有的活动PhaseID: '+originBatchPhaseIDs);
	
	if(originBatchPhaseIDs.length>=batchPhaseIDs.length){
		console.log("可参照");
	}else{
		console.log("参照活动PhaseID数大于原有活动PhaseID数, 不可参照");
	}
	active_dialog.close();
	process_dialog.close();
}

//过滤重复的数组元素
function deleteRepetion(arr){
    var arrTable = {},arrData = [];
    for (var i = 0; i < arr.length; i++) {
        if( !arrTable[ arr[i] ]){
            arrTable[ arr[i] ] = true;
            arrData.push(arr[i]);
        }
    }
    return arrData;
}

/************************************************配方活动复制end*********************************************************/

/*
 *table TD对象
 *key 
 *direct "asc" 或者 "desc"
 */
function tableSort(table,key,direct) {
    /*
	 * if sort click event is disabled when drag event, return false
	 */
	 table = table._DT
	var oCell = $(table._hthead).find("td[key='" + key + "']")[0]
	var formObj=null;
	//20170112 bugfree24172 获取是否可编辑pt
	var isEditAble = table.configs.editable;
	
	if (table.get('formId')){
		formObj = CUI('#' + table.get('formId'));		
	}else{
		formObj = CUI('#QueryForm');			
	} 
    if (table._disableSortClickEvent ) {
        table._disableSortClickEvent = false;
        return false;
    }
    var lockCount;
	
	if( table.lockColumnCount ){
		lockCount = table.lockColumnCount;
		table.unlockColumn( table.lockColumnCount );	
	}
    table.fireEvent('thClick', oCell);
	
    if ( table.frontSortKey && table.frontSortKey === key ) {
    	
		if(direct == 'asc'){
    		table._frontSortArrow.className='dg-hd-td-sort-desc';
    		table._sortMethod = toUpperCase(direct);//同步后台排序数据
    		table._sortKey=key;
    		table.needSort=true;
    	}else{
    		table.requestsort=true;
        	table._frontSortArrow = null;
        	$('span[class^="dg-hd-td-sort-"]' , table._dtHeadEl).remove();
        	
        	//20170120 bugfree24230 前台排序第三次不发起请求，统一前台排序 
			table._frontSortArrow = table._createElement('span', oCell.firstChild, 'dg-hd-td-sort-asc');
			oCell.firstChild.appendChild(table._frontSortArrow);
			table.frontSortKey = key;
			table._sortMethod = toUpperCase(direct);
			table._sortKey=key;
			table.needSort=true;
    	}

    	
    }
	
	var sortArray = [];
	for (var i = 0; i < table._bTbody.rows.length; i++) {
		var oTd = table._bTbody.rows[i].cells[oCell.cellIndex];
		
		while (oTd.hasChildNodes() && oTd.tagName != 'SELECT') {
			oTd = oTd.firstChild;
		}
		sortArray[i] = {};
		sortArray[i].o = table._bTbody.rows[i];
		sortArray[i].f = table._bTbody.rows[i];
		sortArray[i].v = oTd.nodeValue ? oTd.nodeValue : oTd.value ? oTd.value: '';
	}
	
	/* array sort */
	sortArray.sort(table._cp);
	
	if (direct == 'desc') {
		sortArray.reverse();
	} 

    var selectedRows = [];
    for (var i = 0; i < table.selectedRows.length; i++) {
    	selectedRows.push(table.selectedRows[i].rowHtmlObj);
        table._setUnSelected(table.selectedRows[i].rowHtmlObj);
        i--;
    }
    var rowsJsonObj = [];
    /* rowsJsonObj sort */
    for (var i = 0, l = sortArray.length; i < l; i++) {
        rowsJsonObj.push(table.rowsJsonObj[sortArray[i].o.rowIndex]);
    }
    table.rowsJsonObj = rowsJsonObj;
    /* row sort */
    for (var i = 0, l = sortArray.length; i < l; i++) {
        table._bTbody.appendChild(sortArray[i].o);
    }

    table.selectedRows = [];
    for (var i = 0; i < selectedRows.length; i++) {
        table._setSelected(selectedRows[i]);
    }
    table._setfbuttonBar();
    table.setOrderNumber();
    if( lockCount ){
		table.lockColumn( lockCount );
	}
}
/* CUSTOM CODE END */
		RM.formula.formula.formulaEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_formulaEdit,onloadForProduct,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		RM.formula.formula.formulaEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_formulaEdit,onsaveForProduct,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */		
		}
		
function addBatch(){
    if(code != $("#formula_code").val() || name != $("#formula_name").val() || edition != $("#formula_edition").val() 
		|| productCode != $("#formula_product_productCode").val() || productType != $("#formulaproduceTypeid").val() 
		|| useFor != $("#formulausedForid").val() || isForProduct != $("input[name='formula.isForProduct']").val()
		|| formulaType != $("#formula_formulaType_name").val() || batchContral != $("input[name='formula.batchContral']").val()
		|| interfaceUrlid != $("#formulainterfaceUrlid").val()){
		
		workbenchErrorBarWidget.showMessage("配方已修改，请保存后重新创建批控配方","f");
		return false;
	}	
    if($("[name='formula.batchContral']").val() != 'true'){//未勾选批控
		workbenchErrorBarWidget.showMessage("配方未勾选批控，不允许创建批控配方", 'f');
		return false;
	}
	
	//如果batchFormulaID 不为空，说明配方已经同步过到批控，则类型不允许再次新建
	var  batchFormulaID=$('input[name="formula.batchFormulaID"]').val()
	if(batchFormulaID!=null && batchFormulaID!=""){
		workbenchErrorBarWidget.showMessage("配方已关联批控配方，不允许创建批控配方", 'f');
		return false;
	}
	
	var id = $("#id").val();
	$.ajax({
		url : "/RM/interfaceService/interfaceSyncLog/addFormulaToBatch.action",
		type : 'post',
		async : false,
		data:{"mesid":id},
		success : function(res) {
			console.log(res);
			if(res==false){
				workbenchErrorBarWidget.showMessage("新建失败", 'f');
				window.location.reload();
			}else{
				workbenchErrorBarWidget.showMessage("新建成功", 's');
				window.location.reload();
			}
		}
	});
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
				<div class="sidebar-top"><a href="#"  onclick="RM.formula.formula.formulaEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.formula.formula.formulaEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(formula.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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