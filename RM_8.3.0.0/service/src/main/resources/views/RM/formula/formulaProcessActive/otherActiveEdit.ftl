<!-- RM_7.5.0.0/formula/otherActiveEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1488017642707')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_otherActiveEdit,head,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>

<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>


<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
.edit-content-dialog-fullwidth .edit-tabs {width: 100%;margin-left: 0;}
</style>
<script type="text/javascript">
	CUI.ns('RM.formula.formulaProcessActive.otherActiveEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = tableInfoId!>
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
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#assign callbackName ="RM.formula.formulaProcessActive.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formulaProcessActive_otherActiveEdit_form" cssStyle="height:100%;" hiddenField="formulaProcessActive.qualityStandard.id,formulaProcessActive.pickSite.id,formulaProcessActive.formulaId.id,formulaProcessActive.id,formulaProcessActive.product.id,formulaProcessActive.testProduct.id," onsubmitMethod="RM.formula.formulaProcessActive.otherActiveEdit.beforeSubmitMethod()" ecAction="/RM/formula/formulaProcessActive/otherActiveEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="otherActiveEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_otherActiveEdit">
	<input type="hidden" name="datagridKey" value="RM_formula_formulaProcessActive_otherActiveEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaProcessActive.version" value="${(formulaProcessActive.version)!0}" />
	<input type="hidden" name="formulaProcessActive.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="formulaProcessActive.qualityStandard.id" value="${(formulaProcessActive.qualityStandard.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.pickSite.id" value="${(formulaProcessActive.pickSite.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.formulaId.id" value="${(formulaProcessActive.formulaId.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.id" value="${(formulaProcessActive.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.product.id" value="${(formulaProcessActive.product.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.testProduct.id" value="${(formulaProcessActive.testProduct.id)!""}"/>
	<div id="RM_otherActiveEdit_edit_div" style="height:100%">
		<div id="RM_formula_formulaProcessActive_otherActiveEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcessActive_otherActiveEdit_form"+"_attcount";
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
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487330156499')}" >${getText('RM.propertydisplayName.randon1487330156499')}</label>
				</td>
				
						<#assign formulaProcessActive_name_defaultValue  = ''>
							 							<#assign formulaProcessActive_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcessActive.name" id="formulaProcessActive_name"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.name)?has_content>${(formulaProcessActive.name?html)!}<#else>${formulaProcessActive_name_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.name)?has_content>${(formulaProcessActive.name?html)!}<#else>${formulaProcessActive_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487330759313')}" >${getText('RM.propertydisplayName.randon1487330759313')}</label>
				</td>
				
						<#assign formulaProcessActive_activeType_defaultValue  = ''>
							 							<#assign formulaProcessActive_activeType_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="activityTypeChange()"  viewType="${viewType!}" deValue="${formulaProcessActive_activeType_defaultValue!}" formId="RM_formula_formulaProcessActive_otherActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="activityTypeChange()"  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_otherActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487330199423')}" >${getText('RM.propertydisplayName.randon1487330199423')}</label>
				</td>
				
						<#assign formulaProcessActive_occurTurn_defaultValue  = ''>
							 							<#assign formulaProcessActive_occurTurn_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaProcessActive_occurTurn_defaultValue!}" formId="RM_formula_formulaProcessActive_otherActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.occurTurn.id" code="occurTurn" value="${(formulaProcessActive.occurTurn.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_otherActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.occurTurn.id" code="occurTurn" value="${(formulaProcessActive.occurTurn.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490162289778')}" >${getText('RM.propertydisplayName.randon1490162289778')}</label>
				</td>
				
						<#assign formulaProcessActive_longTime_defaultValue  = ''>
							 							<#assign formulaProcessActive_longTime_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="right" style="text-align: right;;" >
					
							
							<div class="fix-input">
									<input name="formulaProcessActive.longTime" id="formulaProcessActive_longTime"  style=";" originalvalue="<#if newObj&& !(formulaProcessActive.longTime)?has_content>${formulaProcessActive_longTime_defaultValue!}<#elseif (formulaProcessActive.longTime)?has_content>#{(formulaProcessActive.longTime)!; m2M2}</#if>" value="<#if newObj&& !(formulaProcessActive.longTime)?has_content>${formulaProcessActive_longTime_defaultValue!}<#elseif (formulaProcessActive.longTime)?has_content>#{(formulaProcessActive.longTime)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcessActive_longTime').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1490162289778")}')}");
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign formulaProcessActive_product_productCode_defaultValue  = ''>
														<#assign formulaProcessActive_product_productCode_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${formulaProcessActive_product_productCode_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.otherActiveEdit._querycustomFunc('formulaProcessActive_product_productCode')"  value="${(formulaProcessActive.product.productCode)!}" displayFieldName="productCode" name="formulaProcessActive.product.productCode" id="formulaProcessActive_product_productCode" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActiveEdit_form" editCustomCallback="unChange();" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname="unChange();_callback_formulaProcessActive_product_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_otherActiveEdit_form',obj, 'formulaProcessActive.product', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('RM_formula_formulaProcessActive_otherActiveEdit_form', 'formulaProcessActive.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign formulaProcessActive_product_productName_defaultValue  = ''>
														<#assign formulaProcessActive_product_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formulaProcessActive.product.productName" id="formulaProcessActive_product_productName"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.product.productName)?has_content>${(formulaProcessActive.product.productName?html)!}<#else>${formulaProcessActive_product_productName_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.product.productName)?has_content>${(formulaProcessActive.product.productName?html)!}<#else>${formulaProcessActive_product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon15035391802161121')}" >${getText('RM.propertydisplayName.randon15035391802161121')}</label>
				</td>
				
						<#assign formulaProcessActive_isAgile_defaultValue  = ''>
							 							<#assign formulaProcessActive_isAgile_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaProcessActive.isAgile_check" originalvalue="<#if !newObj><#if (formulaProcessActive.isAgile)??>${(formulaProcessActive.isAgile!false)?string('true','false')}<#else>false</#if><#elseif formulaProcessActive_isAgile_defaultValue?has_content>${(formulaProcessActive_isAgile_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formulaProcessActive.isAgile)??>${(formulaProcessActive.isAgile!false)?string('true','false')}<#else>false</#if><#else>${(formulaProcessActive_isAgile_defaultValue!true)?string}</#if>" onclick='isAgileChange()' />
								
								<input property_type="BOOLEAN" type="hidden" name="formulaProcessActive.isAgile" originalvalue="<#if ((formulaProcessActive.isAgile)?? &&  formulaProcessActive.isAgile)||(formulaProcessActive_isAgile_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formulaProcessActive.isAgile)?? &&  formulaProcessActive.isAgile)||(formulaProcessActive_isAgile_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formulaProcessActive.isAgile_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formulaProcessActive.isAgile"]');
												CUI('input[name="formulaProcessActive.isAgile_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331060176')}" >${getText('RM.propertydisplayName.randon1487331060176')}</label>
				</td>
				
						<#assign formulaProcessActive_isReplace_defaultValue  = ''>
							 							<#assign formulaProcessActive_isReplace_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaProcessActive.isReplace_check" originalvalue="<#if !newObj><#if (formulaProcessActive.isReplace)??>${(formulaProcessActive.isReplace!false)?string('true','false')}<#else>false</#if><#elseif formulaProcessActive_isReplace_defaultValue?has_content>${(formulaProcessActive_isReplace_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formulaProcessActive.isReplace)??>${(formulaProcessActive.isReplace!false)?string('true','false')}<#else>false</#if><#else>${(formulaProcessActive_isReplace_defaultValue!true)?string}</#if>" onclick='isType()' />
								
								<input property_type="BOOLEAN" type="hidden" name="formulaProcessActive.isReplace" originalvalue="<#if ((formulaProcessActive.isReplace)?? &&  formulaProcessActive.isReplace)||(formulaProcessActive_isReplace_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formulaProcessActive.isReplace)?? &&  formulaProcessActive.isReplace)||(formulaProcessActive_isReplace_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formulaProcessActive.isReplace_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formulaProcessActive.isReplace"]');
												CUI('input[name="formulaProcessActive.isReplace_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488696577648')}" >${getText('RM.propertydisplayName.randon1488696577648')}</label>
				</td>
				
						<#assign formulaProcessActive_isMixQuality_defaultValue  = ''>
							 							<#assign formulaProcessActive_isMixQuality_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaProcessActive.isMixQuality_check" originalvalue="<#if !newObj><#if (formulaProcessActive.isMixQuality)??>${(formulaProcessActive.isMixQuality!false)?string('true','false')}<#else>false</#if><#elseif formulaProcessActive_isMixQuality_defaultValue?has_content>${(formulaProcessActive_isMixQuality_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formulaProcessActive.isMixQuality)??>${(formulaProcessActive.isMixQuality!false)?string('true','false')}<#else>false</#if><#else>${(formulaProcessActive_isMixQuality_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="formulaProcessActive.isMixQuality" originalvalue="<#if ((formulaProcessActive.isMixQuality)?? &&  formulaProcessActive.isMixQuality)||(formulaProcessActive_isMixQuality_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formulaProcessActive.isMixQuality)?? &&  formulaProcessActive.isMixQuality)||(formulaProcessActive_isMixQuality_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formulaProcessActive.isMixQuality_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formulaProcessActive.isMixQuality"]');
												CUI('input[name="formulaProcessActive.isMixQuality_check"]').each(function(){
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
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331086583')}" >${getText('RM.propertydisplayName.randon1487331086583')}</label>
				</td>
				
						<#assign formulaProcessActive_standardQuantity_defaultValue  = ''>
							 							<#assign formulaProcessActive_standardQuantity_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formulaProcessActive.standardQuantity" id="formulaProcessActive_standardQuantity"  style=";" originalvalue="<#if newObj&& !(formulaProcessActive.standardQuantity)?has_content>${formulaProcessActive_standardQuantity_defaultValue!}<#elseif (formulaProcessActive.standardQuantity)?has_content>#{(formulaProcessActive.standardQuantity)!; m6M6}</#if>" value="<#if newObj&& !(formulaProcessActive.standardQuantity)?has_content>${formulaProcessActive_standardQuantity_defaultValue!}<#elseif (formulaProcessActive.standardQuantity)?has_content>#{(formulaProcessActive.standardQuantity)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcessActive_standardQuantity').unbind('blur').bind('blur',function(){
										var percision = 6;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487331086583")}')}");
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488696602815')}" >${getText('RM.propertydisplayName.randon1488696602815')}</label>
				</td>
				
						<#assign formulaProcessActive_minQuality_defaultValue  = ''>
							 							<#assign formulaProcessActive_minQuality_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formulaProcessActive.minQuality" id="formulaProcessActive_minQuality"  style=";" originalvalue="<#if newObj&& !(formulaProcessActive.minQuality)?has_content>${formulaProcessActive_minQuality_defaultValue!}<#elseif (formulaProcessActive.minQuality)?has_content>#{(formulaProcessActive.minQuality)!; m2M2}</#if>" value="<#if newObj&& !(formulaProcessActive.minQuality)?has_content>${formulaProcessActive_minQuality_defaultValue!}<#elseif (formulaProcessActive.minQuality)?has_content>#{(formulaProcessActive.minQuality)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcessActive_minQuality').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1488696602815")}')}");
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488696624224')}" >${getText('RM.propertydisplayName.randon1488696624224')}</label>
				</td>
				
						<#assign formulaProcessActive_maxQuality_defaultValue  = ''>
							 							<#assign formulaProcessActive_maxQuality_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formulaProcessActive.maxQuality" id="formulaProcessActive_maxQuality"  style=";" originalvalue="<#if newObj&& !(formulaProcessActive.maxQuality)?has_content>${formulaProcessActive_maxQuality_defaultValue!}<#elseif (formulaProcessActive.maxQuality)?has_content>#{(formulaProcessActive.maxQuality)!; m2M2}</#if>" value="<#if newObj&& !(formulaProcessActive.maxQuality)?has_content>${formulaProcessActive_maxQuality_defaultValue!}<#elseif (formulaProcessActive.maxQuality)?has_content>#{(formulaProcessActive.maxQuality)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcessActive_maxQuality').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1488696624224")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.radion139823564048345676')}" >${getText('RM.propertydisplayName.radion139823564048345676')}</label>
				</td>
				
						<#assign formulaProcessActive_product_productBaseUnit_name_defaultValue  = ''>
														<#assign formulaProcessActive_product_productBaseUnit_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formulaProcessActive.product.productBaseUnit.name" id="formulaProcessActive_product_productBaseUnit_name"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.product.productBaseUnit.name)?has_content>${(formulaProcessActive.product.productBaseUnit.name?html)!}<#else>${formulaProcessActive_product_productBaseUnit_name_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.product.productBaseUnit.name)?has_content>${(formulaProcessActive.product.productBaseUnit.name?html)!}<#else>${formulaProcessActive_product_productBaseUnit_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1491544403180')}" >${getText('RM.propertydisplayName.randon1491544403180')}</label>
				</td>
				
						<#assign formulaProcessActive_lossRate_defaultValue  = ''>
							 							<#assign formulaProcessActive_lossRate_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formulaProcessActive.lossRate" id="formulaProcessActive_lossRate"  style=";" originalvalue="<#if newObj&& !(formulaProcessActive.lossRate)?has_content>${formulaProcessActive_lossRate_defaultValue!}<#elseif (formulaProcessActive.lossRate)?has_content>#{(formulaProcessActive.lossRate)!; m2M2}</#if>" value="<#if newObj&& !(formulaProcessActive.lossRate)?has_content>${formulaProcessActive_lossRate_defaultValue!}<#elseif (formulaProcessActive.lossRate)?has_content>#{(formulaProcessActive.lossRate)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcessActive_lossRate').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1495418354792")}')}");
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1489911238343')}" >${getText('RM.propertydisplayName.randon1489911238343')}</label>
				</td>
				
						<#assign formulaProcessActive_actOrder_defaultValue  = ''>
							 							<#assign formulaProcessActive_actOrder_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="formulaProcessActive.actOrder" id="formulaProcessActive_actOrder"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.actOrder)?has_content>${(formulaProcessActive.actOrder?html)!}<#else>${formulaProcessActive_actOrder_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.actOrder)?has_content>${(formulaProcessActive.actOrder?html)!}<#else>${formulaProcessActive_actOrder_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon148733113010723')}" >${getText('RM.propertydisplayName.randon148733113010723')}</label>
				</td>
				
						<#assign formulaProcessActive_auto_defaultValue  = ''>
							 							<#assign formulaProcessActive_auto_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaProcessActive.auto_check" originalvalue="<#if !newObj><#if (formulaProcessActive.auto)??>${(formulaProcessActive.auto!false)?string('true','false')}<#else>false</#if><#elseif formulaProcessActive_auto_defaultValue?has_content>${(formulaProcessActive_auto_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formulaProcessActive.auto)??>${(formulaProcessActive.auto!false)?string('true','false')}<#else>false</#if><#else>${(formulaProcessActive_auto_defaultValue!true)?string}</#if>" onclick='autoChange()' />
								
								<input property_type="BOOLEAN" type="hidden" name="formulaProcessActive.auto" originalvalue="<#if ((formulaProcessActive.auto)?? &&  formulaProcessActive.auto)||(formulaProcessActive_auto_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formulaProcessActive.auto)?? &&  formulaProcessActive.auto)||(formulaProcessActive_auto_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formulaProcessActive.auto_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formulaProcessActive.auto"]');
												CUI('input[name="formulaProcessActive.auto_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488696458643')}" >${getText('RM.propertydisplayName.randon1488696458643')}</label>
				</td>
				
						<#assign formulaProcessActive_exeSystem_defaultValue  = ''>
							 							<#assign formulaProcessActive_exeSystem_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaProcessActive_exeSystem_defaultValue!}" formId="RM_formula_formulaProcessActive_otherActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.exeSystem.id" code="RMsystem" value="${(formulaProcessActive.exeSystem.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_otherActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.exeSystem.id" code="RMsystem" value="${(formulaProcessActive.exeSystem.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1497849359617')}" >${getText('RM.propertydisplayName.randon1497849359617')}</label>
				</td>
				
						<#assign formulaProcessActive_mobileTerminal_defaultValue  = ''>
							 							<#assign formulaProcessActive_mobileTerminal_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaProcessActive.mobileTerminal_check" originalvalue="<#if !newObj><#if (formulaProcessActive.mobileTerminal)??>${(formulaProcessActive.mobileTerminal!false)?string('true','false')}<#else>false</#if><#elseif formulaProcessActive_mobileTerminal_defaultValue?has_content>${(formulaProcessActive_mobileTerminal_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formulaProcessActive.mobileTerminal)??>${(formulaProcessActive.mobileTerminal!false)?string('true','false')}<#else>false</#if><#else>${(formulaProcessActive_mobileTerminal_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="formulaProcessActive.mobileTerminal" originalvalue="<#if ((formulaProcessActive.mobileTerminal)?? &&  formulaProcessActive.mobileTerminal)||(formulaProcessActive_mobileTerminal_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formulaProcessActive.mobileTerminal)?? &&  formulaProcessActive.mobileTerminal)||(formulaProcessActive_mobileTerminal_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formulaProcessActive.mobileTerminal_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formulaProcessActive.mobileTerminal"]');
												CUI('input[name="formulaProcessActive.mobileTerminal_check"]').each(function(){
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
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487595139633232')}" >${getText('RM.propertydisplayName.randon1487595139633232')}</label>
				</td>
				
						<#assign formulaProcessActive_qualityStandard_name_defaultValue  = ''>
														<#assign formulaProcessActive_qualityStandard_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1487596068024')}" viewType="${viewType!}" deValue="${formulaProcessActive_qualityStandard_name_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.otherActiveEdit._querycustomFunc('formulaProcessActive_qualityStandard_name')"  value="${(formulaProcessActive.qualityStandard.name)!}" displayFieldName="name" name="formulaProcessActive.qualityStandard.name" id="formulaProcessActive_qualityStandard_name" type="other" url="/RM/qualityStandard/stand/standRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActiveEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_qualityStandard_standRef"  onkeyupfuncname=";_callback_formulaProcessActive_qualityStandard_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.qualityStandard.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.qualityStandard.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_otherActiveEdit_form',obj, 'formulaProcessActive.qualityStandard', '/RM/qualityStandard/stand/standRef.action');
												CUI.commonFills('RM_formula_formulaProcessActive_otherActiveEdit_form', 'formulaProcessActive.qualityStandard',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									RM.formula.formulaProcessActive.otherActiveEdit.query_formulaProcessActive_qualityStandard_name = function() {
										if($('input[name="formulaProcessActive.product.id"]').val() != "" && $('input[name="formulaProcessActive.product.id"]').val() != null && $('input[name="formulaProcessActive.product.id"]').val()!= undefined){
    var productID = $('input[name="formulaProcessActive.product.id"]').val();
    return "productID="+productID;
}else{
    return "productID="+0;
}
									}
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.entityname.randon1490317690671')}" >${getText('RM.entityname.randon1490317690671')}</label>
				</td>
				
						<#assign formulaProcessActive_testProduct_name_defaultValue  = ''>
														<#assign formulaProcessActive_testProduct_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('RM.viewtitle.randon1490318000877')}" viewType="${viewType!}" deValue="${formulaProcessActive_testProduct_name_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.otherActiveEdit._querycustomFunc('formulaProcessActive_testProduct_name')"  value="${(formulaProcessActive.testProduct.name)!}" displayFieldName="name" name="formulaProcessActive.testProduct.name" id="formulaProcessActive_testProduct_name" type="other" url="/RM/sampleProj/sampleProj/sampleProjRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActiveEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_sampleProj_sampleProjRef" onkeyupfuncname=";_callback_formulaProcessActive_testProduct_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.testProduct.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.testProduct.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_otherActiveEdit_form',obj, 'formulaProcessActive.testProduct', '/RM/sampleProj/sampleProj/sampleProjRef.action');
												CUI.commonFills('RM_formula_formulaProcessActive_otherActiveEdit_form', 'formulaProcessActive.testProduct',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.entityname.randon1503469599671')}" >${getText('RM.entityname.randon1503469599671')}</label>
				</td>
				
						<#assign formulaProcessActive_pickSite_name_defaultValue  = ''>
														<#assign formulaProcessActive_pickSite_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1503470970689')}" viewType="${viewType!}" deValue="${formulaProcessActive_pickSite_name_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.otherActiveEdit._querycustomFunc('formulaProcessActive_pickSite_name')"  value="${(formulaProcessActive.pickSite.name)!}" displayFieldName="name" name="formulaProcessActive.pickSite.name" id="formulaProcessActive_pickSite_name" type="other" url="/RM/pickSite/pickSite/pickSiteRefLayOut.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActiveEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_pickSite_pickSiteRefLayOut"  onkeyupfuncname=";_callback_formulaProcessActive_pickSite_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.pickSite.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.pickSite.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_otherActiveEdit_form',obj, 'formulaProcessActive.pickSite', '/RM/pickSite/pickSite/pickSiteRefLayOut.action');
												CUI.commonFills('RM_formula_formulaProcessActive_otherActiveEdit_form', 'formulaProcessActive.pickSite',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1497849337000')}" >${getText('RM.propertydisplayName.randon1497849337000')}</label>
				</td>
				
						<#assign formulaProcessActive_finalInspection_defaultValue  = ''>
							 							<#assign formulaProcessActive_finalInspection_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaProcessActive.finalInspection_check" originalvalue="<#if !newObj><#if (formulaProcessActive.finalInspection)??>${(formulaProcessActive.finalInspection!false)?string('true','false')}<#else>false</#if><#elseif formulaProcessActive_finalInspection_defaultValue?has_content>${(formulaProcessActive_finalInspection_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formulaProcessActive.finalInspection)??>${(formulaProcessActive.finalInspection!false)?string('true','false')}<#else>false</#if><#else>${(formulaProcessActive_finalInspection_defaultValue!true)?string}</#if>" onchange='finalInspect()' />
								
								<input property_type="BOOLEAN" type="hidden" name="formulaProcessActive.finalInspection" originalvalue="<#if ((formulaProcessActive.finalInspection)?? &&  formulaProcessActive.finalInspection)||(formulaProcessActive_finalInspection_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formulaProcessActive.finalInspection)?? &&  formulaProcessActive.finalInspection)||(formulaProcessActive_finalInspection_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formulaProcessActive.finalInspection_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formulaProcessActive.finalInspection"]');
												CUI('input[name="formulaProcessActive.finalInspection_check"]').each(function(){
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488696526426')}" >${getText('RM.propertydisplayName.randon1488696526426')}</label>
				</td>
				
						<#assign formulaProcessActive_isWatchActive_defaultValue  = ''>
							 							<#assign formulaProcessActive_isWatchActive_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaProcessActive.isWatchActive_check" originalvalue="<#if !newObj><#if (formulaProcessActive.isWatchActive)??>${(formulaProcessActive.isWatchActive!false)?string('true','false')}<#else>false</#if><#elseif formulaProcessActive_isWatchActive_defaultValue?has_content>${(formulaProcessActive_isWatchActive_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formulaProcessActive.isWatchActive)??>${(formulaProcessActive.isWatchActive!false)?string('true','false')}<#else>false</#if><#else>${(formulaProcessActive_isWatchActive_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="formulaProcessActive.isWatchActive" originalvalue="<#if ((formulaProcessActive.isWatchActive)?? &&  formulaProcessActive.isWatchActive)||(formulaProcessActive_isWatchActive_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formulaProcessActive.isWatchActive)?? &&  formulaProcessActive.isWatchActive)||(formulaProcessActive_isWatchActive_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formulaProcessActive.isWatchActive_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formulaProcessActive.isWatchActive"]');
												CUI('input[name="formulaProcessActive.isWatchActive_check"]').each(function(){
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
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331194516')}" >${getText('RM.propertydisplayName.randon1487331194516')}</label>
				</td>
				
						<#assign formulaProcessActive_meno_defaultValue  = ''>
							 							<#assign formulaProcessActive_meno_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcessActive.meno" id="formulaProcessActive_meno"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.meno)?has_content>${(formulaProcessActive.meno?html)!}<#else>${formulaProcessActive_meno_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.meno)?has_content>${(formulaProcessActive.meno?html)!}<#else>${formulaProcessActive_meno_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1493729738415')}" >${getText('RM.propertydisplayName.randon1493729738415')}</label>
				</td>
				
						<#assign formulaProcessActive_batchPhaseID_defaultValue  = ''>
							 							<#assign formulaProcessActive_batchPhaseID_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcessActive.batchPhaseID" id="formulaProcessActive_batchPhaseID"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.batchPhaseID)?has_content>${(formulaProcessActive.batchPhaseID?html)!}<#else>${formulaProcessActive_batchPhaseID_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.batchPhaseID)?has_content>${(formulaProcessActive.batchPhaseID?html)!}<#else>${formulaProcessActive_batchPhaseID_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1493778012133')}" >${getText('RM.propertydisplayName.randon1493778012133')}</label>
				</td>
				
						<#assign formulaProcessActive_formulaId_batchFormulaID_defaultValue  = ''>
														<#assign formulaProcessActive_formulaId_batchFormulaID_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('RM.viewtitle.randon1488246963795')}" viewType="${viewType!}" deValue="${formulaProcessActive_formulaId_batchFormulaID_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.otherActiveEdit._querycustomFunc('formulaProcessActive_formulaId_batchFormulaID')"  value="${(formulaProcessActive.formulaId.batchFormulaID)!}" displayFieldName="batchFormulaID" name="formulaProcessActive.formulaId.batchFormulaID" id="formulaProcessActive_formulaId_batchFormulaID" type="other" url="/RM/formula/formula/formulaRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_otherActiveEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_formula_formulaRef" onkeyupfuncname=";_callback_formulaProcessActive_formulaId_batchFormulaID(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.formulaId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.formulaId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_otherActiveEdit_form',obj, 'formulaProcessActive.formulaId', '/RM/formula/formula/formulaRef.action');
												CUI.commonFills('RM_formula_formulaProcessActive_otherActiveEdit_form', 'formulaProcessActive.formulaId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487812534269')}" >${getText('RM.propertydisplayName.randon1487812534269')}</label>
				</td>
				
						<#assign formulaProcessActive_processHiddenId_defaultValue  = ''>
							 							<#assign formulaProcessActive_processHiddenId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="formulaProcessActive.processHiddenId" id="formulaProcessActive_processHiddenId"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.processHiddenId)?has_content>${(formulaProcessActive.processHiddenId?html)!}<#else>${formulaProcessActive_processHiddenId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.processHiddenId)?has_content>${(formulaProcessActive.processHiddenId?html)!}<#else>${formulaProcessActive_processHiddenId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487812507672')}" >${getText('RM.propertydisplayName.randon1487812507672')}</label>
				</td>
				
						<#assign formulaProcessActive_processTableId_defaultValue  = ''>
							 							<#assign formulaProcessActive_processTableId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="formulaProcessActive.processTableId" id="formulaProcessActive_processTableId"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.processTableId)?has_content>${(formulaProcessActive.processTableId?html)!}<#else>${formulaProcessActive_processTableId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.processTableId)?has_content>${(formulaProcessActive.processTableId?html)!}<#else>${formulaProcessActive_processTableId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488873040389')}" >${getText('RM.propertydisplayName.randon1488873040389')}</label>
				</td>
				
						<#assign formulaProcessActive_formulaHiddenId_defaultValue  = ''>
							 							<#assign formulaProcessActive_formulaHiddenId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="formulaProcessActive.formulaHiddenId" id="formulaProcessActive_formulaHiddenId"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.formulaHiddenId)?has_content>${(formulaProcessActive.formulaHiddenId?html)!}<#else>${formulaProcessActive_formulaHiddenId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.formulaHiddenId)?has_content>${(formulaProcessActive.formulaHiddenId?html)!}<#else>${formulaProcessActive_formulaHiddenId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
						<#assign formulaProcessActive_formulaId_id_defaultValue  = ''>
														<#assign formulaProcessActive_formulaId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="LONG" name="formulaProcessActive.formulaId.id" id="formulaProcessActive_formulaId_id"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.formulaId.id)?has_content>${(formulaProcessActive.formulaId.id?html)!}<#else>${formulaProcessActive_formulaId_id_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.formulaId.id)?has_content>${(formulaProcessActive.formulaId.id?html)!}<#else>${formulaProcessActive_formulaId_id_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_otherActiveEdit", 'EDIT')>
			<#if customPropList?? && customPropList?size gte 1>
				<table class="edit-table" style="" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td style="width:13%;"></td><td style="width:20%;"></td>
					<td style="width:13%;"></td><td style="width:20%;"></td>
					<td style="width:13%;"></td><td style="width:20%;"></td>
				</tr>
			<tr class="dialog_tr">
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
				</tr><tr class="dialog_tr">
				</#if>
				<#assign totalspan = totalspan + cspan - 1>
				<td nullable=<#if (c.nullable!false)>true<#else>false</#if> class="edit-table-symbol" <#if c.fieldType?? && c.fieldType == 'DATATIME'>celltype="DATATIME"</#if> style="text-align:right;">
					<label value="${getText('${c.displayName}')}">${getText('${c.displayName}')}</label>
				</td>
				<td nullable=<#if (c.nullable!false)>true<#else>false</#if> class="edit-table-content" <#if c.fieldType?? && c.fieldType == 'DATATIME'>celltype="DATATIME"</#if> <#if cspan gt 1>colspan="${colspanVal}"</#if> style="text-align:left;">
					<#assign columnType = c.property.type>
					<#assign columnName = c.property.name>
					<#assign decimalNum = (c.property.decimalNum!-1)>
					<#assign elementName = 'formulaProcessActive' + "." + columnName>
					<#assign elementId = 'formulaProcessActive' + "_" + columnName>
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
						<#if formulaProcessActive[columnName]??>
							<#assign dateVal = (formulaProcessActive[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="RM_formula_formulaProcessActive_otherActiveEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${formulaProcessActive[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${formulaProcessActive[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${formulaProcessActive[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${formulaProcessActive[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="RM_formula_formulaProcessActive_otherActiveEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_otherActiveEdit,html,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
<!-- 自定义代码 -->
<script type="text/javascript">
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

//活动类型选择投料 机动投料为否
function TypeThreeOperate(){
	var autoValue=$('input[name="formulaProcessActive.auto"]').val();
	
	//损耗率
	$("[name='formulaProcessActive.lossRate']").attr("readonly",false);
	//完工检验
	$("[name='formulaProcessActive.finalInspection_check']").attr("disabled",true);
	$('input[name="formulaProcessActive.finalInspection_check"]').attr("checked",false);
	$('input[name="formulaProcessActive.finalInspection"]').val(false);
   
	var autoValue=$('input[name="formulaProcessActive.auto"]').val();
	if(autoValue=='false'){
		//投料顺序
		$("[name='formulaProcessActive.actOrder']").attr("readonly",false);	
		$("#formulaProcessActive_actOrder").parents("td").prev().css({color:"rgb(179, 3, 3)"})	
	}
	//物料可编辑
	$("input[name='formulaProcessActive.product.productCode']").attr("readonly",false);
	//损耗率可编辑
	$("#formulaProcessActive_lossRate").attr("readonly",false);
	//物品编码为红色
	$("#formulaProcessActive_product_productCode").parents("td").prev().css({color:"rgb(179, 3, 3)"})
	$("#formulaProcessActive_product_productCode_click_button").css("display","block");
	var productCode=$('input[name="formulaProcessActive.product.productCode"]').val();
	if(productCode!=''){
		$("#formulaProcessActive_product_productCode_mneTipLabel").css("display","none");
	}else{
		$("#formulaProcessActive_product_productCode_mneTipLabel").css("display","block");
	}
	//替代料可编辑
	$('input[name="formulaProcessActive.isReplace_check"]').removeAttr("disabled");
	//如果替代料为是
	if($("input[name='formulaProcessActive.isReplace_check']").prop("checked")){
		//单位数量为0，且不可编辑
		$('input[name="formulaProcessActive.standardQuantity"]').val(0);
		//单位数量为红色
		 $("#formulaProcessActive_standardQuantity").parents("td").prev().css({color:"rgb(179, 3, 3)"})
		$("#formulaProcessActive_standardQuantity").attr("readonly",true);
	}
	else{
		//单位数量可编辑
		$("#formulaProcessActive_standardQuantity").attr("readonly",false);
		//单位数量为红色
		$("#formulaProcessActive_standardQuantity").parents("td").prev().css({color:"rgb(179, 3, 3)"});

	}
  	//固定数量
	$('input[name="formulaProcessActive.isMixQuality_check"]').removeAttr("disabled");
	//上限可编辑且为空
	$("input[name='formulaProcessActive.maxQuality']").attr("readonly",false);
	//下限可编辑且为空
	$("input[name='formulaProcessActive.minQuality']").attr("readonly",false);
	//检测方案不可编辑
	$('input[name="formulaProcessActive.testProduct.name"]').val('');
	$("input[name='formulaProcessActive.testProduct.name']").attr("readonly",true);
	$("#formulaProcessActive_testProduct_name_click_button").css("display","none");
	$("#formulaProcessActive_testProduct_name_mneTipLabel").css("display","none");
	//质量标准不可编辑
	$("#formulaProcessActive_qualityStandard_name_click_button").css("display","none");
	$('input[name="formulaProcessActive.qualityStandard.name"]').val('');
	//采样点不可编辑
	$("#formulaProcessActive_pickSite_name_click_button").css("display","none");
	$('input[name="formulaProcessActive.pickSite.name"]').val('');
	//必填颜色恢复
	$("#formulaProcessActive_qualityStandard_name").parents("td").prev().attr("style","text-align: right;");
	$("#formulaProcessActive_testProduct_name").parents("td").prev().attr("style","text-align: right;");
}

//活动类型选择产出
function TypeSixOperate(){
	//损耗率
	$("[name='formulaProcessActive.lossRate']").attr("readonly",false);
	//完工检验
	$("[name='formulaProcessActive.finalInspection_check']").attr("disabled",true);
	$('input[name="formulaProcessActive.finalInspection_check"]').attr("checked",false);
	$('input[name="formulaProcessActive.finalInspection"]').val(false);
	//投料顺序
	$("[name='formulaProcessActive.actOrder']").attr("readonly",true);
	$("[name='formulaProcessActive.actOrder']").val("");
	//物料可编辑
	$("input[name='formulaProcessActive.product.productCode']").attr("readonly",false);
	//损耗率可编辑
	$("#formulaProcessActive_lossRate").attr("readonly",false);
	//物品编码为红色
	$("#formulaProcessActive_product_productCode").parents("td").prev().css({color:"rgb(179, 3, 3)"})
	$("#formulaProcessActive_product_productCode_click_button").css("display","block");
	var productCode=$('input[name="formulaProcessActive.product.productCode"]').val();
	if(productCode!=''){
		$("#formulaProcessActive_product_productCode_mneTipLabel").css("display","none");
	}else{
		$("#formulaProcessActive_product_productCode_mneTipLabel").css("display","block");
	}
	
	//单位数量可编辑
	$("#formulaProcessActive_standardQuantity").attr("readonly",false);
	//单位数量为红色
	$("#formulaProcessActive_standardQuantity").parents("td").prev().css({color:"rgb(179, 3, 3)"})
  
	//替代料不可编辑,且为否
	$('input[name="formulaProcessActive.isReplace_check"]').attr("disabled","disabled");
	$('input[name="formulaProcessActive.isReplace_check"]').attr("checked", false);
	//固定数量不可编辑，且为是
	$('input[name="formulaProcessActive.isMixQuality_check"]').attr("disabled","disabled");
	$('input[name="formulaProcessActive.isMixQuality_check"]').attr("checked", true);
	$("input[name='formulaProcessActive.isMixQuality']").val(true);
	//单位数量可编辑
	$("#formulaProcessActive_standardQuantity").attr("readonly",false);
	//上限可编辑且为空
	$("input[name='formulaProcessActive.maxQuality']").attr("readonly",false);
	$("input[name='formulaProcessActive.maxQuality']").val('');
	//下限可编辑且为空
	$("input[name='formulaProcessActive.minQuality']").attr("readonly",false);
	$("input[name='formulaProcessActive.minQuality']").val('');
	//检测方案不可编辑
	$('input[name="formulaProcessActive.testProduct.name"]').val('');
	$("input[name='formulaProcessActive.testProduct.name']").attr("readonly",true);
	$("#formulaProcessActive_testProduct_name_click_button").css("display","none");
	$("#formulaProcessActive_testProduct_name_mneTipLabel").css("display","none");
	//质量标准不可编辑
	$("#formulaProcessActive_qualityStandard_name_click_button").css("display","none");
	$('input[name="formulaProcessActive.qualityStandard.name"]').val('');
	//选择类型之前采样点不可编辑
	$('input[name="formulaProcessActive.pickSite.name"]').val('');
	$("#formulaProcessActive_pickSite_name_click_button").css("display","none");
	//禁用机动投料
	$("[name='formulaProcessActive.isAgile_check']").attr("disabled",true);
	$('input[name="formulaProcessActive.isAgile_check"]').attr("checked", false);
	//必填颜色恢复
	$("#formulaProcessActive_actOrder").parents("td").prev().attr("style","text-align: right;");
	$("#formulaProcessActive_qualityStandard_name").parents("td").prev().attr("style","text-align: right;");
	$("#formulaProcessActive_testProduct_name").parents("td").prev().attr("style","text-align: right;");
}

//活动类型选择常规或者不选时
function TypeOneOperate(){
	//损耗率
	$("[name='formulaProcessActive.lossRate']").attr("readonly",true);
	//完工检验
	$("[name='formulaProcessActive.finalInspection_check']").attr("disabled",true);
	$('input[name="formulaProcessActive.finalInspection_check"]').attr("checked",false);
	$('input[name="formulaProcessActive.finalInspection"]').val(false);
	//投料顺序
	$("[name='formulaProcessActive.actOrder']").attr("readonly",true);
	$("[name='formulaProcessActive.actOrder']").val("");
	//物料不可编辑
	$("input[name='formulaProcessActive.product.productCode']").attr("readonly",true);
	$("#formulaProcessActive_product_productCode_click_button").css("display","none");
	$("#formulaProcessActive_product_productCode_mneTipLabel").css("display","none");
	$("#formulaProcessActive_product_productCode_mneTipLabel").html("");
	$('input[name="formulaProcessActive.product.productCode"]').val('');
	$('input[name="formulaProcessActive.product.productName"]').val('');
	$("#formulaProcessActive_product_productBaseUnit_name").val("");
	//替代料不可编辑
	$('input[name="formulaProcessActive.isReplace_check"]').attr("disabled","disabled");
	$('input[name="formulaProcessActive.isReplace_check"]').attr("checked", false);
	//固定数量不可编辑
	$('input[name="formulaProcessActive.isMixQuality_check"]').attr("disabled","disabled");
	$('input[name="formulaProcessActive.isMixQuality_check"]').attr("checked", false);
	//单位数量不可编辑
	$("#formulaProcessActive_standardQuantity").attr("readonly",true);
	$("#formulaProcessActive_standardQuantity").val('');
	//上限
	$("input[name='formulaProcessActive.maxQuality']").attr("readonly",true);
	$("input[name='formulaProcessActive.maxQuality']").val('');
	//下限
	$("input[name='formulaProcessActive.minQuality']").attr("readonly",true);
	$("input[name='formulaProcessActive.minQuality']").val('');
	//检测方案不可编辑
	$('input[name="formulaProcessActive.testProduct.name"]').val('');
	$("input[name='formulaProcessActive.testProduct.name']").attr("readonly",true);
	$("#formulaProcessActive_testProduct_name_click_button").css("display","none");
	$("#formulaProcessActive_testProduct_name_mneTipLabel").css("display","none");
	//质量标准不可编辑
	$("#formulaProcessActive_qualityStandard_name_click_button").css("display","none");
	$('input[name="formulaProcessActive.qualityStandard.name"]').val('');
	//选择类型之前采样点不可编辑
	$('input[name="formulaProcessActive.pickSite.name"]').val('');
	$("#formulaProcessActive_pickSite_name_click_button").css("display","none");
	//禁用机动投料
	$("[name='formulaProcessActive.isAgile_check']").attr("disabled",true);
	$('input[name="formulaProcessActive.isAgile_check"]').attr("checked", false);
	//必填颜色恢复
	$("#formulaProcessActive_product_productCode").parents("td").prev().attr("style","text-align: right;");
	$("#formulaProcessActive_standardQuantity").parents("td").prev().attr("style","text-align: right;");
	$("#formulaProcessActive_actOrder").parents("td").prev().attr("style","text-align: right;");
	$("#formulaProcessActive_qualityStandard_name").parents("td").prev().attr("style","text-align: right;");
	$("#formulaProcessActive_testProduct_name").parents("td").prev().attr("style","text-align: right;");
  
  
}

//活动类型选择检查
function TypeFiveOperate(){
	//损耗率
	$("[name='formulaProcessActive.lossRate']").attr("readonly",true);
	//完工检验
	$("[name='formulaProcessActive.finalInspection_check']").attr("disabled",false);
	//投料顺序
	$("[name='formulaProcessActive.actOrder']").attr("readonly",true);
	$("[name='formulaProcessActive.actOrder']").val("");
	//物料可编辑
	$("input[name='formulaProcessActive.product.productCode']").attr("readonly",false);
	//物品编码为红色
	$("#formulaProcessActive_product_productCode").parents("td").prev().css({color:"rgb(179, 3, 3)"})
	$("#formulaProcessActive_product_productCode_click_button").css("display","block");
	var productCode=$('input[name="formulaProcessActive.product.productCode"]').val();
	if(productCode!=''){
		$("#formulaProcessActive_product_productCode_mneTipLabel").css("display","none");
	}else{
		$("#formulaProcessActive_product_productCode_mneTipLabel").css("display","block");
	}
	
	//单位数量可编辑
	$("#formulaProcessActive_standardQuantity").attr("readonly",false);
	//单位数量为红色
	//$("#formulaProcessActive_standardQuantity").parents("td").prev().css({color:"rgb(179, 3, 3)"})
	//替代料不可编辑
	$('input[name="formulaProcessActive.isReplace_check"]').attr("disabled","disabled");
	$('input[name="formulaProcessActive.isReplace_check"]').attr("checked", false);
	//固定数量不可编辑
	$('input[name="formulaProcessActive.isMixQuality_check"]').attr("disabled","disabled");
	$('input[name="formulaProcessActive.isMixQuality_check"]').attr("checked", false);
	//单位数量不可编辑
	$("#formulaProcessActive_standardQuantity").attr("readonly",true);
	$("#formulaProcessActive_standardQuantity").val('');
	//上限
	$("input[name='formulaProcessActive.maxQuality']").attr("readonly",true);
	$("input[name='formulaProcessActive.maxQuality']").val('');
	//下限
	$("input[name='formulaProcessActive.minQuality']").attr("readonly",true);
	$("input[name='formulaProcessActive.minQuality']").val('');
	//禁用机动投料
	$("[name='formulaProcessActive.isAgile_check']").attr("disabled",true);
	$('input[name="formulaProcessActive.isAgile_check"]').attr("checked", false);
	if($('#isLIMS').val()=='true'){
		//检测方案可编辑
		$("#formulaProcessActive_testProduct_name_click_button").css("display","block");
		//检测方案标红
		//$("#formulaProcessActive_testProduct_name").parents("td").prev().css({color:"rgb(179, 3, 3)"});
		//质量标准可编辑
		$("#formulaProcessActive_qualityStandard_name_click_button").css("display","block");
		//质量标准标红
		$("#formulaProcessActive_qualityStandard_name").parents("td").prev().css({color:"rgb(179, 3, 3)"});
		//采样点可编辑
		$("#formulaProcessActive_pickSite_name_click_button").css("display","block");	
		//必填颜色恢复
		$("#formulaProcessActive_product_productCode").parents("td").prev().attr("style","text-align: right;");
		$("#formulaProcessActive_standardQuantity").parents("td").prev().attr("style","text-align: right;");
		$("#formulaProcessActive_actOrder").parents("td").prev().attr("style","text-align: right;");
	}else{
		//检测方案不可编辑
		$('input[name="formulaProcessActive.testProduct.name"]').val('');
		$("input[name='formulaProcessActive.testProduct.name']").attr("readonly",true);
		$("#formulaProcessActive_testProduct_name_click_button").css("display","none");
		$("#formulaProcessActive_testProduct_name_mneTipLabel").css("display","none");
		$("#formulaProcessActive_testProduct_name").parents("td").prev().css({color:"#000000"});
		//质量标准可编辑
		$("#formulaProcessActive_qualityStandard_name_click_button").css("display","block");
		//质量标准标红
		$("#formulaProcessActive_qualityStandard_name").parents("td").prev().css({color:"rgb(179, 3, 3)"});
		//采样点可编辑
		$("#formulaProcessActive_pickSite_name_click_button").css("display","block");
	}
}                                  
</script>
<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.formula.formulaProcessActive.otherActiveEdit.beforeSaveProcess = function(){}
	RM.formula.formulaProcessActive.otherActiveEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formulaProcessActive.otherActiveEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formulaProcessActive_otherActiveEdit_form').trigger('beforeSubmit');
		//formulaProcessActive.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="formulaProcessActive.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_formula_formulaProcessActive_otherActiveEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_formula_formulaProcessActive_otherActiveEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.formula.formulaProcessActive.otherActiveEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formulaProcessActive.otherActiveEdit.print = function(url){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
						}
					}
				});
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
				
				//var url = document.location.href;
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
		
		RM.formula.formulaProcessActive.otherActiveEdit.saveSetting = function(){
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
		
		var isPrintSettingDialogShow = false;//判断打印设置窗口是否打开，防止重复打开
		RM.formula.formulaProcessActive.otherActiveEdit.printSetting = function(){
			if(typeof isPrintSettingDialogShow != 'undefined' && isPrintSettingDialogShow === true){
				return;
			}
			var url = "/ec/print/getSetting.action?printCookie.type=" + $('input[name="viewCode"]').val();
			<#if isWorkflow?? && isWorkflow>
			url = url + "&isWorkflow=true";
			<#else>
			url = url + "&isWorkflow=false";
			</#if>
			<#if isAttachment?? && isAttachment>
			url = url + "&isAttachment=true";
			<#else>
			url = url + "&isAttachment=false";
			</#if>
			RM.formula.formulaProcessActive.otherActiveEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcessActive.otherActiveEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formulaProcessActive.otherActiveEdit.settingDialog.show();
				isPrintSettingDialogShow = true;
		}
	
	//控件版PT选人查看按钮单击事件处理函数
	function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany){
		//保存当前单击事件的对象信息
		var obj = {
			"oGrid" : oGrid,
			"nRow" : nRow - 1,
			"sKey":	sFieldName
		}
		if(customCallBack){
			RM.formula.formulaProcessActive.otherActiveEdit._customCallBack = customCallBack;
		}
		RM.formula.formulaProcessActive.otherActiveEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formulaProcessActive_otherActiveEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formulaProcessActive_otherActiveEdit_fileupload"></div>');
			}
			RM.formula.formulaProcessActive.otherActiveEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formulaProcessActive_otherActiveEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formulaProcessActive_otherActiveEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formulaProcessActive.otherActiveEdit.infoDialog.show();
			if($('#RM_formula_formulaProcessActive_otherActiveEdit_fileupload').html() == '') {
				$('#RM_formula_formulaProcessActive_otherActiveEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formulaProcessActive&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formulaProcessActive.otherActiveEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formulaProcessActive.otherActiveEdit.referenceCopyBackInfo";
		RM.formula.formulaProcessActive.otherActiveEdit.dialog = dialog;
		RM.formula.formulaProcessActive.otherActiveEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			iframe:'reference_copy_edit',
			</#if>
			
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	RM.formula.formulaProcessActive.otherActiveEdit.referenceCopyBackInfo = function(obj){
		if(RM.formula.formulaProcessActive.otherActiveEdit._dialog){
			RM.formula.formulaProcessActive.otherActiveEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formulaProcessActive.otherActiveEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formulaProcessActive_otherActiveEdit_form','RM_formula_formulaProcessActive_otherActiveEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formulaProcessActive.otherActiveEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formulaProcessActive.otherActiveEdit.dialog._el).load('/RM/formula/formulaProcessActive/otherActiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
						closeLoadPanel();
						try{
							StrutsUtilsOnLoad();
						}catch(e){}
						try{
							if(me._config.onload != undefined) eval(me._config.onload + "(me)");
						}catch(e){}
				});
			});
		}else{
		</#if>
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			parent.$( RM.formula.formulaProcessActive.otherActiveEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formulaProcessActive.otherActiveEdit.dialog._config.iframe, RM.formula.formulaProcessActive.otherActiveEdit.dialog._dialog ).prop( 'src', '/RM/formula/formulaProcessActive/otherActiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formulaProcessActive.otherActiveEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formulaProcessActive.otherActiveEdit.dialog._el).load('/RM/formula/formulaProcessActive/otherActiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
			</#if>
				
			
		<#if viewType != "readonly">
		}
		</#if>
	};
	
	RM.formula.formulaProcessActive.otherActiveEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formulaProcessActive.otherActiveEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formulaProcessActive.otherActiveEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formulaProcessActive.otherActiveEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formulaProcessActive.otherActiveEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_formula_formulaProcessActive_otherActiveEdit' + '_' + extraFrameParam;
		var callbackName="";
		RM.formula.formulaProcessActive.otherActiveEdit._prefix = '';
		RM.formula.formulaProcessActive.otherActiveEdit._oGrid = oGrid;
		RM.formula.formulaProcessActive.otherActiveEdit._sUrl = url;
		if(customCallBack){
			RM.formula.formulaProcessActive.otherActiveEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formulaProcessActive.otherActiveEdit.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formulaProcessActive.otherActiveEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formulaProcessActive.otherActiveEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formulaProcessActive.otherActiveEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcessActive.otherActiveEdit.getcallBackInfo_DG";
			RM.formula.formulaProcessActive.otherActiveEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formulaProcessActive.otherActiveEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formulaProcessActive.otherActiveEdit.getcallBackInfo";
		}
		if(RM.formula.formulaProcessActive.otherActiveEdit._prefix!=''){
			RM.formula.formulaProcessActive.otherActiveEdit._prefix = RM.formula.formulaProcessActive.otherActiveEdit._prefix.substring(1);
		}
		if(RM.formula.formulaProcessActive.otherActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcessActive.otherActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formulaProcessActive.otherActiveEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcessActive.otherActiveEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formulaProcessActive.otherActiveEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcessActive.otherActiveEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcessActive.otherActiveEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcessActive.otherActiveEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formulaProcessActive.otherActiveEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formulaProcessActive_otherActiveEdit_form',obj[0], RM.formula.formulaProcessActive.otherActiveEdit._prefix, RM.formula.formulaProcessActive.otherActiveEdit._sUrl);
		CUI.commonFills('RM_formula_formulaProcessActive_otherActiveEdit_form',RM.formula.formulaProcessActive.otherActiveEdit._prefix,obj[0]);

		try{
			if(RM.formula.formulaProcessActive.otherActiveEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.otherActiveEdit._customCallBack);
				RM.formula.formulaProcessActive.otherActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.otherActiveEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formulaProcessActive.otherActiveEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formulaProcessActive.otherActiveEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.otherActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formulaProcessActive.otherActiveEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcessActive.otherActiveEdit._sUrl);
		var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
		for( var i = 0; i < xmlHead.children().length; i++ ){
			var tagName = xmlHead.children()[i].tagName;
			if( tagName.indexOf(rootKey) == 0 ){
				try{
					var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
				}catch(e){
					var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
				}
				//判断符合条件的key是否存在
				if(value != undefined){
					gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
				}	
			}
		}
		try{
			if(RM.formula.formulaProcessActive.otherActiveEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.otherActiveEdit._customCallBack);
				RM.formula.formulaProcessActive.otherActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.otherActiveEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formulaProcessActive.otherActiveEdit.getcallBackInfo_DG = function(obj){
		if(RM.formula.formulaProcessActive.otherActiveEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.otherActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formulaProcessActive.otherActiveEdit._currRow).next().length==0){
					RM.formula.formulaProcessActive.otherActiveEdit._oGrid.addNewRow();
				}	
				RM.formula.formulaProcessActive.otherActiveEdit._currRow = $(RM.formula.formulaProcessActive.otherActiveEdit._currRow).next();
				$(RM.formula.formulaProcessActive.otherActiveEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formulaProcessActive.otherActiveEdit._currRow,obj[i],RM.formula.formulaProcessActive.otherActiveEdit._prefix,RM.formula.formulaProcessActive.otherActiveEdit._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formulaProcessActive.otherActiveEdit._currRow,RM.formula.formulaProcessActive.otherActiveEdit._prefix,obj[i],RM.formula.formulaProcessActive.otherActiveEdit._oGrid)");
		}
		try{
			if(RM.formula.formulaProcessActive.otherActiveEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.otherActiveEdit._customCallBack);
				RM.formula.formulaProcessActive.otherActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.otherActiveEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.otherActiveEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formulaProcessActive.otherActiveEdit._oGrid, RM.formula.formulaProcessActive.otherActiveEdit._currRow, RM.formula.formulaProcessActive.otherActiveEdit._key, RM.formula.formulaProcessActive.otherActiveEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formulaProcessActive.otherActiveEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.otherActiveEdit._customCallBack);
				RM.formula.formulaProcessActive.otherActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.otherActiveEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.otherActiveEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formulaProcessActive.otherActiveEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcessActive_otherActiveEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			//下拉框去除配料和投配料
$("#formulaProcessActiveactiveTypeid option[value='activeType/activeType2']").remove();
$("#formulaProcessActiveactiveTypeid option[value='activeType/activeType4']").remove();

//插入隐藏的表单号
$('input[name="formulaProcessActive.processTableId"]').val($("input[name='formulaProcess.processTableId']").val());
//插入工序Id
$('input[name="formulaProcessActive.processHiddenId"]').val($("input[name='formulaProcess.formId']").val());
//插入配方Id
$('input[name="formulaProcessActive.formulaHiddenId"]').val($('input[name="formulaProcess.formulaHideId"]').val());

//读取是否启用lims
$("#RM_formula_formulaProcessActive_otherActiveEdit_main_div").append("<input type=\"hidden\" id=\"isLIMS\">");
//获取系统编码LIMS
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
$('#isLIMS').val(isLIMS);

//只读系统
$('#formulaProcessActiveexeSystemid').disabledSelect();
		
var activeId=$('input[name="formulaProcessActive.id"]').val();
//如果是新建页面
if(activeId=='' || activeId==undefined){
	newInit();
}else{
	//控制系统执行
	autoOperate();
	//活动类型选择投料
	if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType3"){
		var isAgile=$('input[name="formulaProcessActive.isAgile"]').val();
		if(isAgile == 'false'){
			TypeThreeOperate();
		}else{
			newInit();
			$("[name='formulaProcessActive.isAgile_check']").attr("disabled",false);
			//投料顺序
			$("[name='formulaProcessActive.actOrder']").attr("readonly",false);	
			$("#formulaProcessActive_actOrder").parents("td").prev().css({color:"rgb(179, 3, 3)"})	
		}
	}
	//当活动类型选择产出
	if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType6"){
		TypeSixOperate();
	}
	//活动类型选择常规或者不选时
	if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType1" ||$("#formulaProcessActiveactiveTypeid").val()==""){
		TypeOneOperate();
	}
	//活动类型选择检查
	if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType5"){
		TypeFiveOperate();
	}
}		
if($('#formulaProcessActive_batchPhaseID').val() != ''){//批控同步的活动，控制执行系统不能修改
	$('input[name="formulaProcessActive.auto_check"]').attr('disabled',true);
}

if($("input[name='formulaProcessActive.isReplace']").val() == 'true'){//如勾选固定数量，区间上下限都设置成只读
	$("input[name='formulaProcessActive.minQuality']").attr("readonly","readonly");
	$("input[name='formulaProcessActive.maxQuality']").attr("readonly","readonly");
}
		});
	})(jQuery);
	RM.formula.formulaProcessActive.otherActiveEdit.beforeSubmitMethodSettingInPage = function(){
		//活动类型选择检验
if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType5"){
//	if($("input[name='formulaProcessActive.testProduct.name']").val()==""  && $('#isLIMS').val()=='true'){
//		RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975326')}");
//		return false;
//	}
	
	if($("input[name='formulaProcessActive.qualityStandard.name']").val()==""  ){
		RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975375')}");
		return false;
	}
}

