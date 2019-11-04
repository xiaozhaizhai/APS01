<!-- RM_7.5.0.0/formula/easyFormulaEdit -->
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
<#assign editPageNs = "RM.formula.formula.easyFormulaEdit">
<#-- 模型名称-->
<#assign modelName = "formula">
<#-- 视图编码-->
<#assign viewCode = "RM_7.5.0.0_formula_easyFormulaEdit">
<#-- 实体编码-->
<#assign entity_code = "RM_7.5.0.0_formula">
<#-- 视图名称-->
<#assign viewName = "easyFormulaEdit">
<#-- datagrid编码-->
<#assign datagridCode = "RM_formula_formula_easyFormulaEdit_datagrids">
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
<#assign editFormId = "RM_formula_formula_easyFormulaEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( formula.pending.taskDescription)!>
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
        <#assign configTitle = getText('RM.viewtitle.randon1491547847621')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#RM_formula_formula_easyFormulaEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('RM.formula.formula.easyFormulaEdit');
			RM.formula.formula.easyFormulaEdit.currentUser = ${userJson};
			RM.formula.formula.easyFormulaEdit.currentStaff = ${staffJson};
			RM.formula.formula.easyFormulaEdit.currentDepartment = ${deptJson};
			RM.formula.formula.easyFormulaEdit.currentPosition = ${postJson};
			RM.formula.formula.easyFormulaEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_easyFormulaEdit,head,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="formula.sampleProj.id,formula.product.id,formula.qualityStandard.id,formula.pickSite.id,formula.formulaType.id,formula.id," onsubmitMethod="RM.formula.formula.easyFormulaEdit.beforeSubmitMethod()" id="RM_formula_formula_easyFormulaEdit_form" namespace="/RM/formula/formula/easyFormulaEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_formula_Formula&_bapFieldPermissonModelName_=Formula&superEdit=${(superEdit!false)?string}" editPageNs="RM.formula.formula.easyFormulaEdit" callback="RM.formula.formula.easyFormulaEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_formula_formula_easyFormulaEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="RM_formula_formula_easyFormulaEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="formula.sampleProj.id" value="${(formula.sampleProj.id)!""}" originalvalue="${(formula.sampleProj.id)!""}"/>
					<input type="hidden" name="formula.product.id" value="${(formula.product.id)!""}" originalvalue="${(formula.product.id)!""}"/>
					<input type="hidden" name="formula.qualityStandard.id" value="${(formula.qualityStandard.id)!""}" originalvalue="${(formula.qualityStandard.id)!""}"/>
					<input type="hidden" name="formula.pickSite.id" value="${(formula.pickSite.id)!""}" originalvalue="${(formula.pickSite.id)!""}"/>
					<input type="hidden" name="formula.formulaType.id" value="${(formula.formulaType.id)!""}" originalvalue="${(formula.formulaType.id)!""}"/>
					<input type="hidden" name="formula.id" value="${(formula.id)!""}" originalvalue="${(formula.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "RM_formula_formula_easyFormulaEdit_form"+"_attcount";
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488246312092')}" >${getText('RM.propertydisplayName.randon1488246312092')}</label>
				</td>
				
						<#assign formula_code_defaultValue  = ''>
							 							<#assign formula_code_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
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
								<input property_type="TEXT" name="formula.name" id="formula_name"  style=";" originalvalue="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" value="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487139592239')}" >${getText('RM.propertydisplayName.randon1487139592239')}</label>
				</td>
				
						<#assign formula_edition_defaultValue  = ''>
							 							<#assign formula_edition_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
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
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.radion141577264483332')}" >${getText('RM.propertydisplayName.radion141577264483332')}</label>
				</td>
				
						<#assign formula_product_productCode_defaultValue  = ''>
														<#assign formula_product_productCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1478746948423')}" viewType="${viewType!}" deValue="${formula_product_productCode_defaultValue!}" conditionfunc="RM.formula.formula.easyFormulaEdit._querycustomFunc('formula_product_productCode')"  value="${(formula.product.productCode)!}" displayFieldName="productCode" name="formula.product.productCode" id="formula_product_productCode" type="other" url="/MESBasic/product/product/refProductLayout_kc.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_easyFormulaEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout_kc" onkeyupfuncname=";_callback_formula_product_productCode(obj);" cssStyle="" isEdit=true beforecallback='beforeProBack(obj)'    isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_easyFormulaEdit_form',obj, 'formula.product', '/MESBasic/product/product/refProductLayout_kc.action');
												CUI.commonFills('RM_formula_formula_easyFormulaEdit_form', 'formula.product',obj,true);
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
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.product.productName" id="formula_product_productName"  style=";" originalvalue="<#if !newObj || (formula.product.productName)?has_content>${(formula.product.productName?html)!}<#else>${formula_product_productName_defaultValue!}</#if>" value="<#if !newObj || (formula.product.productName)?has_content>${(formula.product.productName?html)!}<#else>${formula_product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076555894')}" >${getText('RM.propertydisplayName.randon1487076555894')}</label>
				</td>
				
						<#assign formula_produceType_defaultValue  = ''>
							 							<#assign formula_produceType_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_produceType_defaultValue!}" formId="RM_formula_formula_easyFormulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.produceType.id" code="produceType" value="${(formula.produceType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_easyFormulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.produceType.id" code="produceType" value="${(formula.produceType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076506987')}" >${getText('RM.propertydisplayName.randon1487076506987')}</label>
				</td>
				
						<#assign formula_usedFor_defaultValue  = ''>
							 							<#assign formula_usedFor_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_usedFor_defaultValue!}" formId="RM_formula_formula_easyFormulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.usedFor.id" code="usedFor" value="${(formula.usedFor.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_easyFormulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.usedFor.id" code="usedFor" value="${(formula.usedFor.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076528539')}" >${getText('RM.propertydisplayName.randon1487076528539')}</label>
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
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1497849094442')}" >${getText('RM.propertydisplayName.randon1497849094442')}</label>
				</td>
				
						<#assign formula_formulaType_name_defaultValue  = ''>
														<#assign formula_formulaType_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1497851445735')}" viewType="${viewType!}" deValue="${formula_formulaType_name_defaultValue!}" conditionfunc="RM.formula.formula.easyFormulaEdit._querycustomFunc('formula_formulaType_name')"  value="${(formula.formulaType.name)!}" displayFieldName="name" name="formula.formulaType.name" id="formula_formulaType_name" type="other" url="/RM/formulaType/formulaType/typeRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_easyFormulaEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_formulaType_typeRef"  onkeyupfuncname=";_callback_formula_formulaType_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.formulaType.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.formulaType.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_easyFormulaEdit_form',obj, 'formula.formulaType', '/RM/formulaType/formulaType/typeRef.action');
												CUI.commonFills('RM_formula_formula_easyFormulaEdit_form', 'formula.formulaType',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487595139633232')}" >${getText('RM.propertydisplayName.randon1487595139633232')}</label>
				</td>
				
						<#assign formula_qualityStandard_name_defaultValue  = ''>
														<#assign formula_qualityStandard_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1487596068024')}" viewType="${viewType!}" deValue="${formula_qualityStandard_name_defaultValue!}" conditionfunc="RM.formula.formula.easyFormulaEdit._querycustomFunc('formula_qualityStandard_name')"  value="${(formula.qualityStandard.name)!}" displayFieldName="name" name="formula.qualityStandard.name" id="formula_qualityStandard_name" type="other" url="/RM/qualityStandard/stand/standRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_easyFormulaEdit_form" editCustomCallback="standCakkBack(obj);" refViewCode="RM_7.5.0.0_qualityStandard_standRef"  onkeyupfuncname="standCakkBack(obj);_callback_formula_qualityStandard_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.qualityStandard.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.qualityStandard.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_easyFormulaEdit_form',obj, 'formula.qualityStandard', '/RM/qualityStandard/stand/standRef.action');
												CUI.commonFills('RM_formula_formula_easyFormulaEdit_form', 'formula.qualityStandard',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									RM.formula.formula.easyFormulaEdit.query_formula_qualityStandard_name = function() {
										return "product="+$("[name='formula.product.id']").val();
									}
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.entityname.randon1490317690671')}" >${getText('RM.entityname.randon1490317690671')}</label>
				</td>
				
						<#assign formula_sampleProj_name_defaultValue  = ''>
														<#assign formula_sampleProj_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('RM.viewtitle.randon1490318000877')}" viewType="${viewType!}" deValue="${formula_sampleProj_name_defaultValue!}" conditionfunc="RM.formula.formula.easyFormulaEdit._querycustomFunc('formula_sampleProj_name')"  value="${(formula.sampleProj.name)!}" displayFieldName="name" name="formula.sampleProj.name" id="formula_sampleProj_name" type="other" url="/RM/sampleProj/sampleProj/sampleProjRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_easyFormulaEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_sampleProj_sampleProjRef" onkeyupfuncname=";_callback_formula_sampleProj_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.sampleProj.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.sampleProj.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_easyFormulaEdit_form',obj, 'formula.sampleProj', '/RM/sampleProj/sampleProj/sampleProjRef.action');
												CUI.commonFills('RM_formula_formula_easyFormulaEdit_form', 'formula.sampleProj',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.entityname.randon1503469599671')}" >${getText('RM.entityname.randon1503469599671')}</label>
				</td>
				
						<#assign formula_pickSite_name_defaultValue  = ''>
														<#assign formula_pickSite_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1503470970689')}" viewType="${viewType!}" deValue="${formula_pickSite_name_defaultValue!}" conditionfunc="RM.formula.formula.easyFormulaEdit._querycustomFunc('formula_pickSite_name')"  value="${(formula.pickSite.name)!}" displayFieldName="name" name="formula.pickSite.name" id="formula_pickSite_name" type="other" url="/RM/pickSite/pickSite/pickSiteRefLayOut.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_easyFormulaEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_pickSite_pickSiteRefLayOut"  onkeyupfuncname=";_callback_formula_pickSite_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.pickSite.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.pickSite.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_easyFormulaEdit_form',obj, 'formula.pickSite', '/RM/pickSite/pickSite/pickSiteRefLayOut.action');
												CUI.commonFills('RM_formula_formula_easyFormulaEdit_form', 'formula.pickSite',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon149015076701111')}" >${getText('RM.propertydisplayName.randon149015076701111')}</label>
				</td>
				
						<#assign formula_supportEbr_defaultValue  = ''>
							 							<#assign formula_supportEbr_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.supportEbr_check" originalvalue="<#if !newObj><#if (formula.supportEbr)??>${(formula.supportEbr!false)?string('true','false')}<#else>false</#if><#elseif formula_supportEbr_defaultValue?has_content>${(formula_supportEbr_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formula.supportEbr)??>${(formula.supportEbr!false)?string('true','false')}<#else>false</#if><#else>${(formula_supportEbr_defaultValue!true)?string}</#if>" onclick='ebrChange()' />
								
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490010654922')}" >${getText('RM.propertydisplayName.randon1490010654922')}</label>
				</td>
				
						<#assign formula_state_defaultValue  = 'RMstate/state1'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_state_defaultValue!}" formId="RM_formula_formula_easyFormulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.state.id" code="RMstate" value="${(formula.state.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_easyFormulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.state.id" code="RMstate" value="${(formula.state.id)!}"  />
									
								</#if>
							
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
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490578864812')}" >${getText('RM.propertydisplayName.randon1490578864812')}</label>
				</td>
				
						<#assign formula_setProcess_defaultValue  = 'formulaProperty/formulaProperty2'>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_setProcess_defaultValue!}" formId="RM_formula_formula_easyFormulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.setProcess.id" code="formulaProperty" value="${(formula.setProcess.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_easyFormulaEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formula.setProcess.id" code="formulaProperty" value="${(formula.setProcess.id)!}"  />
									
								</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("RM_7.5.0.0_formula_Formula", "RM_7.5.0.0_formula_easyFormulaEdit", 'EDIT')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="RM_formula_formula_easyFormulaEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${formula[columnName]!}" seniorSystemCode=isS2 />
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
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${formula[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="RM_formula_formula_easyFormulaEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487076858348')}" >${getText('RM.propertydisplayName.randon1487076858348')}</label>
				</td>
				
						<#assign formula_description_defaultValue  = ''>
							 							<#assign formula_description_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formula.description" id="formula_description"  style=";" originalvalue="<#if !newObj || (formula.description)?has_content>${(formula.description?html)!}<#else>${formula_description_defaultValue!}</#if>" value="<#if !newObj || (formula.description)?has_content>${(formula.description?html)!}<#else>${formula_description_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr >
						<#assign complex_datagrid_1491548179053_defaultValue  = ''>
				<td nullable=false class="edit-table-content"  colspan="6" style="text-align: left;;" >
				</td>
		</tr>
	</table>
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
								<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaBom", "RM_7.5.0.0_formula_easyFormulaEditdg1491547759425", "DATAGRID", "formulaBom")>
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
								function FormulaBom_dg1491547759425_addRow(event)
																{
	//增行
	FormulaBom_dg1491547759425Widget.addRow();
	
	ebrHide();
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formula/data-dg1491547759425.action?formula.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_easyFormulaEditdg1491547759425">
			<#else>
				<#assign dUrl="/RM/formula/formula/data-dg1491547759425.action?formula.id=${(formula.id)!-1}&datagridCode=RM_7.5.0.0_formula_easyFormulaEditdg1491547759425">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1530012487798')}\",handler:function(event){DT_FormulaBom_dg1491547759425_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1491630292458')}\",handler:function(event){FormulaBom_dg1491547759425_addRow(event)},iconClass:\"cui-btn-none\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1530012487798')}\",handler:function(event){DT_FormulaBom_dg1491547759425_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1491630292458')}\",handler:function(event){FormulaBom_dg1491547759425_addRow(event)},iconClass:\"cui-btn-none\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaBom_dg1491547759425" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1491547759425_id" value="FormulaBom_dg1491547759425" />
			
			<input type="hidden" id="dg1491547759425_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487243065955')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formula/data-dg1491547759425.action?operateType=export&datagridCode=RM_7.5.0.0_formula_easyFormulaEditdg1491547759425"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaBom_dg1491547759425" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FormulaBom_dg1491547759425" viewType="${viewType}" renderOverEvent="dg1491547759425RenderOverEvent" route="${routeFlag}" formId="RM_formula_formula_easyFormulaEdit_form" noPermissionKeys="productId.productCode,productId.productName,productId.id,property,unitQuality,productId.productBaseUnit.name,isMixQuality,phase,sequence,needWeigh,minQuality,maxQuality,lossRate,meno" modelCode="RM_7.5.0.0_formula_FormulaBom" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1491547759425" dtPage="dgPage"  hidekeyPrefix="dg1491547759425" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName','productId.id','productId.id','productId.id','productId.productBaseUnit.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1491547759425PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="RM.buttonPropertyshowName.radion1530012487798,DELETEROW,del;RM.buttonPropertyshowName.radion1491630292458,addRow,none" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
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

										
										
										
										
										

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true  callbackname="callBackPro(obj)" selectCompName="RM.formula.formula.easyFormulaEdit"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout_kc.action" viewCode="MESBasic_1_product_refProductLayout_kc" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1478746948423')}"  label="${getText('RM.propertydisplayName.radion14157726448331')}" width=120 showFormatFunc="" beforecallback="callpro(obj)"  />
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

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formula.easyFormulaEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('RM.propertydisplayName.radion14157727407371')}" width=120 showFormatFunc=""  />
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

									<@datacolumn key="productId.id"        showFormat="TEXT" defaultValue="${(productId_id_defaultValue!)?string}" defaultDisplay="${(productId_id_displayDefaultType!)?string}" decimal="" editable=false type="long" showType="long" notnull=false   selectCompName="RM.formula.formula.easyFormulaEdit"  textalign="left" hiddenCol=true viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.randon1449796384550')}" width=100 showFormatFunc=""  />
							<#assign property_displayDefaultType=''>
								<#assign property_defaultValue='RMproperty/property1'>
										 									<@systemCodeColumn code="RMproperty" textalign="left" defaultValue="${(property_defaultValue!)?string}" key="property.id" editable=true type="selectcomp" notnull=true     label="${getText('RM.propertydisplayName.randon1490010423584')}" width=60   />
							<#assign unitQuality_displayDefaultType=''>
								<#assign unitQuality_defaultValue=''>
										<#assign unitQuality_defaultValue=''>
										  
									<@datacolumn key="unitQuality"        showFormat="TEXT" defaultValue="${(unitQuality_defaultValue!)?string}" defaultDisplay="${(unitQuality_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon14872431390911')}" width=100 showFormatFunc=""  />
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

									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formula.easyFormulaEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('RM.propertydisplayName.radion139823564048323')}" width=100 showFormatFunc=""  />
							<#assign isMixQuality_displayDefaultType=''>
								<#assign isMixQuality_defaultValue='false'>
										 
										
										
										
										
										
 
									<@datacolumn key="isMixQuality"        showFormat="CHECKBOX" defaultValue="${(isMixQuality_defaultValue!)?string}" defaultDisplay="${(isMixQuality_displayDefaultType!)?string}" onchange="FormulaBom_dg1491547759425Widget.evalCustomFunction(nRow,sFieldName,'isMixQualityChange(nRow)')" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852241781')}" width=60 showFormatFunc=""  />
							<#assign phase_displayDefaultType=''>
								<#assign phase_defaultValue=''>
										<#assign phase_defaultValue=''>
										  
									<@datacolumn key="phase"        showFormat="TEXT" defaultValue="${(phase_defaultValue!)?string}" defaultDisplay="${(phase_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1503477430704')}" width=60 showFormatFunc=""  />
							<#assign sequence_displayDefaultType=''>
								<#assign sequence_defaultValue=''>
										<#assign sequence_defaultValue=''>
										  
									<@datacolumn key="sequence"        showFormat="TEXT" defaultValue="${(sequence_defaultValue!)?string}" defaultDisplay="${(sequence_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1503477288458')}" width=60 showFormatFunc=""  />
							<#assign needWeigh_displayDefaultType=''>
								<#assign needWeigh_defaultValue=''>
										<#assign needWeigh_defaultValue=''>
										  
									<@datacolumn key="needWeigh"        showFormat="CHECKBOX" defaultValue="${(needWeigh_defaultValue!)?string}" defaultDisplay="${(needWeigh_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon150347726245811123123')}" width=60 showFormatFunc=""  />
							<#assign minQuality_displayDefaultType=''>
								<#assign minQuality_defaultValue=''>
										<#assign minQuality_defaultValue=''>
										  
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852437576')}" width=120 showFormatFunc=""  />
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										  
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852460357')}" width=120 showFormatFunc=""  />
							<#assign lossRate_displayDefaultType=''>
								<#assign lossRate_defaultValue=''>
										<#assign lossRate_defaultValue=''>
										  
									<@datacolumn key="lossRate"        showFormat="TEXT" defaultValue="${(lossRate_defaultValue!)?string}" defaultDisplay="${(lossRate_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1491544403180')}" width=120 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaBom", "RM_7.5.0.0_formula_easyFormulaEditdg1491547759425", "DATAGRID", "formulaBom")>
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
											<#assign selectCompName = 'RM.formula.formula.easyFormulaEdit'>
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
							<#assign meno_displayDefaultType=''>
								<#assign meno_defaultValue=''>
										<#assign meno_defaultValue=''>
										  
									<@datacolumn key="meno"  popView=true      showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852483896')}" width=200 showFormatFunc=""  />
			
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
				function FormulaBom_dg1491547759425_check_datagridvalid(){
					//
					var errorObj =FormulaBom_dg1491547759425Widget._DT.testData();
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
				
				function savedg1491547759425DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaBom_dg1491547759425Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaBom_dg1491547759425Widget') > -1) {
						FormulaBom_dg1491547759425Widget.setAllRowEdited();
					}
					var json = FormulaBom_dg1491547759425Widget.parseEditedData();
					$('input[name="dg1491547759425ListJson"]').remove();
					$('input[name="dgLists[\'dg1491547759425\']"]').remove();
					$('input[name="dg1491547759425ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1491547759425\']">').val(json).appendTo($('#RM_formula_formula_easyFormulaEdit_form'));
					$('<input type="hidden" name="dg1491547759425ModelCode">').val('RM_7.5.0.0_formula_FormulaBom').appendTo($('#RM_formula_formula_easyFormulaEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1491547759425ListJson">').val(json).appendTo($('#RM_formula_formula_easyFormulaEdit_form'));
				}
				function DT_FormulaBom_dg1491547759425_deldatagrid(){
					var deleteRows = FormulaBom_dg1491547759425Widget.deleteRows();
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
						if($("#dg1491547759425DeletedIds").length>0){
							$("#dg1491547759425DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1491547759425DeletedIds" name="dgDeletedIds[\'dg1491547759425\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_easyFormulaEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1491547759425DeletedIds['+CUI('input[name^="dg1491547759425DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_easyFormulaEdit_form'));
					});
					return deleteRows;
				}
				function DT_FormulaBom_dg1491547759425_delTreeNodes(){
					var deleteRows = FormulaBom_dg1491547759425Widget._DT.removeTreeNode();
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
						if($("#dg1491547759425DeletedIds").length>0){
							$("#dg1491547759425DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1491547759425DeletedIds" name="dgDeletedIds[\'dg1491547759425\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_easyFormulaEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1491547759425DeletedIds['+CUI('input[name^="dg1491547759425DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_easyFormulaEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formula_easyFormulaEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<1;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'FormulaBom_dg1491547759425') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'FormulaBom_dg1491547759425';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'FormulaBom_dg1491547759425';
					}
					$('body').data('RM_formula_formula_easyFormulaEdit_datagrids', datagrids);
				});
				
				var FormulaBom_dg1491547759425_importDialog = null;
				function FormulaBom_dg1491547759425_showImportDialog(){
					try{
						if(FormulaBom_dg1491547759425_importDialog!=null&&FormulaBom_dg1491547759425_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formula/initImport.action?datagridCode=RM_7.5.0.0_formula_easyFormulaEditdg1491547759425&tid=${id!}&datagridName=dg1491547759425";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_easyFormulaEditdg1491547759425_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						FormulaBom_dg1491547759425_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaBom_dg1491547759425"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaBom_dg1491547759425_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaBom_dg1491547759425_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaBom_dg1491547759425_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaBom_dg1491547759425_downLoadFile(){
					var url = "/RM/formula/formula/downLoad.action?datagridCode=RM_7.5.0.0_formula_easyFormulaEditdg1491547759425&templateRelatedModelCode=RM_7.5.0.0_formula_easyFormulaEditdg1491547759425&downloadType=template&fileName=dg1491547759425";
					window.open(url,"","");
				}
				function dg1491547759425RenderOverEvent(){
					$('div .paginatorbar-operatebar:eq(0) a:eq(1)').insertBefore( $('div .paginatorbar-operatebar:eq(0) a:eq(0)') );
var length = FormulaBom_dg1491547759425Widget.getRowLength();

//当表头EBR字段勾选时，阶段、次序、需要称重列显示；当表头EBR字段未勾选时，阶段、次序、需要称重列隐藏
ebrHide();
$("[key='phase'] .dg-hd-td-inner .dg-hd-td-label").attr("style","width: 60px; color: rgb(179, 3, 3);");
$("[key='sequence'] .dg-hd-td-inner .dg-hd-td-label").attr("style","width: 60px; color: rgb(179, 3, 3);");
				}
				function dg1491547759425PageInitMethod(nTabIndex){
					RM.formula.formula.easyFormulaEdit.initSize(nTabIndex);
					$(".paginatorbar-operatebar span").eq(1).attr("class","buttonbar-button cui-btn-add");
				}
			</script>
			
			
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
     	
		<div id="RM_formula_formula_easyFormulaEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="RM.formula.formula.easyFormulaEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.formula.formula.easyFormulaEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="RM.formula.formula.easyFormulaEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_easyFormulaEdit,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
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
						$("#RM_formula_formula_easyFormulaEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_formula_formula_easyFormulaEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_formula_formula_easyFormulaEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_formula_formula_easyFormulaEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.formula.formula.easyFormulaEdit.initCount = 0;
			RM.formula.formula.easyFormulaEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_formula_formula_easyFormulaEdit_main_div .edit-head").height()-$("#RM_formula_formula_easyFormulaEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_formula_formula_easyFormulaEdit_main_div .edit-workflow").height()</#if>;
				$("#RM_formula_formula_easyFormulaEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_formula_formula_easyFormulaEdit_datagrids');
				var padding_bottom=16;
				$("#RM_formula_formula_easyFormulaEdit_main_div .pd_bottom,#RM_formula_formula_easyFormulaEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_formula_formula_easyFormulaEdit_main_div .edit-panes-s").each(function(index){
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
									if(RM.formula.formula.easyFormulaEdit.initCount <= 2) {
										setTimeout(function(){RM.formula.formula.easyFormulaEdit.initSize();}, 200);
										RM.formula.formula.easyFormulaEdit.initCount++;
									}/* else {
										RM.formula.formula.easyFormulaEdit.initCount = 0;
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
							if(($("#RM_formula_formula_easyFormulaEdit_main_div .edit-workflow").length > 0) && ($("#RM_formula_formula_easyFormulaEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#RM_formula_formula_easyFormulaEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				RM.formula.formula.easyFormulaEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.formula.formula.easyFormulaEdit.initSize();
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
						if(parseInt($("#RM_formula_formula_easyFormulaEdit_main_div").css("width"),10)==650){
							$("#RM_formula_formula_easyFormulaEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.formula.formula.easyFormulaEdit.resizeLayout();
						//RM.formula.formula.easyFormulaEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_formula_formula_easyFormulaEdit_main_div").css("width"),10)==800){
							$("#RM_formula_formula_easyFormulaEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.formula.formula.easyFormulaEdit.resizeLayout();
						//RM.formula.formula.easyFormulaEdit.initSize();
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
					RM.formula.formula.easyFormulaEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.formula.formula.easyFormulaEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.formula.formula.easyFormulaEdit.initSize();});
				/*
				RM.formula.formula.easyFormulaEdit.resizeLayout=function(){
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
			RM.formula.formula.easyFormulaEdit.setDepartment();
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

		RM.formula.formula.easyFormulaEdit.validate = function(){
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
		RM.formula.formula.easyFormulaEdit.beforeSaveProcess = function(){
			try{eval("savedg1491547759425DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#RM_formula_formula_easyFormulaEdit_form').trigger('beforeSubmit');
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
		RM.formula.formula.easyFormulaEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#RM_formula_formula_easyFormulaEdit_form').append(FormulaBom_dg1491547759425Widget._DT.createInputs('dg1491547759425List'));
										</#if>
		};
		RM.formula.formula.easyFormulaEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.formula.formula.easyFormulaEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//RM.formula.formula.easyFormulaEdit.beforeSaveProcess();

			//RM.formula.formula.easyFormulaEdit.processDataGrid();
			$('#RM_formula_formula_easyFormulaEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_formula_formula_easyFormulaEdit_form','RM_formula_formula_easyFormulaEdit_datagrids')) {      
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
		RM.formula.formula.easyFormulaEdit.print = function(){
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
		
		RM.formula.formula.easyFormulaEdit.saveSetting = function(){
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
		
		RM.formula.formula.easyFormulaEdit.printSetting = function(){
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
				RM.formula.formula.easyFormulaEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formula.easyFormulaEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.formula.formula.easyFormulaEdit.settingDialog.show();
			}
		}
		
		
		
		RM.formula.formula.easyFormulaEdit.reject = function(){
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
			RM.formula.formula.easyFormulaEdit.submit();
		}
		
		RM.formula.formula.easyFormulaEdit.submit = function(uncheck){
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
			if(!RM.formula.formula.easyFormulaEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			RM.formula.formula.easyFormulaEdit.beforeSaveProcess();
			
			//RM.formula.formula.easyFormulaEdit.processDataGrid();
			
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
			$('#RM_formula_formula_easyFormulaEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		RM.formula.formula.easyFormulaEdit.recall = function(){
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
		RM.formula.formula.easyFormulaEdit._callBackInfo = function(res){
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
		RM.formula.formula.easyFormulaEdit.setDepartment = function(){
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
				RM.formula.formula.easyFormulaEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.formula.formula.easyFormulaEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.formula.formula.easyFormulaEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.formula.formula.easyFormulaEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.formula.formula.easyFormulaEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.formula.formula.easyFormulaEdit._refViewCode_IE = viewCode;
			} else {
				RM.formula.formula.easyFormulaEdit._refViewCode_IE = '';
			}
			RM.formula.formula.easyFormulaEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.formula.formula.easyFormulaEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.formula.formula.easyFormulaEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.formula.formula.easyFormulaEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.formula.formula.easyFormulaEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.formula.formula.easyFormulaEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.formula.formula.easyFormulaEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.formula.formula.easyFormulaEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(RM.formula.formula.easyFormulaEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(RM.formula.formula.easyFormulaEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				RM.formula.formula.easyFormulaEdit.gridEventObj = gridEventObj;
				callbackName = "RM.formula.formula.easyFormulaEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.formula.formula.easyFormulaEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formula.easyFormulaEdit.getcallBackInfo_DG";
				RM.formula.formula.easyFormulaEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.formula.formula.easyFormulaEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.formula.formula.easyFormulaEdit._prefix = _prefix.substring(1);
			}
			
			RM.formula.formula.easyFormulaEdit._oGrid = oGrid;
			RM.formula.formula.easyFormulaEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.formula.formula.easyFormulaEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.formula.formula.easyFormulaEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.formula.formula.easyFormulaEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.formula.formula.easyFormulaEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.formula.formula.easyFormulaEdit._refViewCode = oColumn.viewCode;
				} else {
					RM.formula.formula.easyFormulaEdit._refViewCode = '';
				}
			} else {
				RM.formula.formula.easyFormulaEdit._isObjCustomProp = false;
				RM.formula.formula.easyFormulaEdit._objCustomPropNames = '';
				RM.formula.formula.easyFormulaEdit._refViewCode = '';
			}
			if (RM.formula.formula.easyFormulaEdit._isObjCustomProp == true && RM.formula.formula.easyFormulaEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.formula.formula.easyFormulaEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.formula.formula.easyFormulaEdit._customCallBack = customCallBack;
			}
			if(RM.formula.formula.easyFormulaEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formula.easyFormulaEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.formula.formula.easyFormulaEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formula.easyFormulaEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.formula.formula.easyFormulaEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formula.easyFormulaEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.formula.formula.easyFormulaEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formula.easyFormulaEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.formula.formula.easyFormulaEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.formula.formula.easyFormulaEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formula.easyFormulaEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.formula.formula.easyFormulaEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.easyFormulaEdit.query_'+obj+'()') : null;
			return str;
		};
		RM.formula.formula.easyFormulaEdit.getcallBackGroupInfo = function(obj){
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
			RM.formula.formula.easyFormulaEdit._dialog.close();
		}
		RM.formula.formula.easyFormulaEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_formula_formula_easyFormulaEdit_form',obj[0], RM.formula.formula.easyFormulaEdit._prefix, RM.formula.formula.easyFormulaEdit._sUrl);
			CUI.commonFills('RM_formula_formula_easyFormulaEdit_form',RM.formula.formula.easyFormulaEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.formula.formula.easyFormulaEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.formula.formula.easyFormulaEdit._customCallBack) {
					eval(RM.formula.formula.easyFormulaEdit._customCallBack);
					RM.formula.formula.easyFormulaEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.easyFormulaEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.formula.formula.easyFormulaEdit.getcallBackInfo_DG_IE = function(obj){
			if(RM.formula.formula.easyFormulaEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formula.easyFormulaEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.formula.formula.easyFormulaEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.formula.formula.easyFormulaEdit._isObjCustomProp_IE == true && RM.formula.formula.easyFormulaEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.formula.formula.easyFormulaEdit._sUrl,RM.formula.formula.easyFormulaEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formula.easyFormulaEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.formula.formula.easyFormulaEdit._isObjCustomProp_IE == true && RM.formula.formula.easyFormulaEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.formula.formula.easyFormulaEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.formula.formula.easyFormulaEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.formula.formula.easyFormulaEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.formula.formula.easyFormulaEdit._refViewCode_IE + '&id=' + id,
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
				if(RM.formula.formula.easyFormulaEdit._customCallBack) {
					eval(RM.formula.formula.easyFormulaEdit._customCallBack);
					RM.formula.formula.easyFormulaEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.easyFormulaEdit._dialog.close();
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
		
		RM.formula.formula.easyFormulaEdit.getcallBackInfo_DG = function(obj){
			if(RM.formula.formula.easyFormulaEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formula.easyFormulaEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.formula.formula.easyFormulaEdit._currRow).next().length==0){
						RM.formula.formula.easyFormulaEdit._oGrid.addNewRow();
					}	
					RM.formula.formula.easyFormulaEdit._currRow = $(RM.formula.formula.easyFormulaEdit._currRow).next();
					$(RM.formula.formula.easyFormulaEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.formula.formula.easyFormulaEdit._currRow,obj[i], RM.formula.formula.easyFormulaEdit._prefix, RM.formula.formula.easyFormulaEdit._sUrl);
				if (RM.formula.formula.easyFormulaEdit._isObjCustomProp == true && RM.formula.formula.easyFormulaEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.formula.formula.easyFormulaEdit._currRow,RM.formula.formula.easyFormulaEdit._prefix,obj[i],RM.formula.formula.easyFormulaEdit._oGrid,RM.formula.formula.easyFormulaEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.formula.formula.easyFormulaEdit._currRow,RM.formula.formula.easyFormulaEdit._prefix,obj[i],RM.formula.formula.easyFormulaEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.formula.formula.easyFormulaEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.formula.formula.easyFormulaEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.formula.formula.easyFormulaEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.formula.formula.easyFormulaEdit._refViewCode + '&id=' + id,
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
									name = RM.formula.formula.easyFormulaEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.formula.formula.easyFormulaEdit._currRow, objs, RM.formula.formula.easyFormulaEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.formula.formula.easyFormulaEdit._customCallBack) {
					eval(RM.formula.formula.easyFormulaEdit._customCallBack);
					RM.formula.formula.easyFormulaEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.easyFormulaEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.formula.formula.easyFormulaEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.formula.formula.easyFormulaEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.formula.formula.easyFormulaEdit._oGrid, RM.formula.formula.easyFormulaEdit._currRow, RM.formula.formula.easyFormulaEdit._key, RM.formula.formula.easyFormulaEdit._displayFieldName, obj[i])
			}
			try{
				if(RM.formula.formula.easyFormulaEdit._customCallBack) {
					eval(RM.formula.formula.easyFormulaEdit._customCallBack);
					RM.formula.formula.easyFormulaEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.easyFormulaEdit._dialog.close();
			} catch(e){}
		};
		
		RM.formula.formula.easyFormulaEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.formula.formula.easyFormulaEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formula_easyFormulaEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			RM.formula.formula.easyFormulaEdit.onloadForProduct();
			/**
if($("[name='formula.code']").val()!="" && $("[name='formula.code']").val()!=null ){
	$("[name='formula.code']").attr("readonly",true);
}
*/
//获取系统编码EBR
var url = "/RM/formula/formula/getIsEBR.action";
var isEBR="";
	$.ajax({
	url : url,
	type : 'get',
	async : false,
	success : function(msg) {
		if(msg!=null){
			isEBR = msg.result;
		}
	}
});
if(isEBR==true){
		
}else{
		//EBR字段只读且值为fasle
		$("[name='formula.supportEbr_check']").attr("disabled",'disabled');
		$("[name='formula.supportEbr']").attr("value",'false');
}

var url = "/RM/formula/formula/getIsLIMS.action";
var isLIMS="";
$.ajax({
	url : url,
	type : 'get',
	async : false,
	success : function(msg) {
		if(msg!=null){
			isLIMS = msg.result;
		}
	}
});
if(isLIMS==true){
		
}else{
		//样品模板不可编辑
		$("#formula_sampleProj_namediv").removeAttr("onmouseenter");
		$("#formula_sampleProj_namediv").unbind('mouseenter');
		$("[name='formula.sampleProj.name']").attr("readonly",true);
		$("#formula_sampleProj_name_click_button").remove();
}
		});

		RM.formula.formula.easyFormulaEdit.beforeSubmitMethodSettingInPage = function(){
			RM.formula.formula.easyFormulaEdit.onsaveForProduct();
			var type = $("#operateType").val();
var type1=$("input[name='workFlowVarStatus']").val();
if(  type =='submit' && type1!='reject' &&  type1!='cancel'  ){
	var length = FormulaBom_dg1491547759425Widget.getRowLength();
	if($("[name='formula.supportEbr']").val()=='true'){
		for(var i = 0 ; i < length ; i++){
			if(FormulaBom_dg1491547759425Widget.getCellValue(i,"phase")==""){
				workbenchErrorBarWidget.showMessage("${getText('RM.showMessage00000019','"+(i+1)+"')}");
				return false;
			}
			if(FormulaBom_dg1491547759425Widget.getCellValue(i,"sequence")==""){
				workbenchErrorBarWidget.showMessage("${getText('RM.showMessage00000020','"+(i+1)+"')}");
				return false;
			}
		}
	}
	for(var i = 0 ; i < length ; i++){
		for(var j = i+1 ; j < length ; j++){
			if(FormulaBom_dg1491547759425Widget.getCellValue(i,"productId.id")==FormulaBom_dg1491547759425Widget.getCellValue(j,"productId.id") && FormulaBom_dg1491547759425Widget.getCellValue(i,"property.id")==FormulaBom_dg1491547759425Widget.getCellValue(j,"property.id")){
				workbenchErrorBarWidget.showMessage("${getText('RM.showMessage00000017')}");
				return false;
			}
		}
	}
}
		};
		RM.formula.formula.easyFormulaEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.formula.formula.easyFormulaEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.formula.formula.easyFormulaEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_formula_formula_easyFormulaEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_formula_formula_easyFormulaEdit_main_div").hide();
				},100);
				//CUI("#RM_formula_formula_easyFormulaEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.formula.formula.easyFormulaEdit.showThis = function(){
			if(!CUI("#RM_formula_formula_easyFormulaEdit_main_div").is(':visible')) {
				CUI("#RM_formula_formula_easyFormulaEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.formula.formula.easyFormulaEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.formula.formula.easyFormulaEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_formula_formula_easyFormulaEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_formula_Formula&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formula.easyFormulaEdit.auditDialog.show();
			</#if>
		}
		
		
		RM.formula.formula.easyFormulaEdit.showInfoDialog=function(mode){
			
			RM.formula.formula.easyFormulaEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_formula_formula_easyFormulaEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formula.easyFormulaEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.formula.formula.easyFormulaEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_formula");
			}
		}
		
		RM.formula.formula.easyFormulaEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/formula/formula/dealInfo-list.action&dlTableInfoId=${(formula.tableInfoId)?default('')}");
			}
		}
		RM.formula.formula.easyFormulaEdit.showFlowInfo=function(){
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
		RM.formula.formula.easyFormulaEdit.supervision=function(){
			RM.formula.formula.easyFormulaEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(formula.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.formula.formula.easyFormulaEdit.modifyOwnerStaffDialog.show();
		}
		
function beforeProBack(obj){
	//获取样品ID
	var productID = obj[0].id;
	
	var old = $("[name='formula.product.id']").val();
	if(old!=productID){
		$("[name='formula.qualityStandard.name']").val("");
		$("[name='formula.qualityStandard.id']").val("");
	}

}
function ebrChange(){
	if($("[name='formula.supportEbr']").val()=='true'){
		for(var i = 0 ; i < FormulaBom_dg1491547759425Widget.getRowLength();i++){
			FormulaBom_dg1491547759425Widget.setCellValue(i,"phase","");
			FormulaBom_dg1491547759425Widget.setCellValue(i,"sequence","");
			FormulaBom_dg1491547759425Widget.setCellValue(i,"needWeigh",false)
		}
		$( 'td[key="phase"]').hide();
		$( 'td[key="sequence"]').hide();
		$( 'td[key="needWeigh"]').hide();
		FormulaBom_dg1491547759425Widget._DT._resizeHeight = true;
		FormulaBom_dg1491547759425Widget._DT._initDomElements();
		FormulaBom_dg1491547759425Widget._DT._resizeHeight = false;
	}else{
		$( 'td[key="phase"]').show();
		$( 'td[key="sequence"]').show();
		$( 'td[key="needWeigh"]').show();
		FormulaBom_dg1491547759425Widget._DT._resizeHeight = true;
		FormulaBom_dg1491547759425Widget._DT._initDomElements();
		FormulaBom_dg1491547759425Widget._DT._resizeHeight = false;
	}
}
function standCakkBack(obj){
	$("#formula_product_productCode").val(obj[0].productID.productCode);
	$("#formula_product_productCode_mneTipLabel").hide();
	$("#formula_product_productName").val(obj[0].productID.productName);
	$("[name='formula.product.id']").val(obj[0].productID.id)

}


function callpro(obj){
	/**
	var len = FormulaBom_dg1491547759425Widget.getRowLength();
	for(var i=0;i<len;i++){
		if(FormulaBom_dg1491547759425Widget.getSelectedRow()!=i){
			var productId = FormulaBom_dg1491547759425Widget.getCellValue(i,"productId.id");
			if(productId==obj[0].id){	//如果id相同，设备已被选，不添加
				ec_MESBasic_product_product_productRefNew_queryFormErrorBarWidget.showMessage("${getText('RM.showMessage00000001')}","f");
				return false;
			}
		}
	}
	*/
}
function callBackPro(obj){
	ebrHide();
}
function isMixQualityChange(nRow){
/**
	//当固定数量改为是时
	if(FormulaBom_dg1491547759425Widget.getCellValue(nRow,"isMixQuality")=='true'){
		//只读上限下限
		FormulaBom_dg1491547759425Widget.setCellProperty( nRow, "minQuality", 'readonly', 'true');
		FormulaBom_dg1491547759425Widget.setCellProperty( nRow, "maxQuality", 'readonly', 'true');
		//清空上限下限
		FormulaBom_dg1491547759425Widget.setCellValue(nRow,"maxQuality","");
		FormulaBom_dg1491547759425Widget.setCellValue(nRow,"minQuality","");
	}
	//当固定数量改为否时
	else if(FormulaBom_dg1491547759425Widget.getCellValue(nRow,"isMixQuality")=='false'){
		//恢复上限下限
		FormulaBom_dg1491547759425Widget.setCellProperty( nRow, "minQuality", 'readonly', 'false');
		FormulaBom_dg1491547759425Widget.setCellProperty( nRow, "maxQuality", 'readonly', 'false');
	}
	*/
}

		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_easyFormulaEdit,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码
//当表头EBR字段勾选时，阶段、次序、需要称重列显示；当表头EBR字段未勾选时，阶段、次序、需要称重列隐藏
function ebrHide(){
	if($("[name='formula.supportEbr']").val()=='false'){
		$( 'td[key="phase"]').hide();
		$( 'td[key="sequence"]').hide();
		$( 'td[key="needWeigh"]').hide();
		FormulaBom_dg1491547759425Widget._DT._resizeHeight = true;
		FormulaBom_dg1491547759425Widget._DT._initDomElements();
		FormulaBom_dg1491547759425Widget._DT._resizeHeight = false;
	}else{
		$( 'td[key="phase"]').show();
		$( 'td[key="sequence"]').show();
		$( 'td[key="needWeigh"]').show();
		FormulaBom_dg1491547759425Widget._DT._resizeHeight = true;
		FormulaBom_dg1491547759425Widget._DT._initDomElements();
		FormulaBom_dg1491547759425Widget._DT._resizeHeight = false;
	}
}
	//物品删除重写
	function formula_product_productCode_delete(){
		formula_product_productCode_prefix = '',
		//$("#RM_formula_formula_easyFormulaEdit_form #formula_product_productCode").val('');
		//var arr="formula.product.productCode".split('.');
		//for(var i=0;i<arr.length-1;i++) {
		//	if(i!=0) {
		//		formula_product_productCode_prefix += '.';
		//	}
		//	formula_product_productCode_prefix += arr[i];
		//}
		//CUI('#RM_formula_formula_easyFormulaEdit_form input[name="'+formula_product_productCode_prefix + '.id"]').val('');
		CUI.clearInput("formula.product.productCode");
		CUI("#RM_formula_formula_easyFormulaEdit_form #formula_product_productCode").attr('valuebak','');
		CUI('#RM_formula_formula_easyFormulaEdit_form input[name="'+formula_product_productCode_prefix + '.id"]').attr('valuebak','');
		CUI.restoreMneTips($("#RM_formula_formula_easyFormulaEdit_form #formula_product_productCode"),'formula_product_productCode_mneTipLabel','RM_formula_formula_easyFormulaEdit_form');
		//清空质量标准
		$("[name='formula.qualityStandard.name']").val("");
		$("[name='formula.qualityStandard.id']").val("");
	}
/* CUSTOM CODE END */
		RM.formula.formula.easyFormulaEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_easyFormulaEdit,onloadForProduct,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		RM.formula.formula.easyFormulaEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_easyFormulaEdit,onsaveForProduct,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="RM.formula.formula.easyFormulaEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.formula.formula.easyFormulaEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(formula.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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