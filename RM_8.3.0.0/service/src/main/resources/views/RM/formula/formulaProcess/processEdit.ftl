<!-- RM_7.5.0.0/formula/processEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('RM.viewtitle.randon1487242538511')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processEdit,head,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
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
	CUI.ns('RM.formula.formulaProcess.processEdit');
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
<#assign callbackName ="RM.formula.formulaProcess.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="RM_formula_formulaProcess_processEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="RM_formula_formulaProcess_processEdit_form" cssStyle="height:100%;" hiddenField="formulaProcess.formulaId.id,formulaProcess.processType.id," onsubmitMethod="RM.formula.formulaProcess.processEdit.beforeSubmitMethod()" ecAction="/RM/formula/formulaProcess/processEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="processEdit">
	<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_processEdit">
	<input type="hidden" name="datagridKey" value="RM_formula_formulaProcess_processEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="formulaProcess.version" value="${(formulaProcess.version)!0}" />
	<input type="hidden" name="formulaProcess.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="formulaProcess.formulaId.id" value="${(formulaProcess.formulaId.id)!""}"/>
		<input type="hidden" name="formulaProcess.processType.id" value="${(formulaProcess.processType.id)!""}"/>
	<div id="RM_processEdit_edit_div" style="height:100%">
		<div id="RM_formula_formulaProcess_processEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcess_processEdit_form"+"_attcount";
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
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487295011793')}" >${getText('RM.propertydisplayName.randon1487295011793')}</label>
				</td>
				
						<#assign formulaProcess_name_defaultValue  = ''>
							 							<#assign formulaProcess_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcess.name" id="formulaProcess_name"  style=";" originalvalue="<#if !newObj || (formulaProcess.name)?has_content>${(formulaProcess.name?html)!}<#else>${formulaProcess_name_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.name)?has_content>${(formulaProcess.name?html)!}<#else>${formulaProcess_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon14870742324234')}" >${getText('RM.propertydisplayName.randon14870742324234')}</label>
				</td>
				
						<#assign formulaProcess_processType_name_defaultValue  = ''>
														<#assign formulaProcess_processType_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" mneenable=false reftitle="${getText('RM.viewtitle.randon1487220867598')}" viewType="${viewType!}" deValue="${formulaProcess_processType_name_defaultValue!}" conditionfunc="RM.formula.formulaProcess.processEdit._querycustomFunc('formulaProcess_processType_name')"  value="${(formulaProcess.processType.name)!}" displayFieldName="name" name="formulaProcess.processType.name" id="formulaProcess_processType_name" type="other" url="/RM/processType/processType/processTypeRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcess_processEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_processType_processTypeRef"  onkeyupfuncname=";_callback_formulaProcess_processType_name(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcess.id)?? && (formulaProcess.processType.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcess.processType.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcess_processEdit_form',obj, 'formulaProcess.processType', '/RM/processType/processType/processTypeRef.action');
												CUI.commonFills('RM_formula_formulaProcess_processEdit_form', 'formulaProcess.processType',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487292241411')}" >${getText('RM.propertydisplayName.randon1487292241411')}</label>
				</td>
				
						<#assign formulaProcess_longTime_defaultValue  = ''>
							 							<#assign formulaProcess_longTime_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="formulaProcess.longTime" id="formulaProcess_longTime"  style=";" originalvalue="<#if newObj&& !(formulaProcess.longTime)?has_content>${formulaProcess_longTime_defaultValue!}<#elseif (formulaProcess.longTime)?has_content>#{(formulaProcess.longTime)!; m2M2}</#if>" value="<#if newObj&& !(formulaProcess.longTime)?has_content>${formulaProcess_longTime_defaultValue!}<#elseif (formulaProcess.longTime)?has_content>#{(formulaProcess.longTime)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#formulaProcess_longTime').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487292241411")}')}");
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1539849930820')}" >${getText('RM.propertydisplayName.randon1539849930820')}</label>
				</td>
				
						<#assign formulaProcess_procSort_defaultValue  = ''>
							 							<#assign formulaProcess_procSort_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcess.procSort" id="formulaProcess_procSort"  style=";" originalvalue="<#if !newObj || (formulaProcess.procSort)?has_content>${(formulaProcess.procSort?html)!}<#else>${formulaProcess_procSort_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.procSort)?has_content>${(formulaProcess.procSort?html)!}<#else>${formulaProcess_procSort_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("RM_7.5.0.0_formula_FormulaProcess", "RM_7.5.0.0_formula_processEdit", 'EDIT')>
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
					<#assign elementName = 'formulaProcess' + "." + columnName>
					<#assign elementId = 'formulaProcess' + "_" + columnName>
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
						<#if formulaProcess[columnName]??>
							<#assign dateVal = (formulaProcess[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="RM_formula_formulaProcess_processEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${formulaProcess[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${formulaProcess[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${formulaProcess[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${formulaProcess[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="RM_formula_formulaProcess_processEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487292273721')}" >${getText('RM.propertydisplayName.randon1487292273721')}</label>
				</td>
				
						<#assign formulaProcess_meno_defaultValue  = ''>
							 							<#assign formulaProcess_meno_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="formulaProcess.meno" id="formulaProcess_meno"  style=";" originalvalue="<#if !newObj || (formulaProcess.meno)?has_content>${(formulaProcess.meno?html)!}<#else>${formulaProcess_meno_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.meno)?has_content>${(formulaProcess.meno?html)!}<#else>${formulaProcess_meno_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:47%'></td><td style='height:0px;border:none;width:54%'></td></tr>
		<tr class="dialog_tr">
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.ID')}" >${getText('ec.common.ID')}</label>
				</td>
				
						<#assign formulaProcess_formulaId_id_defaultValue  = ''>
														<#assign formulaProcess_formulaId_id_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="LONG" reftitle="${getText('RM.viewtitle.randon1488246963795')}" viewType="${viewType!}" deValue="${formulaProcess_formulaId_id_defaultValue!}" conditionfunc="RM.formula.formulaProcess.processEdit._querycustomFunc('formulaProcess_formulaId_id')"  value="${(formulaProcess.formulaId.id)!}" displayFieldName="id" name="formulaProcess.formulaId.id" id="formulaProcess_formulaId_id" type="other" url="/RM/formula/formula/formulaRef.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formulaProcess_processEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_formula_formulaRef" onkeyupfuncname=";_callback_formulaProcess_formulaId_id(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(formulaProcess.id)?? && (formulaProcess.formulaId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaProcess.formulaId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formulaProcess_processEdit_form',obj, 'formulaProcess.formulaId', '/RM/formula/formula/formulaRef.action');
												CUI.commonFills('RM_formula_formulaProcess_processEdit_form', 'formulaProcess.formulaId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487297610678')}" >${getText('RM.propertydisplayName.randon1487297610678')}</label>
				</td>
				
						<#assign formulaProcess_formulaHideId_defaultValue  = ''>
							 							<#assign formulaProcess_formulaHideId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="formulaProcess.formulaHideId" id="formulaProcess_formulaHideId"  style=";" originalvalue="<#if !newObj || (formulaProcess.formulaHideId)?has_content>${(formulaProcess.formulaHideId?html)!}<#else>${formulaProcess_formulaHideId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formulaHideId)?has_content>${(formulaProcess.formulaHideId?html)!}<#else>${formulaProcess_formulaHideId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487297416937')}" >${getText('RM.propertydisplayName.randon1487297416937')}</label>
				</td>
				
						<#assign formulaProcess_processTableId_defaultValue  = ''>
							 							<#assign formulaProcess_processTableId_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="LONG" name="formulaProcess.processTableId" id="formulaProcess_processTableId"  style=";" originalvalue="<#if !newObj || (formulaProcess.processTableId)?has_content>${(formulaProcess.processTableId?html)!}<#else>${formulaProcess_processTableId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.processTableId)?has_content>${(formulaProcess.processTableId?html)!}<#else>${formulaProcess_processTableId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField" />
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

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processEdit,html,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	RM.formula.formulaProcess.processEdit.beforeSaveProcess = function(){}
	RM.formula.formulaProcess.processEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(RM.formula.formulaProcess.processEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#RM_formula_formulaProcess_processEdit_form').trigger('beforeSubmit');
		//formulaProcess.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="formulaProcess.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#RM_formula_formulaProcess_processEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#RM_formula_formulaProcess_processEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	RM.formula.formulaProcess.processEdit.validate = function(){
		return true;
	}
	
	
	//打印
	RM.formula.formulaProcess.processEdit.print = function(url){
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
		
		RM.formula.formulaProcess.processEdit.saveSetting = function(){
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
		RM.formula.formulaProcess.processEdit.printSetting = function(){
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
			RM.formula.formulaProcess.processEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcess.processEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				RM.formula.formulaProcess.processEdit.settingDialog.show();
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
			RM.formula.formulaProcess.processEdit._customCallBack = customCallBack;
		}
		RM.formula.formulaProcess.processEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#RM_formula_formulaProcess_processEdit_fileupload').length == 0) {
				$('body').append('<div id="RM_formula_formulaProcess_processEdit_fileupload"></div>');
			}
			RM.formula.formulaProcess.processEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "RM_formula_formulaProcess_processEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#RM_formula_formulaProcess_processEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			RM.formula.formulaProcess.processEdit.infoDialog.show();
			if($('#RM_formula_formulaProcess_processEdit_fileupload').html() == '') {
				$('#RM_formula_formulaProcess_processEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=RM_formula_formulaProcess&entityCode=RM_7.5.0.0_formula&dialogId="+dialogId);
			}
		}
	//参照复制函数
	RM.formula.formulaProcess.processEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="RM.formula.formulaProcess.processEdit.referenceCopyBackInfo";
		RM.formula.formulaProcess.processEdit.dialog = dialog;
		RM.formula.formulaProcess.processEdit._dialog = foundation.common.select({
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
	
	RM.formula.formulaProcess.processEdit.referenceCopyBackInfo = function(obj){
		if(RM.formula.formulaProcess.processEdit._dialog){
			RM.formula.formulaProcess.processEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,RM.formula.formulaProcess.processEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('RM_formula_formulaProcess_processEdit_form','RM_formula_formulaProcess_processEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(RM.formula.formulaProcess.processEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(RM.formula.formulaProcess.processEdit.dialog._el).load('/RM/formula/formulaProcess/processEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( RM.formula.formulaProcess.processEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + RM.formula.formulaProcess.processEdit.dialog._config.iframe, RM.formula.formulaProcess.processEdit.dialog._dialog ).prop( 'src', '/RM/formula/formulaProcess/processEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(RM.formula.formulaProcess.processEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(RM.formula.formulaProcess.processEdit.dialog._el).load('/RM/formula/formulaProcess/processEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	RM.formula.formulaProcess.processEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		RM.formula.formulaProcess.processEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		RM.formula.formulaProcess.processEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			RM.formula.formulaProcess.processEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	RM.formula.formulaProcess.processEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'RM_formula_formulaProcess_processEdit' + '_' + extraFrameParam;
		var callbackName="";
		RM.formula.formulaProcess.processEdit._prefix = '';
		RM.formula.formulaProcess.processEdit._oGrid = oGrid;
		RM.formula.formulaProcess.processEdit._sUrl = url;
		if(customCallBack){
			RM.formula.formulaProcess.processEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			RM.formula.formulaProcess.processEdit.gridEventObj = gridEventObj;
			callbackName = "RM.formula.formulaProcess.processEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				RM.formula.formulaProcess.processEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "RM.formula.formulaProcess.processEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcess.processEdit.getcallBackInfo_DG";
			RM.formula.formulaProcess.processEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				RM.formula.formulaProcess.processEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="RM.formula.formulaProcess.processEdit.getcallBackInfo";
		}
		if(RM.formula.formulaProcess.processEdit._prefix!=''){
			RM.formula.formulaProcess.processEdit._prefix = RM.formula.formulaProcess.processEdit._prefix.substring(1);
		}
		if(RM.formula.formulaProcess.processEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaProcess.processEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof RM.formula.formulaProcess.processEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcess.processEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		RM.formula.formulaProcess.processEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaProcess.processEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaProcess.processEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcess.processEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	RM.formula.formulaProcess.processEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('RM_formula_formulaProcess_processEdit_form',obj[0], RM.formula.formulaProcess.processEdit._prefix, RM.formula.formulaProcess.processEdit._sUrl);
		CUI.commonFills('RM_formula_formulaProcess_processEdit_form',RM.formula.formulaProcess.processEdit._prefix,obj[0]);

		try{
			if(RM.formula.formulaProcess.processEdit._customCallBack) {
				eval(RM.formula.formulaProcess.processEdit._customCallBack);
				RM.formula.formulaProcess.processEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.processEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	RM.formula.formulaProcess.processEdit.getcallBackInfo_DG_IE = function(obj){
		if(RM.formula.formulaProcess.processEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcess.processEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = RM.formula.formulaProcess.processEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcess.processEdit._sUrl);
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
			if(RM.formula.formulaProcess.processEdit._customCallBack) {
				eval(RM.formula.formulaProcess.processEdit._customCallBack);
				RM.formula.formulaProcess.processEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.processEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	RM.formula.formulaProcess.processEdit.getcallBackInfo_DG = function(obj){
		if(RM.formula.formulaProcess.processEdit._customBeforeCallBack) {
			var flag = eval(RM.formula.formulaProcess.processEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(RM.formula.formulaProcess.processEdit._currRow).next().length==0){
					RM.formula.formulaProcess.processEdit._oGrid.addNewRow();
				}	
				RM.formula.formulaProcess.processEdit._currRow = $(RM.formula.formulaProcess.processEdit._currRow).next();
				$(RM.formula.formulaProcess.processEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(RM.formula.formulaProcess.processEdit._currRow,obj[i],RM.formula.formulaProcess.processEdit._prefix,RM.formula.formulaProcess.processEdit._sUrl);
			eval("CUI.commonFills_DG(RM.formula.formulaProcess.processEdit._currRow,RM.formula.formulaProcess.processEdit._prefix,obj[i],RM.formula.formulaProcess.processEdit._oGrid)");
		}
		try{
			if(RM.formula.formulaProcess.processEdit._customCallBack) {
				eval(RM.formula.formulaProcess.processEdit._customCallBack);
				RM.formula.formulaProcess.processEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.processEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcess.processEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(RM.formula.formulaProcess.processEdit._oGrid, RM.formula.formulaProcess.processEdit._currRow, RM.formula.formulaProcess.processEdit._key, RM.formula.formulaProcess.processEdit._displayFieldName, obj[i])
		}
		try{
			if(RM.formula.formulaProcess.processEdit._customCallBack) {
				eval(RM.formula.formulaProcess.processEdit._customCallBack);
				RM.formula.formulaProcess.processEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			RM.formula.formulaProcess.processEdit._dialog.close();
		} catch(e){}
	};
	
	RM.formula.formulaProcess.processEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			RM.formula.formulaProcess.processEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcess_processEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			$("input[name='formulaProcess.formulaHideId']").attr("style","display:none");
$('input[name="formulaProcess.processTableId"]').val($('#processTableId').val());
$("input[name='formulaProcess.formulaHideId']").val($('#id').val());
$("input[name='formulaProcess.formulaId.id']").val($('#id').val());
//工序名称
var proName=$("#formulaProcess_name").val();
//在工序名称后添加隐藏框值为工序类型
$($($($("#RM_formula_formulaProcess_processEdit_main_div").children().children().children().children().children().children().children()[1]).children()[1]).children()).append("<div><input type='hidden' id='proName' value='"+proName+"'/></div>");
//上行代码的优化
//$($("input[name='formulaProcess.name']").parent()).append("<div><input type='hidden' id='proName' value='"+proName+"'/></div>");

var arr = new Array();
for (var i = 0; i < FormulaProcess_dg1487242802285Widget.getRowLength(); i++) {
	arr.push(FormulaProcess_dg1487242802285Widget.getCellValue(i,'procSort') || 0);
}
arr.sort();

if ($('input[name="formula.batchContral"]').val() != 'true') {
	//$("input[name='formulaProcess.procSort']").val(Number(arr[arr.length - 1])+1)
}
		});
	})(jQuery);
	RM.formula.formulaProcess.processEdit.beforeSubmitMethodSettingInPage = function(){
		//活动名称
var activeName=$('input[name="formulaProcess.name"]').val();
//配方Id
var formulaId=$('input[name="formulaProcess.formulaHideId"]').val();
//如果是新增的工序进行校验
var value='';
if(activeName!=''){
	var url = "/RM/formula/formulaProcess/checkBeActiveName.action?activeName="+activeName+"&formulaId="+formulaId;
    $.ajax({
	    url : url,
	    type : 'get',
	    async : false,
	    success : function(msg) {
		    if(msg!=null){
			    value = msg.result;
			}
	    }
    });
		
    if((activeName==$("#proName").val() && (Number(value)>1)) || (activeName!=$("#proName").val() && (Number(value)>0))){
	    RM_formula_formulaProcess_processEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon14870234232')}");
	    return false;
    }
}else if((activeName=="") && (Number(value))>0){
	RM_formula_formulaProcess_processEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon14870234232')}");
	return false;
}
//名称不能为空
var processName=$('input[name="formulaProcess.name"]').val();
if(processName==undefined || processName==''){
 		 RM_formula_formulaProcess_processEdit_formDialogErrorBarWidget.showMessage("${getText('RM.fomula.radon14870323423')}");
					   return false;
 }
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	RM.formula.formulaProcess.processEdit.initCount = 0;
	RM.formula.formulaProcess.processEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#RM_processEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('RM_formula_formulaProcess_processEdit_datagrids');	
		var	conHeight = h-$("#RM_formula_formulaProcess_processEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#RM_formula_formulaProcess_processEdit_main_div .edit-panes-s").each(function(index){
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
							if(RM.formula.formulaProcess.processEdit.initCount <= 2) {
								setTimeout(function(){RM.formula.formulaProcess.processEdit.initSize();}, 200);
								RM.formula.formulaProcess.processEdit.initCount++;
							}/* else {
								RM.formula.formulaProcess.processEdit.initCount = 0;
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
		RM.formula.formulaProcess.processEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    RM.formula.formulaProcess.processEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){RM.formula.formulaProcess.processEdit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processEdit,js,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
  
  function formulaProcess_processIdBeforeProcessID_selectEvent(type,url,title,refparam){
			var conditionfunc = "RM.formula.formulaProcess.processEdit._querycustomFunc('formulaProcess_processIdBeforeProcessID')";
			if(eval("typeof("+conditionfunc.substring(0,conditionfunc.indexOf("("))+")!='undefined'")) {
				var conditionfuncStr = eval(conditionfunc)==null ? "" : eval(conditionfunc);
				if(refparam != null && refparam.length > 0) {
					refparam += "&";
				} else {
					refparam = "";
				}
				refparam += "condition=" +  encodeURIComponent(conditionfuncStr);
			}
			refparam+="&multiSelect=true";
			//工序Id
			var formulaId=$('input[name="formulaProcess.formulaHideId"]').val();
			//工序选中的行
			var selectRow=FormulaProcess_dg1487242802285Widget.getSelectedRow();
			var processId='';
			if($('#RM_formula_formulaProcess_processEdit_form input[name="id"]').val()!=''){
					processId=$('#RM_formula_formulaProcess_processEdit_form input[name="id"]').val();
			}else{
					processId=1;
			}
			
			refparam+="&formulaId="+formulaId+"&processId="+processId;
			if(type=="userRange"){
					var outCome = $('input[name="workFlowVar.outcome"]:checked').val();
				$('#formulaProcess_processIdBeforeProcessIDOutcome').val(outCome);
				refparam += "&outcome=" + outCome;
				refparam += "&deploymentId=";
				refparam += "&selectPeople="
			}
			if(type=="staffRange"){
				refparam += "&selectPeople="
			}
			formulaProcess_processIdBeforeProcessID_dialog = foundation.common.select({
				pageType : type,
				closePage : false,
				
				
				callBackFuncName : '_callback_formulaProcess_processIdBeforeProcessID',
				url : url,
				title : title,
				params : refparam
			});
		}
  
function _callback_formulaProcess_processIdBeforeProcessID(objs){
		if (objs == null || objs == undefined || objs.length <= 0) {
				return false;
			}
			var processIds=$('#formulaProcess_processIdBeforeProcessIDMultiIDs').val();
				for(var o=0 ; o < objs.length; o++) {
				processIds=processIds+objs[o].id+",";
				}
  var value='';
		var url = "/RM/formula/formulaProcess/checkBeforeProcess.action?processIds="+processIds;
        $.ajax({
	        url : url,
	        type : 'get',
	        async : false,
	        success : function(msg) {
		     if(msg!=null){
			   value = msg.result;
			
		     }
	         }
            });
   if(value==false){
  	RM_formula_formulaProcess_processEdit_formDialogErrorBarWidget.show('${getText('RM.fomula.radon14870323423232')}','f');
	  												return false;
  }
			for(var o=0 ; o < objs.length; o++) {
				var id = objs[o].id;
				// 当前所有id
				var allmnemultiselectids = CUI("#formulaProcess_processIdBeforeProcessIDMultiIDs").val() || '';
				// 判断是否已经存在
				if(allmnemultiselectids.indexOf(',' + id + ',') != -1 || allmnemultiselectids.indexOf(id + ',') == 0){
					continue;
				}
				var addInupt = CUI("#formulaProcess_processIdBeforeProcessIDAddIds");
				var addIDs = addInupt.val();
				var delInupt = CUI("#formulaProcess_processIdBeforeProcessIDDeleteIds");	
				var delIDs = delInupt.val();
				// 原有数据被删除
				if(delIDs.indexOf(',' + id + ',') != -1 || delIDs.indexOf(id + ',') == 0){
					var re = new RegExp('(.*,|^^)(' + id + ',)(.*)'); 
					delIDs = delIDs.replace(re,'$1$3');
					delInupt.val(delIDs);
				}else{
					// 增加
					addIDs += (id + ',');
					addInupt.val(addIDs);
				}
				// 更新当前所有id
				allmnemultiselectids += (id + ',');
				CUI("#formulaProcess_processIdBeforeProcessIDMultiIDs").val(allmnemultiselectids);
				var newSpan = $("<span class='mne-select-span'>"+objs[o].name+"<img src='/bap/struts/ec/delete.gif' class='multi-mne-img' onMouseOver='deleteBtnChange(this)' onMouseOut='deleteBtnChange(this)' mneobjid='"+id+"'/></span>");
				CUI("#formulaProcess_processIdBeforeProcessIDMultiIDsContainer").append(newSpan);
				$('img[mneobjid="'+id+'"]',$('#formulaProcess_processIdBeforeProcessIDMultiIDsContainer')).click(function(e){
					stopBubble(e);
		        	deleteformulaProcess_processIdBeforeProcessIDMulti(this);
				});
			}
			formulaProcess_processIdBeforeProcessIDCalWidth();
			if( $('#formulaProcess_processIdBeforeProcessIDMultiIDsContainerDiv').height() > 28 && ( $.browser.msie7 || $.browser.msie6 ) ){
				$("#formulaProcess_processIdBeforeProcessIDMultiIDsContainer").css( 'top', 0 );
			}
			//console.log(11);
            formulaProcess_processIdBeforeProcessID_dialog.close();
}
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>