//如果phaseID不为空
if(  $('input[name="formulaProcessActive.batchPhaseID"]').val()!=""   &&  $("#formulaProcessActiveactiveTypeid").val()!="activeType/activeType3"  &&  $('input[name="formulaProcessActive.auto"]').val()=='true'  ){
	RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon148707497531133333')}");
	return false;
}

//名称不为空
if($("#formulaProcessActive_name").val()==""){
	RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975311')}");
	return false;
}
//发生于不为空
if($("#formulaProcessActiveoccurTurnid").val()==""){
	RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975388')}");
	return false;
}
//类型不为空
if($("#formulaProcessActiveactiveTypeid").val()==""){
	RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975389')}");
	return false;
}
//物品必填
if($("input[name='formulaProcessActive.product.productCode']").attr("readonly")!="readonly" && ($("input[name='formulaProcessActive.product.productCode']").val()=='' || $("input[name='formulaProcessActive.product.productCode']").val()==undefined) ||($("input[name='formulaProcessActive.product.productCode']").attr("readonly")!="readonly" && $("input[name='formulaProcessActive.product.productName']").val()=="")){
	RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975312')}");
	return false;
}

//投料顺序
if($('input[name="formulaProcessActive.actOrder"]').val()==''  && $('input[name="formulaProcessActive.auto"]').val()=='false' && $("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType3"){
    RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074234278922')}");
	return false;
}

//单位数量
if($("input[name='formulaProcessActive.standardQuantity']").attr("readonly")!="readonly" && ($("input[name='formulaProcessActive.standardQuantity']").val()=='' || $("input[name='formulaProcessActive.standardQuantity']").val()==undefined)){
	RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975374')}");
	return false;
}
if($("[name='formulaProcess.batchUnitID']").val()!=''&&$("[name='formulaProcess.batchUnitID']").val()!=undefined){
	if($("[name='formulaProcessActive.batchPhaseID']").val()!=''&&$("[name='formulaProcessActive.batchPhaseID']").val()!=undefined){
		if($("#formulaProcessActiveoccurTurnid").val()!="occurTurn/occurTurn2"){
			RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487330199424')}");
			return false;
		}
	}else{
			if($("#formulaProcessActiveoccurTurnid").val()=="occurTurn/occurTurn2"){
			RM_formula_formulaProcessActive_otherActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.propertydisplayName.randon1487330199425')}");
			return false;
		}
	}
}
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formulaProcessActive.otherActiveEdit.initCount = 0;
	RM.formula.formulaProcessActive.otherActiveEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_otherActiveEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formulaProcessActive_otherActiveEdit_datagrids');	
		var	conHeight = h-$("#RM_formula_formulaProcessActive_otherActiveEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formulaProcessActive_otherActiveEdit_main_div .edit-panes-s").each(function(index){
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
					if(thisHeight && thisHeight > 0) {
						$(this).parent().height(thisHeight);
					}
					datatableHeight = conHeight - thisHeight;
				}
			} else {
				if(thisHeight > conHeight) {
					$(this).parent().height(conHeight);
					$(this).parent().css("overflow-y","auto");
				} else if(thisHeight && thisHeight > 0) {
					$(this).parent().height(thisHeight);
				}
			}
			if(datagrids && datagrids.length > 0) {
				if(datagrids[index].length > 0) {
					datatableHeight = datatableHeight - 15;
					var perHeight = datatableHeight/datagrids[index].length;
					for(var dg=0;dg<datagrids[index].length;dg++) {
						
						var dgwidget = eval(datagrids[index][dg]+'Widget');
						
						if(dgwidget) {
							
							dgwidget.setHeight(perHeight - 68);
							
						} else {
							if(RM.formula.formulaProcessActive.otherActiveEdit.initCount <= 2) {
								setTimeout(function(){RM.formula.formulaProcessActive.otherActiveEdit.initSize();}, 200);
								RM.formula.formulaProcessActive.otherActiveEdit.initCount++;
							}/* else {
								RM.formula.formulaProcessActive.otherActiveEdit.initCount = 0;
							}*/
						}
					}
				}
			} else {
				//$(this).parent().height(conHeight-30);
				$(this).parent().height(conHeight-7); //为什么减去7呢，因为要跟底部框保持一定的距离 by xudihui
				$(this).parent().css("overflow-y","auto");
			}
		});
	}

	$(function(){
		RM.formula.formulaProcessActive.otherActiveEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.formula.formulaProcessActive.otherActiveEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.formula.formulaProcessActive.otherActiveEdit.initSize();});
	});
