<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = formulaChange.tableInfoId!>
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
        <#assign configTitle = getText('RM.viewtitle.randon1488874548562')>
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
		#RM_fomulaChange_formulaChange_useChangeEdit_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		</style>
		<script type="text/javascript">
			CUI.ns('RM.fomulaChange.formulaChange.useChangeEdit');
			RM.fomulaChange.formulaChange.useChangeEdit.currentUser = ${userJson};
			RM.fomulaChange.formulaChange.useChangeEdit.currentStaff = ${staffJson};
			RM.fomulaChange.formulaChange.useChangeEdit.currentDepartment = ${deptJson};
			RM.fomulaChange.formulaChange.useChangeEdit.currentPosition = ${postJson};
			RM.fomulaChange.formulaChange.useChangeEdit.currentCompany = ${compJson};
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
		<@s.form errorBarId="workbenchErrorBar" hiddenField="formulaChange.id,formulaChange.formulaId.id," onsubmitMethod="RM.fomulaChange.formulaChange.useChangeEdit.beforeSubmitMethod()" id="RM_fomulaChange_formulaChange_useChangeEdit_form" namespace="/RM/fomulaChange/formulaChange/useChangeEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_fomulaChange_FormulaChange&_bapFieldPermissonModelName_=FormulaChange&superEdit=${(superEdit!false)?string}" callback="RM.fomulaChange.formulaChange.useChangeEdit._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_fomulaChange_formulaChange_useChangeEdit_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl" id="top_buttonbar">
									<#if !((formulaChange.status)?? && formulaChange.status == 77)>
									<#if !(superEdit!false) && id??>
									</#if>
									
									<a class='cui-btn-new' id="edit-save-btn" onclick="RM.fomulaChange.formulaChange.useChangeEdit.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
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
												RM.fomulaChange.formulaChange.useChangeEdit.submit(true);
											});
										});
									</script>
											</#if>
											<#break>
										</#if>
									</#list>
									</#if>

									
									<#if !(superEdit!false)>
									<a class='cui-btn-new' id="edit-submit-btn" onclick="RM.fomulaChange.formulaChange.useChangeEdit.submit()"><span class="submit"></span>${getHtmlText("ec.flow.submit")}</a>
									<#if formulaChange??&&formulaChange.status??&&formulaChange.status!=0&&formulaChange.status!=99>
									<#if notifyEnabled?? && notifyEnabled>
									<!-- 系统启用通知功能时，才能崔办 -->
									<a class='cui-btn-new'  id="edit-remind-btn" onclick="ec.common.remind(${formulaChange.tableInfoId!},${formulaChange.id!})"><span class="edit-press"></span>${getHtmlText("ec.flow.remind")}</a>
									</#if>
				
									<#if recallAble && formulaChange??&&formulaChange.status??&&formulaChange.status!=77>
									<a class='cui-btn-new'  id="edit-recall-btn" onclick="RM.fomulaChange.formulaChange.useChangeEdit.recall()"><span class="edit-cancel"></span>${getHtmlText("ec.flow.recall")}</a>
								
									</#if>
									<#if hasSupervision>
									<a class='cui-btn-new' id="edit-supervision-btn" onclick="RM.fomulaChange.formulaChange.useChangeEdit.supervision()"><span class="edit-person"></span>${getHtmlText("ec.flow.supervision.modifyPending")}</a>

									</#if>
									</#if>
									<#if pendingId??>
									<a class='cui-btn-new' id="edit-proxyPending-btn" onclick="ec.common.proxyPending(${pendingId})"><span class="edit-entrust"></span>${getHtmlText("ec.pending.proxyPending")}</a>
									</#if>
									</#if>
									</#if>
									
									<a class='cui-btn-new' id="edit-close-btn" onclick="window.close()"><span class="close"></span>${getHtmlText("foundation.common.closeWindow")}</a>
			
								</div>
								
								<div class="fr">
									<ul>
										<#if !(superEdit!false)>
										<li id="fr_flow"><a title='${getText("ec.flow.flowImage")}' onclick="RM.fomulaChange.formulaChange.useChangeEdit.showInfoDialog('flow')"><span class='icon_prograss' ></span></a></li>
										</#if>
										<#if auditCheck('RM_7.5.0.0_fomulaChange_useChangeEdit') == '1'>
										<li id="fr_audit" ><a title='${getText("foundation.base.audit")}' onclick="RM.fomulaChange.formulaChange.useChangeEdit.showAudit()">
										<span class='icon_audit' ></span>
										</a></li>
										</#if>
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="RM.fomulaChange.formulaChange.useChangeEdit.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="RM_fomulaChange_formulaChange_useChangeEdit_form_attcount"></em></i></span>
										</a></li>
										<li id="fr_dealInfo"><a title='${getText("ec.view.dealadvice")}'  onclick="RM.fomulaChange.formulaChange.useChangeEdit.showInfoDialog('dealInfo')"><span class='icon_handle'></span></a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
								<span class="tableNo"><#if formulaChange.tableNo??> &nbsp;&nbsp;${formulaChange.tableNo}</#if></span>
								<span class="staff">${getText('ec.common.left.bracket')}${(creatorInfo.staff.name)!}
									<#if !editNew>
									<input type="hidden" name="formulaChange.createStaffId" value="${editNew?string((creatorInfo.staff.id)!'\'\'',(formulaChange.createStaffId)!'\'\'')}" />
									</#if>
									<#if !editNew>
									<input type="hidden" name="formulaChange.createTime" value="${(formulaChange.createTime?datetime)!}" />
									</#if>
									
									${editNew?string(datetime(),(formulaChange.createTime?datetime)!)} 
								</span>
								
								<span class="position">
									<input id="positionLayRec" type="hidden" name="formulaChange.positionLayRec" value="<#if editNew>${(creatorInfo.positions[0].layRec)!}<#else>${(formulaChange.positionLayRec)!}</#if>" />
										<#if editNew>
											<#if creatorInfo.positions?size == 1>
											${(creatorInfo.positions[0].name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="formulaChange.createPositionId" value="${creatorInfo.positions[0].id}" />
											<input type="hidden" name="formulaChange.createDepartmentId" value="${(creatorInfo.positions[0].department.id)!}" />
										
											<#else>
											<#list creatorInfo.positions as p>
												<#if !(p.isVirtual?? && p.isVirtual)>
													<#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>
												<input type="hidden" id="creatorDepartmentId" name="formulaChange.createDepartmentId" value="${p.department.id}" />
													</#if>
												</#if>
											</#list>
											<select id="creatorPosition" name="formulaChange.createPositionId" onchange="RM.fomulaChange.formulaChange.useChangeEdit.setDepartment()">
												<#list creatorInfo.positions as p>
													<#if !(p.isVirtual?? && p.isVirtual)>
													<option value="${p.id}" <#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>selected</#if> layRec="${(p.layRec)!}" departmentId="${p.department.id}" departmentName="${p.department.name}">${p.name}</option>
													</#if>
												</#list>
											</select>${getText('ec.common.right.bracket')}
											</#if>
										<#else>
											${(creatorInfo.position.name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="formulaChange.createPositionId" value="${(formulaChange.createPositionId)!}" />
										</#if>
								</span>
								
								
								<span class="status">
									${getText('ec.workflow.status')}${getText('ec.common.validate.colon')}
									<a href="#" onclick="javascript:void(0)">
										${getText((formulaChange.pending.taskDescription)!)}
									</a>
								</span>
							</div>
    					</div>
    					
    					<div class="edit-main" id="RM_fomulaChange_formulaChange_useChangeEdit">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="useChangeEdit">
								<input type="hidden" name="datagridKey" value="RM_fomulaChange_formulaChange_useChangeEdit_datagrids">
								<input type="hidden" name="viewCode" value="RM_7.5.0.0_fomulaChange_useChangeEdit">
								<input type="hidden" name="modelName" value="FormulaChange">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="formulaChange.version" value="${(formulaChange.version)!0}" />
								<input type="hidden" name="formulaChange.extraCol" value='' />
								<input type="hidden" name="operateType" id="operateType" />
								<input type="hidden" name="uploadDocIds" value="${uploadDocIds!''}">
										<#if deploymentId??>
											<input type="hidden" name="deploymentId" value="${(deploymentId)!}" />
											<input type="hidden" name="taskDescription" value="${(taskDescription)!}" />
											<input type="hidden" name="activityName" value="${(activityName)!}" />
										</#if>
										<#if webSignetFlag??>
											<input type="hidden" name="webSignetFlag" value="${(webSignetFlag!false)?string('true','false')}" />
										</#if>
										<#if pendingId??>
											<input type="hidden" name="pendingId" value="${(pendingId)!}" />
										</#if>
										<input type="hidden" name="formulaChange.id" value="${(formulaChange.id)!""}" originalvalue="${(formulaChange.id)!""}"/>
										<input type="hidden" name="formulaChange.formulaId.id" value="${(formulaChange.formulaId.id)!""}" originalvalue="${(formulaChange.formulaId.id)!""}"/>

		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "RM_fomulaChange_formulaChange_useChangeEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=RM_7.5.0.0_fomulaChange', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>								<div class="edit-panes edit-panes-w edit-container clearfix">

										<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:30%'></td><td style='height:0px;border:none;width:37%'></td><td style='height:0px;border:none;width:30%'></td></tr>
		<tr >
				
												<#if !RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_code_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_code_permit = checkFieldPermission('formulaChange.formulaId.code','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_formula_Formula_code')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_code_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_code_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1488246312092')}" >${getText('RM.propertydisplayName.randon1488246312092')}</label>
				</td>
				
						<#assign formulaChange_formulaId_code_defaultValue  = ''>
														<#assign formulaChange_formulaId_code_defaultValue  = ''>
					<#if !RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_code_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_code_permit = checkFieldPermission('formulaChange.formulaId.code','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_formula_Formula_code')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_code_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_code_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_code_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" mneenable=false reftitle="${getText('RM.viewtitle.randon1488246963795')}" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('formulaChange_formulaId_code')" view=true value="${(formulaChange.formulaId.code)!}" displayFieldName="code" name="formulaChange.formulaId.code" id="formulaChange_formulaId_code" type="other" url="/RM/formula/formula/formulaRef.action" clicked=true multiple=false mnewidth=260 formId="RM_fomulaChange_formulaChange_useChangeEdit_form" editCustomCallback=";" onkeyupfuncname=";_callback_formulaChange_formulaId_code(obj);" cssStyle="" isEdit=true  refViewCode="RM_7.5.0.0_formula_formulaRef"   isCrossCompany=false  />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" mneenable=false reftitle="${getText('RM.viewtitle.randon1488246963795')}" viewType="readonly" deValue="${formulaChange_formulaId_code_defaultValue!}" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('formulaChange_formulaId_code')" view=true  value="${(formulaChange.formulaId.code)!}" displayFieldName="code" name="formulaChange.formulaId.code" id="formulaChange_formulaId_code" type="other" url="/RM/formula/formula/formulaRef.action" clicked=true multiple=false mnewidth=260 formId="RM_fomulaChange_formulaChange_useChangeEdit_form" editCustomCallback=";" refViewCode="RM_7.5.0.0_formula_formulaRef"  onkeyupfuncname=";_callback_formulaChange_formulaId_code(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(formulaChange.id)?? && (formulaChange.formulaId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formulaChange.formulaId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_fomulaChange_formulaChange_useChangeEdit_form',obj, 'formulaChange.formulaId', '/RM/formula/formula/formulaRef.action');
												CUI.commonFills('RM_fomulaChange_formulaChange_useChangeEdit_form', 'formulaChange.formulaId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				</tr><tr >
												<#if !RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_name_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_name_permit = checkFieldPermission('formulaChange.formulaId.name','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_formula_Formula_name')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487075823790')}" >${getText('RM.propertydisplayName.randon1487075823790')}</label>
				</td>
				
						<#assign formulaChange_formulaId_name_defaultValue  = ''>
														<#assign formulaChange_formulaId_name_defaultValue  = ''>
					<#if !RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_name_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_name_permit = checkFieldPermission('formulaChange.formulaId.name','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_formula_Formula_name')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
							<#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formulaChange.formulaId.name" id="formulaChange_formulaId_name"  style=";" originalvalue="<#if !newObj || (formulaChange.formulaId.name)?has_content>${(formulaChange.formulaId.name?html)!}<#else>${formulaChange_formulaId_name_defaultValue!}</#if>" value="<#if !newObj || (formulaChange.formulaId.name)?has_content>${(formulaChange.formulaId.name?html)!}<#else>${formulaChange_formulaId_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr >
												<#if !RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit = checkFieldPermission('formulaChange.formulaId.usedFor','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_formula_Formula_usedFor')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076506980')}" >${getText('RM.propertydisplayName.randon1487076506980')}</label>
				</td>
				
						<#assign formulaChange_formulaId_usedFor_defaultValue  = ''>
														<#assign formulaChange_formulaId_usedFor_defaultValue  = ''>
					<#if !RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit = checkFieldPermission('formulaChange.formulaId.usedFor','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_formula_Formula_usedFor')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" style="text-align: left;;" >
							<#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="" viewType="${viewType!}" deValue="${formulaChange_formulaId_usedFor_defaultValue!}" formId="RM_fomulaChange_formulaChange_useChangeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaChange.formulaId.usedFor.id" code="usedFor" value="${(formulaChange.formulaId.usedFor.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaChange_formulaId_usedFor_defaultValue!}" formId="RM_fomulaChange_formulaChange_useChangeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaChange.formulaId.usedFor.id" code="usedFor" value="${(formulaChange.formulaId.usedFor.id)!}"  />
									</#if>
								<#else>
									<#if RM_7_5_0_0_fomulaChange_FormulaChange_formulaId_RM_7_5_0_0_formula_Formula_usedFor_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_fomulaChange_formulaChange_useChangeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaChange.formulaId.usedFor.id" code="usedFor" value="${(formulaChange.formulaId.usedFor.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_fomulaChange_formulaChange_useChangeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaChange.formulaId.usedFor.id" code="usedFor" value="${(formulaChange.formulaId.usedFor.id)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				</tr><tr >
							 					<#if !RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit = checkFieldPermission('formulaChange.usedFor','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_fomulaChange_FormulaChange_usedFor')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1488268147401')}" >${getText('RM.propertydisplayName.randon1488268147401')}</label>
				</td>
				
						<#assign formulaChange_usedFor_defaultValue  = ''>
							 							<#assign formulaChange_usedFor_defaultValue  = ''>
					<#if !RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit = checkFieldPermission('formulaChange.usedFor','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_fomulaChange_FormulaChange_usedFor')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="" viewType="${viewType!}" deValue="${formulaChange_usedFor_defaultValue!}" formId="RM_fomulaChange_formulaChange_useChangeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaChange.usedFor.id" code="usedFor" value="${(formulaChange.usedFor.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formulaChange_usedFor_defaultValue!}" formId="RM_fomulaChange_formulaChange_useChangeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaChange.usedFor.id" code="usedFor" value="${(formulaChange.usedFor.id)!}"  />
									</#if>
								<#else>
									<#if RM_7_5_0_0_fomulaChange_FormulaChange_usedFor_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_fomulaChange_formulaChange_useChangeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formulaChange.usedFor.id" code="usedFor" value="${(formulaChange.usedFor.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_fomulaChange_formulaChange_useChangeEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="formulaChange.usedFor.id" code="usedFor" value="${(formulaChange.usedFor.id)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				</tr><tr >
							 					<#if !RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit = checkFieldPermission('formulaChange.isForProduct','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_fomulaChange_FormulaChange_isForProduct')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1488268170121')}" >${getText('RM.propertydisplayName.randon1488268170121')}</label>
				</td>
				
						<#assign formulaChange_isForProduct_defaultValue  = ''>
							 							<#assign formulaChange_isForProduct_defaultValue  = ''>
					<#if !RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit??>
					<#assign RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit = checkFieldPermission('formulaChange.isForProduct','RM_7.5.0.0_fomulaChange_FormulaChange','RM_7.5.0.0_fomulaChange_FormulaChange_isForProduct')>
					</#if>
					<td <#if RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="2" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formulaChange.isForProduct_check" originalvalue="<#if !newObj || (formulaChange.isForProduct)?has_content>${(formulaChange.isForProduct!false)?string('true','false')}<#elseif formulaChange_isForProduct_defaultValue?has_content>${(formulaChange_isForProduct_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (formulaChange.isForProduct)?has_content>${(formulaChange.isForProduct!false)?string('true','false')}<#else>${(formulaChange_isForProduct_defaultValue!true)?string}</#if>"  <#if RM_7_5_0_0_fomulaChange_FormulaChange_isForProduct_permit == 1>disabled=true</#if>/>
								</#if>
								<input property_type="BOOLEAN" type="hidden" name="formulaChange.isForProduct" originalvalue="<#if ((formulaChange.isForProduct)?? &&  formulaChange.isForProduct)||(formulaChange_isForProduct_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formulaChange.isForProduct)?? &&  formulaChange.isForProduct)||(formulaChange_isForProduct_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formulaChange.isForProduct_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formulaChange.isForProduct"]');
												CUI('input[name="formulaChange.isForProduct_check"]').each(function(){
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
		</tr>
	</table>
</div>										</div>
										<div class="edit-datatable">	
										</div>
								</div>
    						</div>
    					</div>
    					<#if (pendingId?? || editNew) && !(superEdit!false)>
					
		<div class="edit-foot">
			<div class="edit-workflow">
				<table width="100%">
					<tr>
						<td height="40" class="edit_symbol">${getText('ec.view.dealeffort')}</td>
						<td id="workflow_outcomes">
							<input type="hidden" id="__workflow_outcomeDes" name="workFlowVar.outcomeDes" value="" />
							<input type="hidden" id="__workflow_outcomeMap" name="workFlowVar.outcomeMapJson" value="" />
							<input type="hidden" id="__workflow_assignUser_people" name="workFlowVar.additionalUsersStr" />
							
							<#assign assignUser=0 /><#assign existsZuofei = false />
							<#if transitions?has_content>
							<#list transitions as t>
								<#if t.cancel??&&t.cancel==1>
									<#assign existsZuofei = true />
								</#if>
							</#list>
							<#list transitions as t>
								<#if t.cancel??&&t.cancel==1>
									<#--作废按钮已经挪到view-edit.ftl中，这里什么也不做-->
								<#else>
								<div class="deal-result">
									<#if t.notificationType??&&t.notificationType==1>
										<input class="ec_check" style="vertical-align:middle;" <#if !(t.reject?? && t.reject gt 0) || !(graduallyReject?? && graduallyReject)><#if t.selectPeople??&&t.selectPeople gt 0> onclick="showAssign_nodification_${t.name}(this)" <#if t.requiredStaff??&&t.requiredStaff gt 0 > checkNull="true" </#if> </#if> </#if> type="checkbox" dec="${getText(t.description!t.name!)}" name="workFlowVar_nodification_outcome" id="__workflow_outcome_nodification_${t.name}" value="${t.name}" activityType="notification"/>
									<#else>
										<input class="ec_radio" rejectFlag="${t.reject}" style="vertical-align:middle;"  onclick="showAssign_${t.name}(this)" <#if t.requiredStaff??&&t.requiredStaff gt 0 >checkNull="true" </#if>  type="radio" dec="${getText(t.description!t.name!)}" name="workFlowVar.outcome" id="__workflow_outcome_${t.name}" value="${t.name}"<#if (!(pending??&&pending.loop?? && pending.loop gt 0)&&transitions?size == 1) || (existsZuofei?? && existsZuofei && transitions?size == 2) > checked="checked"</#if> />
										<#if t.reject??&&t.reject gt 0>
         									<input class="wfcancel"  type="hidden" name="workFlowVarStatus" />
        								</#if>
									</#if>
									<label for="__workflow_outcome_${t.name}" class="ec_radio">${getHtmlText(t.description!t.name!)}</label>
								</div>
								<#if !(t.reject?? && t.reject gt 0) || !(graduallyReject?? && graduallyReject)>
								<#if t.selectPeople??&&t.selectPeople gt 0>

										<#assign defaultSelectIds = ''>
										<#assign defaultSelectNames = ''>
										<#if t.defaultSelectStaff?? && t.defaultSelectStaff gt 0>
											<#assign defaultSelectIds = (lastAssignUserMap[t.name]['ids'])!>
											<#assign defaultSelectNames = (lastAssignUserMap[t.name]['names'])!>
										</#if>

										<div style="<#if !((transitions?size == 1) || (existsZuofei?? && existsZuofei && transitions?size == 2)) >display:none;</#if>float:left;width:20%;padding-right:5px;min-width:200px;" <#if t.notificationType??&&t.notificationType==1>id="nodification_assignStaff_${t.name}"<#else>id="assignStaff_${t.name}"</#if> >
										<#if t.selectPeople==1>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==2>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==3>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==4>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==5>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										</#if>
										<#if defaultSelectIds?has_content>
											<script type="text/javascript">
												$(function(){
													$('#assignStaffSelect_${t.name}AddIds').val('${defaultSelectIds}');
													setTimeout(function(){
														assignStaffSelect_${t.name}CalWidth();
													}, 500);
												});
											</script>
										</#if>
										<#--
										<#if t.selectPeople==1>
										<#if t.userRangeFalg?? && t.userRangeFalg==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#elseif t.selectPeople==2>
										<#if t.userRangeFalg?? && t.userRangeFalg==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										-->
										</div>
									</#if>
								</#if>
								</#if>
							</#list>
							<#if pending?? && pending.loop??&& pending.loop gt 0>
								<div class="deal-result">
									<input class="ec_check" style="vertical-align:middle;"  onclick="showAssign_countersign(this)"  type="checkbox" dec="${getText('ec.edit.countersignSelect')}" name="workFlowVar_countersign_outcome" id="__workflow_outcome_countersign" value=""/>
									<label for="__workflow_outcome_countersign" class="ec_radio">${getHtmlText('ec.edit.countersignSelect')}</label>
								</div>
								<div style="float:left;width:27%;padding-right:5px;display:none;" id="countersign_assignStaff" >
									<input type="hidden" id="__workflow_countersign_people" name="workFlowVar.countersignUsers" />
									<input type="hidden" id="__workflow_countersign_main_people" name="workFlowVar.mainCountersigner" />
									<#if pending.loop==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==2>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==3>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==4>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==5>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" outcome="${pending.activityName}" selectPeople="${pending.loop}"/>
									</#if>
								</div>
								<#if pending?? && pending.mainLoop!false>
									<div class="deal-result"  id="endCountersignDiv" style="display:none;">
										<input class="ec_check" style="vertical-align:middle;"  type="checkbox" value="true" name="workFlowVar.endCountersignFlag" id="endCountersign"  />
										<label for="endCountersign_label" class="ec_radio">${getHtmlText('ec.workflow.consign.close')}</label>
									</div>
								</#if>
							</#if>
							<#elseif (pending?? && pending.activityType == 'notification')||(activityType??&&activityType=='notification')>
							<div class="deal-result">
							<input class="ec_radio" style="vertical-align:middle;" type="radio" des="${getText('calendar.common.check')}" name="workFlowVar.outcome" id="__workflow_outcome_ok" value="${getText('calendar.common.check')}" checked="checked" />
							<label for="__workflow_outcome_ok" class="ec_radio">${getHtmlText('calendar.common.check')}</label>
							</div>
							</#if>
							<a class="cui-btn-blue" onclick="RM.fomulaChange.formulaChange.useChangeEdit.save()"><span class='btn_r'>${getText('ec.flow.save')}</span></a>
							<a class="cui-btn-green" onclick="RM.fomulaChange.formulaChange.useChangeEdit.submit()"><span class='btn_r'>${getText('ec.flow.submit')}</span></a>
						
						</td>
						<td align="right" width="20">
						<#if !(dealSet??&&dealSet==2)>	
							<span id="workflow_toggle" class="workflow-toggle-b"></span>
						</#if>	
						</td>
					</tr>
					<#if !(dealSet??&&dealSet==2)>	
					<tr>
						<td valign="top" class="edit_symbol">${getText('ec.view.advice.write')}</td>
						<td colspan="2">
							<textarea id="workflow_comments" name="workFlowVar.comment">${(workFlowVar.comment)!}</textarea>
						</td>
						<td></td>
					</tr>
					</#if>	
					
				</table>
			</div>
		</div>
	<script type="text/javascript">	
		showAssign_countersign=function(obj){
			if($(obj).prop("checked")==true){
				$("#countersign_assignStaff").show();
			}else{
				$("#countersign_assignStaff").hide();
			}
		}
		<#if (pendingId?? || editNew) && transitions??>
		<#list transitions as t>
			<#if t.notificationType==1>
				
				showAssign_nodification_${t.name}=function(obj){
					
					if($(obj).prop("checked")==true){
						$("#nodification_assignStaff_${t.name}").show();
					}else{
						$("#nodification_assignStaff_${t.name}").hide();
					}
				}
			<#else>
				showAssign_${t.name}=function(obj){
					var radioObj = $(obj);
					var rejectFlag = radioObj.attr('rejectFlag');
					if(rejectFlag && rejectFlag == '1') {
						$('input[name="workFlowVarStatus"]').val('reject');
					} else {
						$('input[name="workFlowVarStatus"]').val('');
					}
					$("div[id^='assignStaff_']").each(function(){
						$(this).hide();
					});
					if($(obj).prop("checked")==true){
						$("#assignStaff_${t.name}").show();
						// 重新计算是否需要显示更多"..."
						try{
							assignStaffSelect_${t.name}CalWidth();
						}catch(e){}
					}
					$("#endCountersignDiv").show();
				}
			
			</#if>
		</#list>
		</#if>
		</script>    					</#if>
    				
    				
		</div>
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="RM_fomulaChange_formulaChange_useChangeEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="RM.fomulaChange.formulaChange.useChangeEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.fomulaChange.formulaChange.useChangeEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="RM.fomulaChange.formulaChange.useChangeEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_fomulaChange_useChangeEdit,html,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) -->
<!-- 自定义代码 -->
        <style type="text/css">
		#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-head {display:none;}
		#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-workflow {display:none;}
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
						$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.fomulaChange.formulaChange.useChangeEdit.initCount = 0;
			RM.fomulaChange.formulaChange.useChangeEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-head").height()-$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-workflow").height()</#if>;
				$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_fomulaChange_formulaChange_useChangeEdit_datagrids');
				var padding_bottom=16;
				$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div .pd_bottom,#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-panes-s").each(function(index){
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
									if(RM.fomulaChange.formulaChange.useChangeEdit.initCount <= 2) {
										setTimeout(function(){RM.fomulaChange.formulaChange.useChangeEdit.initSize();}, 200);
										RM.fomulaChange.formulaChange.useChangeEdit.initCount++;
									}/* else {
										RM.fomulaChange.formulaChange.useChangeEdit.initCount = 0;
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
							if(($("#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-workflow").length > 0) && ($("#RM_fomulaChange_formulaChange_useChangeEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				RM.fomulaChange.formulaChange.useChangeEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.fomulaChange.formulaChange.useChangeEdit.initSize();
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
						if(parseInt($("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").css("width"),10)==650){
							$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.fomulaChange.formulaChange.useChangeEdit.resizeLayout();
						//RM.fomulaChange.formulaChange.useChangeEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").css("width"),10)==800){
							$("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.fomulaChange.formulaChange.useChangeEdit.resizeLayout();
						//RM.fomulaChange.formulaChange.useChangeEdit.initSize();
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
					RM.fomulaChange.formulaChange.useChangeEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.fomulaChange.formulaChange.useChangeEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.fomulaChange.formulaChange.useChangeEdit.initSize();});
				/*
				RM.fomulaChange.formulaChange.useChangeEdit.resizeLayout=function(){
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
			RM.fomulaChange.formulaChange.useChangeEdit.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${formulaChange.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/RM/fomulaChange/formulaChange/dealInfo-list.action&enableSimpleDealInfo=false");
			</#if>
		});

		RM.fomulaChange.formulaChange.useChangeEdit.validate = function(){
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
		RM.fomulaChange.formulaChange.useChangeEdit.beforeSaveProcess = function(){

			var extraCol = '<extra-data>';
			$('#RM_fomulaChange_formulaChange_useChangeEdit_form').trigger('beforeSubmit');
			//formulaChange.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="formulaChange.extraCol"]').val(extraCol);
		}
		RM.fomulaChange.formulaChange.useChangeEdit.processDataGrid = function(){
		};
		RM.fomulaChange.formulaChange.useChangeEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.fomulaChange.formulaChange.useChangeEdit.validate()){return;}
			RM.fomulaChange.formulaChange.useChangeEdit.beforeSaveProcess();

			//RM.fomulaChange.formulaChange.useChangeEdit.processDataGrid();
			$('#RM_fomulaChange_formulaChange_useChangeEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_fomulaChange_formulaChange_useChangeEdit_form','RM_fomulaChange_formulaChange_useChangeEdit_datagrids')) {      
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
		RM.fomulaChange.formulaChange.useChangeEdit.print = function(){
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
		
		RM.fomulaChange.formulaChange.useChangeEdit.saveSetting = function(){
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
		
		RM.fomulaChange.formulaChange.useChangeEdit.printSetting = function(){
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
				RM.fomulaChange.formulaChange.useChangeEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.fomulaChange.formulaChange.useChangeEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.fomulaChange.formulaChange.useChangeEdit.settingDialog.show();
			}
		}
		
		
		RM.fomulaChange.formulaChange.useChangeEdit.submit = function(uncheck){
			$('#operateType').val("submit");
			if(uncheck){}
			else
			if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').val())){
				workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
				return;
			}
			if(!RM.fomulaChange.formulaChange.useChangeEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			RM.fomulaChange.formulaChange.useChangeEdit.beforeSaveProcess();
			
			//RM.fomulaChange.formulaChange.useChangeEdit.processDataGrid();
			
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
			$('#RM_fomulaChange_formulaChange_useChangeEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		RM.fomulaChange.formulaChange.useChangeEdit.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/RM/fomulaChange/formulaChange/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(formulaChange.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(formulaChange.tableInfoId)?default('')}&id=${(formulaChange.id)?default('')}&entityCode=RM_7.5.0.0_fomulaChange";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.RM.fomulaChange.formulaChange.editCallBackInfo(res); 						
								}catch(e2){
									try{
										window.opener.location.reload();
									}catch(e3){}
								}
							};

		 					setTimeout(function(){
								document.location.href=url;
		 					}, 1000);
						}
					}
				});
			});
		}
		RM.fomulaChange.formulaChange.useChangeEdit._callBackInfo = function(res){
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
 						window.opener.RM.fomulaChange.formulaChange.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.location.reload();
						}catch(e3){}
					}
				};
				<#if !(superEdit!false)>
 				if(res.operateType == 'save'){
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=RM_7.5.0.0_fomulaChange";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.fomulaChange.formulaChange.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		<#if editNew>
		RM.fomulaChange.formulaChange.useChangeEdit.setDepartment = function(){
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
				RM.fomulaChange.formulaChange.useChangeEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.fomulaChange.formulaChange.useChangeEdit._refViewCode_IE = viewCode;
			} else {
				RM.fomulaChange.formulaChange.useChangeEdit._refViewCode_IE = '';
			}
			RM.fomulaChange.formulaChange.useChangeEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.fomulaChange.formulaChange.useChangeEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.fomulaChange.formulaChange.useChangeEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.fomulaChange.formulaChange.useChangeEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.fomulaChange.formulaChange.useChangeEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.fomulaChange.formulaChange.useChangeEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				RM.fomulaChange.formulaChange.useChangeEdit.gridEventObj = gridEventObj;
				callbackName = "RM.fomulaChange.formulaChange.useChangeEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.fomulaChange.formulaChange.useChangeEdit.getMultiselectCallBackInfo_DG" : "RM.fomulaChange.formulaChange.useChangeEdit.getcallBackInfo_DG";
				RM.fomulaChange.formulaChange.useChangeEdit._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.fomulaChange.formulaChange.useChangeEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.fomulaChange.formulaChange.useChangeEdit._prefix = _prefix.substring(1);
			}
			
			RM.fomulaChange.formulaChange.useChangeEdit._oGrid = oGrid;
			RM.fomulaChange.formulaChange.useChangeEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.fomulaChange.formulaChange.useChangeEdit._refViewCode = oColumn.viewCode;
				} else {
					RM.fomulaChange.formulaChange.useChangeEdit._refViewCode = '';
				}
			} else {
				RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp = false;
				RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames = '';
				RM.fomulaChange.formulaChange.useChangeEdit._refViewCode = '';
			}
			if (RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp == true && RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.fomulaChange.formulaChange.useChangeEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.fomulaChange.formulaChange.useChangeEdit._customCallBack = customCallBack;
			}
			if(RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.fomulaChange.formulaChange.useChangeEdit._querycustomFuncN == "function") {
				refparam += RM.fomulaChange.formulaChange.useChangeEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.fomulaChange.formulaChange.useChangeEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.fomulaChange.formulaChange.useChangeEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.fomulaChange.formulaChange.useChangeEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.fomulaChange.formulaChange.useChangeEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.fomulaChange.formulaChange.useChangeEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.fomulaChange.formulaChange.useChangeEdit.query_"+obj+")!='undefined'") ? eval('RM.fomulaChange.formulaChange.useChangeEdit.query_'+obj+'()') : null;
			return str;
		};
		RM.fomulaChange.formulaChange.useChangeEdit.getcallBackGroupInfo = function(obj){
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
			RM.fomulaChange.formulaChange.useChangeEdit._dialog.close();
		}
		RM.fomulaChange.formulaChange.useChangeEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_fomulaChange_formulaChange_useChangeEdit_form',obj[0], RM.fomulaChange.formulaChange.useChangeEdit._prefix, RM.fomulaChange.formulaChange.useChangeEdit._sUrl);
			CUI.commonFills('RM_fomulaChange_formulaChange_useChangeEdit_form',RM.fomulaChange.formulaChange.useChangeEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.fomulaChange.formulaChange.useChangeEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.fomulaChange.formulaChange.useChangeEdit._customCallBack) {
					eval(RM.fomulaChange.formulaChange.useChangeEdit._customCallBack);
					RM.fomulaChange.formulaChange.useChangeEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.fomulaChange.formulaChange.useChangeEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.fomulaChange.formulaChange.useChangeEdit.getcallBackInfo_DG_IE = function(obj){
			if(RM.fomulaChange.formulaChange.useChangeEdit._customBeforeCallBack) {
				var flag = eval(RM.fomulaChange.formulaChange.useChangeEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.fomulaChange.formulaChange.useChangeEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp_IE == true && RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.fomulaChange.formulaChange.useChangeEdit._sUrl,RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.fomulaChange.formulaChange.useChangeEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp_IE == true && RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.fomulaChange.formulaChange.useChangeEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.fomulaChange.formulaChange.useChangeEdit._refViewCode_IE + '&id=' + id,
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
				if(RM.fomulaChange.formulaChange.useChangeEdit._customCallBack) {
					eval(RM.fomulaChange.formulaChange.useChangeEdit._customCallBack);
					RM.fomulaChange.formulaChange.useChangeEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.fomulaChange.formulaChange.useChangeEdit._dialog.close();
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
		
		RM.fomulaChange.formulaChange.useChangeEdit.getcallBackInfo_DG = function(obj){
			if(RM.fomulaChange.formulaChange.useChangeEdit._customBeforeCallBack) {
				var flag = eval(RM.fomulaChange.formulaChange.useChangeEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.fomulaChange.formulaChange.useChangeEdit._currRow).next().length==0){
						RM.fomulaChange.formulaChange.useChangeEdit._oGrid.addNewRow();
					}	
					RM.fomulaChange.formulaChange.useChangeEdit._currRow = $(RM.fomulaChange.formulaChange.useChangeEdit._currRow).next();
					$(RM.fomulaChange.formulaChange.useChangeEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.fomulaChange.formulaChange.useChangeEdit._currRow,obj[i], RM.fomulaChange.formulaChange.useChangeEdit._prefix, RM.fomulaChange.formulaChange.useChangeEdit._sUrl);
				if (RM.fomulaChange.formulaChange.useChangeEdit._isObjCustomProp == true && RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.fomulaChange.formulaChange.useChangeEdit._currRow,RM.fomulaChange.formulaChange.useChangeEdit._prefix,obj[i],RM.fomulaChange.formulaChange.useChangeEdit._oGrid,RM.fomulaChange.formulaChange.useChangeEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.fomulaChange.formulaChange.useChangeEdit._currRow,RM.fomulaChange.formulaChange.useChangeEdit._prefix,obj[i],RM.fomulaChange.formulaChange.useChangeEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.fomulaChange.formulaChange.useChangeEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.fomulaChange.formulaChange.useChangeEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.fomulaChange.formulaChange.useChangeEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.fomulaChange.formulaChange.useChangeEdit._refViewCode + '&id=' + id,
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
									name = RM.fomulaChange.formulaChange.useChangeEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.fomulaChange.formulaChange.useChangeEdit._currRow, objs, RM.fomulaChange.formulaChange.useChangeEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.fomulaChange.formulaChange.useChangeEdit._customCallBack) {
					eval(RM.fomulaChange.formulaChange.useChangeEdit._customCallBack);
					RM.fomulaChange.formulaChange.useChangeEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.fomulaChange.formulaChange.useChangeEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.fomulaChange.formulaChange.useChangeEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.fomulaChange.formulaChange.useChangeEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.fomulaChange.formulaChange.useChangeEdit._oGrid, RM.fomulaChange.formulaChange.useChangeEdit._currRow, RM.fomulaChange.formulaChange.useChangeEdit._key, RM.fomulaChange.formulaChange.useChangeEdit._displayFieldName, obj[i])
			}
			try{
				if(RM.fomulaChange.formulaChange.useChangeEdit._customCallBack) {
					eval(RM.fomulaChange.formulaChange.useChangeEdit._customCallBack);
					RM.fomulaChange.formulaChange.useChangeEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.fomulaChange.formulaChange.useChangeEdit._dialog.close();
			} catch(e){}
		};
		
		RM.fomulaChange.formulaChange.useChangeEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.fomulaChange.formulaChange.useChangeEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_fomulaChange_formulaChange_useChangeEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			RM.fomulaChange.formulaChange.useChangeEdit.onloadForProduct();
			var fId=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].id;
var fCode=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].code;
var fName=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].name;
var usedForId=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].usedFor.id;
var usedForValue=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].usedFor.value;
var isForPro=ec_RM_formula_formula_formulaList_queryWidget.getSelectedRow()[0].isForProduct;
$("input[name='formulaChange.formulaId.code']").val(fCode);
$("input[name='formulaChange.formulaId.name']").val(fName);
$("input[name='formulaChange.formulaId.usedFor.value']").val(usedForValue);
$("input[name='formulaChange.formulaId.id']").val(fId);
$("input[name='formulaChange.isForProduct_check']").prop("checked",isForPro);
			
		});

		RM.fomulaChange.formulaChange.useChangeEdit.beforeSubmitMethodSettingInPage = function(){
			RM.fomulaChange.formulaChange.useChangeEdit.onsaveForProduct();
		};
		RM.fomulaChange.formulaChange.useChangeEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.fomulaChange.formulaChange.useChangeEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.fomulaChange.formulaChange.useChangeEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").hide();
				},100);
				//CUI("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.fomulaChange.formulaChange.useChangeEdit.showThis = function(){
			if(!CUI("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").is(':visible')) {
				CUI("#RM_fomulaChange_formulaChange_useChangeEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.fomulaChange.formulaChange.useChangeEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.fomulaChange.formulaChange.useChangeEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_fomulaChange_formulaChange_useChangeEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_fomulaChange_FormulaChange&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.fomulaChange.formulaChange.useChangeEdit.auditDialog.show();
			</#if>
		}
		
		
		RM.fomulaChange.formulaChange.useChangeEdit.showInfoDialog=function(mode){
			
			RM.fomulaChange.formulaChange.useChangeEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_fomulaChange_formulaChange_useChangeEdit_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.fomulaChange.formulaChange.useChangeEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.fomulaChange.formulaChange.useChangeEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_fomulaChange");
			}
		}
		
		RM.fomulaChange.formulaChange.useChangeEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/fomulaChange/formulaChange/dealInfo-list.action&dlTableInfoId=${(formulaChange.tableInfoId)?default('')}");
			}
		}
		RM.fomulaChange.formulaChange.useChangeEdit.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=RM_7.5.0.0_fomulaChange_FormulaChange&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(formulaChange.tableInfoId)?default('')}");
			}
		}
		RM.fomulaChange.formulaChange.useChangeEdit.supervision=function(){
			RM.fomulaChange.formulaChange.useChangeEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(formulaChange.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.fomulaChange.formulaChange.useChangeEdit.modifyOwnerStaffDialog.show();
		}
		


		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_fomulaChange_useChangeEdit,js,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */

		RM.fomulaChange.formulaChange.useChangeEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_fomulaChange_useChangeEdit,onloadForProduct,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
		}

		RM.fomulaChange.formulaChange.useChangeEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_fomulaChange_useChangeEdit,onsaveForProduct,RM_7.5.0.0_fomulaChange_FormulaChange,RM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="RM.fomulaChange.formulaChange.useChangeEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.fomulaChange.formulaChange.useChangeEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(formulaChange.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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