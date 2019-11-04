<!-- RM_7.5.0.0/formula/activeTypeEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1493278086744')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_activeTypeEdit,head,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
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
	CUI.ns('RM.formula.formulaProcessActive.activeTypeEdit');
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
<@errorbar id="RM_formula_formulaProcessActive_activeTypeEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formulaProcessActive_activeTypeEdit_form" cssStyle="height:100%;" hiddenField="formulaProcessActive.qualityStandard.id,formulaProcessActive.id,formulaProcessActive.product.id,formulaProcessActive.testProduct.id," onsubmitMethod="RM.formula.formulaProcessActive.activeTypeEdit.beforeSubmitMethod()" ecAction="/RM/formula/formulaProcessActive/activeTypeEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="activeTypeEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_activeTypeEdit">
	<input type="hidden" name="datagridKey" value="RM_formula_formulaProcessActive_activeTypeEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaProcessActive.version" value="${(formulaProcessActive.version)!0}" />
	<input type="hidden" name="formulaProcessActive.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="formulaProcessActive.qualityStandard.id" value="${(formulaProcessActive.qualityStandard.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.id" value="${(formulaProcessActive.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.product.id" value="${(formulaProcessActive.product.id)!""}"/>
		<input type="hidden" name="formulaProcessActive.testProduct.id" value="${(formulaProcessActive.testProduct.id)!""}"/>
	<div id="RM_activeTypeEdit_edit_div" style="height:100%">
		<div id="RM_formula_formulaProcessActive_activeTypeEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcessActive_activeTypeEdit_form"+"_attcount";
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="center" style="text-align: center;;" >
					
							<label style="width:100%;padding-center:5px;;" value="${getText('RM.propertydisplayName.randon1493297031005')}" >${getText('RM.propertydisplayName.randon1493297031005')}</label>
				</td>
				
						<#assign formulaProcessActive_activeTypeForBatch_defaultValue  = ''>
							 							<#assign formulaProcessActive_activeTypeForBatch_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaProcessActive_activeTypeForBatch_defaultValue!}" formId="RM_formula_formulaProcessActive_activeTypeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.activeTypeForBatch.id" code="activeforbatch" value="${(formulaProcessActive.activeTypeForBatch.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_activeTypeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.activeTypeForBatch.id" code="activeforbatch" value="${(formulaProcessActive.activeTypeForBatch.id)!}"  />
									
								</#if>
							
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331086583')}" >${getText('RM.propertydisplayName.randon1487331086583')}</label>
				</td>
				
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
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign formulaProcessActive_product_productName_defaultValue  = ''>
														<#assign formulaProcessActive_product_productName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1450085069587')}" viewType="${viewType!}" deValue="${formulaProcessActive_product_productName_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.activeTypeEdit._querycustomFunc('formulaProcessActive_product_productName')"  value="${(formulaProcessActive.product.productName)!}" displayFieldName="productName" name="formulaProcessActive.product.productName" id="formulaProcessActive_product_productName" type="other" url="/MESBasic/product/product/refProductLayout.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_activeTypeEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_product_refProductLayout" onkeyupfuncname=";_callback_formulaProcessActive_product_productName(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_activeTypeEdit_form',obj, 'formulaProcessActive.product', '/MESBasic/product/product/refProductLayout.action');
												CUI.commonFills('RM_formula_formulaProcessActive_activeTypeEdit_form', 'formulaProcessActive.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487330759313')}" >${getText('RM.propertydisplayName.randon1487330759313')}</label>
				</td>
				
						<#assign formulaProcessActive_activeType_defaultValue  = ''>
							 							<#assign formulaProcessActive_activeType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaProcessActive_activeType_defaultValue!}" formId="RM_formula_formulaProcessActive_activeTypeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_activeTypeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488776431957')}" >${getText('RM.propertydisplayName.randon1488776431957')}</label>
				</td>
				
						<#assign formulaProcessActive_channelOrManual_defaultValue  = ''>
							 							<#assign formulaProcessActive_channelOrManual_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
									<div class="fix-search-click">
										<select property_type="BOOLEAN" class="edit-select" originalvalue="<#if !newObj>${(formulaProcessActive.channelOrManual!false)?string('true','false')}<#elseif formulaProcessActive_channelOrManual_defaultValue?has_content>${(formulaProcessActive_channelOrManual_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj>${(formulaProcessActive.channelOrManual!false)?string('true','false')}<#else>${(formulaProcessActive_channelOrManual_defaultValue!true)?string}</#if>" style=";" name="formulaProcessActive.channelOrManual" > 
											<option value=""></option>
											<#if (newObj?? && !newObj)>
											<#if (formulaProcessActive.channelOrManual)??>
											<option value="true" <#if (formulaProcessActive.channelOrManual!false)?string('true','false')=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive.channelOrManual!false)?string('true','false')=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											<#else>
											<option value="true">${getText('ec.select.yes')}</option>
											<option value="false">${getText('ec.select.no')}</option>
											</#if>
											<#else>
											<option value="true" <#if (formulaProcessActive_channelOrManual_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive_channelOrManual_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</#if>
										</select>
									</div>
							
							
				</td>
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331060176')}" >${getText('RM.propertydisplayName.randon1487331060176')}</label>
				</td>
				
						<#assign formulaProcessActive_isReplace_defaultValue  = ''>
							 							<#assign formulaProcessActive_isReplace_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
									<div class="fix-search-click">
										<select property_type="BOOLEAN" class="edit-select" originalvalue="<#if !newObj>${(formulaProcessActive.isReplace!false)?string('true','false')}<#elseif formulaProcessActive_isReplace_defaultValue?has_content>${(formulaProcessActive_isReplace_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj>${(formulaProcessActive.isReplace!false)?string('true','false')}<#else>${(formulaProcessActive_isReplace_defaultValue!true)?string}</#if>" style=";" name="formulaProcessActive.isReplace" > 
											<option value=""></option>
											<#if (newObj?? && !newObj)>
											<#if (formulaProcessActive.isReplace)??>
											<option value="true" <#if (formulaProcessActive.isReplace!false)?string('true','false')=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive.isReplace!false)?string('true','false')=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											<#else>
											<option value="true">${getText('ec.select.yes')}</option>
											<option value="false">${getText('ec.select.no')}</option>
											</#if>
											<#else>
											<option value="true" <#if (formulaProcessActive_isReplace_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive_isReplace_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</#if>
										</select>
									</div>
							
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488696577648')}" >${getText('RM.propertydisplayName.randon1488696577648')}</label>
				</td>
				
						<#assign formulaProcessActive_isMixQuality_defaultValue  = ''>
							 							<#assign formulaProcessActive_isMixQuality_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
									<div class="fix-search-click">
										<select property_type="BOOLEAN" class="edit-select" originalvalue="<#if !newObj>${(formulaProcessActive.isMixQuality!false)?string('true','false')}<#elseif formulaProcessActive_isMixQuality_defaultValue?has_content>${(formulaProcessActive_isMixQuality_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj>${(formulaProcessActive.isMixQuality!false)?string('true','false')}<#else>${(formulaProcessActive_isMixQuality_defaultValue!true)?string}</#if>" style=";" name="formulaProcessActive.isMixQuality" > 
											<option value=""></option>
											<#if (newObj?? && !newObj)>
											<#if (formulaProcessActive.isMixQuality)??>
											<option value="true" <#if (formulaProcessActive.isMixQuality!false)?string('true','false')=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive.isMixQuality!false)?string('true','false')=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											<#else>
											<option value="true">${getText('ec.select.yes')}</option>
											<option value="false">${getText('ec.select.no')}</option>
											</#if>
											<#else>
											<option value="true" <#if (formulaProcessActive_isMixQuality_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
											<option value="false" <#if (formulaProcessActive_isMixQuality_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</#if>
										</select>
									</div>
							
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488696624224')}" >${getText('RM.propertydisplayName.randon1488696624224')}</label>
				</td>
				
						<#assign formulaProcessActive_maxQuality_defaultValue  = ''>
							 					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formulaProcessActive.maxQuality" id="formulaProcessActive_maxQuality"  style=";" originalvalue="<#if newObj&& !(formulaProcessActive.maxQuality)?has_content>${formulaProcessActive_maxQuality_defaultValue!}<#elseif (formulaProcessActive.maxQuality)?has_content>#{(formulaProcessActive.maxQuality)!; m6M6}</#if>" value="<#if newObj&& !(formulaProcessActive.maxQuality)?has_content>${formulaProcessActive_maxQuality_defaultValue!}<#elseif (formulaProcessActive.maxQuality)?has_content>#{(formulaProcessActive.maxQuality)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcessActive_maxQuality').unbind('blur').bind('blur',function(){
										var percision = 6;
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488696602815')}" >${getText('RM.propertydisplayName.randon1488696602815')}</label>
				</td>
				
						<#assign formulaProcessActive_minQuality_defaultValue  = ''>
							 							<#assign formulaProcessActive_minQuality_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formulaProcessActive.minQuality" id="formulaProcessActive_minQuality"  style=";" originalvalue="<#if newObj&& !(formulaProcessActive.minQuality)?has_content>${formulaProcessActive_minQuality_defaultValue!}<#elseif (formulaProcessActive.minQuality)?has_content>#{(formulaProcessActive.minQuality)!; m6M6}</#if>" value="<#if newObj&& !(formulaProcessActive.minQuality)?has_content>${formulaProcessActive_minQuality_defaultValue!}<#elseif (formulaProcessActive.minQuality)?has_content>#{(formulaProcessActive.minQuality)!; m6M6}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcessActive_minQuality').unbind('blur').bind('blur',function(){
										var percision = 6;
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
		</tr>
	</table>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="display:none;">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td><td style='height:0px;border:none;width:9%'></td><td style='height:0px;border:none;width:16%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488697524885')}" >${getText('RM.propertydisplayName.randon1488697524885')}</label>
				</td>
				
						<#assign formulaProcessActive_fromContainer_defaultValue  = ''>
							 							<#assign formulaProcessActive_fromContainer_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaProcessActive_fromContainer_defaultValue!}" formId="RM_formula_formulaProcessActive_activeTypeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.fromContainer.id" code="fromContainer" value="${(formulaProcessActive.fromContainer.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_activeTypeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaProcessActive.fromContainer.id" code="fromContainer" value="${(formulaProcessActive.fromContainer.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1488696547250')}" >${getText('RM.propertydisplayName.randon1488696547250')}</label>
				</td>
				
						<#assign formulaProcessActive_container_defaultValue  = ''>
							 							<#assign formulaProcessActive_container_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcessActive.container" id="formulaProcessActive_container"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.container)?has_content>${(formulaProcessActive.container?html)!}<#else>${formulaProcessActive_container_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.container)?has_content>${(formulaProcessActive.container?html)!}<#else>${formulaProcessActive_container_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490317960117')}" >${getText('RM.propertydisplayName.randon1490317960117')}</label>
				</td>
				
						<#assign formulaProcessActive_testProduct_name_defaultValue  = ''>
														<#assign formulaProcessActive_testProduct_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('RM.viewtitle.randon1490318000877')}" viewType="${viewType!}" deValue="${formulaProcessActive_testProduct_name_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.activeTypeEdit._querycustomFunc('formulaProcessActive_testProduct_name')"  value="${(formulaProcessActive.testProduct.name)!}" displayFieldName="name" name="formulaProcessActive.testProduct.name" id="formulaProcessActive_testProduct_name" type="other" url="/RM/sampleProj/sampleProj/sampleProjRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_activeTypeEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_sampleProj_sampleProjRef" onkeyupfuncname=";_callback_formulaProcessActive_testProduct_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.testProduct.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.testProduct.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_activeTypeEdit_form',obj, 'formulaProcessActive.testProduct', '/RM/sampleProj/sampleProj/sampleProjRef.action');
												CUI.commonFills('RM_formula_formulaProcessActive_activeTypeEdit_form', 'formulaProcessActive.testProduct',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487595424436')}" >${getText('RM.propertydisplayName.randon1487595424436')}</label>
				</td>
				
						<#assign formulaProcessActive_qualityStandard_code_defaultValue  = ''>
														<#assign formulaProcessActive_qualityStandard_code_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" mneenable=false reftitle="${getText('RM.viewtitle.randon1487596068024')}" viewType="${viewType!}" deValue="${formulaProcessActive_qualityStandard_code_defaultValue!}" conditionfunc="RM.formula.formulaProcessActive.activeTypeEdit._querycustomFunc('formulaProcessActive_qualityStandard_code')"  value="${(formulaProcessActive.qualityStandard.code)!}" displayFieldName="code" name="formulaProcessActive.qualityStandard.code" id="formulaProcessActive_qualityStandard_code" type="other" url="/RM/qualityStandard/stand/standRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcessActive_activeTypeEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_qualityStandard_standRef"  onkeyupfuncname=";_callback_formulaProcessActive_qualityStandard_code(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcessActive.id)?? && (formulaProcessActive.qualityStandard.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcessActive.qualityStandard.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcessActive_activeTypeEdit_form',obj, 'formulaProcessActive.qualityStandard', '/RM/qualityStandard/stand/standRef.action');
												CUI.commonFills('RM_formula_formulaProcessActive_activeTypeEdit_form', 'formulaProcessActive.qualityStandard',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_activeTypeEdit", 'EDIT')>
			<#if customPropList?? && customPropList?size gte 1>
				<table class="edit-table" style="" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td style="width:22%;"></td><td style="width:29%;"></td>
					<td style="width:22%;"></td><td style="width:29%;"></td>
				</tr>
			<tr class="dialog_tr">
				<#-- 排布自定义字段 -->
				<#assign totalspan = 0>
				<#list customPropList as c>
				<#assign cspan = (c.colspan!1)>
				<#if cspan gt 2>
					<#assign cspan = 2>
				</#if>
				<#if cspan gt 1>
					<#assign colspanVal = cspan * 2 - 1>
				</#if> 
				<#assign cp_index = c_index + totalspan>
				<#if (cp_index + 1) % 2 == 0>
					<#assign restcol = 1>
				<#else>
					<#assign restcol = 2 - (cp_index + 1) % 2 + 1>
				</#if>
				<#if (cp_index gt 0 && ((cp_index + 1) % 2 == 1 || 2 == 1)) || cspan gt restcol>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="RM_formula_formulaProcessActive_activeTypeEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${formulaProcessActive[columnName]!}" seniorSystemCode=isS2 />
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
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${formulaProcessActive[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="RM_formula_formulaProcessActive_activeTypeEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

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
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_activeTypeEdit,html,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.formula.formulaProcessActive.activeTypeEdit.beforeSaveProcess = function(){}
	RM.formula.formulaProcessActive.activeTypeEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formulaProcessActive.activeTypeEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formulaProcessActive_activeTypeEdit_form').trigger('beforeSubmit');
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
			$("#RM_formula_formulaProcessActive_activeTypeEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_formula_formulaProcessActive_activeTypeEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.formula.formulaProcessActive.activeTypeEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formulaProcessActive.activeTypeEdit.print = function(url){
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
		
		RM.formula.formulaProcessActive.activeTypeEdit.saveSetting = function(){
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
		RM.formula.formulaProcessActive.activeTypeEdit.printSetting = function(){
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
			RM.formula.formulaProcessActive.activeTypeEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcessActive.activeTypeEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formulaProcessActive.activeTypeEdit.settingDialog.show();
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
			RM.formula.formulaProcessActive.activeTypeEdit._customCallBack = customCallBack;
		}
		RM.formula.formulaProcessActive.activeTypeEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formulaProcessActive_activeTypeEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formulaProcessActive_activeTypeEdit_fileupload"></div>');
			}
			RM.formula.formulaProcessActive.activeTypeEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formulaProcessActive_activeTypeEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formulaProcessActive_activeTypeEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formulaProcessActive.activeTypeEdit.infoDialog.show();
			if($('#RM_formula_formulaProcessActive_activeTypeEdit_fileupload').html() == '') {
				$('#RM_formula_formulaProcessActive_activeTypeEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formulaProcessActive&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formulaProcessActive.activeTypeEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formulaProcessActive.activeTypeEdit.referenceCopyBackInfo";
		RM.formula.formulaProcessActive.activeTypeEdit.dialog = dialog;
		RM.formula.formulaProcessActive.activeTypeEdit._dialog = foundation.common.select({
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
	
	RM.formula.formulaProcessActive.activeTypeEdit.referenceCopyBackInfo = function(obj){
		if(RM.formula.formulaProcessActive.activeTypeEdit._dialog){
			RM.formula.formulaProcessActive.activeTypeEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formulaProcessActive.activeTypeEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formulaProcessActive_activeTypeEdit_form','RM_formula_formulaProcessActive_activeTypeEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formulaProcessActive.activeTypeEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formulaProcessActive.activeTypeEdit.dialog._el).load('/RM/formula/formulaProcessActive/activeTypeEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formula.formulaProcessActive.activeTypeEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formulaProcessActive.activeTypeEdit.dialog._config.iframe, RM.formula.formulaProcessActive.activeTypeEdit.dialog._dialog ).prop( 'src', '/RM/formula/formulaProcessActive/activeTypeEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formulaProcessActive.activeTypeEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formulaProcessActive.activeTypeEdit.dialog._el).load('/RM/formula/formulaProcessActive/activeTypeEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formula.formulaProcessActive.activeTypeEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formulaProcessActive.activeTypeEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formulaProcessActive.activeTypeEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formulaProcessActive.activeTypeEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formulaProcessActive.activeTypeEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_formula_formulaProcessActive_activeTypeEdit' + '_' + extraFrameParam;
		var callbackName="";
		RM.formula.formulaProcessActive.activeTypeEdit._prefix = '';
		RM.formula.formulaProcessActive.activeTypeEdit._oGrid = oGrid;
		RM.formula.formulaProcessActive.activeTypeEdit._sUrl = url;
		if(customCallBack){
			RM.formula.formulaProcessActive.activeTypeEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formulaProcessActive.activeTypeEdit.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formulaProcessActive.activeTypeEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formulaProcessActive.activeTypeEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formulaProcessActive.activeTypeEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcessActive.activeTypeEdit.getcallBackInfo_DG";
			RM.formula.formulaProcessActive.activeTypeEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formulaProcessActive.activeTypeEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formulaProcessActive.activeTypeEdit.getcallBackInfo";
		}
		if(RM.formula.formulaProcessActive.activeTypeEdit._prefix!=''){
			RM.formula.formulaProcessActive.activeTypeEdit._prefix = RM.formula.formulaProcessActive.activeTypeEdit._prefix.substring(1);
		}
		if(RM.formula.formulaProcessActive.activeTypeEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcessActive.activeTypeEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formulaProcessActive.activeTypeEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcessActive.activeTypeEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formulaProcessActive.activeTypeEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcessActive.activeTypeEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcessActive.activeTypeEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcessActive.activeTypeEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formulaProcessActive.activeTypeEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formulaProcessActive_activeTypeEdit_form',obj[0], RM.formula.formulaProcessActive.activeTypeEdit._prefix, RM.formula.formulaProcessActive.activeTypeEdit._sUrl);
		CUI.commonFills('RM_formula_formulaProcessActive_activeTypeEdit_form',RM.formula.formulaProcessActive.activeTypeEdit._prefix,obj[0]);

		try{
			if(RM.formula.formulaProcessActive.activeTypeEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.activeTypeEdit._customCallBack);
				RM.formula.formulaProcessActive.activeTypeEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.activeTypeEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formulaProcessActive.activeTypeEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formulaProcessActive.activeTypeEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.activeTypeEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formulaProcessActive.activeTypeEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcessActive.activeTypeEdit._sUrl);
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
			if(RM.formula.formulaProcessActive.activeTypeEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.activeTypeEdit._customCallBack);
				RM.formula.formulaProcessActive.activeTypeEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.activeTypeEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formulaProcessActive.activeTypeEdit.getcallBackInfo_DG = function(obj){
		if(RM.formula.formulaProcessActive.activeTypeEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.activeTypeEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formulaProcessActive.activeTypeEdit._currRow).next().length==0){
					RM.formula.formulaProcessActive.activeTypeEdit._oGrid.addNewRow();
				}	
				RM.formula.formulaProcessActive.activeTypeEdit._currRow = $(RM.formula.formulaProcessActive.activeTypeEdit._currRow).next();
				$(RM.formula.formulaProcessActive.activeTypeEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formulaProcessActive.activeTypeEdit._currRow,obj[i],RM.formula.formulaProcessActive.activeTypeEdit._prefix,RM.formula.formulaProcessActive.activeTypeEdit._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formulaProcessActive.activeTypeEdit._currRow,RM.formula.formulaProcessActive.activeTypeEdit._prefix,obj[i],RM.formula.formulaProcessActive.activeTypeEdit._oGrid)");
		}
		try{
			if(RM.formula.formulaProcessActive.activeTypeEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.activeTypeEdit._customCallBack);
				RM.formula.formulaProcessActive.activeTypeEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.activeTypeEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.activeTypeEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formulaProcessActive.activeTypeEdit._oGrid, RM.formula.formulaProcessActive.activeTypeEdit._currRow, RM.formula.formulaProcessActive.activeTypeEdit._key, RM.formula.formulaProcessActive.activeTypeEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formulaProcessActive.activeTypeEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.activeTypeEdit._customCallBack);
				RM.formula.formulaProcessActive.activeTypeEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.activeTypeEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.activeTypeEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formulaProcessActive.activeTypeEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcessActive_activeTypeEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			var selectRow=FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
if(FormulaProcessActive_dg1487554913298Widget.getCellValue(selectRow,"auto")==true){
	//隐藏产出
	$("#formulaProcessActiveactiveTypeForBatchid option[value='activeforbatch/activeType06']").remove();
	//隐藏检查
	$("#formulaProcessActiveactiveTypeForBatchid option[value='activeforbatch/activeType05']").remove();
	//隐藏常规
	$("#formulaProcessActiveactiveTypeForBatchid option[value='activeforbatch/activeType04']").remove();
	//手工投配料
	$("#formulaProcessActiveactiveTypeForBatchid option[value='activeforbatch/activeType03']").remove();
}
		});
	})(jQuery);
	RM.formula.formulaProcessActive.activeTypeEdit.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formulaProcessActive.activeTypeEdit.initCount = 0;
	RM.formula.formulaProcessActive.activeTypeEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_activeTypeEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formulaProcessActive_activeTypeEdit_datagrids');	
		var	conHeight = h-$("#RM_formula_formulaProcessActive_activeTypeEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formulaProcessActive_activeTypeEdit_main_div .edit-panes-s").each(function(index){
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
							if(RM.formula.formulaProcessActive.activeTypeEdit.initCount <= 2) {
								setTimeout(function(){RM.formula.formulaProcessActive.activeTypeEdit.initSize();}, 200);
								RM.formula.formulaProcessActive.activeTypeEdit.initCount++;
							}/* else {
								RM.formula.formulaProcessActive.activeTypeEdit.initCount = 0;
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
		RM.formula.formulaProcessActive.activeTypeEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.formula.formulaProcessActive.activeTypeEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.formula.formulaProcessActive.activeTypeEdit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_activeTypeEdit,js,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>