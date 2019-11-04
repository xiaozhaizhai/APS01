<!-- RM_7.5.0.0/suitedLine/suitedLineEdit -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "RM_suitedLine_lineFormula">
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
<#assign userJson= Session.user.toJSON()>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#-- 实体对象 -->
<#assign tableObj = lineFormula>
<#-- 命名空间 -->
<#assign editPageNs = "RM.suitedLine.lineFormula.suitedLineEdit">
<#-- 模型名称-->
<#assign modelName = "lineFormula">
<#-- 视图编码-->
<#assign viewCode = "RM_7.5.0.0_suitedLine_suitedLineEdit">
<#-- 实体编码-->
<#assign entity_code = "RM_7.5.0.0_suitedLine">
<#-- 视图名称-->
<#assign viewName = "suitedLineEdit">
<#-- datagrid编码-->
<#assign datagridCode = "RM_suitedLine_lineFormula_suitedLineEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "LineFormula">
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
<#assign editFormId = "RM_suitedLine_lineFormula_suitedLineEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( lineFormula.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "RM.viewcontrolName.randon1553588866595">
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
        <#assign configTitle = getText('RM.viewtitle.randon1487990556294')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#RM_suitedLine_lineFormula_suitedLineEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('RM.suitedLine.lineFormula.suitedLineEdit');
			RM.suitedLine.lineFormula.suitedLineEdit.currentUser = ${userJson};
			RM.suitedLine.lineFormula.suitedLineEdit.currentStaff = ${staffJson};
			RM.suitedLine.lineFormula.suitedLineEdit.currentDepartment = ${deptJson};
			RM.suitedLine.lineFormula.suitedLineEdit.currentPosition = ${postJson};
			RM.suitedLine.lineFormula.suitedLineEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_suitedLineEdit,head,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="lineFormula.formulaId.id,lineFormula.id,lineFormula.lineId.id," onsubmitMethod="RM.suitedLine.lineFormula.suitedLineEdit.beforeSubmitMethod()" id="RM_suitedLine_lineFormula_suitedLineEdit_form" namespace="/RM/suitedLine/lineFormula/suitedLineEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_suitedLine_LineFormula&_bapFieldPermissonModelName_=LineFormula" editPageNs="RM.suitedLine.lineFormula.suitedLineEdit" callback="RM.suitedLine.lineFormula.suitedLineEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_suitedLine_lineFormula_suitedLineEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="RM_suitedLine_lineFormula_suitedLineEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="lineFormula.formulaId.id" value="${(lineFormula.formulaId.id)!""}" originalvalue="${(lineFormula.formulaId.id)!""}"/>
					<input type="hidden" name="lineFormula.id" value="${(lineFormula.id)!""}" originalvalue="${(lineFormula.id)!""}"/>
					<input type="hidden" name="lineFormula.lineId.id" value="${(lineFormula.lineId.id)!""}" originalvalue="${(lineFormula.lineId.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "RM_suitedLine_lineFormula_suitedLineEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=RM_7.5.0.0_suitedLine', null, function(){
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
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon14871409535801')}" >${getText('RM.propertydisplayName.randon14871409535801')}</label>
				</td>
				
						<#assign lineFormula_formulaId_code_defaultValue  = ''>
														<#assign lineFormula_formulaId_code_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" reftitle="${getText('RM.viewtitle.randon1491787313479')}" viewType="${viewType!}" deValue="${lineFormula_formulaId_code_defaultValue!}" conditionfunc="RM.suitedLine.lineFormula.suitedLineEdit._querycustomFunc('lineFormula_formulaId_code')"  value="${(lineFormula.formulaId.code)!}" displayFieldName="code" name="lineFormula.formulaId.code" id="lineFormula_formulaId_code" type="other" url="/RM/formula/formula/formulaPubRef.action" clicked=true multiple=false mnewidth=260 formId="RM_suitedLine_lineFormula_suitedLineEdit_form" editCustomCallback="formulaCallBack(obj);" refViewCode="RM_7.5.0.0_formula_formulaPubRef" onkeyupfuncname="formulaCallBack(obj);_callback_lineFormula_formulaId_code(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(lineFormula.id)?? && (lineFormula.formulaId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${lineFormula.formulaId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_suitedLine_lineFormula_suitedLineEdit_form',obj, 'lineFormula.formulaId', '/RM/formula/formula/formulaPubRef.action');
												CUI.commonFills('RM_suitedLine_lineFormula_suitedLineEdit_form', 'lineFormula.formulaId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon14870758237901')}" >${getText('RM.propertydisplayName.randon14870758237901')}</label>
				</td>
				
						<#assign lineFormula_formulaId_name_defaultValue  = ''>
														<#assign lineFormula_formulaId_name_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="lineFormula.formulaId.name" id="lineFormula_formulaId_name"  style=";" originalvalue="<#if !newObj || (lineFormula.formulaId.name)?has_content>${(lineFormula.formulaId.name?html)!}<#else>${lineFormula_formulaId_name_defaultValue!}</#if>" value="<#if !newObj || (lineFormula.formulaId.name)?has_content>${(lineFormula.formulaId.name?html)!}<#else>${lineFormula_formulaId_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
												<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon14871395922391')}" >${getText('RM.propertydisplayName.randon14871395922391')}</label>
				</td>
				
						<#assign lineFormula_formulaId_edition_defaultValue  = ''>
														<#assign lineFormula_formulaId_edition_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input-readonly">
									<input name="lineFormula.formulaId.edition" id="lineFormula_formulaId_edition"  style=";" originalvalue="<#if newObj&& !(lineFormula.formulaId.edition)?has_content>${lineFormula_formulaId_edition_defaultValue!}<#elseif (lineFormula.formulaId.edition)?has_content>#{(lineFormula.formulaId.edition)!; m2M2}</#if>" value="<#if newObj&& !(lineFormula.formulaId.edition)?has_content>${lineFormula_formulaId_edition_defaultValue!}<#elseif (lineFormula.formulaId.edition)?has_content>#{(lineFormula.formulaId.edition)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							
				</td>
				</tr><tr >
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon148792773969323422342')}" >${getText('RM.propertydisplayName.randon148792773969323422342')}</label>
				</td>
				
						<#assign lineFormula_lineId_name_defaultValue  = ''>
														<#assign lineFormula_lineId_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1490322427886')}" viewType="${viewType!}" deValue="${lineFormula_lineId_name_defaultValue!}" conditionfunc="RM.suitedLine.lineFormula.suitedLineEdit._querycustomFunc('lineFormula_lineId_name')"  value="${(lineFormula.lineId.name)!}" displayFieldName="name" name="lineFormula.lineId.name" id="lineFormula_lineId_name" type="other" url="/MESBasic/factoryModel/factoryModel/factoryProductRef.action" clicked=true multiple=false mnewidth=260 formId="RM_suitedLine_lineFormula_suitedLineEdit_form" editCustomCallback="callbackLineFormula(obj);" refViewCode="MESBasic_1_factoryModel_factoryProductRef" onkeyupfuncname="callbackLineFormula(obj);_callback_lineFormula_lineId_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(lineFormula.id)?? && (lineFormula.lineId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${lineFormula.lineId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_suitedLine_lineFormula_suitedLineEdit_form',obj, 'lineFormula.lineId', '/MESBasic/factoryModel/factoryModel/factoryProductRef.action');
												CUI.commonFills('RM_suitedLine_lineFormula_suitedLineEdit_form', 'lineFormula.lineId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									RM.suitedLine.lineFormula.suitedLineEdit.query_lineFormula_lineId_name = function() {
										var lineName=$('input[name="lineFormula.lineId.name"]').val();
return "lineName="+lineName;
									}
								</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487927891234')}" >${getText('RM.propertydisplayName.randon1487927891234')}</label>
				</td>
				
						<#assign lineFormula_maxCapacity_defaultValue  = ''>
							 							<#assign lineFormula_maxCapacity_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="lineFormula.maxCapacity" id="lineFormula_maxCapacity"  style=";" originalvalue="<#if newObj&& !(lineFormula.maxCapacity)?has_content>${lineFormula_maxCapacity_defaultValue!}<#elseif (lineFormula.maxCapacity)?has_content>#{(lineFormula.maxCapacity)!; m2M2}</#if>" value="<#if newObj&& !(lineFormula.maxCapacity)?has_content>${lineFormula_maxCapacity_defaultValue!}<#elseif (lineFormula.maxCapacity)?has_content>#{(lineFormula.maxCapacity)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#lineFormula_maxCapacity').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487927891234")}')}");
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487927827167123167')}" >${getText('RM.propertydisplayName.randon1487927827167123167')}</label>
				</td>
				
						<#assign lineFormula_longTime_defaultValue  = ''>
							 							<#assign lineFormula_longTime_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="lineFormula.longTime" id="lineFormula_longTime"  style=";" originalvalue="<#if newObj&& !(lineFormula.longTime)?has_content>${lineFormula_longTime_defaultValue!}<#elseif (lineFormula.longTime)?has_content>#{(lineFormula.longTime)!; m2M2}</#if>" value="<#if newObj&& !(lineFormula.longTime)?has_content>${lineFormula_longTime_defaultValue!}<#elseif (lineFormula.longTime)?has_content>#{(lineFormula.longTime)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#lineFormula_longTime').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487927827167")}')}");
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
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487927965341234')}" >${getText('RM.propertydisplayName.randon1487927965341234')}</label>
				</td>
				
						<#assign lineFormula_theoreYield_defaultValue  = ''>
							 							<#assign lineFormula_theoreYield_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="lineFormula.theoreYield" id="lineFormula_theoreYield"  style=";" originalvalue="<#if newObj&& !(lineFormula.theoreYield)?has_content>${lineFormula_theoreYield_defaultValue!}<#elseif (lineFormula.theoreYield)?has_content>#{(lineFormula.theoreYield)!; m2M2}</#if>" value="<#if newObj&& !(lineFormula.theoreYield)?has_content>${lineFormula_theoreYield_defaultValue!}<#elseif (lineFormula.theoreYield)?has_content>#{(lineFormula.theoreYield)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" onblur='lineFormulaCheck()'/>
							</div>
							<script type="text/javascript">
								$(function(){
									$('#lineFormula_theoreYield').unbind('blur').bind('blur',function(){
										var percision = 2;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("RM.propertydisplayName.randon1487927965341")}')}");
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1554975104606')}" >${getText('RM.propertydisplayName.randon1554975104606')}</label>
				</td>
				
						<#assign lineFormula_autoReportOnFinish_defaultValue  = ''>
							 							<#assign lineFormula_autoReportOnFinish_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${lineFormula_autoReportOnFinish_defaultValue!}" formId="RM_suitedLine_lineFormula_suitedLineEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="lineFormula.autoReportOnFinish.id" code="autoReportOnFinish" value="${(lineFormula.autoReportOnFinish.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_suitedLine_lineFormula_suitedLineEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="lineFormula.autoReportOnFinish.id" code="autoReportOnFinish" value="${(lineFormula.autoReportOnFinish.id)!}"  />
									
								</#if>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("RM_7.5.0.0_suitedLine_LineFormula", "RM_7.5.0.0_suitedLine_suitedLineEdit", 'EDIT')>
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
					<#assign elementName = 'lineFormula' + "." + columnName>
					<#assign elementId = 'lineFormula' + "_" + columnName>
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
						<#if lineFormula[columnName]??>
							<#assign dateVal = (lineFormula[columnName])?string('yyyy-MM-dd HH:mm:ss')>
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType cssStyle="text-align:${c.align!}" formId="RM_suitedLine_lineFormula_suitedLineEdit_form" classStyle="cui-noborder-input" view=(c.readonly!false) cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${lineFormula[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${lineFormula[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${lineFormula[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType cssStyle="text-align:${c.align!}" view=(c.readonly!false) value="${lineFormula[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="RM_suitedLine_lineFormula_suitedLineEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
					
							<label style="width:100%;;" value="${getText('RM.propertydisplayName.randon1487927995051')}" >${getText('RM.propertydisplayName.randon1487927995051')}</label>
				</td>
				
						<#assign lineFormula_meno_defaultValue  = ''>
							 							<#assign lineFormula_meno_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="lineFormula_meno" originalvalue="<#if !newObj || (lineFormula.meno)?has_content>${(lineFormula.meno?html)!}<#else>${lineFormula_meno_defaultValue?html}</#if>"  name="lineFormula.meno" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (lineFormula.meno)?has_content>${(lineFormula.meno)!}<#else>${lineFormula_meno_defaultValue}</#if></textarea></div>
							
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
								<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_suitedLine_ProcessUnit", "RM_7.5.0.0_suitedLine_suitedLineEditdg1490263075678", "DATAGRID", "processUnit")>
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
								function ProcessUnit_dg1490263075678_testEdit(event)
																{
	var selectRow=ProcessUnit_dg1490263075678Widget.getSelectedRow();
	if(selectRow==undefined){
		workbenchErrorBarWidget.showMessage("${getText('RM.lineFormula.randon1487075267698')}");
		return false;
	}
	var unitIdAddIds;
	if(ProcessUnit_dg1490263075678Widget.getCellValue(selectRow,'processUnitIDUnitId').substr(0,1)==","){
		unitIdAddIds=ProcessUnit_dg1490263075678Widget.getCellValue(selectRow,'processUnitIDUnitId').substr(1,ProcessUnit_dg1490263075678Widget.getCellValue(selectRow,'processUnitIDUnitId').length-1);
	}else{
		unitIdAddIds=ProcessUnit_dg1490263075678Widget.getCellValue(selectRow,'processUnitIDUnitId');
	}
	if(unitIdAddIds==''||unitIdAddIds==undefined){
		workbenchErrorBarWidget.showMessage("${getText('RM.lineFormula.randon1487075262342342')}");
		return false;
	}
	//工序-工作单元Id
	var unitId=ProcessUnit_dg1490263075678Widget.getCellValue(selectRow,'id');
	if(unitId=='' || unitId==undefined){
		workbenchErrorBarWidget.showMessage("${getText('RM.lineFormula.randon1487075262234234')}");
		return false;		
	}
	var processUntit;
	if(ProcessUnit_dg1490263075678Widget.getCellValue(ProcessUnit_dg1490263075678Widget.getSelectedRow(),'processUnitIDUnitId').substr(0,1)==","){
		processUntit=ProcessUnit_dg1490263075678Widget.getCellValue(ProcessUnit_dg1490263075678Widget.getSelectedRow(),'processUnitIDUnitId').substr(1,ProcessUnit_dg1490263075678Widget.getCellValue(ProcessUnit_dg1490263075678Widget.getSelectedRow(),'processUnitIDUnitId').length-1);
	}else{
		processUntit=ProcessUnit_dg1490263075678Widget.getCellValue(ProcessUnit_dg1490263075678Widget.getSelectedRow(),'processUnitIDUnitId');
	}
	var processUnitId=ProcessUnit_dg1490263075678Widget.getCellValue(ProcessUnit_dg1490263075678Widget.getSelectedRow(),'id');
	//校验是否有工作中心包含在工作中心组中
	var url1 = "/RM/suitedLine/processPoint/checkFactoryModel.action?processUnitId="+processUnitId+"&processUntit="+processUntit;
	var checkFlag;
	$.ajax({
		url : url1,
		type : 'get',
		async : false,
		success : function(msg) {
			if(msg!=null){
				checkFlag = msg.result;
			}
		}
	});
	if(checkFlag!='' && checkFlag!=null){
	workbenchErrorBarWidget.showMessage("工作单元[<b>"+checkFlag.substring(checkFlag.indexOf(',')+1)+"</b>]已经包含在工作单元组[<b>" +checkFlag.substring(0,checkFlag.indexOf(','))+ "</b>]不需要重复添加！");
		return false;	
	}
	
	
	
	var processId=ProcessUnit_dg1490263075678Widget.getCellValue(selectRow,'processId.id'); 
	var weight=window.screen.width*0.3;
	
testEdit=new CUI.Dialog({
		title:"${getText('RM.viewdisplayName.randon1490266476347')}",
	    formId:"RM_suitedLine_processUnit_testEdit_form",
		height:window.screen.height*0.5,
		width: window.screen.width*0.5,
		modal:true,
		url:'/RM/suitedLine/processUnit/testEdit.action?entityCode=RM_7.5.0.0_suitedLine&processUntitId='+unitIdAddIds+'&processId='+processId+'&id='+unitId,
		buttons:[{
			name:"${getText('foundation.common.save')}",
			handler:function(){
				CUI('#RM_suitedLine_processUnit_testEdit_form').submit();
			}
		},
		{
			name:"${getText('foundation.common.closed')}",
			handler:function(){this.close();}
		}]
  });       
  testEdit.show();
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/suitedLine/lineFormula/data-dg1490263075678.action?lineFormula.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1490263075678">
			<#else>
				<#assign dUrl="/RM/suitedLine/lineFormula/data-dg1490263075678.action?lineFormula.id=${(lineFormula.id)!-1}&datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1490263075678">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1490263192308')}\",handler:function(event){ProcessUnit_dg1490263075678_testEdit(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.buttonPropertyshowName.radion1490263192308')}\",handler:function(event){ProcessUnit_dg1490263075678_testEdit(event)},iconClass:\"cui-btn-edit\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProcessUnit_dg1490263075678" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1490263075678_id" value="ProcessUnit_dg1490263075678" />
			
			<input type="hidden" id="dg1490263075678_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487928212842')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/suitedLine/lineFormula/data-dg1490263075678.action?operateType=export&datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1490263075678"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProcessUnit_dg1490263075678" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProcessUnit_dg1490263075678" viewType="${viewType}" renderOverEvent="dg1490263075678RenderOverEvent" route="${routeFlag}" formId="RM_suitedLine_lineFormula_suitedLineEdit_form" noPermissionKeys="processId.name,processUnitIDUnitId,pmemo" modelCode="RM_7.5.0.0_suitedLine_ProcessUnit" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1490263075678" dtPage="dgPage"  hidekeyPrefix="dg1490263075678" hidekey="['id','version','processId.id','processId.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1490263075678PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="RM.buttonPropertyshowName.radion1490263192308,testEdit,edit" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign processId_name_displayDefaultType=''>
								<#assign processId_name_defaultValue=''>
										<#assign processId_name_defaultValue=''>
																	<#if (processId_name_defaultValue!)?string=="currentUser">
								<#assign processId_name_defaultValue='${staffJson!}'>
							<#elseif (processId_name_defaultValue!)?string=="currentPost">
								<#assign processId_name_defaultValue='${postJson!}'>
							<#elseif (processId_name_defaultValue!)?string=="currentDepart">
								<#assign processId_name_defaultValue='${deptJson!}'>
							<#elseif (processId_name_defaultValue!)?string=="currentComp">
								<#assign processId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="processId.name"        showFormat="SELECTCOMP" defaultValue="${(processId_name_defaultValue!)?string}" defaultDisplay="${(processId_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.suitedLine.lineFormula.suitedLineEdit"  textalign="left"  viewUrl="/RM/formula/formulaProcess/processLineReference.action" viewCode="RM_7.5.0.0_formula_processLineReference" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488977430659')}"  label="${getText('RM.propertydisplayName.randon1487295011793')}" width=100 showFormatFunc=""  />
							<#assign processUnitIDUnitId_displayDefaultType=''>
								<#assign processUnitIDUnitId_defaultValue=''>
							<#if (processUnitIDUnitId_defaultValue!)?string=="currentUser">
								<#assign processUnitIDUnitId_defaultValue='${staffJson!}'>
							<#elseif (processUnitIDUnitId_defaultValue!)?string=="currentPost">
								<#assign processUnitIDUnitId_defaultValue='${postJson!}'>
							<#elseif (processUnitIDUnitId_defaultValue!)?string=="currentDepart">
								<#assign processUnitIDUnitId_defaultValue='${deptJson!}'>
							<#elseif (processUnitIDUnitId_defaultValue!)?string=="currentComp">
								<#assign processUnitIDUnitId_defaultValue='${compJson!}'>
							</#if>
									<@datacolumn key="processUnitIDUnitId"  multiselect=true displayFieldName="name"      showFormat="TEXT" defaultValue="${(processUnitIDUnitId_defaultValue!)?string}" defaultDisplay="${(processUnitIDUnitId_displayDefaultType!)?string}" decimal="" editable=true type="multselect" showType="multselect" notnull=true   selectCompName="RM.suitedLine.lineFormula.suitedLineEdit"  textalign="right"  viewUrl="/MESBasic/factoryModel/factoryModel/suitLineRef.action?multiSelect=true" viewCode="MESBasic_1_factoryModel_suitLineRef" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1543316852447')}" mneenable=false  label="${getText('RM.propertydisplayName.randon1490234042230')}" width=200 showFormatFunc=""  />
							<#assign customPropViewMappings = getShowCustomProps("RM_7.5.0.0_suitedLine_ProcessUnit", "RM_7.5.0.0_suitedLine_suitedLineEditdg1490263075678", "DATAGRID", "processUnit")>
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
											<#assign selectCompName = 'RM.suitedLine.lineFormula.suitedLineEdit'>
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
							<#assign pmemo_displayDefaultType=''>
								<#assign pmemo_defaultValue=''>
										<#assign pmemo_defaultValue=''>
										  
									<@datacolumn key="pmemo"        showFormat="TEXT" defaultValue="${(pmemo_defaultValue!)?string}" defaultDisplay="${(pmemo_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487928399064')}" width=200 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
						RM.suitedLine.lineFormula.suitedLineEdit.query_dg1490263075678processUnitIDUnitId = function() {
							var lineId = $('input[name="lineFormula.lineId.id"]').val();
return "parentId=" + lineId;
						}
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
				function ProcessUnit_dg1490263075678_check_datagridvalid(){
					//
					var errorObj =ProcessUnit_dg1490263075678Widget._DT.testData();
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
				
				function savedg1490263075678DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProcessUnit_dg1490263075678Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProcessUnit_dg1490263075678Widget') > -1) {
						ProcessUnit_dg1490263075678Widget.setAllRowEdited();
					}
					var json = ProcessUnit_dg1490263075678Widget.parseEditedData();
					$('input[name="dg1490263075678ListJson"]').remove();
					$('input[name="dgLists[\'dg1490263075678\']"]').remove();
					$('input[name="dg1490263075678ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1490263075678\']">').val(json).appendTo($('#RM_suitedLine_lineFormula_suitedLineEdit_form'));
					$('<input type="hidden" name="dg1490263075678ModelCode">').val('RM_7.5.0.0_suitedLine_ProcessUnit').appendTo($('#RM_suitedLine_lineFormula_suitedLineEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1490263075678ListJson">').val(json).appendTo($('#RM_suitedLine_lineFormula_suitedLineEdit_form'));
				}
				function DT_ProcessUnit_dg1490263075678_deldatagrid(){
					var deleteRows = ProcessUnit_dg1490263075678Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','formulaId.id','lineId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490263075678DeletedIds").length>0){
							$("#dg1490263075678DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490263075678DeletedIds" name="dgDeletedIds[\'dg1490263075678\']" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_lineFormula_suitedLineEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490263075678DeletedIds['+CUI('input[name^="dg1490263075678DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_lineFormula_suitedLineEdit_form'));
					});
					return deleteRows;
				}
				function DT_ProcessUnit_dg1490263075678_delTreeNodes(){
					var deleteRows = ProcessUnit_dg1490263075678Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','formulaId.id','lineId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490263075678DeletedIds").length>0){
							$("#dg1490263075678DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490263075678DeletedIds" name="dgDeletedIds[\'dg1490263075678\']" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_lineFormula_suitedLineEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490263075678DeletedIds['+CUI('input[name^="dg1490263075678DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_lineFormula_suitedLineEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_suitedLine_lineFormula_suitedLineEdit_datagrids');
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
							if(datagrids[0][i] == 'ProcessUnit_dg1490263075678') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProcessUnit_dg1490263075678';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProcessUnit_dg1490263075678';
					}
					$('body').data('RM_suitedLine_lineFormula_suitedLineEdit_datagrids', datagrids);
				});
				
				var ProcessUnit_dg1490263075678_importDialog = null;
				function ProcessUnit_dg1490263075678_showImportDialog(){
					try{
						if(ProcessUnit_dg1490263075678_importDialog!=null&&ProcessUnit_dg1490263075678_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/suitedLine/lineFormula/initImport.action?datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1490263075678&tid=${id!}&datagridName=dg1490263075678";
							<#if canImportExcel>
								var buttonCode="RM_7.5.0.0_suitedLine_suitedLineEditdg1490263075678_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProcessUnit_dg1490263075678_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProcessUnit_dg1490263075678"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProcessUnit_dg1490263075678_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProcessUnit_dg1490263075678_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProcessUnit_dg1490263075678_importDialog.show();
					}catch(e){}
				}	
				
				function ProcessUnit_dg1490263075678_downLoadFile(){
					var url = "/RM/suitedLine/lineFormula/downLoad.action?datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1490263075678&templateRelatedModelCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1490263075678&downloadType=template&fileName=dg1490263075678";
					window.open(url,"","");
				}
				function dg1490263075678RenderOverEvent(){
				}
				function dg1490263075678PageInitMethod(nTabIndex){
					RM.suitedLine.lineFormula.suitedLineEdit.initSize(nTabIndex);
					$("#ProcessUnit_dg1490263075678 .paginatorbar-operatebar span:eq(0)").attr('class','buttonbar-button cui-btn-cdsz');
				}
			</script>
			
			
			</div>
			</div>
		</div>
	</div>
			
			
</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="RM_suitedLine_lineFormula_suitedLineEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.suitedLine.lineFormula.suitedLineEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_suitedLineEdit,html,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) -->
<!-- 自定义代码 -->
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
						$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.suitedLine.lineFormula.suitedLineEdit.initCount = 0;
			RM.suitedLine.lineFormula.suitedLineEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div .edit-head").height()-$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div .edit-workflow").height()</#if>;
				$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_suitedLine_lineFormula_suitedLineEdit_datagrids');
				var padding_bottom=16;
				$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div .pd_bottom,#RM_suitedLine_lineFormula_suitedLineEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div .edit-panes-s").each(function(index){
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
									if(RM.suitedLine.lineFormula.suitedLineEdit.initCount <= 2) {
										setTimeout(function(){RM.suitedLine.lineFormula.suitedLineEdit.initSize();}, 200);
										RM.suitedLine.lineFormula.suitedLineEdit.initCount++;
									}/* else {
										RM.suitedLine.lineFormula.suitedLineEdit.initCount = 0;
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
							if(($("#RM_suitedLine_lineFormula_suitedLineEdit_main_div .edit-workflow").length > 0) && ($("#RM_suitedLine_lineFormula_suitedLineEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#RM_suitedLine_lineFormula_suitedLineEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				RM.suitedLine.lineFormula.suitedLineEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.suitedLine.lineFormula.suitedLineEdit.initSize();
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
						if(parseInt($("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").css("width"),10)==650){
							$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.suitedLine.lineFormula.suitedLineEdit.resizeLayout();
						//RM.suitedLine.lineFormula.suitedLineEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").css("width"),10)==800){
							$("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.suitedLine.lineFormula.suitedLineEdit.resizeLayout();
						//RM.suitedLine.lineFormula.suitedLineEdit.initSize();
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
					RM.suitedLine.lineFormula.suitedLineEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.suitedLine.lineFormula.suitedLineEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.suitedLine.lineFormula.suitedLineEdit.initSize();});
				/*
				RM.suitedLine.lineFormula.suitedLineEdit.resizeLayout=function(){
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

		RM.suitedLine.lineFormula.suitedLineEdit.validate = function(){
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
		RM.suitedLine.lineFormula.suitedLineEdit.beforeSaveProcess = function(){
			try{eval("savedg1490263075678DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#RM_suitedLine_lineFormula_suitedLineEdit_form').trigger('beforeSubmit');
			//lineFormula.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="lineFormula.extraCol"]').val(extraCol);
		}
		RM.suitedLine.lineFormula.suitedLineEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#RM_suitedLine_lineFormula_suitedLineEdit_form').append(ProcessUnit_dg1490263075678Widget._DT.createInputs('dg1490263075678List'));
										</#if>
		};
		RM.suitedLine.lineFormula.suitedLineEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.suitedLine.lineFormula.suitedLineEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//RM.suitedLine.lineFormula.suitedLineEdit.beforeSaveProcess();

			//RM.suitedLine.lineFormula.suitedLineEdit.processDataGrid();
			$('#RM_suitedLine_lineFormula_suitedLineEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_suitedLine_lineFormula_suitedLineEdit_form','RM_suitedLine_lineFormula_suitedLineEdit_datagrids')) {      
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
		RM.suitedLine.lineFormula.suitedLineEdit.print = function(){
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
		
		RM.suitedLine.lineFormula.suitedLineEdit.saveSetting = function(){
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
		
		RM.suitedLine.lineFormula.suitedLineEdit.printSetting = function(){
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
				RM.suitedLine.lineFormula.suitedLineEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.suitedLine.lineFormula.suitedLineEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.suitedLine.lineFormula.suitedLineEdit.settingDialog.show();
			}
		}
		
		
		RM.suitedLine.lineFormula.suitedLineEdit._callBackInfo = function(res){
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
 						window.opener.RM.suitedLine.lineFormula.editCallBackInfo(res); 						
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

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.suitedLine.lineFormula.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				RM.suitedLine.lineFormula.suitedLineEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.suitedLine.lineFormula.suitedLineEdit._refViewCode_IE = viewCode;
			} else {
				RM.suitedLine.lineFormula.suitedLineEdit._refViewCode_IE = '';
			}
			RM.suitedLine.lineFormula.suitedLineEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.suitedLine.lineFormula.suitedLineEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.suitedLine.lineFormula.suitedLineEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.suitedLine.lineFormula.suitedLineEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.suitedLine.lineFormula.suitedLineEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.suitedLine.lineFormula.suitedLineEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(RM.suitedLine.lineFormula.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(RM.suitedLine.lineFormula.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				RM.suitedLine.lineFormula.suitedLineEdit.gridEventObj = gridEventObj;
				callbackName = "RM.suitedLine.lineFormula.suitedLineEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.suitedLine.lineFormula.suitedLineEdit.getMultiselectCallBackInfo_DG" : "RM.suitedLine.lineFormula.suitedLineEdit.getcallBackInfo_DG";
				RM.suitedLine.lineFormula.suitedLineEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.suitedLine.lineFormula.suitedLineEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.suitedLine.lineFormula.suitedLineEdit._prefix = _prefix.substring(1);
			}
			
			RM.suitedLine.lineFormula.suitedLineEdit._oGrid = oGrid;
			RM.suitedLine.lineFormula.suitedLineEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.suitedLine.lineFormula.suitedLineEdit._refViewCode = oColumn.viewCode;
				} else {
					RM.suitedLine.lineFormula.suitedLineEdit._refViewCode = '';
				}
			} else {
				RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp = false;
				RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames = '';
				RM.suitedLine.lineFormula.suitedLineEdit._refViewCode = '';
			}
			if (RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp == true && RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.suitedLine.lineFormula.suitedLineEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.suitedLine.lineFormula.suitedLineEdit._customCallBack = customCallBack;
			}
			if(RM.suitedLine.lineFormula.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.suitedLine.lineFormula.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.suitedLine.lineFormula.suitedLineEdit._querycustomFuncN == "function") {
				refparam += RM.suitedLine.lineFormula.suitedLineEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.suitedLine.lineFormula.suitedLineEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.suitedLine.lineFormula.suitedLineEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.suitedLine.lineFormula.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.suitedLine.lineFormula.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.suitedLine.lineFormula.suitedLineEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.suitedLine.lineFormula.suitedLineEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.suitedLine.lineFormula.suitedLineEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.suitedLine.lineFormula.suitedLineEdit.query_"+obj+")!='undefined'") ? eval('RM.suitedLine.lineFormula.suitedLineEdit.query_'+obj+'()') : null;
			return str;
		};
		RM.suitedLine.lineFormula.suitedLineEdit.getcallBackGroupInfo = function(obj){
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
			RM.suitedLine.lineFormula.suitedLineEdit._dialog.close();
		}
		RM.suitedLine.lineFormula.suitedLineEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_suitedLine_lineFormula_suitedLineEdit_form',obj[0], RM.suitedLine.lineFormula.suitedLineEdit._prefix, RM.suitedLine.lineFormula.suitedLineEdit._sUrl);
			CUI.commonFills('RM_suitedLine_lineFormula_suitedLineEdit_form',RM.suitedLine.lineFormula.suitedLineEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.suitedLine.lineFormula.suitedLineEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.suitedLine.lineFormula.suitedLineEdit._customCallBack) {
					eval(RM.suitedLine.lineFormula.suitedLineEdit._customCallBack);
					RM.suitedLine.lineFormula.suitedLineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.suitedLine.lineFormula.suitedLineEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.suitedLine.lineFormula.suitedLineEdit.getcallBackInfo_DG_IE = function(obj){
			if(RM.suitedLine.lineFormula.suitedLineEdit._customBeforeCallBack) {
				var flag = eval(RM.suitedLine.lineFormula.suitedLineEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.suitedLine.lineFormula.suitedLineEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp_IE == true && RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.suitedLine.lineFormula.suitedLineEdit._sUrl,RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.suitedLine.lineFormula.suitedLineEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp_IE == true && RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.suitedLine.lineFormula.suitedLineEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.suitedLine.lineFormula.suitedLineEdit._refViewCode_IE + '&id=' + id,
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
				if(RM.suitedLine.lineFormula.suitedLineEdit._customCallBack) {
					eval(RM.suitedLine.lineFormula.suitedLineEdit._customCallBack);
					RM.suitedLine.lineFormula.suitedLineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.suitedLine.lineFormula.suitedLineEdit._dialog.close();
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
		
		RM.suitedLine.lineFormula.suitedLineEdit.getcallBackInfo_DG = function(obj){
			if(RM.suitedLine.lineFormula.suitedLineEdit._customBeforeCallBack) {
				var flag = eval(RM.suitedLine.lineFormula.suitedLineEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.suitedLine.lineFormula.suitedLineEdit._currRow).next().length==0){
						RM.suitedLine.lineFormula.suitedLineEdit._oGrid.addNewRow();
					}	
					RM.suitedLine.lineFormula.suitedLineEdit._currRow = $(RM.suitedLine.lineFormula.suitedLineEdit._currRow).next();
					$(RM.suitedLine.lineFormula.suitedLineEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.suitedLine.lineFormula.suitedLineEdit._currRow,obj[i], RM.suitedLine.lineFormula.suitedLineEdit._prefix, RM.suitedLine.lineFormula.suitedLineEdit._sUrl);
				if (RM.suitedLine.lineFormula.suitedLineEdit._isObjCustomProp == true && RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.suitedLine.lineFormula.suitedLineEdit._currRow,RM.suitedLine.lineFormula.suitedLineEdit._prefix,obj[i],RM.suitedLine.lineFormula.suitedLineEdit._oGrid,RM.suitedLine.lineFormula.suitedLineEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.suitedLine.lineFormula.suitedLineEdit._currRow,RM.suitedLine.lineFormula.suitedLineEdit._prefix,obj[i],RM.suitedLine.lineFormula.suitedLineEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.suitedLine.lineFormula.suitedLineEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.suitedLine.lineFormula.suitedLineEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.suitedLine.lineFormula.suitedLineEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.suitedLine.lineFormula.suitedLineEdit._refViewCode + '&id=' + id,
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
									name = RM.suitedLine.lineFormula.suitedLineEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.suitedLine.lineFormula.suitedLineEdit._currRow, objs, RM.suitedLine.lineFormula.suitedLineEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.suitedLine.lineFormula.suitedLineEdit._customCallBack) {
					eval(RM.suitedLine.lineFormula.suitedLineEdit._customCallBack);
					RM.suitedLine.lineFormula.suitedLineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.suitedLine.lineFormula.suitedLineEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.suitedLine.lineFormula.suitedLineEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.suitedLine.lineFormula.suitedLineEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.suitedLine.lineFormula.suitedLineEdit._oGrid, RM.suitedLine.lineFormula.suitedLineEdit._currRow, RM.suitedLine.lineFormula.suitedLineEdit._key, RM.suitedLine.lineFormula.suitedLineEdit._displayFieldName, obj[i])
			}
			try{
				if(RM.suitedLine.lineFormula.suitedLineEdit._customCallBack) {
					eval(RM.suitedLine.lineFormula.suitedLineEdit._customCallBack);
					RM.suitedLine.lineFormula.suitedLineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.suitedLine.lineFormula.suitedLineEdit._dialog.close();
			} catch(e){}
		};
		
		RM.suitedLine.lineFormula.suitedLineEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.suitedLine.lineFormula.suitedLineEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_suitedLine_lineFormula_suitedLineEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			RM.suitedLine.lineFormula.suitedLineEdit.onloadForProduct();
			//$('#RM_suitedLine_lineFormula_suitedLineEdit table tbody tr').eq(3).hide();
//判断配方的EPR参数
	var supportEbr=$('input[name="lineFormula.formulaId.supportEbr"]').val();
	if(supportEbr=='true'){//启用EPR则开启EPR编辑
		 $('input[name="lineFormula.ebr_check"]').removeAttr("disabled");
	}else{
		$('input[name="lineFormula.ebr_check"]').attr("checked", false);
		$('input[name="lineFormula.ebr_check"]').attr("disabled","disabled");
	}
		});

		RM.suitedLine.lineFormula.suitedLineEdit.beforeSubmitMethodSettingInPage = function(){
			RM.suitedLine.lineFormula.suitedLineEdit.onsaveForProduct();
			var length=ProcessUnit_dg1490263075678Widget.getRowLength();
for(var i=0;i<length;i++){
	var processUntit=ProcessUnit_dg1490263075678Widget.getCellValue(i,'processUnitIDUnitId');
	var processUnitId=ProcessUnit_dg1490263075678Widget.getCellValue(i,'id');
	if(processUnitId==null){
		continue;
	}
	var url1 = "/RM/suitedLine/processPoint/getTestPointSave.action?processUnitId="+processUnitId+"&processUntit="+processUntit;
	var pointFlag;
	$.ajax({
		url : url1,
		type : 'get',
		async : false,
		success : function(msg) {
			if(msg!=null){
				pointFlag = msg.result;
			}
		}
	});
}
		};
		RM.suitedLine.lineFormula.suitedLineEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.suitedLine.lineFormula.suitedLineEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.suitedLine.lineFormula.suitedLineEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").hide();
				},100);
				//CUI("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.suitedLine.lineFormula.suitedLineEdit.showThis = function(){
			if(!CUI("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").is(':visible')) {
				CUI("#RM_suitedLine_lineFormula_suitedLineEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.suitedLine.lineFormula.suitedLineEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.suitedLine.lineFormula.suitedLineEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_suitedLine_lineFormula_suitedLineEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_suitedLine_LineFormula&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.suitedLine.lineFormula.suitedLineEdit.auditDialog.show();
			</#if>
		}
		
		
		RM.suitedLine.lineFormula.suitedLineEdit.showInfoDialog=function(mode){
			
			RM.suitedLine.lineFormula.suitedLineEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_suitedLine_lineFormula_suitedLineEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.suitedLine.lineFormula.suitedLineEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.suitedLine.lineFormula.suitedLineEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_suitedLine");
			}
		}
		
		RM.suitedLine.lineFormula.suitedLineEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/suitedLine/lineFormula/dealInfo-list.action&dlTableInfoId=${(lineFormula.tableInfoId)?default('')}");
			}
		}
		RM.suitedLine.lineFormula.suitedLineEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=RM_7.5.0.0_suitedLine_LineFormula&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(lineFormula.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=RM_7.5.0.0_suitedLine_LineFormula&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(lineFormula.tableInfoId)?default('')}");
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
		RM.suitedLine.lineFormula.suitedLineEdit.supervision=function(){
			RM.suitedLine.lineFormula.suitedLineEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(lineFormula.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.suitedLine.lineFormula.suitedLineEdit.modifyOwnerStaffDialog.show();
		}
		
function lineFormulaCheck(){
	if(Number($("#lineFormula_theoreYield").val())>100 ||Number($("#lineFormula_theoreYield").val())<0){
	    workbenchErrorBarWidget.showMessage("${getText('RM.formula.randon145236987')}");
		$("#lineFormula_theoreYield").val("");
	    return false;
    }
}
function formulaCallBack(obj){
	
	//自动报工赋值
	$("#lineFormulaautoReportOnFinishid").unDisabledSelect();
	$("#lineFormulaautoReportOnFinishid").setValue(obj[0].autoReportOnFinish.id);
	
	//判断配方的EPR参数
	var supportEbr=$('input[name="lineFormula.formulaId.supportEbr"]').val();
	if(supportEbr=='true'){//启用EPR则开启EPR编辑
		 $('input[name="lineFormula.ebr_check"]').removeAttr("disabled");
	}else{
		$('input[name="lineFormula.ebr_check"]').attr("checked", false);
		$('input[name="lineFormula.ebr_check"]').attr("disabled","disabled");
	}
	
	//自动将该配方的所有工序填充到表体
	var formulaId=$('input[name="lineFormula.formulaId.id"]').val();
	ProcessUnit_dg1490263075678Widget._DT.delAllRows();
	var url = "/RM/suitedLine/lineFormula/findFormulaProcess.action?formulaId="+formulaId;
	var paramResult;
	$.ajax({
		url : url,
		type : 'get',
		async : false,
		success : function(msg) {
			if(msg!=null){
				paramResult = msg;
			}
		}
	});
	for(var param in paramResult){
            	
		var processId = paramResult[param]['processId']==null?"":paramResult[param]['processId'];
		var processName= paramResult[param]['processName']==null?"":paramResult[param]['processName'];
		
		ProcessUnit_dg1490263075678Widget._DT.addNewRow();
		var lastRow = ProcessUnit_dg1490263075678Widget._DT.getAllRows().length - 1;
		 
		ProcessUnit_dg1490263075678Widget.setCellValue(lastRow,'processId.id',processId);
		ProcessUnit_dg1490263075678Widget.setCellValue(lastRow,'processId.name',processName);

	}

}
function callbackLineFormula(obj){
   console.log(obj);
   //$.simpleSelect.clearSelectObjValue('lineFormula_lineId_name');

}



		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_suitedLineEdit,js,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) */
// 自定义代码
        var testEdit=null
$(function(){
 testEdit=new CUI.Dialog({
		title:"测点设置",
	    formId:"RM_suitedLine_processUnit_testEdit_form",
		height:455,
		width: window.screen.width*0.4,
		modal:true,
		url:'/RM/suitedLine/processUnit/testEdit.action?entityCode=RM_7.5.0.0_suitedLine',
		buttons:[{
			name:"${getText('foundation.common.save')}",
			handler:function(){
				CUI('#RM_suitedLine_processUnit_testEdit_form').submit();
			}
		},
		{
			name:"${getText('foundation.common.closed')}",
			handler:function(){this.close();}
		}]
  });       
			RM.suitedLine.processUnit = RM.suitedLine.lineFormula.suitedLineEdit;
     RM.suitedLine.processUnit.callBackInfo=function(){   
             CUI.Dialog.toggleAllButton(); 
       //关闭测点设置
       testEdit.close();
            
        }
     	})
     
		RM.suitedLine.lineFormula.suitedLineEdit._callBackInfo = function(res){
			if(res.dealSuccessFlag){
					var showMsg ;
				if(res.operateType == 'save'){
					showMsg = "保存成功。";
				}else{
					showMsg = "处理成功！";
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
 						window.opener.RM.suitedLine.lineFormula.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.location.reload();
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					document.location.href="/RM/suitedLine/lineFormula/suitedLineEdit.action?entityCode=RM_7.5.0.0_suitedLine&id="+res.id+'&${getPowerCode('${buttonPerfix!}suitedLineList_update_modify_RM_7.5.0.0_suitedLine_suitedLineList')}';
					//window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.suitedLine.lineFormula.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
/* CUSTOM CODE END */
		RM.suitedLine.lineFormula.suitedLineEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_suitedLineEdit,onloadForProduct,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		RM.suitedLine.lineFormula.suitedLineEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_suitedLineEdit,onsaveForProduct,RM_7.5.0.0_suitedLine_LineFormula,RM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="RM.suitedLine.lineFormula.suitedLineEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.suitedLine.lineFormula.suitedLineEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(lineFormula.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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