<!-- WOM_7.5.0.0/batchingMaterialNeed/makeBatchingOrder -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1491803887698')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrder,head,WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "WOM_batchingMaterialNeed_makeBatOrderHead">
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
<#assign callbackName ="WOM.batchingMaterialNeed.makeBatOrderHead.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form" cssStyle="height:100%;" hiddenField="makeBatOrderHead.doneStaff.id,makeBatOrderHead.makeStaff.id," onsubmitMethod="WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.beforeSubmitMethod()" ecAction="/WOM/batchingMaterialNeed/makeBatOrderHead/makeBatchingOrder/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="makeBatchingOrder">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrder">
	<input type="hidden" name="datagridKey" value="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="makeBatOrderHead.version" value="${(makeBatOrderHead.version)!0}" />
	<input type="hidden" name="makeBatOrderHead.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="makeBatOrderHead.doneStaff.id" value="${(makeBatOrderHead.doneStaff.id)!""}"/>
		<input type="hidden" name="makeBatOrderHead.makeStaff.id" value="${(makeBatOrderHead.makeStaff.id)!""}"/>
	<div id="WOM_makeBatchingOrder_edit_div" style="height:100%">
		<div id="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_batchingMaterialNeed', null, function(){
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491801993078')}" >${getText('WOM.propertydisplayName.randon1491801993078')}</label>
				</td>
				
						<#assign makeBatOrderHead_makeStaff_name_defaultValue  = 'currentUser'>
												<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="readonly" deValue="${makeBatOrderHead_makeStaff_name_defaultValue!}" conditionfunc="WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._querycustomFunc('makeBatOrderHead_makeStaff_name')" view=true  value="${(makeBatOrderHead.makeStaff.name)!}" displayFieldName="name" name="makeBatOrderHead.makeStaff.name" id="makeBatOrderHead_makeStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_makeBatOrderHead_makeStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (makeBatOrderHead_makeStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form',obj, 'makeBatOrderHead.makeStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form', 'makeBatOrderHead.makeStaff',obj,true);
											$('input:hidden[name="makeBatOrderHead.makeStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(makeBatOrderHead.id)?? && (makeBatOrderHead.makeStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${makeBatOrderHead.makeStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form',obj, 'makeBatOrderHead.makeStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form', 'makeBatOrderHead.makeStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491802035309')}" >${getText('WOM.propertydisplayName.randon1491802035309')}</label>
				</td>
				
						<#assign makeBatOrderHead_doneStaff_name_defaultValue  = ''>
														<#assign makeBatOrderHead_doneStaff_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${makeBatOrderHead_doneStaff_name_defaultValue!}" conditionfunc="WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._querycustomFunc('makeBatOrderHead_doneStaff_name')"  value="${(makeBatOrderHead.doneStaff.name)!}" displayFieldName="name" name="makeBatOrderHead.doneStaff.name" id="makeBatOrderHead_doneStaff_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_makeBatOrderHead_doneStaff_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (makeBatOrderHead_doneStaff_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form',obj, 'makeBatOrderHead.doneStaff', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form', 'makeBatOrderHead.doneStaff',obj,true);
											$('input:hidden[name="makeBatOrderHead.doneStaff.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(makeBatOrderHead.id)?? && (makeBatOrderHead.doneStaff.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${makeBatOrderHead.doneStaff.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form',obj, 'makeBatOrderHead.doneStaff', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form', 'makeBatOrderHead.doneStaff',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1491799580611')}" >${getText('WOM.propertydisplayName.randon1491799580611')}</label>
				</td>
				
						<#assign makeBatOrderHead_needDate_defaultValue  = ''>
							 							<#assign makeBatOrderHead_needDate_defaultValue  = ''>
					<#if (makeBatOrderHead_needDate_defaultValue)?? &&(makeBatOrderHead_needDate_defaultValue)?has_content>
							<#assign makeBatOrderHead_needDate_defaultValue  = getDefaultDateTime(makeBatOrderHead_needDate_defaultValue!)?datetime>
					</#if>
					<td  nullable=false class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(makeBatOrderHead.needDate)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="makeBatOrderHead.needDate" value="${makeBatOrderHead_needDate_defaultValue!}" type="dateTimeMin"  id="makeBatOrderHead.needDate"  cssStyle=""   align="left"/>
								
							<#else>
							<#if (makeBatOrderHead.needDate)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="makeBatOrderHead.needDate" value="${makeBatOrderHead.needDate?string('yyyy-MM-dd HH:mm:ss')}" type="dateTimeMin"  id="makeBatOrderHead.needDate"  cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="makeBatOrderHead.needDate" value="" type="dateTimeMin" id="makeBatOrderHead.needDate" cssStyle=""  align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead", "WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrder", 'EDIT')>
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
					<#assign elementName = 'makeBatOrderHead' + "." + columnName>
					<#assign elementId = 'makeBatOrderHead' + "_" + columnName>
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
						<#if makeBatOrderHead[columnName]??>
							<#assign dateVal = (makeBatOrderHead[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${makeBatOrderHead[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${makeBatOrderHead[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${makeBatOrderHead[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${makeBatOrderHead[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
								<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart", "WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856", "DATAGRID", "makeBatOrderPart")>
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
				<#assign dUrl="/WOM/batchingMaterialNeed/makeBatOrderHead/data-dg1491803986856.action?makeBatOrderHead.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856">
			<#else>
				<#assign dUrl="/WOM/batchingMaterialNeed/makeBatOrderHead/data-dg1491803986856.action?makeBatOrderHead.id=${(makeBatOrderHead.id)!-1}&datagridCode=WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_MakeBatOrderPart_dg1491803986856" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1491803986856_id" value="MakeBatOrderPart_dg1491803986856" />
			
			<input type="hidden" id="dg1491803986856_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1491801852784')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/batchingMaterialNeed/makeBatOrderHead/data-dg1491803986856.action?operateType=export&datagridCode=WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="MakeBatOrderPart_dg1491803986856" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="MakeBatOrderPart_dg1491803986856" viewType="${viewType}" renderOverEvent="dg1491803986856RenderOverEvent" route="${routeFlag}" formId="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form" noPermissionKeys="needID.id,needID.productId.productCode,needID.productId.productName,num,remark" modelCode="WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1491803986856" dtPage="dgPage"  hidekeyPrefix="dg1491803986856" hidekey="['id','version','needID.id','needID.id','needID.id','needID.productId.productCode','needID.id','needID.productId.productName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1491803986856PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign needID_id_displayDefaultType=''>
								<#assign needID_id_defaultValue=''>
										<#assign needID_id_defaultValue=''>
																	<#if (needID_id_defaultValue!)?string=="currentUser">
								<#assign needID_id_defaultValue='${staffJson!}'>
							<#elseif (needID_id_defaultValue!)?string=="currentPost">
								<#assign needID_id_defaultValue='${postJson!}'>
							<#elseif (needID_id_defaultValue!)?string=="currentDepart">
								<#assign needID_id_defaultValue='${deptJson!}'>
							<#elseif (needID_id_defaultValue!)?string=="currentComp">
								<#assign needID_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="needID.id"        showFormat="SELECTCOMP" defaultValue="${(needID_id_defaultValue!)?string}" defaultDisplay="${(needID_id_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder"  textalign="center" hiddenCol=true viewUrl="/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef.action" viewCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1491792578939')}"  label="${getText('ec.common.ID')}" width=100 showFormatFunc=""  />
							<#assign needID_productId_productCode_displayDefaultType=''>
								<#assign needID_productId_productCode_defaultValue=''>
										<#assign needID_productId_productCode_defaultValue=''>
																	<#if (needID_productId_productCode_defaultValue!)?string=="currentUser">
								<#assign needID_productId_productCode_defaultValue='${staffJson!}'>
							<#elseif (needID_productId_productCode_defaultValue!)?string=="currentPost">
								<#assign needID_productId_productCode_defaultValue='${postJson!}'>
							<#elseif (needID_productId_productCode_defaultValue!)?string=="currentDepart">
								<#assign needID_productId_productCode_defaultValue='${deptJson!}'>
							<#elseif (needID_productId_productCode_defaultValue!)?string=="currentComp">
								<#assign needID_productId_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="needID.productId.productCode"        showFormat="TEXT" defaultValue="${(needID_productId_productCode_defaultValue!)?string}" defaultDisplay="${(needID_productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder"  textalign="left"  viewUrl="/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef.action" viewCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1491792578939')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""  />
							<#assign needID_productId_productName_displayDefaultType=''>
								<#assign needID_productId_productName_defaultValue=''>
										<#assign needID_productId_productName_defaultValue=''>
																	<#if (needID_productId_productName_defaultValue!)?string=="currentUser">
								<#assign needID_productId_productName_defaultValue='${staffJson!}'>
							<#elseif (needID_productId_productName_defaultValue!)?string=="currentPost">
								<#assign needID_productId_productName_defaultValue='${postJson!}'>
							<#elseif (needID_productId_productName_defaultValue!)?string=="currentDepart">
								<#assign needID_productId_productName_defaultValue='${deptJson!}'>
							<#elseif (needID_productId_productName_defaultValue!)?string=="currentComp">
								<#assign needID_productId_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="needID.productId.productName"        showFormat="TEXT" defaultValue="${(needID_productId_productName_defaultValue!)?string}" defaultDisplay="${(needID_productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder"  textalign="left"  viewUrl="/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef.action" viewCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1491792578939')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""  />
							<#assign num_displayDefaultType=''>
								<#assign num_defaultValue=''>
										<#assign num_defaultValue=''>
										  
									<@datacolumn key="num"        showFormat="TEXT" defaultValue="${(num_defaultValue!)?string}" defaultDisplay="${(num_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1491802231630')}" width=100 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart", "WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856", "DATAGRID", "makeBatOrderPart")>
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
											<#assign selectCompName = 'WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder'>
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
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										  
									<@datacolumn key="remark"        showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1491802260903')}" width=150 showFormatFunc=""  />
			
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
				function MakeBatOrderPart_dg1491803986856_check_datagridvalid(){
					//
					var errorObj =MakeBatOrderPart_dg1491803986856Widget._DT.testData();
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
				
				function savedg1491803986856DataGrid(){
					<#if  refId?? && (refId gt 0)>
					MakeBatOrderPart_dg1491803986856Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('MakeBatOrderPart_dg1491803986856Widget') > -1) {
						MakeBatOrderPart_dg1491803986856Widget.setAllRowEdited();
					}
					var json = MakeBatOrderPart_dg1491803986856Widget.parseEditedData();
					$('input[name="dg1491803986856ListJson"]').remove();
					$('input[name="dgLists[\'dg1491803986856\']"]').remove();
					$('input[name="dg1491803986856ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1491803986856\']">').val(json).appendTo($('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form'));
					$('<input type="hidden" name="dg1491803986856ModelCode">').val('WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart').appendTo($('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1491803986856ListJson">').val(json).appendTo($('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form'));
				}
				function DT_MakeBatOrderPart_dg1491803986856_deldatagrid(){
					var deleteRows = MakeBatOrderPart_dg1491803986856Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','headID.id','needID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1491803986856DeletedIds").length>0){
							$("#dg1491803986856DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1491803986856DeletedIds" name="dgDeletedIds[\'dg1491803986856\']" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1491803986856DeletedIds['+CUI('input[name^="dg1491803986856DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form'));
					});
					return deleteRows;
				}
				function DT_MakeBatOrderPart_dg1491803986856_delTreeNodes(){
					var deleteRows = MakeBatOrderPart_dg1491803986856Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','headID.id','needID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1491803986856DeletedIds").length>0){
							$("#dg1491803986856DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1491803986856DeletedIds" name="dgDeletedIds[\'dg1491803986856\']" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1491803986856DeletedIds['+CUI('input[name^="dg1491803986856DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_datagrids');
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
							if(datagrids[0][i] == 'MakeBatOrderPart_dg1491803986856') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'MakeBatOrderPart_dg1491803986856';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'MakeBatOrderPart_dg1491803986856';
					}
					$('body').data('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_datagrids', datagrids);
				});
				
				var MakeBatOrderPart_dg1491803986856_importDialog = null;
				function MakeBatOrderPart_dg1491803986856_showImportDialog(){
					try{
						if(MakeBatOrderPart_dg1491803986856_importDialog!=null&&MakeBatOrderPart_dg1491803986856_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/batchingMaterialNeed/makeBatOrderHead/initImport.action?datagridCode=WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856&tid=${id!}&datagridName=dg1491803986856";
							<#if canImportExcel>
								var buttonCode="WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						MakeBatOrderPart_dg1491803986856_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("MakeBatOrderPart_dg1491803986856"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();MakeBatOrderPart_dg1491803986856_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();MakeBatOrderPart_dg1491803986856_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						MakeBatOrderPart_dg1491803986856_importDialog.show();
					}catch(e){}
				}	
				
				function MakeBatOrderPart_dg1491803986856_downLoadFile(){
					var url = "/WOM/batchingMaterialNeed/makeBatOrderHead/downLoad.action?datagridCode=WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856&templateRelatedModelCode=WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrderdg1491803986856&downloadType=template&fileName=dg1491803986856";
					window.open(url,"","");
				}
				function dg1491803986856RenderOverEvent(){
					var len=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow().length;
for(var i=0;i<len;i++){
   	var id=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[i].id
   	var proname=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[i].productId.productName
   	var procode=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[i].productId.productCode
   	MakeBatOrderPart_dg1491803986856Widget._DT.addNewRow()
   	MakeBatOrderPart_dg1491803986856Widget._DT.setCellValue(i,'needID.id',id);
   	MakeBatOrderPart_dg1491803986856Widget._DT.setCellValue(i,'needID.productId.productName',proname);
   	MakeBatOrderPart_dg1491803986856Widget._DT.setCellValue(i,'needID.productId.productCode',procode);
   	var planNum = ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[i].planNum;
   	var hasOrderNum = ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[i].hasOrderNum;
   	if(planNum==null || planNum==""){
   		planNum = 0;
   	}
   	if(hasOrderNum==null || hasOrderNum==""){
   		hasOrderNum = 0;
   	}
   	if((planNum - hasOrderNum) > 0){
   		MakeBatOrderPart_dg1491803986856Widget._DT.setCellValue(i,'num',planNum - hasOrderNum);
   	}
}
				}
				function dg1491803986856PageInitMethod(nTabIndex){
					WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrder,html,WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.beforeSaveProcess = function(){}
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.beforeSubmitMethod = function() {
		try{eval("savedg1491803986856DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form').trigger('beforeSubmit');
		//makeBatOrderHead.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="makeBatOrderHead.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.print = function(url){
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
		
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.saveSetting = function(){
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
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.printSetting = function(){
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
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.settingDialog.show();
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
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack = customCallBack;
		}
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_fileupload').length == 0) {
				$('body').append('<div id="WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_fileupload"></div>');
			}
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.infoDialog.show();
			if($('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_fileupload').html() == '') {
				$('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_batchingMaterialNeed_makeBatOrderHead&entityCode=WOM_7.5.0.0_batchingMaterialNeed&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.referenceCopyBackInfo";
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.dialog = dialog;
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._dialog = foundation.common.select({
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
	
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.referenceCopyBackInfo = function(obj){
		if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._dialog){
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form','WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.dialog._el).load('/WOM/batchingMaterialNeed/makeBatOrderHead/makeBatchingOrder.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.dialog._config.iframe, WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.dialog._dialog ).prop( 'src', '/WOM/batchingMaterialNeed/makeBatOrderHead/makeBatchingOrder.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.dialog._el).load('/WOM/batchingMaterialNeed/makeBatOrderHead/makeBatchingOrder.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder' + '_' + extraFrameParam;
		var callbackName="";
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix = '';
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._oGrid = oGrid;
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._sUrl = url;
		if(customCallBack){
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.gridEventObj = gridEventObj;
			callbackName = "WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.getMultiselectCallBackInfo_DG" : "WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.getcallBackInfo_DG";
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.getcallBackInfo";
		}
		if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix!=''){
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix = WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix.substring(1);
		}
		if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._querycustomFuncN == "function") {
				refparam += WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form',obj[0], WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix, WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._sUrl);
		CUI.commonFills('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form',WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix,obj[0]);

		try{
			if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack) {
				eval(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack);
				WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.getcallBackInfo_DG_IE = function(obj){
		if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customBeforeCallBack) {
			var flag = eval(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._sUrl);
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
			if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack) {
				eval(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack);
				WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.getcallBackInfo_DG = function(obj){
		if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customBeforeCallBack) {
			var flag = eval(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._currRow).next().length==0){
					WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._oGrid.addNewRow();
				}	
				WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._currRow = $(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._currRow).next();
				$(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._currRow,obj[i],WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix,WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._sUrl);
			eval("CUI.commonFills_DG(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._currRow,WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._prefix,obj[i],WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._oGrid)");
		}
		try{
			if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack) {
				eval(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack);
				WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._dialog.close();
		} catch(e){}
	};
	
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._oGrid, WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._currRow, WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._key, WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._displayFieldName, obj[i])
		}
		try{
			if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack) {
				eval(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack);
				WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder._dialog.close();
		} catch(e){}
	};
	
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form'));
        			}
        	   	}
        	}
      	});
	};
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.beforeSubmitMethodSettingInPage = function(){
		//表头信息
			     var makeOrderStaff=$('input[name="makeBatOrderHead.makeStaff.id"]').val()
				 var exeOrderStaff=$('input[name="makeBatOrderHead.doneStaff.id"]').val()
				 var needArriveDate=$('input[name="makeBatOrderHead.needDate"]').val();
				 //表体信息
				 var orderDetails=MakeBatOrderPart_dg1491803986856Widget.getAllRowData();			 			
				  //进行配料待办制定
				 makeBatchingOrder(makeOrderStaff,exeOrderStaff,needArriveDate,orderDetails);
				 WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query('query');
				 WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_formDialogErrorBarWidget.showMessage('${getText("ec.common.saveandclosesuccessful")}','s');
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initCount = 0;
	WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_makeBatchingOrder_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_datagrids');	
		var	conHeight = h-$("#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_main_div .edit-panes-s").each(function(index){
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
							if(WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initCount <= 2) {
								setTimeout(function(){WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initSize();}, 200);
								WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initCount++;
							}/* else {
								WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initCount = 0;
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
		WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initSize(index);
		});
		$(window).bind("dialog.resize",function(){WOM.batchingMaterialNeed.makeBatOrderHead.makeBatchingOrder.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchingMaterialNeed_makeBatchingOrder,js,WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderHead,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>