<!-- RM_7.5.0.0/formula/fomulaActiveEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1487812919927')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_fomulaActiveEdit,head,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
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
	CUI.ns('RM.formula.formulaProcessActive.fomulaActiveEdit');
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
<@errorbar id="RM_formula_formulaProcessActive_fomulaActiveEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formulaProcessActive_fomulaActiveEdit_form" cssStyle="height:100%;" hiddenField="formulaProcessActive.id," onsubmitMethod="RM.formula.formulaProcessActive.fomulaActiveEdit.beforeSubmitMethod()" ecAction="/RM/formula/formulaProcessActive/fomulaActiveEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="fomulaActiveEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_fomulaActiveEdit">
	<input type="hidden" name="datagridKey" value="RM_formula_formulaProcessActive_fomulaActiveEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaProcessActive.version" value="${(formulaProcessActive.version)!0}" />
	<input type="hidden" name="formulaProcessActive.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="formulaProcessActive.id" value="${(formulaProcessActive.id)!""}"/>
	<div id="RM_fomulaActiveEdit_edit_div" style="height:100%">
		<div id="RM_formula_formulaProcessActive_fomulaActiveEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcessActive_fomulaActiveEdit_form"+"_attcount";
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
				
						<#assign formulaProcessActive_activeType_defaultValue  = 'activeType/activeType4'>
							 					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaProcessActive_activeType_defaultValue!}" formId="RM_formula_formulaProcessActive_fomulaActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formulaProcessActive_fomulaActiveEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaProcessActive.activeType.id" code="activeType" value="${(formulaProcessActive.activeType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1490162289778')}" >${getText('RM.propertydisplayName.randon1490162289778')}</label>
				</td>
				
						<#assign formulaProcessActive_longTime_defaultValue  = ''>
							 							<#assign formulaProcessActive_longTime_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
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
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331110232')}" >${getText('RM.propertydisplayName.randon1487331110232')}</label>
				</td>
				
						<#assign formulaProcessActive_ingredientsOrder_defaultValue  = ''>
							 							<#assign formulaProcessActive_ingredientsOrder_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="INTEGER" name="formulaProcessActive.ingredientsOrder" id="formulaProcessActive_ingredientsOrder"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.ingredientsOrder)?has_content>${(formulaProcessActive.ingredientsOrder?html)!}<#else>${formulaProcessActive_ingredientsOrder_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.ingredientsOrder)?has_content>${(formulaProcessActive.ingredientsOrder?html)!}<#else>${formulaProcessActive_ingredientsOrder_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331130107')}" >${getText('RM.propertydisplayName.randon1487331130107')}</label>
				</td>
				
						<#assign formulaProcessActive_auto_defaultValue  = ''>
							 							<#assign formulaProcessActive_auto_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaProcessActive.auto_check" originalvalue="<#if !newObj><#if (formulaProcessActive.auto)??>${(formulaProcessActive.auto!false)?string('true','false')}<#else>false</#if><#elseif formulaProcessActive_auto_defaultValue?has_content>${(formulaProcessActive_auto_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (formulaProcessActive.auto)??>${(formulaProcessActive.auto!false)?string('true','false')}<#else>false</#if><#else>${(formulaProcessActive_auto_defaultValue!true)?string}</#if>"  />
								
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331143778')}" >${getText('RM.propertydisplayName.randon1487331143778')}</label>
				</td>
				
						<#assign formulaProcessActive_exeBillName_defaultValue  = ''>
							 							<#assign formulaProcessActive_exeBillName_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcessActive.exeBillName" id="formulaProcessActive_exeBillName"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.exeBillName)?has_content>${(formulaProcessActive.exeBillName?html)!}<#else>${formulaProcessActive_exeBillName_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.exeBillName)?has_content>${(formulaProcessActive.exeBillName?html)!}<#else>${formulaProcessActive_exeBillName_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1493729738415')}" >${getText('RM.propertydisplayName.randon1493729738415')}</label>
				</td>
				
						<#assign formulaProcessActive_batchPhaseID_defaultValue  = ''>
							 							<#assign formulaProcessActive_batchPhaseID_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcessActive.batchPhaseID" id="formulaProcessActive_batchPhaseID"  style=";" originalvalue="<#if !newObj || (formulaProcessActive.batchPhaseID)?has_content>${(formulaProcessActive.batchPhaseID?html)!}<#else>${formulaProcessActive_batchPhaseID_defaultValue!}</#if>" value="<#if !newObj || (formulaProcessActive.batchPhaseID)?has_content>${(formulaProcessActive.batchPhaseID?html)!}<#else>${formulaProcessActive_batchPhaseID_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcessActive", "RM_7.5.0.0_formula_fomulaActiveEdit", 'EDIT')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="RM_formula_formulaProcessActive_fomulaActiveEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${formulaProcessActive[columnName]!}" seniorSystemCode=isS2 />
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
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${formulaProcessActive[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="RM_formula_formulaProcessActive_fomulaActiveEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487331194516')}" >${getText('RM.propertydisplayName.randon1487331194516')}</label>
				</td>
				
						<#assign formulaProcessActive_meno_defaultValue  = ''>
							 							<#assign formulaProcessActive_meno_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="formulaProcessActive_meno" originalvalue="<#if !newObj || (formulaProcessActive.meno)?has_content>${(formulaProcessActive.meno?html)!}<#else>${formulaProcessActive_meno_defaultValue?html}</#if>"  name="formulaProcessActive.meno" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (formulaProcessActive.meno)?has_content>${(formulaProcessActive.meno)!}<#else>${formulaProcessActive_meno_defaultValue}</#if></textarea></div>
							
				</td>
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
								<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaMixtureActive", "RM_7.5.0.0_formula_fomulaActiveEditdg1487917117329", "DATAGRID", "formulaMixtureActive")>
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
			
								
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formulaProcessActive/data-dg1487917117329.action?formulaProcessActive.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_fomulaActiveEditdg1487917117329">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcessActive/data-dg1487917117329.action?formulaProcessActive.id=${(formulaProcessActive.id)!-1}&datagridCode=RM_7.5.0.0_formula_fomulaActiveEditdg1487917117329">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1552984800558')}\",handler:function(event){DT_FormulaMixtureActive_dg1487917117329_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1552984800558')}\",handler:function(event){DT_FormulaMixtureActive_dg1487917117329_deldatagrid();},iconClass:\"cui-btn-del\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaMixtureActive_dg1487917117329" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1487917117329_id" value="FormulaMixtureActive_dg1487917117329" />
			
			<input type="hidden" id="dg1487917117329_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487811340490')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcessActive/data-dg1487917117329.action?operateType=export&datagridCode=RM_7.5.0.0_formula_fomulaActiveEditdg1487917117329"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaMixtureActive_dg1487917117329" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="FormulaMixtureActive_dg1487917117329" viewType="${viewType}" renderOverEvent="dg1487917117329RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcessActive_fomulaActiveEdit_form" noPermissionKeys="name,exeOrder,product.productCode,product.productName,isPlace,standardQuantity,auto,batchSite,longTime,formulaType,saveFlag,addFlag,meno" modelCode="RM_7.5.0.0_formula_FormulaMixtureActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1487917117329" dtPage="dgPage"  hidekeyPrefix="dg1487917117329" hidekey="['id','version','product.id','product.productCode','product.id','product.productName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1487917117329PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="RM.buttonPropertyshowName.radion1552984800558,DELETEROW,del" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										  
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=true     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487811442421')}" width=100 showFormatFunc=""  />
							<#assign exeOrder_displayDefaultType=''>
								<#assign exeOrder_defaultValue=''>
										<#assign exeOrder_defaultValue=''>
										  
									<@datacolumn key="exeOrder"        showFormat="TEXT" defaultValue="${(exeOrder_defaultValue!)?string}" defaultDisplay="${(exeOrder_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487811763250')}" width=100 showFormatFunc=""  />
							<#assign product_productCode_displayDefaultType=''>
								<#assign product_productCode_defaultValue=''>
										<#assign product_productCode_defaultValue=''>
																	<#if (product_productCode_defaultValue!)?string=="currentUser">
								<#assign product_productCode_defaultValue='${staffJson!}'>
							<#elseif (product_productCode_defaultValue!)?string=="currentPost">
								<#assign product_productCode_defaultValue='${postJson!}'>
							<#elseif (product_productCode_defaultValue!)?string=="currentDepart">
								<#assign product_productCode_defaultValue='${deptJson!}'>
							<#elseif (product_productCode_defaultValue!)?string=="currentComp">
								<#assign product_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="product.productCode"        showFormat="SELECTCOMP" defaultValue="${(product_productCode_defaultValue!)?string}" defaultDisplay="${(product_productCode_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcessActive.fomulaActiveEdit"  textalign="center"  viewUrl="/MESBasic/product/product/refProductLayout.action" viewCode="MESBasic_1_product_refProductLayout" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
							<#assign product_productName_displayDefaultType=''>
								<#assign product_productName_defaultValue=''>
										<#assign product_productName_defaultValue=''>
																	<#if (product_productName_defaultValue!)?string=="currentUser">
								<#assign product_productName_defaultValue='${staffJson!}'>
							<#elseif (product_productName_defaultValue!)?string=="currentPost">
								<#assign product_productName_defaultValue='${postJson!}'>
							<#elseif (product_productName_defaultValue!)?string=="currentDepart">
								<#assign product_productName_defaultValue='${deptJson!}'>
							<#elseif (product_productName_defaultValue!)?string=="currentComp">
								<#assign product_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="product.productName"        showFormat="TEXT" defaultValue="${(product_productName_defaultValue!)?string}" defaultDisplay="${(product_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formulaProcessActive.fomulaActiveEdit"  textalign="center"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
							<#assign isPlace_displayDefaultType=''>
								<#assign isPlace_defaultValue=''>
										<#assign isPlace_defaultValue=''>
										 
										
										
										
										
										
 
									<@datacolumn key="isPlace"        showFormat="CHECKBOX" defaultValue="${(isPlace_defaultValue!)?string}" defaultDisplay="${(isPlace_displayDefaultType!)?string}" onchange="FormulaMixtureActive_dg1487917117329Widget.evalCustomFunction(nRow,sFieldName,'changeQuantity()')" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487812026631')}" width=100 showFormatFunc=""  />
							<#assign standardQuantity_displayDefaultType=''>
								<#assign standardQuantity_defaultValue='0.00'>
										  
									<@datacolumn key="standardQuantity"        showFormat="TEXT" defaultValue="${(standardQuantity_defaultValue!)?string}" defaultDisplay="${(standardQuantity_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487812075915')}" width=100 showFormatFunc=""  />
							<#assign auto_displayDefaultType=''>
								<#assign auto_defaultValue=''>
										<#assign auto_defaultValue=''>
										  
									<@datacolumn key="auto"        showFormat="CHECKBOX" defaultValue="${(auto_defaultValue!)?string}" defaultDisplay="${(auto_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487812128791')}" width=100 showFormatFunc=""  />
							<#assign batchSite_displayDefaultType=''>
								<#assign batchSite_defaultValue=''>
										<#assign batchSite_defaultValue=''>
										 
									<@systemCodeColumn code="batchSite" textalign="center" defaultValue="${(batchSite_defaultValue!)?string}" key="batchSite.id" editable=true type="selectcomp" notnull=false    onchange="FormulaMixtureActive_dg1487917117329Widget.evalCustomFunction(nRow,sFieldName,'ptSave()')"  label="${getText('RM.propertydisplayName.randon1487811905250')}" width=100   />
							<#assign longTime_displayDefaultType=''>
								<#assign longTime_defaultValue=''>
										<#assign longTime_defaultValue=''>
										  
									<@datacolumn key="longTime"        showFormat="TEXT" defaultValue="${(longTime_defaultValue!)?string}" defaultDisplay="${(longTime_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1490162318454')}" width=100 showFormatFunc=""  />
							<#assign formulaType_displayDefaultType=''>
								<#assign formulaType_defaultValue='activeType/activeType2'>
										 									<@systemCodeColumn code="activeType" textalign="center" defaultValue="${(formulaType_defaultValue!)?string}" key="formulaType.id" editable=true type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487811825429')}" width=100   />
							<#assign saveFlag_displayDefaultType=''>
								<#assign saveFlag_defaultValue='true'>
										  
									<@datacolumn key="saveFlag"        showFormat="CHECKBOX" defaultValue="${(saveFlag_defaultValue!)?string}" defaultDisplay="${(saveFlag_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488329849392')}" width=100 showFormatFunc=""  />
							<#assign addFlag_displayDefaultType=''>
								<#assign addFlag_defaultValue='true'>
										  
									<@datacolumn key="addFlag"        showFormat="CHECKBOX" defaultValue="${(addFlag_defaultValue!)?string}" defaultDisplay="${(addFlag_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488331230571')}" width=100 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_formula_FormulaMixtureActive", "RM_7.5.0.0_formula_fomulaActiveEditdg1487917117329", "DATAGRID", "formulaMixtureActive")>
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
											<#assign selectCompName = 'RM.formula.formulaProcessActive.fomulaActiveEdit'>
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
										  
									<@datacolumn key="meno"        showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487812510638')}" width=100 showFormatFunc=""  />
			
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
				function FormulaMixtureActive_dg1487917117329_check_datagridvalid(){
					//
					var errorObj =FormulaMixtureActive_dg1487917117329Widget._DT.testData();
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
				
				function savedg1487917117329DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaMixtureActive_dg1487917117329Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaMixtureActive_dg1487917117329Widget') > -1) {
						FormulaMixtureActive_dg1487917117329Widget.setAllRowEdited();
					}
					var json = FormulaMixtureActive_dg1487917117329Widget.parseEditedData();
					$('input[name="dg1487917117329ListJson"]').remove();
					$('input[name="dgLists[\'dg1487917117329\']"]').remove();
					$('input[name="dg1487917117329ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1487917117329\']">').val(json).appendTo($('#RM_formula_formulaProcessActive_fomulaActiveEdit_form'));
					$('<input type="hidden" name="dg1487917117329ModelCode">').val('RM_7.5.0.0_formula_FormulaMixtureActive').appendTo($('#RM_formula_formulaProcessActive_fomulaActiveEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1487917117329ListJson">').val(json).appendTo($('#RM_formula_formulaProcessActive_fomulaActiveEdit_form'));
				}
				function DT_FormulaMixtureActive_dg1487917117329_deldatagrid(){
					var deleteRows = FormulaMixtureActive_dg1487917117329Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processActiveId.id','product.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487917117329DeletedIds").length>0){
							$("#dg1487917117329DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487917117329DeletedIds" name="dgDeletedIds[\'dg1487917117329\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487917117329DeletedIds['+CUI('input[name^="dg1487917117329DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form'));
					});
					return deleteRows;
				}
				function DT_FormulaMixtureActive_dg1487917117329_delTreeNodes(){
					var deleteRows = FormulaMixtureActive_dg1487917117329Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processActiveId.id','product.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487917117329DeletedIds").length>0){
							$("#dg1487917117329DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487917117329DeletedIds" name="dgDeletedIds[\'dg1487917117329\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487917117329DeletedIds['+CUI('input[name^="dg1487917117329DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcessActive_fomulaActiveEdit_datagrids');
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
							if(datagrids[0][i] == 'FormulaMixtureActive_dg1487917117329') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'FormulaMixtureActive_dg1487917117329';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'FormulaMixtureActive_dg1487917117329';
					}
					$('body').data('RM_formula_formulaProcessActive_fomulaActiveEdit_datagrids', datagrids);
				});
				
				var FormulaMixtureActive_dg1487917117329_importDialog = null;
				function FormulaMixtureActive_dg1487917117329_showImportDialog(){
					try{
						if(FormulaMixtureActive_dg1487917117329_importDialog!=null&&FormulaMixtureActive_dg1487917117329_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcessActive/initImport.action?datagridCode=RM_7.5.0.0_formula_fomulaActiveEditdg1487917117329&tid=${id!}&datagridName=dg1487917117329";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_formula_fomulaActiveEditdg1487917117329_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						FormulaMixtureActive_dg1487917117329_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaMixtureActive_dg1487917117329"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaMixtureActive_dg1487917117329_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaMixtureActive_dg1487917117329_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaMixtureActive_dg1487917117329_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaMixtureActive_dg1487917117329_downLoadFile(){
					var url = "/RM/formula/formulaProcessActive/downLoad.action?datagridCode=RM_7.5.0.0_formula_fomulaActiveEditdg1487917117329&templateRelatedModelCode=RM_7.5.0.0_formula_fomulaActiveEditdg1487917117329&downloadType=template&fileName=dg1487917117329";
					window.open(url,"","");
				}
				function dg1487917117329RenderOverEvent(){
					var length=FormulaMixtureActive_dg1487917117329Widget.getRowLength();
for(var i=0;i<length;i++){
			FormulaMixtureActive_dg1487917117329Widget.setCellValue(i,'saveFlag',true);
}
				}
				function dg1487917117329PageInitMethod(nTabIndex){
					RM.formula.formulaProcessActive.fomulaActiveEdit.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_fomulaActiveEdit,html,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.formula.formulaProcessActive.fomulaActiveEdit.beforeSaveProcess = function(){}
	RM.formula.formulaProcessActive.fomulaActiveEdit.beforeSubmitMethod = function() {
		try{eval("savedg1487917117329DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formulaProcessActive.fomulaActiveEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formulaProcessActive_fomulaActiveEdit_form').trigger('beforeSubmit');
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
			$("#RM_formula_formulaProcessActive_fomulaActiveEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_formula_formulaProcessActive_fomulaActiveEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.formula.formulaProcessActive.fomulaActiveEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formulaProcessActive.fomulaActiveEdit.print = function(url){
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
		
		RM.formula.formulaProcessActive.fomulaActiveEdit.saveSetting = function(){
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
		RM.formula.formulaProcessActive.fomulaActiveEdit.printSetting = function(){
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
			RM.formula.formulaProcessActive.fomulaActiveEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcessActive.fomulaActiveEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formulaProcessActive.fomulaActiveEdit.settingDialog.show();
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
			RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack = customCallBack;
		}
		RM.formula.formulaProcessActive.fomulaActiveEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formulaProcessActive_fomulaActiveEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formulaProcessActive_fomulaActiveEdit_fileupload"></div>');
			}
			RM.formula.formulaProcessActive.fomulaActiveEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formulaProcessActive_fomulaActiveEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formulaProcessActive_fomulaActiveEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formulaProcessActive.fomulaActiveEdit.infoDialog.show();
			if($('#RM_formula_formulaProcessActive_fomulaActiveEdit_fileupload').html() == '') {
				$('#RM_formula_formulaProcessActive_fomulaActiveEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formulaProcessActive&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formulaProcessActive.fomulaActiveEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formulaProcessActive.fomulaActiveEdit.referenceCopyBackInfo";
		RM.formula.formulaProcessActive.fomulaActiveEdit.dialog = dialog;
		RM.formula.formulaProcessActive.fomulaActiveEdit._dialog = foundation.common.select({
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
	
	RM.formula.formulaProcessActive.fomulaActiveEdit.referenceCopyBackInfo = function(obj){
		if(RM.formula.formulaProcessActive.fomulaActiveEdit._dialog){
			RM.formula.formulaProcessActive.fomulaActiveEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formulaProcessActive.fomulaActiveEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formulaProcessActive_fomulaActiveEdit_form','RM_formula_formulaProcessActive_fomulaActiveEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formulaProcessActive.fomulaActiveEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formulaProcessActive.fomulaActiveEdit.dialog._el).load('/RM/formula/formulaProcessActive/fomulaActiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formula.formulaProcessActive.fomulaActiveEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formulaProcessActive.fomulaActiveEdit.dialog._config.iframe, RM.formula.formulaProcessActive.fomulaActiveEdit.dialog._dialog ).prop( 'src', '/RM/formula/formulaProcessActive/fomulaActiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formulaProcessActive.fomulaActiveEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formulaProcessActive.fomulaActiveEdit.dialog._el).load('/RM/formula/formulaProcessActive/fomulaActiveEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formula.formulaProcessActive.fomulaActiveEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formulaProcessActive.fomulaActiveEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formulaProcessActive.fomulaActiveEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formulaProcessActive.fomulaActiveEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_formula_formulaProcessActive_fomulaActiveEdit' + '_' + extraFrameParam;
		var callbackName="";
		RM.formula.formulaProcessActive.fomulaActiveEdit._prefix = '';
		RM.formula.formulaProcessActive.fomulaActiveEdit._oGrid = oGrid;
		RM.formula.formulaProcessActive.fomulaActiveEdit._sUrl = url;
		if(customCallBack){
			RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formulaProcessActive.fomulaActiveEdit.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formulaProcessActive.fomulaActiveEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formulaProcessActive.fomulaActiveEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formulaProcessActive.fomulaActiveEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcessActive.fomulaActiveEdit.getcallBackInfo_DG";
			RM.formula.formulaProcessActive.fomulaActiveEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formulaProcessActive.fomulaActiveEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formulaProcessActive.fomulaActiveEdit.getcallBackInfo";
		}
		if(RM.formula.formulaProcessActive.fomulaActiveEdit._prefix!=''){
			RM.formula.formulaProcessActive.fomulaActiveEdit._prefix = RM.formula.formulaProcessActive.fomulaActiveEdit._prefix.substring(1);
		}
		if(RM.formula.formulaProcessActive.fomulaActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcessActive.fomulaActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formulaProcessActive.fomulaActiveEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcessActive.fomulaActiveEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formulaProcessActive.fomulaActiveEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcessActive.fomulaActiveEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcessActive.fomulaActiveEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcessActive.fomulaActiveEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formulaProcessActive.fomulaActiveEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formulaProcessActive_fomulaActiveEdit_form',obj[0], RM.formula.formulaProcessActive.fomulaActiveEdit._prefix, RM.formula.formulaProcessActive.fomulaActiveEdit._sUrl);
		CUI.commonFills('RM_formula_formulaProcessActive_fomulaActiveEdit_form',RM.formula.formulaProcessActive.fomulaActiveEdit._prefix,obj[0]);

		try{
			if(RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack);
				RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.fomulaActiveEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formulaProcessActive.fomulaActiveEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formulaProcessActive.fomulaActiveEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.fomulaActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formulaProcessActive.fomulaActiveEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcessActive.fomulaActiveEdit._sUrl);
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
			if(RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack);
				RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.fomulaActiveEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formulaProcessActive.fomulaActiveEdit.getcallBackInfo_DG = function(obj){
		if(RM.formula.formulaProcessActive.fomulaActiveEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcessActive.fomulaActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formulaProcessActive.fomulaActiveEdit._currRow).next().length==0){
					RM.formula.formulaProcessActive.fomulaActiveEdit._oGrid.addNewRow();
				}	
				RM.formula.formulaProcessActive.fomulaActiveEdit._currRow = $(RM.formula.formulaProcessActive.fomulaActiveEdit._currRow).next();
				$(RM.formula.formulaProcessActive.fomulaActiveEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formulaProcessActive.fomulaActiveEdit._currRow,obj[i],RM.formula.formulaProcessActive.fomulaActiveEdit._prefix,RM.formula.formulaProcessActive.fomulaActiveEdit._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formulaProcessActive.fomulaActiveEdit._currRow,RM.formula.formulaProcessActive.fomulaActiveEdit._prefix,obj[i],RM.formula.formulaProcessActive.fomulaActiveEdit._oGrid)");
		}
		try{
			if(RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack);
				RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.fomulaActiveEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.fomulaActiveEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formulaProcessActive.fomulaActiveEdit._oGrid, RM.formula.formulaProcessActive.fomulaActiveEdit._currRow, RM.formula.formulaProcessActive.fomulaActiveEdit._key, RM.formula.formulaProcessActive.fomulaActiveEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack) {
				eval(RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack);
				RM.formula.formulaProcessActive.fomulaActiveEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcessActive.fomulaActiveEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcessActive.fomulaActiveEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formulaProcessActive.fomulaActiveEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			//插入隐藏的表单号
        $('input[name="formulaProcessActive.processTableId"]').val($("input[name='formulaProcess.processTableId']").val());
        //插入工序Id
        $('input[name="formulaProcessActive.processHiddenId"]').val($("input[name='formulaProcess.formId']").val());
		
if($('#formulaProcessActive_batchPhaseID').val() != ''){
	$('input[name="formulaProcessActive.auto_check"]').attr('disabled',true);
}
		});
	})(jQuery);
	RM.formula.formulaProcessActive.fomulaActiveEdit.beforeSubmitMethodSettingInPage = function(){
		if($("#formulaProcessActive_name").val()==""){
					RM_formula_formulaProcessActive_fomulaActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975311')}");
					return false;
				}
				//标准时长
				if($("#formulaProcessActive_longTime").val()==""){
					RM_formula_formulaProcessActive_fomulaActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975300')}");
					return false;
				}
				//投料顺序
				if($("#formulaProcessActive_ingredientsOrder").val()==""){
					RM_formula_formulaProcessActive_fomulaActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975333')}");
					return false;
				}
				var rows=FormulaMixtureActive_dg1487917117329Widget.getRowLength();
				if(rows!=0){
					for(var i=0;i<rows;i++){
					var name=FormulaMixtureActive_dg1487917117329Widget.getCellValue(i,"name");
					if(name==""||name==null){
					   RM_formula_formulaProcessActive_fomulaActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975377')}");
					   return false;
					}
				}
				}
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formulaProcessActive.fomulaActiveEdit.initCount = 0;
	RM.formula.formulaProcessActive.fomulaActiveEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_fomulaActiveEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formulaProcessActive_fomulaActiveEdit_datagrids');	
		var	conHeight = h-$("#RM_formula_formulaProcessActive_fomulaActiveEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formulaProcessActive_fomulaActiveEdit_main_div .edit-panes-s").each(function(index){
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
							if(RM.formula.formulaProcessActive.fomulaActiveEdit.initCount <= 2) {
								setTimeout(function(){RM.formula.formulaProcessActive.fomulaActiveEdit.initSize();}, 200);
								RM.formula.formulaProcessActive.fomulaActiveEdit.initCount++;
							}/* else {
								RM.formula.formulaProcessActive.fomulaActiveEdit.initCount = 0;
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
		RM.formula.formulaProcessActive.fomulaActiveEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.formula.formulaProcessActive.fomulaActiveEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.formula.formulaProcessActive.fomulaActiveEdit.initSize();});
	});
</script>
<script type="text/javascript">
	


function changeQuantity(){
	var rows=FormulaMixtureActive_dg1487917117329Widget.getRowLength();
	for(var i=0;i<rows;i++){
		if($($($("#FormulaMixtureActive_dg1487917117329_tbody").children().children().children("td")[4+10*i]).children().children()).attr("checked")=="checked"){
			var row=FormulaMixtureActive_dg1487917117329Widget.getSelectedRow();
	        FormulaMixtureActive_dg1487917117329Widget.setCellProperty(row,"standardQuantity",'readonly','true');
		}
		else{
			var row=FormulaMixtureActive_dg1487917117329Widget.getSelectedRow();
			//var row1=FormulaMixtureActive_dg1487917117329Widget.getSelectedRow();
	        FormulaMixtureActive_dg1487917117329Widget.setCellProperty(row,"standardQuantity",'readonly',false);
		}
	}
}
function ptSave(){
	var bitchSite=FormulaMixtureActive_dg1487917117329Widget.getCellValue(0,"batchSite.id");
	if(bitchSite=="batchSite/batchSite3"){
		//将增行按钮删除
		$($($(".paginatorbar-operatebar")[2].children).first()).css("display","none");
	}
	else{
		$($($(".paginatorbar-operatebar")[2].children).first()).removeAttr("style");
		var row=FormulaMixtureActive_dg1487917117329Widget.getSelectedRow();
		if(row!=0){
			var bitchSite0=FormulaMixtureActive_dg1487917117329Widget.getCellValue(row-1,"batchSite.id");
		var bitchSite1=FormulaMixtureActive_dg1487917117329Widget.getCellValue(row,"batchSite.id");
		if(bitchSite0!=bitchSite1){
			//$($($(".paginatorbar-operatebar")[2].children).first()).css("display","none");
			RM_formula_formulaProcessActive_fomulaActiveEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon1487074975344')}");
			FormulaMixtureActive_dg1487917117329Widget.setCellValue(row,"batchSite.id","");
		    return false;
		}
		}
		
	}
}

	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_fomulaActiveEdit,js,RM_7.5.0.0_formula_FormulaProcessActive,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>