</script>
<script type="text/javascript">
	
function activityTypeChange(){
	//活动类型只能选择投料、产出、常规、检查	
	if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType2" ||$("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType4"){
	RM_formula_formulaProcessActive_otherActivaEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975350')}");
	$("#formulaProcessActive_activeType_id__jQSelect01 h4").html("");
	}
	//活动类型选择投料
	if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType3"){
		//机动投料可编辑 默认否
		$('input[name="formulaProcessActive.isAgile_check"]').removeAttr("disabled");
		$('input[name="formulaProcessActive.isAgile_check"]').attr("checked", false);
		TypeThreeOperate();
	}
	//当活动类型选择产出
	if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType6"){
		TypeSixOperate();
		$("[name='formulaProcessActive.isAgile']").val(false);
		$("[name='formulaProcessActive.isMixQuality_check']").attr("checked", false);
		$("input[name='formulaProcessActive.isMixQuality']").val(false);
		$("[name='formulaProcessActive.isReplace']").val(false);
	}
	//活动类型选择常规或者不选时
	if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType1" ||$("#formulaProcessActiveactiveTypeid").val()==""){
		TypeOneOperate();
		$("[name='formulaProcessActive.isAgile']").val(false);
		$("[name='formulaProcessActive.isReplace']").val(false);
		$("[name='formulaProcessActive.isMixQuality']").val(false);
	}
	//活动类型选择检查
	if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType5"){
		TypeFiveOperate(); 
		$("[name='formulaProcessActive.isAgile']").val(false);
		$("[name='formulaProcessActive.isReplace']").val(false);
		$("[name='formulaProcessActive.isMixQuality']").val(false);
	}
}
function isAgileChange(){
	var isAgile=$('input[name="formulaProcessActive.isAgile"]').val();
	if(isAgile == 'true'){
		TypeThreeOperate();
	}else{
		newInit();
		$("[name='formulaProcessActive.isAgile_check']").attr("disabled",false);
		//必填颜色恢复
		$("#formulaProcessActive_product_productCode").parents("td").prev().attr("style","text-align: right;");
		$("#formulaProcessActive_standardQuantity").parents("td").prev().attr("style","text-align: right;");
		$("#formulaProcessActive_actOrder").parents("td").prev().attr("style","text-align: right;");
		$("#formulaProcessActive_qualityStandard_name").parents("td").prev().attr("style","text-align: right;");
		$("#formulaProcessActive_testProduct_name").parents("td").prev().attr("style","text-align: right;");
		//清空数据
		$("#formulaProcessActive_product_productCode").val("");
		$("#formulaProcessActive_product_productName").val("");
		$("[name='formulaProcessActive.product.id']").val("");
		$('input[name="formulaProcessActive.isReplace_check"]').attr("checked", false);
		$("[name='formulaProcessActive.isMixQuality_check']").attr("checked", false);
		$("[name='formulaProcessActive.isReplace_check']").attr("checked", false);
		$("[name='formulaProcessActive.isReplace']").val(false);
		$("[name='formulaProcessActive.isMixQuality']").val(false);
		$("input[name='formulaProcessActive.isMixQuality']").val(false);
		$("#formulaProcessActive_standardQuantity").val('');
		$("input[name='formulaProcessActive.maxQuality']").val('');
		$("input[name='formulaProcessActive.minQuality']").val('');
		$("#formulaProcessActive_product_productBaseUnit_name").val("");
		$("#formulaProcessActive_lossRate").val("");
		//$("#formulaProcessActive_actOrder").val("");
		//投料顺序
		$("[name='formulaProcessActive.actOrder']").attr("readonly",false);	
		$("#formulaProcessActive_actOrder").parents("td").prev().css({color:"rgb(179, 3, 3)"})	
	}
}
function isType(){
	//替代料
	var isPlace=$('input[name="formulaProcessActive.isReplace"]').val();
	if(isPlace=='false'){
		//单位数量为0，且不可编辑
		$('input[name="formulaProcessActive.standardQuantity"]').val(0);
		$("#formulaProcessActive_standardQuantity").attr("readonly",true);
		$('input[name="formulaProcessActive.minQuality"]').val("");
		$("#formulaProcessActive_minQuality").attr("readonly",true);
		$('input[name="formulaProcessActive.maxQuality"]').val("");
		$("#formulaProcessActive_maxQuality").attr("readonly",true);
	}else{
		//单位数量可编辑
		$('input[name="formulaProcessActive.standardQuantity"]').val('');
		$("#formulaProcessActive_standardQuantity").attr("readonly",false);
		$('input[name="formulaProcessActive.minQuality"]').val("");
		$("#formulaProcessActive_minQuality").attr("readonly",false);
		$('input[name="formulaProcessActive.maxQuality"]').val("");
		$("#formulaProcessActive_maxQuality").attr("readonly",false);
	}
}
function autoChange(){
                   //自动的值
        			var autoValue=$('input[name="formulaProcessActive.auto"]').val();
        			if(autoValue=='true'){
        			     //去掉批控选项
        			      $("#formulaProcessActiveexeSystemid option[value='RMsystem/system1']").remove();
        			      $("#formulaProcessActiveexeSystemid").setValue('RMsystem/system2');
        			     
        			      //系统变为可编辑
        			      $('#formulaProcessActiveexeSystemid').unDisabledSelect();
						  //控制系统执行为否且活动类型为投料时，投料顺序可编辑且不可为空  by pl 
						  if($("#formulaProcessActiveactiveTypeid").val()=="activeType/activeType3"){
							  //投料顺序
							  $("[name='formulaProcessActive.actOrder']").attr("readonly",false);	
							  $("#formulaProcessActive_actOrder").parents("td").prev().css({color:"rgb(179, 3, 3)"})
                           }						  
						  //移动端
						  $("[name='formulaProcessActive.mobileTerminal_check']").attr("disabled",false);
						
						  
        			}else if(autoValue=='false'){
								$("#formulaProcessActiveexeSystemid").append('<option value="RMsystem/system1">批控系统</option>');
        						$('#formulaProcessActiveexeSystemid').setValue('RMsystem/system1');
        						$('#formulaProcessActiveexeSystemid').disabledSelect(); 
							  //投料顺序
							  $("[name='formulaProcessActive.actOrder']").attr("readonly",true);
							  $("[name='formulaProcessActive.actOrder']").val("");
							   $("#formulaProcessActive_actOrder").parents("td").prev().css({color:"#000000"})	
							  //移动端
							  $("[name='formulaProcessActive.mobileTerminal_check']").attr("disabled",true);
							  $('input[name="formulaProcessActive.mobileTerminal_check"]').attr("checked",false);
							  $('input[name="formulaProcessActive.mobileTerminal"]').val(false);
        			}
        
        }
