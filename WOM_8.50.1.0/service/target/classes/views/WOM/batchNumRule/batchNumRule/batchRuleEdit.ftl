<!-- WOM_7.5.0.0/batchNumRule/batchRuleEdit -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1490409864843')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchNumRule_batchRuleEdit,head,WOM_7.5.0.0_batchNumRule_BatchNumRule,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.batchNumRule.batchNumRule.batchRuleEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "WOM_batchNumRule_batchNumRule">
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
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#assign callbackName ="WOM.batchNumRule.batchNumRule.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_batchNumRule_batchNumRule_batchRuleEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_batchNumRule_batchNumRule_batchRuleEdit_form" cssStyle="height:100%;" hiddenField="batchNumRule.id," onsubmitMethod="WOM.batchNumRule.batchNumRule.batchRuleEdit.beforeSubmitMethod()" ecAction="/WOM/batchNumRule/batchNumRule/batchRuleEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="batchRuleEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_batchNumRule_batchRuleEdit">
	<input type="hidden" name="datagridKey" value="WOM_batchNumRule_batchNumRule_batchRuleEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="batchNumRule.version" value="${(batchNumRule.version)!0}" />
	<input type="hidden" name="batchNumRule.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="batchNumRule.id" value="${(batchNumRule.id)!""}"/>
	<div id="WOM_batchRuleEdit_edit_div" style="height:100%">
		<div id="WOM_batchNumRule_batchNumRule_batchRuleEdit_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_batchNumRule_batchNumRule_batchRuleEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_batchNumRule', null, function(){
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490409027018')}" >${getText('WOM.propertydisplayName.randon1490409027018')}</label>
				</td>
				
						<#assign batchNumRule_code_defaultValue  = ''>
							 							<#assign batchNumRule_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="batchNumRule.code" id="batchNumRule_code"  style=";" originalvalue="<#if !newObj || (batchNumRule.code)?has_content>${(batchNumRule.code?html)!}<#else>${batchNumRule_code_defaultValue!}</#if>" value="<#if !newObj || (batchNumRule.code)?has_content>${(batchNumRule.code?html)!}<#else>${batchNumRule_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490409049075')}" >${getText('WOM.propertydisplayName.randon1490409049075')}</label>
				</td>
				
						<#assign batchNumRule_name_defaultValue  = ''>
							 							<#assign batchNumRule_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="batchNumRule.name" id="batchNumRule_name"  style=";" originalvalue="<#if !newObj || (batchNumRule.name)?has_content>${(batchNumRule.name?html)!}<#else>${batchNumRule_name_defaultValue!}</#if>" value="<#if !newObj || (batchNumRule.name)?has_content>${(batchNumRule.name?html)!}<#else>${batchNumRule_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1509601492783')}" >${getText('WOM.propertydisplayName.randon1509601492783')}</label>
				</td>
				
						<#assign batchNumRule_ruleType_defaultValue  = ''>
							 							<#assign batchNumRule_ruleType_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${batchNumRule_ruleType_defaultValue!}" formId="WOM_batchNumRule_batchNumRule_batchRuleEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="batchNumRule.ruleType.id" code="womRuleType" value="${(batchNumRule.ruleType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="WOM_batchNumRule_batchNumRule_batchRuleEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="batchNumRule.ruleType.id" code="womRuleType" value="${(batchNumRule.ruleType.id)!}"  />
									
								</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1508132389761')}" >${getText('WOM.propertydisplayName.randon1508132389761')}</label>
				</td>
				
						<#assign batchNumRule_isAccountPeriod_defaultValue  = ''>
							 							<#assign batchNumRule_isAccountPeriod_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="batchNumRule.isAccountPeriod_check" originalvalue="<#if !newObj><#if (batchNumRule.isAccountPeriod)??>${(batchNumRule.isAccountPeriod!false)?string('true','false')}<#else>false</#if><#elseif batchNumRule_isAccountPeriod_defaultValue?has_content>${(batchNumRule_isAccountPeriod_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (batchNumRule.isAccountPeriod)??>${(batchNumRule.isAccountPeriod!false)?string('true','false')}<#else>false</#if><#else>${(batchNumRule_isAccountPeriod_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="batchNumRule.isAccountPeriod" originalvalue="<#if ((batchNumRule.isAccountPeriod)?? &&  batchNumRule.isAccountPeriod)||(batchNumRule_isAccountPeriod_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((batchNumRule.isAccountPeriod)?? &&  batchNumRule.isAccountPeriod)||(batchNumRule_isAccountPeriod_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="batchNumRule.isAccountPeriod_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="batchNumRule.isAccountPeriod"]');
												CUI('input[name="batchNumRule.isAccountPeriod_check"]').each(function(){
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
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchNumRule_BatchNumRule", "WOM_7.5.0.0_batchNumRule_batchRuleEdit", 'EDIT')>
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
					<#assign elementName = 'batchNumRule' + "." + columnName>
					<#assign elementId = 'batchNumRule' + "_" + columnName>
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
						<#if batchNumRule[columnName]??>
							<#assign dateVal = (batchNumRule[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_batchNumRule_batchNumRule_batchRuleEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${batchNumRule[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${batchNumRule[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${batchNumRule[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${batchNumRule[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_batchNumRule_batchNumRule_batchRuleEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490409085465')}" >${getText('WOM.propertydisplayName.randon1490409085465')}</label>
				</td>
				
						<#assign batchNumRule_menu_defaultValue  = ''>
							 							<#assign batchNumRule_menu_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="batchNumRule.menu" id="batchNumRule_menu"  style=";" originalvalue="<#if !newObj || (batchNumRule.menu)?has_content>${(batchNumRule.menu?html)!}<#else>${batchNumRule_menu_defaultValue!}</#if>" value="<#if !newObj || (batchNumRule.menu)?has_content>${(batchNumRule.menu?html)!}<#else>${batchNumRule_menu_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
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
	<table class="edit-table" style="display:none">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1490409060229')}" >${getText('WOM.propertydisplayName.randon1490409060229')}</label>
				</td>
				
						<#assign batchNumRule_ruleDetail_defaultValue  = ''>
							 							<#assign batchNumRule_ruleDetail_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="batchNumRule.ruleDetail" id="batchNumRule_ruleDetail"  style=";" originalvalue="<#if !newObj || (batchNumRule.ruleDetail)?has_content>${(batchNumRule.ruleDetail?html)!}<#else>${batchNumRule_ruleDetail_defaultValue!}</#if>" value="<#if !newObj || (batchNumRule.ruleDetail)?has_content>${(batchNumRule.ruleDetail?html)!}<#else>${batchNumRule_ruleDetail_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
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
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchNumRule_batchRuleEdit,html,WOM_7.5.0.0_batchNumRule_BatchNumRule,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
.edv-a{border:1px #5C8CB5 solid;width:500px;_width:485px;height:45px;margin:0 auto;padding:3px;_padding-bottom:0px;}
#codeConfigContainer {margin: 3px 5px 5px 5px;}
#toolbar1 {
	height: 20px;
	line-height: 15px;
	padding-left: 50px;
	padding-top: 10px;
    margin-top:15px;
    margin-left:16px;
	background-color:rgb(232,232,232);      
}
#toolbar1 a {
	font:  13px normal;
	margin: 1px 1px 1px 10px;
	vertical-align: bottom;
	padding:2px 1px;
}
#toolbar1 a:hover{
	background-color: #FFF5C2;
	border: 1px solid #FFC100;
	margin: 1px 0 1px 9px;
	padding:1px 1px;
}
#toolbar1 img {
	margin-right: 2px;
	vertical-align: bottom;
}
a:link, a:visited {
	color: #000;
}
#outerContainer {
	width:768px;
	height:300px;
	margin:0px 16px; 0px 0px;
}
#codeConfigContainer {
	width:766px;
}
.deleteBtn {
	float:right;
	height: 24px;
	width: 13px;
	line-height: 24px;
	font-size: 12px;
	vertical-align:middle;
	cursor: pointer;
	margin: 0 0 0 3px;
	background-image: url("/bap/static/ec/images/delete.gif");
	background-repeat: no-repeat;
	background-position: left center;
}
.deleteBtnOn {
	float:right;
	height: 24px;
	width: 13px;
	line-height: 24px;
	font-size: 12px;
	vertical-align:middle;
	cursor: pointer;
	margin: 0 0 0 3px;
	background-image: url("/bap/static/ec/images/deleteon.gif");
	background-repeat: no-repeat;
	background-position: left center;
}
</style>
<div id="codeConfigDiv">
	<@errorbar id="code_query_edit_bar"></@errorbar>
	<div id="toolbar1"> 
		<a href="#" onclick="javascript:ec.code.config.addItem('property');">${getHtmlText('ec.ec.code.config.add.entity.property')}</a>&nbsp;&nbsp;
		<a href="#" onclick="javascript:ec.code.config.addItem('inherent');">${getHtmlText('ec.ec.code.config.add.entity.attribute')}</a>&nbsp;&nbsp;
		<a href="#" onclick="javascript:ec.code.config.addItem('date');">${getHtmlText('ec.ec.code.config.add.date')}</a>&nbsp;&nbsp;
		<a href="#" onclick="javascript:ec.code.config.addItem('custom');">${getHtmlText('ec.ec.code.config.add.custom')}</a>&nbsp;&nbsp;
		<a href="#" onclick="javascript:ec.code.config.addItem('auto');">${getHtmlText('ec.ec.code.config.add.auto')}</a>&nbsp;&nbsp;
		<input type="checkbox" id="rollbackable" name="rollbackable"><label style="cursor: pointer;" for="rollbackable">${getHtmlText('ec.ec.code.config.rollback')}</label>
	</div>
	<div id="outerContainer">
		<table id="codeConfigContainer">
			<tr style="display:none;">
				<td width="15%">
					<select onchange="ec.code.config.typeHasChange(this);" class="edit-select-code" style="width:95%" name="type">
						<option value="property">${getText('ec.ec.code.config.type.entity.property')}</option>
						<option value="inherent">${getText('ec.ec.code.config.type.entity.attribute')}</option>
						<option value="date">${getText('ec.ec.code.config.type.date')}</option>
						<option value="custom">${getText('ec.ec.code.config.type.custom')}</option>
						<option value="auto">${getText('ec.ec.code.config.type.auto')}</option>
					</select>
				</td>
				<td width="60%">
					<div name="property" class="fix-search-click" style="width:95%">
						<input size="15" name="value" class="cui-edit-field">
						<input type="button" onclick="ec.code.config.selectProperty(event, this)"  value="" class="cui-search-click">
					</div>
					<div name="inherent" style="width:95%">
						<select class="edit-select-code" style="width:100%" name="value">
							<option value="${model.entity.module.artifact}">${getText('ec.ec.code.config.current.module.code')}${model.entity.module.artifact}</option>
							<#if model.entity.workflowEnabled>
							<option value="${model.entity.prefix}">${getText('ec.ec.code.config.current.table.prefix')}${model.entity.prefix}</option>
							</#if>
							<option value="${model.entity.entityName}">${getText('ec.ec.code.config.current.entity.name')}${model.entity.entityName}</option>
							<option value="${model.modelName}">${getText('ec.ec.code.config.current.model.name')}${model.modelName}</option>
						</select>
					</div>
					<div name="date" class="fix-search-click" style="width:95%;text-align: right;">
						<select class="edit-select-code" style="width:40%" name="dateType">
							<option value="YearA">${getText('ec.ec.code.config.date.datetype.yeara')}</option>
							<option value="YearB">${getText('ec.ec.code.config.date.datetype.yearb')}</option>
							<option value="Month">${getText('ec.ec.code.config.date.datetype.month')}</option>
							<option value="Date">${getText('ec.ec.code.config.date.datetype.date')}</option>
						</select>
						<input size="15" name="value" style="width:55%" class="cui-edit-field">
						<input type="button" onclick="ec.code.config.selectDateProperty(event, this)"  value="" class="cui-search-click">
					</div>
					<div name="custom" style="width:95%">
						<input size="15" name="value" class="cui-edit-field">
					</div>
					<div name="auto" class="fix-search-click" style="width:95%;">
						${getHtmlText('ec.ec.code.config.auto.digit')}<input size="15" style="width:10%" name="digit" class="cui-edit-field"> 
						<select class="edit-select-code" onchange="ec.code.config.autoTypeChange(this);" style="width:25%" name="autoType">
							<option value="Code">${getText('ec.ec.code.config.auto.autoType.Code')}</option>
							<option value="Date">${getText('ec.ec.code.config.auto.autoType.Date')}</option>
						</select>
						<select class="edit-select-code" style="width:20%" name="countType">
							<option value="Daily">${getText('ec.ec.code.config.auto.loop.cycle.daily')}</option>
							<option value="Monthly">${getText('ec.ec.code.config.auto.loop.cycle.monthly')}</option>
							<option value="Yearly">${getText('ec.ec.code.config.auto.loop.cycle.yearly')}</option>
						</select>
						<input size="15" name="value" style="width:30%" class="cui-edit-field">
						<input type="button" onclick="ec.code.config.selectDateProperty(event, this)"  value="" class="cui-search-click">
					</div>
				</td>
				<td width="15%">
					<select class="edit-select-code" style="width:100%" name="thecase">
						<option value="original">${getText('ec.ec.code.config.case.original')}</option>
						<option value="uppercase">${getText('ec.ec.code.config.case.uppercase')}</option>
						<option value="lowercase">${getText('ec.ec.code.config.case.lowercase')}</option>
					</select>
				</td>
				<td width="5%">
					<input size="15" name="separator" value="_" style="width:95%;" class="cui-edit-field">
				</td>
				<td width="5%">
					<span class="deleteBtn" onclick="javascript:ec.code.config.delItem(this);">&nbsp;</span>
				</td>
			</tr>
		</table>
	</div>
