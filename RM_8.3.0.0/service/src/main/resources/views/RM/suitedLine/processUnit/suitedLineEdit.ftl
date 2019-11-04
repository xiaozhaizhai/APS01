<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "RM_suitedLine_processUnit">
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
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=8,9,10" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('RM.viewtitle.randon1487990556294')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		body{_width:100%;}
		.ewc-dialog-el{height:100%;}
		.flow-height{
			height:94%;
			height:91%\9;
		}
		#RM_suitedLine_processUnit_suitedLineEdit_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		</style>
		<script type="text/javascript">
			CUI.ns('RM.suitedLine.processUnit.suitedLineEdit');
			RM.suitedLine.processUnit.suitedLineEdit.currentUser = ${userJson};
			RM.suitedLine.processUnit.suitedLineEdit.currentStaff = ${staffJson};
			RM.suitedLine.processUnit.suitedLineEdit.currentDepartment = ${deptJson};
			RM.suitedLine.processUnit.suitedLineEdit.currentPosition = ${postJson};
			RM.suitedLine.processUnit.suitedLineEdit.currentCompany = ${compJson};
		</script>
    </head>
	<body>
		<@loadpanel/>
		<div id="load_mask_first" class="load_mask_first"></div>
		<iframe id="load_iframe_ie_first" class="load_iframe_ie" style="z-index: 199; display: block;"></iframe>
		<div id="loading_wrap_first" class="loading_wrap_first">
			<div class="loading_process">
				<div class="loading_msg_first">${getText("foundation.common.data.waiting")}</div>
			</div>
		</div>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="lineFormula.formulaId.id,lineFormula.lineId.id," onsubmitMethod="RM.suitedLine.processUnit.suitedLineEdit.beforeSubmitMethod()" id="RM_suitedLine_processUnit_suitedLineEdit_form" namespace="/RM/suitedLine/processUnit/suitedLineEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_suitedLine_ProcessUnit&_bapFieldPermissonModelName_=ProcessUnit" callback="RM.suitedLine.processUnit.suitedLineEdit._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_suitedLine_processUnit_suitedLineEdit_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl" id="top_buttonbar">
									<#if !((processUnit.status)?? && processUnit.status == 77)>
									<#if !(superEdit!false) && id??>
									</#if>
									
									<a class='cui-btn-new' id="edit-save-btn" onclick="RM.suitedLine.processUnit.suitedLineEdit.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
									<#if transitions?has_content>
									<#list transitions as t>
										<#if t.cancel??&&t.cancel==1>
											<#if id??>
								    <a class='cui-btn-new' id='edit-${t.name}-btn'><span class='edit-nullify'></span>${getHtmlText('ec.edit.remove')}</a>
									<script type="text/javascript">
										$(function(){
											$('#edit-${t.name}-btn').click(function(){
												if(!confirm("${getText('ec.view.confirm.remove')}"))return;
												$("input[type='radio'][name='workFlowVar.outcome']").prop("checked",false);
												if($("#workflow_outcomes .wfcancel").length == 0) {
													$("#workflow_outcomes").append('<input class="wfcancel" type="hidden" name="workFlowVar.outcome" id="__workflow_outcome_${t.name}" value="${t.name}" />');
													$("#workflow_outcomes").append('<input class="wfcancel"  type="hidden" name="workFlowVarStatus" value="cancel" />');
												}
												var wfcancelArr=new Array();
												var paramObj=new Object();
												paramObj.type='normal';
												paramObj.outcome='${t.name}';
												paramObj.dec='${t.description}';
												wfcancelArr.push(paramObj);
												$("#__workflow_outcomeMap").val(YAHOO.lang.JSON.stringify(wfcancelArr));
												RM.suitedLine.processUnit.suitedLineEdit.submit(true);
											});
										});
									</script>
											</#if>
											<#break>
										</#if>
									</#list>
									</#if>

									
									</#if>
									
									<a class='cui-btn-new' id="edit-close-btn" onclick="window.close()"><span class="close"></span>${getHtmlText("foundation.common.closeWindow")}</a>
			
								</div>
								
								<div class="fr">
									<ul>
										<#if auditCheck('RM_7.5.0.0_suitedLine_suitedLineEdit') == '1'>
										<li id="fr_audit" ><a title='${getText("foundation.base.audit")}' onclick="RM.suitedLine.processUnit.suitedLineEdit.showAudit()">
										<span class='icon_audit' ></span>
										</a></li>
										</#if>
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="RM.suitedLine.processUnit.suitedLineEdit.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="RM_suitedLine_processUnit_suitedLineEdit_form_attcount"></em></i></span>
										</a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
							</div>
    					</div>
    					
    					<div class="edit-main" id="RM_suitedLine_processUnit_suitedLineEdit">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="suitedLineEdit">
								<input type="hidden" name="datagridKey" value="RM_suitedLine_processUnit_suitedLineEdit_datagrids">
								<input type="hidden" name="viewCode" value="RM_7.5.0.0_suitedLine_suitedLineEdit">
								<input type="hidden" name="modelName" value="ProcessUnit">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="processUnit.version" value="${(processUnit.version)!0}" />
								<input type="hidden" name="processUnit.extraCol" value='' />
								<input type="hidden" name="operateType" id="operateType" />
								<input type="hidden" name="uploadDocIds" value="${uploadDocIds!''}">
										<input type="hidden" name="lineFormula.formulaId.id" value="${(lineFormula.formulaId.id)!""}" originalvalue="${(lineFormula.formulaId.id)!""}"/>
										<input type="hidden" name="lineFormula.lineId.id" value="${(lineFormula.lineId.id)!""}" originalvalue="${(lineFormula.lineId.id)!""}"/>

		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "RM_suitedLine_processUnit_suitedLineEdit_form"+"_attcount";
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
</script>								<div class="edit-panes edit-panes-w edit-container clearfix">

										<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
												<#if !RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_code_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_code_permit = checkFieldPermission('lineFormula.formulaId.code','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_formula_Formula_code')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_code_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_code_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487140953580')}" >${getText('RM.propertydisplayName.randon1487140953580')}</label>
				</td>
				
						<#assign lineFormula_formulaId_code_defaultValue  = ''>
														<#assign lineFormula_formulaId_code_defaultValue  = ''>
					<#if !RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_code_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_code_permit = checkFieldPermission('lineFormula.formulaId.code','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_formula_Formula_code')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_code_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_code_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_code_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" mneenable=false reftitle="${getText('RM.viewtitle.randon1488246963795')}" conditionfunc="RM.suitedLine.processUnit.suitedLineEdit._querycustomFunc('lineFormula_formulaId_code')" view=true value="${(lineFormula.formulaId.code)!}" displayFieldName="code" name="lineFormula.formulaId.code" id="lineFormula_formulaId_code" type="other" url="/RM/formula/formula/formulaRef.action" clicked=true multiple=false mnewidth=260 formId="RM_suitedLine_processUnit_suitedLineEdit_form" editCustomCallback="formulaCallBack();" onkeyupfuncname="formulaCallBack();_callback_lineFormula_formulaId_code(obj);" cssStyle="" isEdit=true onchange='onchange()' refViewCode="RM_7.5.0.0_formula_formulaRef"   isCrossCompany=false  />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" mneenable=false reftitle="${getText('RM.viewtitle.randon1488246963795')}" viewType="${viewType!}" deValue="${lineFormula_formulaId_code_defaultValue!}" conditionfunc="RM.suitedLine.processUnit.suitedLineEdit._querycustomFunc('lineFormula_formulaId_code')"  value="${(lineFormula.formulaId.code)!}" displayFieldName="code" name="lineFormula.formulaId.code" id="lineFormula_formulaId_code" type="other" url="/RM/formula/formula/formulaRef.action" clicked=true multiple=false mnewidth=260 formId="RM_suitedLine_processUnit_suitedLineEdit_form" editCustomCallback="formulaCallBack();" refViewCode="RM_7.5.0.0_formula_formulaRef"  onkeyupfuncname="formulaCallBack();_callback_lineFormula_formulaId_code(obj);" cssStyle="" isEdit=true onchange='onchange()'  isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(processUnit.id)?? && (lineFormula.formulaId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${lineFormula.formulaId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_suitedLine_processUnit_suitedLineEdit_form',obj, 'lineFormula.formulaId', '/RM/formula/formula/formulaRef.action');
												CUI.commonFills('RM_suitedLine_processUnit_suitedLineEdit_form', 'lineFormula.formulaId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				
												<#if !RM_7_5_0_0_suitedLine_LineFormula_lineId_MESBasic_1_factoryModel_FactoryModel_name_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_lineId_MESBasic_1_factoryModel_FactoryModel_name_permit = checkFieldPermission('lineFormula.lineId.name','RM_7.5.0.0_suitedLine_ProcessUnit','MESBasic_1_factoryModel_FactoryModel_name')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_lineId_MESBasic_1_factoryModel_FactoryModel_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_suitedLine_LineFormula_lineId_MESBasic_1_factoryModel_FactoryModel_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487927739693')}" >${getText('RM.propertydisplayName.randon1487927739693')}</label>
				</td>
				
						<#assign lineFormula_lineId_name_defaultValue  = ''>
														<#assign lineFormula_lineId_name_defaultValue  = ''>
					<#if !RM_7_5_0_0_suitedLine_LineFormula_lineId_MESBasic_1_factoryModel_FactoryModel_name_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_lineId_MESBasic_1_factoryModel_FactoryModel_name_permit = checkFieldPermission('lineFormula.lineId.name','RM_7.5.0.0_suitedLine_ProcessUnit','MESBasic_1_factoryModel_FactoryModel_name')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_lineId_MESBasic_1_factoryModel_FactoryModel_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_suitedLine_LineFormula_lineId_MESBasic_1_factoryModel_FactoryModel_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if RM_7_5_0_0_suitedLine_LineFormula_lineId_MESBasic_1_factoryModel_FactoryModel_name_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('')}" conditionfunc="RM.suitedLine.processUnit.suitedLineEdit._querycustomFunc('lineFormula_lineId_name')" view=true value="${(lineFormula.lineId.name)!}" displayFieldName="name" name="lineFormula.lineId.name" id="lineFormula_lineId_name" type="other" url="" clicked=true multiple=false mnewidth=260 formId="RM_suitedLine_processUnit_suitedLineEdit_form" editCustomCallback=";" onkeyupfuncname=";_callback_lineFormula_lineId_name(obj);" cssStyle="" isEdit=true   refViewCode="MESBasic_1_factoryModel_proLineRef"  isCrossCompany=false />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('')}" viewType="${viewType!}" deValue="${lineFormula_lineId_name_defaultValue!}" conditionfunc="RM.suitedLine.processUnit.suitedLineEdit._querycustomFunc('lineFormula_lineId_name')"  value="${(lineFormula.lineId.name)!}" displayFieldName="name" name="lineFormula.lineId.name" id="lineFormula_lineId_name" type="other" url="" clicked=true multiple=false mnewidth=260 formId="RM_suitedLine_processUnit_suitedLineEdit_form" editCustomCallback=";" refViewCode="MESBasic_1_factoryModel_proLineRef" onkeyupfuncname=";_callback_lineFormula_lineId_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(processUnit.id)?? && (lineFormula.lineId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${lineFormula.lineId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_suitedLine_processUnit_suitedLineEdit_form',obj, 'lineFormula.lineId', '');
												CUI.commonFills('RM_suitedLine_processUnit_suitedLineEdit_form', 'lineFormula.lineId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
									RM.suitedLine.processUnit.suitedLineEdit.query_lineFormula_lineId_name = function() {
										var layNum=4;
return "layNum="+layNum;
									}
								</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit = checkFieldPermission('lineFormula.maxCapacity','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_maxCapacity')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487927891234')}" >${getText('RM.propertydisplayName.randon1487927891234')}</label>
				</td>
				
						<#assign lineFormula_maxCapacity_defaultValue  = ''>
							 							<#assign lineFormula_maxCapacity_defaultValue  = ''>
					<#if !RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit = checkFieldPermission('lineFormula.maxCapacity','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_maxCapacity')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit == 1>-readonly</#if>">
									<input name="lineFormula.maxCapacity" id="lineFormula_maxCapacity"  style=";" originalvalue="<#if newObj&& !(lineFormula.maxCapacity)?has_content>${lineFormula_maxCapacity_defaultValue!}<#elseif (lineFormula.maxCapacity)?has_content>#{(lineFormula.maxCapacity)!; m2M2}</#if>" value="<#if newObj&& !(lineFormula.maxCapacity)?has_content>${lineFormula_maxCapacity_defaultValue!}<#elseif (lineFormula.maxCapacity)?has_content>#{(lineFormula.maxCapacity)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_suitedLine_LineFormula_maxCapacity_permit == 1> readonly=readonly</#if> />
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
							</#if>
				</td>
				</tr><tr >
							 					<#if !RM_7_5_0_0_suitedLine_LineFormula_longTime_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_longTime_permit = checkFieldPermission('lineFormula.longTime','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_longTime')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_longTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_suitedLine_LineFormula_longTime_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487927827167')}" >${getText('RM.propertydisplayName.randon1487927827167')}</label>
				</td>
				
						<#assign lineFormula_longTime_defaultValue  = ''>
							 							<#assign lineFormula_longTime_defaultValue  = ''>
					<#if !RM_7_5_0_0_suitedLine_LineFormula_longTime_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_longTime_permit = checkFieldPermission('lineFormula.longTime','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_longTime')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_longTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_suitedLine_LineFormula_longTime_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_suitedLine_LineFormula_longTime_permit == 1>-readonly</#if>">
									<input name="lineFormula.longTime" id="lineFormula_longTime"  style=";" originalvalue="<#if newObj&& !(lineFormula.longTime)?has_content>${lineFormula_longTime_defaultValue!}<#elseif (lineFormula.longTime)?has_content>#{(lineFormula.longTime)!; m2M2}</#if>" value="<#if newObj&& !(lineFormula.longTime)?has_content>${lineFormula_longTime_defaultValue!}<#elseif (lineFormula.longTime)?has_content>#{(lineFormula.longTime)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_suitedLine_LineFormula_longTime_permit == 1> readonly=readonly</#if> />
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
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit = checkFieldPermission('lineFormula.theoreYield','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_theoreYield')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487927965341')}" >${getText('RM.propertydisplayName.randon1487927965341')}</label>
				</td>
				
						<#assign lineFormula_theoreYield_defaultValue  = ''>
							 							<#assign lineFormula_theoreYield_defaultValue  = ''>
					<#if !RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit = checkFieldPermission('lineFormula.theoreYield','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_theoreYield')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit == 1>-readonly</#if>">
									<input name="lineFormula.theoreYield" id="lineFormula_theoreYield"  style=";" originalvalue="<#if newObj&& !(lineFormula.theoreYield)?has_content>${lineFormula_theoreYield_defaultValue!}<#elseif (lineFormula.theoreYield)?has_content>#{(lineFormula.theoreYield)!; m2M2}</#if>" value="<#if newObj&& !(lineFormula.theoreYield)?has_content>${lineFormula_theoreYield_defaultValue!}<#elseif (lineFormula.theoreYield)?has_content>#{(lineFormula.theoreYield)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_suitedLine_LineFormula_theoreYield_permit == 1> readonly=readonly</#if> />
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
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_suitedLine_LineFormula_ebr_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_ebr_permit = checkFieldPermission('lineFormula.ebr','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_ebr')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_ebr_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_suitedLine_LineFormula_ebr_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487927911269')}" >${getText('RM.propertydisplayName.randon1487927911269')}</label>
				</td>
				
						<#assign lineFormula_ebr_defaultValue  = ''>
							 							<#assign lineFormula_ebr_defaultValue  = ''>
					<#if !RM_7_5_0_0_suitedLine_LineFormula_ebr_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_ebr_permit = checkFieldPermission('lineFormula.ebr','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_ebr')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_ebr_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_suitedLine_LineFormula_ebr_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if RM_7_5_0_0_suitedLine_LineFormula_ebr_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="lineFormula.ebr_check" originalvalue="<#if !newObj || (lineFormula.ebr)?has_content>${(lineFormula.ebr!false)?string('true','false')}<#elseif lineFormula_ebr_defaultValue?has_content>${(lineFormula_ebr_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (lineFormula.ebr)?has_content>${(lineFormula.ebr!false)?string('true','false')}<#else>${(lineFormula_ebr_defaultValue!true)?string}</#if>"  <#if RM_7_5_0_0_suitedLine_LineFormula_ebr_permit == 1>disabled=true</#if>/>
								</#if>
								<input property_type="BOOLEAN" type="hidden" name="lineFormula.ebr" originalvalue="<#if ((lineFormula.ebr)?? &&  lineFormula.ebr)||(lineFormula_ebr_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((lineFormula.ebr)?? &&  lineFormula.ebr)||(lineFormula_ebr_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="lineFormula.ebr_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="lineFormula.ebr"]');
												CUI('input[name="lineFormula.ebr_check"]').each(function(){
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
							</#if>
				</td>
				</tr><tr >
							 					<#if !RM_7_5_0_0_suitedLine_LineFormula_meno_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_meno_permit = checkFieldPermission('lineFormula.meno','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_meno')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_meno_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_suitedLine_LineFormula_meno_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487927995051')}" >${getText('RM.propertydisplayName.randon1487927995051')}</label>
				</td>
				
						<#assign lineFormula_meno_defaultValue  = ''>
							 							<#assign lineFormula_meno_defaultValue  = ''>
					<#if !RM_7_5_0_0_suitedLine_LineFormula_meno_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_meno_permit = checkFieldPermission('lineFormula.meno','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_suitedLine_LineFormula_meno')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_meno_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="5" style="text-align: left;;" >
							<#if RM_7_5_0_0_suitedLine_LineFormula_meno_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="lineFormula_meno" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_suitedLine_LineFormula_meno_permit == 1>-readonly</#if> fix-ie7-textarea"><textarea property_type="TEXT" id="lineFormula_meno" originalvalue="<#if !newObj || (lineFormula.meno)?has_content>${(lineFormula.meno?html)!}<#else>${lineFormula_meno_defaultValue?html}</#if>"  name="lineFormula.meno" class="cui-noborder-textarea cui-textarea-auto"<#if RM_7_5_0_0_suitedLine_LineFormula_meno_permit == 1> readonly=readonly</#if> style=";" ><#if !newObj || (lineFormula.meno)?has_content>${(lineFormula.meno)!}<#else>${lineFormula_meno_defaultValue}</#if></textarea></div>
							</#if>
				</td>
				</tr><tr >
												<#if !RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_supportEbr_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_supportEbr_permit = checkFieldPermission('lineFormula.formulaId.supportEbr','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_formula_Formula_supportEbr')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_supportEbr_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
							<label style="<#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_supportEbr_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1490150767011')}" >${getText('RM.propertydisplayName.randon1490150767011')}</label>
				</td>
				
						<#assign lineFormula_formulaId_supportEbr_defaultValue  = ''>
														<#assign lineFormula_formulaId_supportEbr_defaultValue  = ''>
					<#if !RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_supportEbr_permit??>
					<#assign RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_supportEbr_permit = checkFieldPermission('lineFormula.formulaId.supportEbr','RM_7.5.0.0_suitedLine_ProcessUnit','RM_7.5.0.0_formula_Formula_supportEbr')>
					</#if>
					<td <#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_supportEbr_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
							<#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_supportEbr_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if RM_7_5_0_0_suitedLine_LineFormula_formulaId_RM_7_5_0_0_formula_Formula_supportEbr_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="lineFormula.formulaId.supportEbr_check" originalvalue="<#if !newObj || (lineFormula.formulaId.supportEbr)?has_content>${(lineFormula.formulaId.supportEbr!false)?string('true','false')}<#elseif lineFormula_formulaId_supportEbr_defaultValue?has_content>${(lineFormula_formulaId_supportEbr_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (lineFormula.formulaId.supportEbr)?has_content>${(lineFormula.formulaId.supportEbr!false)?string('true','false')}<#else>${(lineFormula_formulaId_supportEbr_defaultValue!true)?string}</#if>"  disabled=true/>
								</#if>
								<input property_type="BOOLEAN" type="hidden" name="lineFormula.formulaId.supportEbr" originalvalue="<#if ((lineFormula.formulaId.supportEbr)?? &&  lineFormula.formulaId.supportEbr)||(lineFormula_formulaId_supportEbr_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((lineFormula.formulaId.supportEbr)?? &&  lineFormula.formulaId.supportEbr)||(lineFormula_formulaId_supportEbr_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="lineFormula.formulaId.supportEbr_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="lineFormula.formulaId.supportEbr"]');
												CUI('input[name="lineFormula.formulaId.supportEbr_check"]').each(function(){
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
							</#if>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
</div>										</div>
										<div class="edit-datatable">	
				
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
			<#if false && isIE>
					<#assign routeFlag = "1">
			<#else>
					<#assign routeFlag = "0">
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
			
							<script type="text/javascript">
								function ProcessUnit_dg1487990913600_testEdit(event)
																{
    var testEdit=new CUI.Dialog({
		title:"测点设置",
	    formId:"RM_suitedLine_processUnit_testEdit_form",
		type:5,
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
  testEdit.show();
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/suitedLine/processUnit/data-dg1487990913600.action?lineFormula.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1487990913600">
			<#else>
				<#assign dUrl="/RM/suitedLine/processUnit/data-dg1487990913600.action?lineFormula.id=${(processUnit.id)!-1}&datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1487990913600">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProcessUnit_dg1487990913600_deldatagrid();}},{text:\"${getText('ec.view.button.insertRow')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowUp')}\",handler:function(){this.moveRow('up');},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowDown')}\",handler:function(){this.moveRow('down');},iconClass:\"cui-btn-down\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1488000873709')}\",handler:function(event){ProcessUnit_dg1487990913600_testEdit(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProcessUnit_dg1487990913600_deldatagrid();}},{text:\"${getText('ec.view.button.insertRow')}\",handler:function(){this.appendRow();},iconClass:\"cui-btn-insert\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowUp')}\",handler:function(){this.moveRow('up');},iconClass:\"cui-btn-up\",useInMore:\"false\"},{text:\"${getText('ec.view.button.moveRowDown')}\",handler:function(){this.moveRow('down');},iconClass:\"cui-btn-down\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion1488000873709')}\",handler:function(event){ProcessUnit_dg1487990913600_testEdit(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProcessUnit_dg1487990913600" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1487990913600_id" value="ProcessUnit_dg1487990913600" />
			
			<input type="hidden" id="dg1487990913600_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487928212842')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/suitedLine/processUnit/data-dg1487990913600.action?operateType=export&datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1487990913600"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProcessUnit_dg1487990913600" />
			<@datagrid withoutConfigTable=true id="ProcessUnit_dg1487990913600" viewType="${viewType}" renderOverEvent="dg1487990913600RenderOverEvent" route="${routeFlag}" formId="RM_suitedLine_processUnit_suitedLineEdit_form" noPermissionKeys="processId.name,processUnitIDUnitId,pmemo" modelCode="RM_7.5.0.0_suitedLine_ProcessUnit" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1487990913600" dtPage="dgPage"  hidekeyPrefix="dg1487990913600" hidekey="['id','version','sort','processId.id','processId.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1487990913600PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="RM.buttonPropertyshowName.radion1488000873709,testEdit" exportExcel=exportExcel addNewRow=true   canInsertRow=true  insertRowAble=true firstLoad=firstLoad >		
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

									<@datacolumn key="processId.name"        showFormat="SELECTCOMP" defaultValue="${(processId_name_defaultValue!)?string}" defaultDisplay="${(processId_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="RM.suitedLine.processUnit.suitedLineEdit"  textalign="left"  viewUrl="/RM/formula/formulaProcess/processLineReference.action" viewCode="RM_7.5.0.0_formula_processLineReference" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488977430659')}"  label="${getText('RM.propertydisplayName.randon1487295011793')}" width=100 showFormatFunc="laId=$"/>
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
									<@datacolumn key="processUnitIDUnitId"  multiselect=true displayFieldName="name"      showFormat="SELECTCOMP" defaultValue="${(processUnitIDUnitId_defaultValue!)?string}" defaultDisplay="${(processUnitIDUnitId_displayDefaultType!)?string}" decimal="" editable=true type="multselect" showType="multselect" notnull=true   selectCompName="RM.suitedLine.processUnit.suitedLineEdit"  textalign="left"  viewUrl="/MESBasic/factoryModel/factoryModel/factroyRefMulty.action?multiSelect=true" viewCode="MESBasic_1_factoryModel_factroyRefMulty" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1460961864158')}" mneenable=false  label="${getText('RM.propertydisplayName.randon1490234042230')}" width=200 showFormatFunc=""/>
							<#assign pmemo_displayDefaultType=''>
								<#assign pmemo_defaultValue=''>
										<#assign pmemo_defaultValue=''>
										  
									<@datacolumn key="pmemo"        showFormat="TEXT" defaultValue="${(pmemo_defaultValue!)?string}" defaultDisplay="${(pmemo_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487928399064')}" width=100 showFormatFunc=""/>
			
			</@datagrid>
				<script type="text/javascript">
					var formulaId=$('input[name="lineFormula.formulaId.id"]').val();
alert(formulaId);
return "formulaId"+formulaId;
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
			
			<script type="text/javascript">
				function ProcessUnit_dg1487990913600_check_datagridvalid(){
					//
					var errorObj =ProcessUnit_dg1487990913600Widget._DT.testData();
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
				
				function savedg1487990913600DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProcessUnit_dg1487990913600Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProcessUnit_dg1487990913600Widget') > -1) {
						ProcessUnit_dg1487990913600Widget.setAllRowEdited();
					}
					var json = ProcessUnit_dg1487990913600Widget.parseEditedData();
					$('input[name="dg1487990913600ListJson"]').remove();
					$('input[name="dgLists[\'dg1487990913600\']"]').remove();
					$('input[name="dg1487990913600ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1487990913600\']">').val(json).appendTo($('#RM_suitedLine_processUnit_suitedLineEdit_form'));
					$('<input type="hidden" name="dg1487990913600ModelCode">').val('RM_7.5.0.0_suitedLine_ProcessUnit').appendTo($('#RM_suitedLine_processUnit_suitedLineEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1487990913600ListJson">').val(json).appendTo($('#RM_suitedLine_processUnit_suitedLineEdit_form'));
				}
				function DT_ProcessUnit_dg1487990913600_deldatagrid(){
					var deleteRows = ProcessUnit_dg1487990913600Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','formulaId.id','lineId.id','headId.id','unitId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487990913600DeletedIds").length>0){
							$("#dg1487990913600DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487990913600DeletedIds" name="dgDeletedIds[\'dg1487990913600\']" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_processUnit_suitedLineEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487990913600DeletedIds['+CUI('input[name^="dg1487990913600DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_processUnit_suitedLineEdit_form'));
					});
				}
				function DT_ProcessUnit_dg1487990913600_delTreeNodes(){
					var deleteRows = ProcessUnit_dg1487990913600Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','formulaId.id','lineId.id','headId.id','unitId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487990913600DeletedIds").length>0){
							$("#dg1487990913600DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487990913600DeletedIds" name="dgDeletedIds[\'dg1487990913600\']" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_processUnit_suitedLineEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487990913600DeletedIds['+CUI('input[name^="dg1487990913600DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_suitedLine_processUnit_suitedLineEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_suitedLine_processUnit_suitedLineEdit_datagrids');
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
							if(datagrids[0][i] == 'ProcessUnit_dg1487990913600') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProcessUnit_dg1487990913600';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProcessUnit_dg1487990913600';
					}
					$('body').data('RM_suitedLine_processUnit_suitedLineEdit_datagrids', datagrids);
				});
				
				var ProcessUnit_dg1487990913600_importDialog = null;
				function ProcessUnit_dg1487990913600_showImportDialog(){
					try{
						if(ProcessUnit_dg1487990913600_importDialog!=null&&ProcessUnit_dg1487990913600_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/suitedLine/processUnit/initImport.action?datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1487990913600&tid=${id!}&datagridName=dg1487990913600";
						ProcessUnit_dg1487990913600_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProcessUnit_dg1487990913600"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProcessUnit_dg1487990913600_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProcessUnit_dg1487990913600_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProcessUnit_dg1487990913600_importDialog.show();
					}catch(e){}
				}	
				
				function ProcessUnit_dg1487990913600_downLoadFile(){
					var url = "/RM/suitedLine/processUnit/downLoad.action?datagridCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1487990913600&templateRelatedModelCode=RM_7.5.0.0_suitedLine_suitedLineEditdg1487990913600&downloadType=template&fileName=dg1487990913600";
					window.open(url,"","");
				}
				function dg1487990913600RenderOverEvent(){
				}
				function dg1487990913600PageInitMethod(nTabIndex){
					RM.suitedLine.processUnit.suitedLineEdit.initSize(nTabIndex);
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
     	
		<div id="RM_suitedLine_processUnit_suitedLineEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.suitedLine.processUnit.suitedLineEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_suitedLineEdit,html,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) -->
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
						$("#RM_suitedLine_processUnit_suitedLineEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_suitedLine_processUnit_suitedLineEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_suitedLine_processUnit_suitedLineEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_suitedLine_processUnit_suitedLineEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.suitedLine.processUnit.suitedLineEdit.initCount = 0;
			RM.suitedLine.processUnit.suitedLineEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_suitedLine_processUnit_suitedLineEdit_main_div .edit-head").height()-$("#RM_suitedLine_processUnit_suitedLineEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_suitedLine_processUnit_suitedLineEdit_main_div .edit-workflow").height()</#if>;
				$("#RM_suitedLine_processUnit_suitedLineEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_suitedLine_processUnit_suitedLineEdit_datagrids');
				var padding_bottom=16;
				$("#RM_suitedLine_processUnit_suitedLineEdit_main_div .pd_bottom,#RM_suitedLine_processUnit_suitedLineEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_suitedLine_processUnit_suitedLineEdit_main_div .edit-panes-s").each(function(index){
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
									if(RM.suitedLine.processUnit.suitedLineEdit.initCount <= 2) {
										setTimeout(function(){RM.suitedLine.processUnit.suitedLineEdit.initSize();}, 200);
										RM.suitedLine.processUnit.suitedLineEdit.initCount++;
									}/* else {
										RM.suitedLine.processUnit.suitedLineEdit.initCount = 0;
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
							if(($("#RM_suitedLine_processUnit_suitedLineEdit_main_div .edit-workflow").length > 0) && ($("#RM_suitedLine_processUnit_suitedLineEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				RM.suitedLine.processUnit.suitedLineEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.suitedLine.processUnit.suitedLineEdit.initSize();
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
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#RM_suitedLine_processUnit_suitedLineEdit_main_div").css("width"),10)==650){
							$("#RM_suitedLine_processUnit_suitedLineEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.suitedLine.processUnit.suitedLineEdit.resizeLayout();
						//RM.suitedLine.processUnit.suitedLineEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_suitedLine_processUnit_suitedLineEdit_main_div").css("width"),10)==800){
							$("#RM_suitedLine_processUnit_suitedLineEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.suitedLine.processUnit.suitedLineEdit.resizeLayout();
						//RM.suitedLine.processUnit.suitedLineEdit.initSize();
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
					RM.suitedLine.processUnit.suitedLineEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.suitedLine.processUnit.suitedLineEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.suitedLine.processUnit.suitedLineEdit.initSize();});
				/*
				RM.suitedLine.processUnit.suitedLineEdit.resizeLayout=function(){
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
		});

		RM.suitedLine.processUnit.suitedLineEdit.validate = function(){
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
		RM.suitedLine.processUnit.suitedLineEdit.beforeSaveProcess = function(){
			try{eval("savedg1487990913600DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#RM_suitedLine_processUnit_suitedLineEdit_form').trigger('beforeSubmit');
			//processUnit.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="processUnit.extraCol"]').val(extraCol);
		}
		RM.suitedLine.processUnit.suitedLineEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#RM_suitedLine_processUnit_suitedLineEdit_form').append(ProcessUnit_dg1487990913600Widget._DT.createInputs('dg1487990913600List'));
										</#if>
		};
		RM.suitedLine.processUnit.suitedLineEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.suitedLine.processUnit.suitedLineEdit.validate()){return;}
			RM.suitedLine.processUnit.suitedLineEdit.beforeSaveProcess();

			//RM.suitedLine.processUnit.suitedLineEdit.processDataGrid();
			$('#RM_suitedLine_processUnit_suitedLineEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_suitedLine_processUnit_suitedLineEdit_form','RM_suitedLine_processUnit_suitedLineEdit_datagrids')) {      
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
		RM.suitedLine.processUnit.suitedLineEdit.print = function(){
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
		
		RM.suitedLine.processUnit.suitedLineEdit.saveSetting = function(){
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
		
		RM.suitedLine.processUnit.suitedLineEdit.printSetting = function(){
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
				RM.suitedLine.processUnit.suitedLineEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.suitedLine.processUnit.suitedLineEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.suitedLine.processUnit.suitedLineEdit.settingDialog.show();
			}
		}
		
		
		RM.suitedLine.processUnit.suitedLineEdit._callBackInfo = function(res){
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
 						window.opener.RM.suitedLine.processUnit.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.location.reload();
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.suitedLine.processUnit.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				RM.suitedLine.processUnit.suitedLineEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.suitedLine.processUnit.suitedLineEdit._refViewCode_IE = viewCode;
			} else {
				RM.suitedLine.processUnit.suitedLineEdit._refViewCode_IE = '';
			}
			RM.suitedLine.processUnit.suitedLineEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.suitedLine.processUnit.suitedLineEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.suitedLine.processUnit.suitedLineEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.suitedLine.processUnit.suitedLineEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.suitedLine.processUnit.suitedLineEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.suitedLine.processUnit.suitedLineEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				RM.suitedLine.processUnit.suitedLineEdit.gridEventObj = gridEventObj;
				callbackName = "RM.suitedLine.processUnit.suitedLineEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.suitedLine.processUnit.suitedLineEdit.getMultiselectCallBackInfo_DG" : "RM.suitedLine.processUnit.suitedLineEdit.getcallBackInfo_DG";
				RM.suitedLine.processUnit.suitedLineEdit._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.suitedLine.processUnit.suitedLineEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.suitedLine.processUnit.suitedLineEdit._prefix = _prefix.substring(1);
			}
			
			RM.suitedLine.processUnit.suitedLineEdit._oGrid = oGrid;
			RM.suitedLine.processUnit.suitedLineEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.suitedLine.processUnit.suitedLineEdit._refViewCode = oColumn.viewCode;
				} else {
					RM.suitedLine.processUnit.suitedLineEdit._refViewCode = '';
				}
			} else {
				RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp = false;
				RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames = '';
				RM.suitedLine.processUnit.suitedLineEdit._refViewCode = '';
			}
			if (RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp == true && RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.suitedLine.processUnit.suitedLineEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.suitedLine.processUnit.suitedLineEdit._customCallBack = customCallBack;
			}
			if(RM.suitedLine.processUnit.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.suitedLine.processUnit.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.suitedLine.processUnit.suitedLineEdit._querycustomFuncN == "function") {
				refparam += RM.suitedLine.processUnit.suitedLineEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.suitedLine.processUnit.suitedLineEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.suitedLine.processUnit.suitedLineEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.suitedLine.processUnit.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.suitedLine.processUnit.suitedLineEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.suitedLine.processUnit.suitedLineEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.suitedLine.processUnit.suitedLineEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.suitedLine.processUnit.suitedLineEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.suitedLine.processUnit.suitedLineEdit.query_"+obj+")!='undefined'") ? eval('RM.suitedLine.processUnit.suitedLineEdit.query_'+obj+'()') : null;
			return str;
		};
		RM.suitedLine.processUnit.suitedLineEdit.getcallBackGroupInfo = function(obj){
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
			RM.suitedLine.processUnit.suitedLineEdit._dialog.close();
		}
		RM.suitedLine.processUnit.suitedLineEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_suitedLine_processUnit_suitedLineEdit_form',obj[0], RM.suitedLine.processUnit.suitedLineEdit._prefix, RM.suitedLine.processUnit.suitedLineEdit._sUrl);
			CUI.commonFills('RM_suitedLine_processUnit_suitedLineEdit_form',RM.suitedLine.processUnit.suitedLineEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.suitedLine.processUnit.suitedLineEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.suitedLine.processUnit.suitedLineEdit._customCallBack) {
					eval(RM.suitedLine.processUnit.suitedLineEdit._customCallBack);
					RM.suitedLine.processUnit.suitedLineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.suitedLine.processUnit.suitedLineEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.suitedLine.processUnit.suitedLineEdit.getcallBackInfo_DG_IE = function(obj){
			if(RM.suitedLine.processUnit.suitedLineEdit._customBeforeCallBack) {
				var flag = eval(RM.suitedLine.processUnit.suitedLineEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.suitedLine.processUnit.suitedLineEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp_IE == true && RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.suitedLine.processUnit.suitedLineEdit._sUrl,RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.suitedLine.processUnit.suitedLineEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp_IE == true && RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.suitedLine.processUnit.suitedLineEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.suitedLine.processUnit.suitedLineEdit._refViewCode_IE + '&id=' + id,
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
				if(RM.suitedLine.processUnit.suitedLineEdit._customCallBack) {
					eval(RM.suitedLine.processUnit.suitedLineEdit._customCallBack);
					RM.suitedLine.processUnit.suitedLineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.suitedLine.processUnit.suitedLineEdit._dialog.close();
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
		
		RM.suitedLine.processUnit.suitedLineEdit.getcallBackInfo_DG = function(obj){
			if(RM.suitedLine.processUnit.suitedLineEdit._customBeforeCallBack) {
				var flag = eval(RM.suitedLine.processUnit.suitedLineEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.suitedLine.processUnit.suitedLineEdit._currRow).next().length==0){
						RM.suitedLine.processUnit.suitedLineEdit._oGrid.addNewRow();
					}	
					RM.suitedLine.processUnit.suitedLineEdit._currRow = $(RM.suitedLine.processUnit.suitedLineEdit._currRow).next();
					$(RM.suitedLine.processUnit.suitedLineEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.suitedLine.processUnit.suitedLineEdit._currRow,obj[i], RM.suitedLine.processUnit.suitedLineEdit._prefix, RM.suitedLine.processUnit.suitedLineEdit._sUrl);
				if (RM.suitedLine.processUnit.suitedLineEdit._isObjCustomProp == true && RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.suitedLine.processUnit.suitedLineEdit._currRow,RM.suitedLine.processUnit.suitedLineEdit._prefix,obj[i],RM.suitedLine.processUnit.suitedLineEdit._oGrid,RM.suitedLine.processUnit.suitedLineEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.suitedLine.processUnit.suitedLineEdit._currRow,RM.suitedLine.processUnit.suitedLineEdit._prefix,obj[i],RM.suitedLine.processUnit.suitedLineEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.suitedLine.processUnit.suitedLineEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.suitedLine.processUnit.suitedLineEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.suitedLine.processUnit.suitedLineEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.suitedLine.processUnit.suitedLineEdit._refViewCode + '&id=' + id,
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
									name = RM.suitedLine.processUnit.suitedLineEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.suitedLine.processUnit.suitedLineEdit._currRow, objs, RM.suitedLine.processUnit.suitedLineEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.suitedLine.processUnit.suitedLineEdit._customCallBack) {
					eval(RM.suitedLine.processUnit.suitedLineEdit._customCallBack);
					RM.suitedLine.processUnit.suitedLineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.suitedLine.processUnit.suitedLineEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.suitedLine.processUnit.suitedLineEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.suitedLine.processUnit.suitedLineEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.suitedLine.processUnit.suitedLineEdit._oGrid, RM.suitedLine.processUnit.suitedLineEdit._currRow, RM.suitedLine.processUnit.suitedLineEdit._key, RM.suitedLine.processUnit.suitedLineEdit._displayFieldName, obj[i])
			}
			try{
				if(RM.suitedLine.processUnit.suitedLineEdit._customCallBack) {
					eval(RM.suitedLine.processUnit.suitedLineEdit._customCallBack);
					RM.suitedLine.processUnit.suitedLineEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.suitedLine.processUnit.suitedLineEdit._dialog.close();
			} catch(e){}
		};
		
		RM.suitedLine.processUnit.suitedLineEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.suitedLine.processUnit.suitedLineEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_suitedLine_processUnit_suitedLineEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			RM.suitedLine.processUnit.suitedLineEdit.onloadForProduct();
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
		//是否启用EBR允许编辑
		$('select[name="lineFormula.ebr"]').unDisabledSelect();
}else{
//是否启用EBR不允许编辑
$('select[name="lineFormula.ebr"]').disabledSelect();
}
			
		});

		RM.suitedLine.processUnit.suitedLineEdit.beforeSubmitMethodSettingInPage = function(){
			RM.suitedLine.processUnit.suitedLineEdit.onsaveForProduct();
		};
		RM.suitedLine.processUnit.suitedLineEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.suitedLine.processUnit.suitedLineEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.suitedLine.processUnit.suitedLineEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_suitedLine_processUnit_suitedLineEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_suitedLine_processUnit_suitedLineEdit_main_div").hide();
				},100);
				//CUI("#RM_suitedLine_processUnit_suitedLineEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.suitedLine.processUnit.suitedLineEdit.showThis = function(){
			if(!CUI("#RM_suitedLine_processUnit_suitedLineEdit_main_div").is(':visible')) {
				CUI("#RM_suitedLine_processUnit_suitedLineEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.suitedLine.processUnit.suitedLineEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.suitedLine.processUnit.suitedLineEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_suitedLine_processUnit_suitedLineEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_suitedLine_ProcessUnit&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.suitedLine.processUnit.suitedLineEdit.auditDialog.show();
			</#if>
		}
		
		
		RM.suitedLine.processUnit.suitedLineEdit.showInfoDialog=function(mode){
			
			RM.suitedLine.processUnit.suitedLineEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_suitedLine_processUnit_suitedLineEdit_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.suitedLine.processUnit.suitedLineEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.suitedLine.processUnit.suitedLineEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_suitedLine");
			}
		}
		
		RM.suitedLine.processUnit.suitedLineEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/suitedLine/processUnit/dealInfo-list.action&dlTableInfoId=${(processUnit.tableInfoId)?default('')}");
			}
		}
		RM.suitedLine.processUnit.suitedLineEdit.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=RM_7.5.0.0_suitedLine_ProcessUnit&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(processUnit.tableInfoId)?default('')}");
			}
		}
		RM.suitedLine.processUnit.suitedLineEdit.supervision=function(){
			RM.suitedLine.processUnit.suitedLineEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(processUnit.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.suitedLine.processUnit.suitedLineEdit.modifyOwnerStaffDialog.show();
		}
		
function onchange(){
	var height=ProcessUnit_dg1487990913600Widget.getRowLength();
	if(height>0){
		workbenchErrorBarWidget.showMessage("表单存在数据，请删除后操作！");
		return false;
	}
}
function formulaCallBack(){
	
	//判断配方的EPR参数
	var supportEbr=$('input[name="lineFormula.formulaId.supportEbr"]').val();
	
	if(supportEbr){//启用EPR则开启EPR编辑
		$('input[name="lineFormula.ebr_check"]').attr("checked", true);
		$('input[name="lineFormula.ebr_check"]').attr("disabled","disabled");
	}else{
		$('input[name="lineFormula.ebr_check"]').attr("checked", false);
		$('input[name="lineFormula.ebr_check"]').attr("disabled",false);
	}
	
	//自动将该配方的所有工序填充到表体
	var formulaId=$('input[name="lineFormula.formulaId.id"]').val();
	ProcessUnit_dg1487990913600Widget._DT.delAllRows();
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
		
		ProcessUnit_dg1487990913600Widget._DT.addNewRow();
		var lastRow = ProcessUnit_dg1487990913600Widget._DT.getAllRows().length - 1;
		 
		ProcessUnit_dg1487990913600Widget.setCellValue(lastRow,'processId.id',processId);
		ProcessUnit_dg1487990913600Widget.setCellValue(lastRow,'processId.name',processName);

	}

}




		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_suitedLineEdit,js,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

		RM.suitedLine.processUnit.suitedLineEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_suitedLineEdit,onloadForProduct,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		RM.suitedLine.processUnit.suitedLineEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_suitedLine_suitedLineEdit,onsaveForProduct,RM_7.5.0.0_suitedLine_ProcessUnit,RM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="RM.suitedLine.processUnit.suitedLineEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.suitedLine.processUnit.suitedLineEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(processUnit.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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