function finalInspect(){
	var flag = $('input[name="formulaProcessActive.finalInspection"]').val();
	if(flag == 'true'){
		var productId = $('input[name="formulaProcess.formulaId.product.id"]').val();
		var productCode = $('input[name="formulaProcess.formulaId.product.productCode"]').val();
		var productName = $('input[name="formulaProcess.formulaId.product.productName"]').val();
		
		$('input[name="formulaProcessActive.product.id"]').val(productId);
		$('input[name="formulaProcessActive.product.productCode"]').val(productCode);
		$('input[name="formulaProcessActive.product.productName"]').val(productName);
	}else{
		$('input[name="formulaProcessActive.product.id"]').val('');
		$('input[name="formulaProcessActive.product.productCode"]').val('');
		$('input[name="formulaProcessActive.product.productName"]').val('');
	}
}
function systemChange(){
              //自动的值
        			var autoValue=$('input[name="formulaProcessActive.auto"]').val();
        			alert(autoValue);
        			if(autoValue=='false'){
        			alert(1111);
        			      		$("#formulaProcessActiveexeSystemid option[value='system/system1']").remove();
        			      $('#formulaProcessActiveexeSystemid').unDisabledSelect();
        			}else if(autoValue=='true'){
        			alert(22222);
        						$('#formulaProcessActiveexeSystemid').setValue('system/system1');
        						$('#formulaProcessActiveexeSystemid').disabledSelect();
        			}
        
        
}
function unChange(){
dg1487554913298RenderOverEvent();
dg1487555065561RenderOverEvent();

}

	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_otherActiveEdit,js,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码
   var formulaId= $('input[name="formulaProcessActive.formulaId.id"]').val();
    RM.formula.formulaProcessActive.callBackInfo = function(res){
      console.log(res.dealSuccessFlag);
      if(res.dealSuccessFlag){
          setTimeout(function(){
              try{
                otherEdit.close();
                closeLoadPanel();
				var url = "/RM/formula/formulaBom/autoProduce.action?formulaId="+$('input[name="formulaProcess.formulaId.id"]').val();
				var isEBR="";
				$.ajax({
				    url : url,
				    type : 'get',
				    async : false,
				    success : function(msg) {
				        if(msg!=null){
				            isEBR = msg.result;
				            //workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
                          if(opener!=null){
                           opener.FormulaBom_dg1503551511011Widget._DT.setRequestDataUrl(opener.FormulaBom_dg1503551511011Widget._DT.requestUrl);
                          }
                          FormulaProcessActive_dg1487554913298Widget._DT.setRequestDataUrl(FormulaProcessActive_dg1487554913298Widget._DT.requestUrl); 						
                          window.location.reload();
                        }
				    }
				});
                  
              }catch(e){}
          },200);
      } else {
          CUI.showErrorInfos(res);
      }
  };
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>