</div>
<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.batchNumRule.batchNumRule.batchRuleEdit.beforeSaveProcess = function(){}
	WOM.batchNumRule.batchNumRule.batchRuleEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.batchNumRule.batchNumRule.batchRuleEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_batchNumRule_batchNumRule_batchRuleEdit_form').trigger('beforeSubmit');
		//batchNumRule.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="batchNumRule.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_batchNumRule_batchNumRule_batchRuleEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_batchNumRule_batchNumRule_batchRuleEdit_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.batchNumRule.batchNumRule.batchRuleEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.batchNumRule.batchNumRule.batchRuleEdit.print = function(url){
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
		
		WOM.batchNumRule.batchNumRule.batchRuleEdit.saveSetting = function(){
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
		WOM.batchNumRule.batchNumRule.batchRuleEdit.printSetting = function(){
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
			WOM.batchNumRule.batchNumRule.batchRuleEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.batchNumRule.batchNumRule.batchRuleEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.batchNumRule.batchNumRule.batchRuleEdit.settingDialog.show();
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
			WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack = customCallBack;
		}
		WOM.batchNumRule.batchNumRule.batchRuleEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_batchNumRule_batchNumRule_batchRuleEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_batchNumRule_batchNumRule_batchRuleEdit_fileupload"></div>');
			}
			WOM.batchNumRule.batchNumRule.batchRuleEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_batchNumRule_batchNumRule_batchRuleEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_batchNumRule_batchNumRule_batchRuleEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.batchNumRule.batchNumRule.batchRuleEdit.infoDialog.show();
			if($('#WOM_batchNumRule_batchNumRule_batchRuleEdit_fileupload').html() == '') {
				$('#WOM_batchNumRule_batchNumRule_batchRuleEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_batchNumRule_batchNumRule&entityCode=WOM_7.5.0.0_batchNumRule&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.batchNumRule.batchNumRule.batchRuleEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.batchNumRule.batchNumRule.batchRuleEdit.referenceCopyBackInfo";
		WOM.batchNumRule.batchNumRule.batchRuleEdit.dialog = dialog;
		WOM.batchNumRule.batchNumRule.batchRuleEdit._dialog = foundation.common.select({
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
	
	WOM.batchNumRule.batchNumRule.batchRuleEdit.referenceCopyBackInfo = function(obj){
		if(WOM.batchNumRule.batchNumRule.batchRuleEdit._dialog){
			WOM.batchNumRule.batchNumRule.batchRuleEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.batchNumRule.batchNumRule.batchRuleEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_batchNumRule_batchNumRule_batchRuleEdit_form','WOM_batchNumRule_batchNumRule_batchRuleEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.batchNumRule.batchNumRule.batchRuleEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.batchNumRule.batchNumRule.batchRuleEdit.dialog._el).load('/WOM/batchNumRule/batchNumRule/batchRuleEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.batchNumRule.batchNumRule.batchRuleEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.batchNumRule.batchNumRule.batchRuleEdit.dialog._config.iframe, WOM.batchNumRule.batchNumRule.batchRuleEdit.dialog._dialog ).prop( 'src', '/WOM/batchNumRule/batchNumRule/batchRuleEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.batchNumRule.batchNumRule.batchRuleEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.batchNumRule.batchNumRule.batchRuleEdit.dialog._el).load('/WOM/batchNumRule/batchNumRule/batchRuleEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.batchNumRule.batchNumRule.batchRuleEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.batchNumRule.batchNumRule.batchRuleEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.batchNumRule.batchNumRule.batchRuleEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.batchNumRule.batchNumRule.batchRuleEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_batchNumRule_batchNumRule_batchRuleEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix = '';
		WOM.batchNumRule.batchNumRule.batchRuleEdit._oGrid = oGrid;
		WOM.batchNumRule.batchNumRule.batchRuleEdit._sUrl = url;
		if(customCallBack){
			WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.batchNumRule.batchNumRule.batchRuleEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.batchNumRule.batchNumRule.batchRuleEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.batchNumRule.batchNumRule.batchRuleEdit.getMultiselectCallBackInfo_DG" : "WOM.batchNumRule.batchNumRule.batchRuleEdit.getcallBackInfo_DG";
			WOM.batchNumRule.batchNumRule.batchRuleEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.batchNumRule.batchNumRule.batchRuleEdit.getcallBackInfo";
		}
		if(WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix!=''){
			WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix = WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix.substring(1);
		}
		if(WOM.batchNumRule.batchNumRule.batchRuleEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchNumRule.batchNumRule.batchRuleEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.batchNumRule.batchNumRule.batchRuleEdit._querycustomFuncN == "function") {
				refparam += WOM.batchNumRule.batchNumRule.batchRuleEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.batchNumRule.batchNumRule.batchRuleEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.batchNumRule.batchNumRule.batchRuleEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchNumRule.batchNumRule.batchRuleEdit.query_"+obj+")!='undefined'") ? eval('WOM.batchNumRule.batchNumRule.batchRuleEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.batchNumRule.batchNumRule.batchRuleEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_batchNumRule_batchNumRule_batchRuleEdit_form',obj[0], WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix, WOM.batchNumRule.batchNumRule.batchRuleEdit._sUrl);
		CUI.commonFills('WOM_batchNumRule_batchNumRule_batchRuleEdit_form',WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix,obj[0]);

		try{
			if(WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack) {
				eval(WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack);
				WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchNumRule.batchNumRule.batchRuleEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.batchNumRule.batchNumRule.batchRuleEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.batchNumRule.batchNumRule.batchRuleEdit._customBeforeCallBack) {
			var flag = eval(WOM.batchNumRule.batchNumRule.batchRuleEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.batchNumRule.batchNumRule.batchRuleEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.batchNumRule.batchNumRule.batchRuleEdit._sUrl);
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
			if(WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack) {
				eval(WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack);
				WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchNumRule.batchNumRule.batchRuleEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.batchNumRule.batchNumRule.batchRuleEdit.getcallBackInfo_DG = function(obj){
		if(WOM.batchNumRule.batchNumRule.batchRuleEdit._customBeforeCallBack) {
			var flag = eval(WOM.batchNumRule.batchNumRule.batchRuleEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.batchNumRule.batchNumRule.batchRuleEdit._currRow).next().length==0){
					WOM.batchNumRule.batchNumRule.batchRuleEdit._oGrid.addNewRow();
				}	
				WOM.batchNumRule.batchNumRule.batchRuleEdit._currRow = $(WOM.batchNumRule.batchNumRule.batchRuleEdit._currRow).next();
				$(WOM.batchNumRule.batchNumRule.batchRuleEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.batchNumRule.batchNumRule.batchRuleEdit._currRow,obj[i],WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix,WOM.batchNumRule.batchNumRule.batchRuleEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.batchNumRule.batchNumRule.batchRuleEdit._currRow,WOM.batchNumRule.batchNumRule.batchRuleEdit._prefix,obj[i],WOM.batchNumRule.batchNumRule.batchRuleEdit._oGrid)");
		}
		try{
			if(WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack) {
				eval(WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack);
				WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchNumRule.batchNumRule.batchRuleEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.batchNumRule.batchNumRule.batchRuleEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.batchNumRule.batchNumRule.batchRuleEdit._oGrid, WOM.batchNumRule.batchNumRule.batchRuleEdit._currRow, WOM.batchNumRule.batchNumRule.batchRuleEdit._key, WOM.batchNumRule.batchNumRule.batchRuleEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack) {
				eval(WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack);
				WOM.batchNumRule.batchNumRule.batchRuleEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchNumRule.batchNumRule.batchRuleEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.batchNumRule.batchNumRule.batchRuleEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.batchNumRule.batchNumRule.batchRuleEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_batchNumRule_batchNumRule_batchRuleEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	(function($){
		$(function(){
			$(".edit-panes-s").after($("#codeConfigDiv").html());//显示模板规则
$("#codeConfigDiv").html("");
//修改编码为只读
if($("#id").val()!=""){
	$("#batchNumRule_code").attr("readonly",true);
}
		});
	})(jQuery);
	WOM.batchNumRule.batchNumRule.batchRuleEdit.beforeSubmitMethodSettingInPage = function(){
		if($("[name='batchNumRule.isAccountPeriod_check']").val()=='true'){

	var length = $("[name='date'] .edit-select-code").length;
	for(var i = 1 ; i < length ; i++){
		if($("[name='date'] .edit-select-code:eq("+i+")").val()=='Date'){
			workbenchErrorBarWidget.showMessage("会计期不允许按日生成编码");
			return false;
		}
	}
	length = $("#codeConfigContainer [name='auto'] [name='countType']").length;
	for(var i = 1 ; i < length ; i++){
		if($("#codeConfigContainer [name='auto'] [name='countType']:eq("+i+")").val()=='Daily' && $("[name='auto'] [name='autoType']:eq("+(i)+")").val()=='Date'){
			workbenchErrorBarWidget.showMessage("会计期不允许按日生成编码");
			return false;
		}
	}
}

return ec.code.config.saveConfig();//保存模板规则方法
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.batchNumRule.batchNumRule.batchRuleEdit.initCount = 0;
	WOM.batchNumRule.batchNumRule.batchRuleEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_batchRuleEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_batchNumRule_batchNumRule_batchRuleEdit_datagrids');	
		var	conHeight = h-$("#WOM_batchNumRule_batchNumRule_batchRuleEdit_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_batchNumRule_batchNumRule_batchRuleEdit_main_div .edit-panes-s").each(function(index){
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
							if(WOM.batchNumRule.batchNumRule.batchRuleEdit.initCount <= 2) {
								setTimeout(function(){WOM.batchNumRule.batchNumRule.batchRuleEdit.initSize();}, 200);
								WOM.batchNumRule.batchNumRule.batchRuleEdit.initCount++;
							}/* else {
								WOM.batchNumRule.batchNumRule.batchRuleEdit.initCount = 0;
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
		WOM.batchNumRule.batchNumRule.batchRuleEdit.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.batchNumRule.batchNumRule.batchRuleEdit.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.batchNumRule.batchNumRule.batchRuleEdit.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchNumRule_batchRuleEdit,js,WOM_7.5.0.0_batchNumRule_BatchNumRule,WOM_7.5.0.0) */
// 自定义代码

  CUI.ns("ec.code.config");
ec.code.config.addItem = function(type){
	var newTr = $('#codeConfigContainer tr:first').clone();
	$('#codeConfigContainer').append(newTr);
	$('div[name!="' + type + '"]', newTr).remove();
	$('select[name="type"]', newTr).val(type);
	newTr.show();
	$('input[name="separator"]').show();
	$('input[name="separator"]:last').hide();
	if(type=="auto"){
		ec.code.config.autoTypeChange($('select[name="autoType"]', newTr));
	}
	if(type=="date"||type=="auto"){
		$('select[name="thecase"]', newTr).attr("disabled",true); 
	}else{
		$('select[name="thecase"]', newTr).attr("disabled",false); 
	}
	return newTr;
}
ec.code.config.delItem = function(obj){
	$(obj).parents('tr:first').remove();
	$('input[name="separator"]').show();
	$('input[name="separator"]:last').hide();
}
ec.code.config.typeHasChange = function(obj){
	var type = $(obj).val();
	var newTr = $('#codeConfigContainer tr:first').clone();
	var oldTr = $(obj).parents('tr:first');
	newTr.insertAfter(oldTr);
	oldTr.remove();

	$('div[name!="' + type + '"]', newTr).remove();
	$('select[name="type"]', newTr).val(type);
	if(type=="auto"){
		ec.code.config.autoTypeChange($('select[name="autoType"]', newTr));
	}
	if(type=="date"||type=="auto"){
		$('select[name="thecase"]', newTr).attr("disabled",true); 
	}else{
		$('select[name="thecase"]', newTr).attr("disabled",false); 
	}
	newTr.show();
	return newTr;
}
ec.code.config.selectProperty = function(e, obj){
	YUE.stopPropagation(e);
	ec.code.config.current = $(obj).prev('input[name="value"]');
	ec.code.config.showOverLayer(obj, '/WOM/property/select_property.action?model.code=${model.code}');
}
ec.code.config.selectDateProperty = function(e, obj){
	YUE.stopPropagation(e);
	ec.code.config.current = $(obj).prev('input[name="value"]');
	ec.code.config.showOverLayer(obj, '/WOM/property/select_dateproperty.action?model.code=${model.code}');
}
ec.code.config.validateConfig = function(){
	if($('tr:visible', '#codeConfigContainer').length <= 0) {
		code_query_edit_barWidget.show('${getText("ec.ec.code.config.validate.must.one")}');
		return false;
	}
	if($('select[name="countType"]').length > 2) {
		code_query_edit_barWidget.show('${getText("ec.ec.code.config.validate.only.one")}');
		return false;
	}
	var validateFlag = true;
	$('tr:visible', '#codeConfigContainer').each(function(){
		var tmpTr = $(this);
		if($('select[name="type"]', tmpTr).val() == 'property') {
			if($('[name="value"]', tmpTr).val() == null || $('[name="value"]', tmpTr).val().length == 0) {
				code_query_edit_barWidget.show('${getText("ec.ec.code.config.validate.fail")}');
				validateFlag = false;
				return false;
			}
		}
	});
	return validateFlag;
}
ec.code.config.saveConfig = function(){
	if(!ec.code.config.validateConfig()) {
		return false;
	}
	var config = '{"rollbackable":' + $('#rollbackable').prop('checked') + ',"config":[';
	var formatStr="";
	var trlen=$('tr:visible', '#codeConfigContainer').length;
	$('tr:visible', '#codeConfigContainer').each(function(index,element){
		var tmpTr = $(this);
		var type = $('select[name="type"]', tmpTr).val();
		var thecase = $('select[name="thecase"]', tmpTr).val();
		var value = $('[name="value"]', tmpTr);
		var separator = $('input[name="separator"]', tmpTr).val();
		config += '{"type":"' + type + '",';
		config += '"thecase":"' + thecase + '",';
		config += '"value":"' + ((type == 'property'|| type =='date'|| type =='auto') ? value.attr('propertiesName') : value.val()) + '",';
		if(type == 'auto') {
			var autoType=$('select[name="autoType"]', tmpTr).val();
			var digit=$('input[name="digit"]', tmpTr).val();
			config += '"digit":"' + digit + '",';
			config += '"autoType":"' + autoType + '",';
			if(autoType=="Code"){
				config += '"countType":"none",';
			}else{
				config += '"countType":"' + $('select[name="countType"]', tmpTr).val() + '",';
			}
			formatStr += "{0,number,"+String(Math.pow(10,digit)).substr(1)+"}";
		}else if(type == 'date') {
			config += '"dateType":"' + $('select[name="dateType"]', tmpTr).val() + '",';
			formatStr += "{"+(index+1)+"}";
		}else{
			formatStr += "{"+(index+1)+"}";
		}
		config += '"separator":"' + separator + '"},';
		if(index<trlen-1){
			formatStr += separator;
		}
	});
	if(config.endsWith('},')) {
		config = config.substring(0, config.length - 1);
	}
	config += '],"pattern":"'+formatStr+'"}';
	$('*[name="batchNumRule.ruleDetail"]').val(config);
	return true;
}
ec.code.config.init = function(){
	var config = $('*[name="batchNumRule.ruleDetail"]').val();
	//try{
		var cjson = $.parseJSON(config);
		if(cjson && cjson.rollbackable && cjson.rollbackable !== 'false') {
			$('#rollbackable').prop('checked', true);
		}
		if(cjson && cjson.config && cjson.config.length > 0) {
			$.each(cjson.config, function(){
				var addTr = ec.code.config.addItem(this.type);
				$('select[name="thecase"]', addTr).val(this.thecase);
				$('input[name="separator"]', addTr).val(this.separator);
				var valueInput = $('[name="value"]', addTr);
				if(this.type == 'property'||this.type == 'date'||this.type == 'auto') {
					valueInput.attr('propertiesName', this.value);
					ec.code.config.fillPropertiesNames(valueInput, this.value);
				} else {
					valueInput.val(this.value);
				}
				if(this.type == 'auto' && this.countType && this.countType.length > 0) {
					$('input[name="digit"]', addTr).val(this.digit);
					$('select[name="countType"]', addTr).val(this.countType);
					$('select[name="autoType"]', addTr).val(this.autoType);
					ec.code.config.autoTypeChange($('select[name="autoType"]', addTr));
				}else if(this.type == 'date') {
					$('select[name="dateType"]', addTr).val(this.dateType);
				}
			});
		}
	//} catch(e) {}
	return true;
}
ec.code.config.propertyDblClickFunc = function(obj){
	if(propertyClickFunc(obj)) {
		ec.code.config.current.attr('propertiesName', $(obj).attr('name'));
		ec.code.config.fillPropertiesNames(ec.code.config.current, $(obj).attr('name'));
	}
}
ec.code.config.fillPropertiesNames = function(obj, names){
	if(names=="_systemdate"){
		obj.val('${getText('ec.ec.code.config.date.systemdate')}');
		return;
	}
	var ret = getDisplayNamesByNamesAndModelCode(names, '${model.code}');
	obj.val('');
	for(var v in ret.data) {
		if(obj.val().length > 0) {
			obj.val(obj.val() + '.');
		}
		obj.val(obj.val() + ret.data[v]);
	}
}
ec.code.config.autoTypeChange = function(obj){
	var autoType=$(obj).val();
	if(autoType=="Code"){
		$(obj).next("select").val("").hide().next("input").val("").attr("propertiesName",'').hide().next("input").hide();
	}else if(autoType=="Date"){
		$(obj).next("select").show().next("input").show().next("input").show();
	}
}

	$(function(){
		ec.code.config.init();
	});
	$('body').unbind('click.overlayer').bind('click.overlayer', function(){
		if(ec.code.config.showOverLayerDiv && ec.code.config.showOverLayerDiv.isShow) {
			ec.code.config.showOverLayerDiv.close();
		}
	});
			
	ec.code.config.showOverLayer = function(obj,url){
		CUI('#customContent').html("");
		ec.code.config.showOverLayerDiv = new CUI.Overlay({
			align:obj,
	     	el:'customContent',
	     	title:'${getText('ec.property.choicefield')}',
	     	width:180,
	     	height:282,
	     	zIndex:9999,
	     	shadow:false,
			buttons:[
					{	name:"${getHtmlText('foundation.workbench.mainPage.sure')}",
						handler:function(){
							if($('li[isSelected="1"]').length == 0) {
								alert('${getText("ec.ec.code.config.selectNullData")}');
							} else {
								ec.code.config.propertyDblClickFunc($('li[isSelected="1"]')[0]);
								$('body').trigger('click.overlayer');
							}
						}
					},
					{	name:"${getHtmlText('calendar.common.cancal')}",
						handler:function(){$('body').trigger('click.overlayer');}
					}]
	     	
		});
		
		
		ec.code.config.showOverLayerDiv.render();
		$("#overlay-idcustomContent").click(
			function(e){
				YUE.stopPropagation(e);
			}
		)
		url+="&time="+new Date();
		ec.code.config.showOverLayerDiv.show();
		$("#customContent").html('<table style="width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">${getText("foundation.cui.dialog.loading")}</label></td></tr></table>');
		CUI('#customContent').load(url);
	}
	//重写取字段国际化的方法，防止没有权限	
    
	function getDisplayNamesByNamesAndModelCode(names, modelCode) {
		var url = "/public/property/getDisplayNames.action?propertiesNames=" + names + "&model.code=" + modelCode;
		var retMsg = null;
		$.ajax({
			url: url,
			type: 'post',
			async: false,
			success: function(msg) {
				retMsg = msg;
			}
		});
		return retMsg;
	}
	WOM.batchNumRule.batchNumRule.batchRuleEdit.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.batchNumRule.batchNumRule.batchRuleEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_batchNumRule_batchNumRule_batchRuleEdit_form').trigger('beforeSubmit');
		//batchNumRule.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="batchNumRule.extraCol"]').val(extraCol);
		
		//自定义代码，添加位数限制
		var length = $("[name='auto']").length;
		if(length>1){
			for(var i = 1 ; i < length ; i ++){
				if($("[name='auto']:eq("+i+")").find('input').eq(0).val().length==0){
					WOM_batchNumRule_batchNumRule_batchRuleEdit_formDialogErrorBarWidget.showMessage("自增长位数不能为空!");
					return false;
				}
				if(isNaN($("[name='auto']:eq("+i+")").find('input').eq(0).val())){
					WOM_batchNumRule_batchNumRule_batchRuleEdit_formDialogErrorBarWidget.showMessage("自增长位数只允许为数字!");
					return false;
				}else{
					if(parseInt($("[name='auto']:eq("+i+")").find('input').eq(0).val())<1||parseInt($("[name='auto']:eq("+i+")").find('input').eq(0).val())>6){
						WOM_batchNumRule_batchNumRule_batchRuleEdit_formDialogErrorBarWidget.showMessage("自增长位数范围只允许1-6!");
						return false;
					}
				}
			}
		}
		//自定义编码，时间不允许为空
		var dateLength = $("[name='date']").length;
		if(dateLength>1){
			for(var i = 1 ; i < dateLength ; i ++){
				if($("[name='date']:eq("+i+")").find('input').eq(0).val().length==0){
					WOM_batchNumRule_batchNumRule_batchRuleEdit_formDialogErrorBarWidget.showMessage("时间节目标字段不允许为空!");
					return false;
				}
			}
		}
	};
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>