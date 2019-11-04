<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = formulaProcess.tableInfoId!>
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
        <#assign configTitle = getText('RM.viewtitle.randon1487554825350')>
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
		#RM_formula_formulaProcess_processActiveEdit_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		</style>
		<script type="text/javascript">
			CUI.ns('RM.formula.formulaProcess.processActiveEdit');
			RM.formula.formulaProcess.processActiveEdit.currentUser = ${userJson};
			RM.formula.formulaProcess.processActiveEdit.currentStaff = ${staffJson};
			RM.formula.formulaProcess.processActiveEdit.currentDepartment = ${deptJson};
			RM.formula.formulaProcess.processActiveEdit.currentPosition = ${postJson};
			RM.formula.formulaProcess.processActiveEdit.currentCompany = ${compJson};
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
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="RM.formula.formulaProcess.processActiveEdit.beforeSubmitMethod()" id="RM_formula_formulaProcess_processActiveEdit_form" namespace="/RM/formula/formulaProcess/processActiveEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_formula_FormulaProcess&_bapFieldPermissonModelName_=FormulaProcess" callback="RM.formula.formulaProcess.processActiveEdit._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_formula_formulaProcess_processActiveEdit_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl" id="top_buttonbar">
									<#if !((formulaProcess.status)?? && formulaProcess.status == 77)>
									<#if !(superEdit!false) && id??>
									</#if>
									
									<a class='cui-btn-new' id="edit-save-btn" onclick="RM.formula.formulaProcess.processActiveEdit.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
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
												RM.formula.formulaProcess.processActiveEdit.submit(true);
											});
										});
									</script>
											</#if>
											<#break>
										</#if>
									</#list>
									</#if>

									
									<#if !(superEdit!false)>
									<a class='cui-btn-new' id="edit-submit-btn" onclick="RM.formula.formulaProcess.processActiveEdit.submit()"><span class="submit"></span>${getHtmlText("ec.flow.submit")}</a>
									<#if formulaProcess??&&formulaProcess.status??&&formulaProcess.status!=0&&formulaProcess.status!=99>
									<#if notifyEnabled?? && notifyEnabled>
									<!-- 系统启用通知功能时，才能崔办 -->
									<a class='cui-btn-new'  id="edit-remind-btn" onclick="ec.common.remind(${formulaProcess.tableInfoId!},${formulaProcess.id!})"><span class="edit-press"></span>${getHtmlText("ec.flow.remind")}</a>
									</#if>
				
									<#if recallAble && formulaProcess??&&formulaProcess.status??&&formulaProcess.status!=77>
									<a class='cui-btn-new'  id="edit-recall-btn" onclick="RM.formula.formulaProcess.processActiveEdit.recall()"><span class="edit-cancel"></span>${getHtmlText("ec.flow.recall")}</a>
								
									</#if>
									<#if hasSupervision>
									<a class='cui-btn-new' id="edit-supervision-btn" onclick="RM.formula.formulaProcess.processActiveEdit.supervision()"><span class="edit-person"></span>${getHtmlText("ec.flow.supervision.modifyPending")}</a>

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
										<li id="fr_flow"><a title='${getText("ec.flow.flowImage")}' onclick="RM.formula.formulaProcess.processActiveEdit.showInfoDialog('flow')"><span class='icon_prograss' ></span></a></li>
										</#if>
										<#if auditCheck('RM_7.5.0.0_formula_processActiveEdit') == '1'>
										<li id="fr_audit" ><a title='${getText("foundation.base.audit")}' onclick="RM.formula.formulaProcess.processActiveEdit.showAudit()">
										<span class='icon_audit' ></span>
										</a></li>
										</#if>
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="RM.formula.formulaProcess.processActiveEdit.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="RM_formula_formulaProcess_processActiveEdit_form_attcount"></em></i></span>
										</a></li>
										<li id="fr_dealInfo"><a title='${getText("ec.view.dealadvice")}'  onclick="RM.formula.formulaProcess.processActiveEdit.showInfoDialog('dealInfo')"><span class='icon_handle'></span></a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
								<span class="tableNo"><#if formulaProcess.tableNo??> &nbsp;&nbsp;${formulaProcess.tableNo}</#if></span>
								<span class="staff">${getText('ec.common.left.bracket')}${(creatorInfo.staff.name)!}
									<#if !editNew>
									<input type="hidden" name="formulaProcess.createStaffId" value="${editNew?string((creatorInfo.staff.id)!'\'\'',(formulaProcess.createStaffId)!'\'\'')}" />
									</#if>
									<#if !editNew>
									<input type="hidden" name="formulaProcess.createTime" value="${(formulaProcess.createTime?datetime)!}" />
									</#if>
									
									${editNew?string(datetime(),(formulaProcess.createTime?datetime)!)} 
								</span>
								
								<span class="position">
									<input id="positionLayRec" type="hidden" name="formulaProcess.positionLayRec" value="<#if editNew>${(creatorInfo.positions[0].layRec)!}<#else>${(formulaProcess.positionLayRec)!}</#if>" />
										<#if editNew>
											<#if creatorInfo.positions?size == 1>
											${(creatorInfo.positions[0].name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="formulaProcess.createPositionId" value="${creatorInfo.positions[0].id}" />
											<input type="hidden" name="formulaProcess.createDepartmentId" value="${(creatorInfo.positions[0].department.id)!}" />
										
											<#else>
											<#list creatorInfo.positions as p>
												<#if !(p.isVirtual?? && p.isVirtual)>
													<#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>
												<input type="hidden" id="creatorDepartmentId" name="formulaProcess.createDepartmentId" value="${p.department.id}" />
													</#if>
												</#if>
											</#list>
											<select id="creatorPosition" name="formulaProcess.createPositionId" onchange="RM.formula.formulaProcess.processActiveEdit.setDepartment()">
												<#list creatorInfo.positions as p>
													<#if !(p.isVirtual?? && p.isVirtual)>
													<option value="${p.id}" <#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>selected</#if> layRec="${(p.layRec)!}" departmentId="${p.department.id}" departmentName="${p.department.name}">${p.name}</option>
													</#if>
												</#list>
											</select>${getText('ec.common.right.bracket')}
											</#if>
										<#else>
											${(creatorInfo.position.name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="formulaProcess.createPositionId" value="${(formulaProcess.createPositionId)!}" />
										</#if>
								</span>
								
								
								<span class="status">
									${getText('ec.workflow.status')}${getText('ec.common.validate.colon')}
									<a href="#" onclick="javascript:void(0)">
										${getText((formulaProcess.pending.taskDescription)!)}
									</a>
								</span>
							</div>
    					</div>
    					
    					<div class="edit-main" id="RM_formula_formulaProcess_processActiveEdit">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="processActiveEdit">
								<input type="hidden" name="datagridKey" value="RM_formula_formulaProcess_processActiveEdit_datagrids">
								<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_processActiveEdit">
								<input type="hidden" name="modelName" value="FormulaProcess">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="formulaProcess.version" value="${(formulaProcess.version)!0}" />
								<input type="hidden" name="formulaProcess.extraCol" value='' />
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

		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "RM_formula_formulaProcess_processActiveEdit_form"+"_attcount";
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
</script>								<div class="edit-panes edit-panes-w edit-container clearfix">

										<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<#if !RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit = checkFieldPermission('formulaProcess.formulaHideId','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_formulaHideId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487297610678')}" >${getText('RM.propertydisplayName.randon1487297610678')}</label>
				</td>
				
						<#assign formulaProcess_formulaHideId_defaultValue  = ''>
							 							<#assign formulaProcess_formulaHideId_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit = checkFieldPermission('formulaProcess.formulaHideId','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_formulaHideId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
							<#if RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit == 1>-readonly</#if>">
								<input property_type="LONG" name="formulaProcess.formulaHideId" id="formulaProcess_formulaHideId"  style=";" originalvalue="<#if !newObj || (formulaProcess.formulaHideId)?has_content>${(formulaProcess.formulaHideId?html)!}<#else>${formulaProcess_formulaHideId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formulaHideId)?has_content>${(formulaProcess.formulaHideId?html)!}<#else>${formulaProcess_formulaHideId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaProcess_formulaHideId_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaProcess_processTableId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_processTableId_permit = checkFieldPermission('formulaProcess.processTableId','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_processTableId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcess_processTableId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcess_processTableId_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487297416937')}" >${getText('RM.propertydisplayName.randon1487297416937')}</label>
				</td>
				
						<#assign formulaProcess_processTableId_defaultValue  = ''>
							 							<#assign formulaProcess_processTableId_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcess_processTableId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_processTableId_permit = checkFieldPermission('formulaProcess.processTableId','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_processTableId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcess_processTableId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
							<#if RM_7_5_0_0_formula_FormulaProcess_processTableId_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcess_processTableId_permit == 1>-readonly</#if>">
								<input property_type="LONG" name="formulaProcess.processTableId" id="formulaProcess_processTableId"  style=";" originalvalue="<#if !newObj || (formulaProcess.processTableId)?has_content>${(formulaProcess.processTableId?html)!}<#else>${formulaProcess_processTableId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.processTableId)?has_content>${(formulaProcess.processTableId?html)!}<#else>${formulaProcess_processTableId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaProcess_processTableId_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_FormulaProcess_formId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_formId_permit = checkFieldPermission('formulaProcess.formId','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_formId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcess_formId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;display:none;;" >
							<label style="<#if RM_7_5_0_0_formula_FormulaProcess_formId_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487573457977')}" >${getText('RM.propertydisplayName.randon1487573457977')}</label>
				</td>
				
						<#assign formulaProcess_formId_defaultValue  = ''>
							 							<#assign formulaProcess_formId_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_FormulaProcess_formId_permit??>
					<#assign RM_7_5_0_0_formula_FormulaProcess_formId_permit = checkFieldPermission('formulaProcess.formId','RM_7.5.0.0_formula_FormulaProcess','RM_7.5.0.0_formula_FormulaProcess_formId')>
					</#if>
					<td <#if RM_7_5_0_0_formula_FormulaProcess_formId_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;display:none;;" >
							<#if RM_7_5_0_0_formula_FormulaProcess_formId_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if RM_7_5_0_0_formula_FormulaProcess_formId_permit == 1>-readonly</#if>">
								<input property_type="LONG" name="formulaProcess.formId" id="formulaProcess_formId"  style=";" originalvalue="<#if !newObj || (formulaProcess.formId)?has_content>${(formulaProcess.formId?html)!}<#else>${formulaProcess_formId_defaultValue!}</#if>" value="<#if !newObj || (formulaProcess.formId)?has_content>${(formulaProcess.formId?html)!}<#else>${formulaProcess_formId_defaultValue!}</#if>" type="text" class="cui-noborder-input numberField"<#if RM_7_5_0_0_formula_FormulaProcess_formId_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
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
								function FormulaProcessActive_dg1487554913298_fomulaActive(event)
																{
 var SelectedRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
     var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeType.id');
     var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');
			if(SelectedRow!=undefined){
					var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeType.id');
          var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');
        if(activeType!='activeType/activeType4' && activeType!='activeType/activeType2'){
        		workbenchErrorBarWidget.showMessage('只有类型为配料、投配料类型的活动才可以进行投配料活动设置','f');
	  															return false;
        }
        if(activeType=='activeType/activeType2'){
        		activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeHiddenId');
        }
         fomulaActive=new CUI.Dialog({
	         					title:"投配料活动设置",
	    							formId:"RM_formula_formulaProcessActive_fomulaActiveEdit_form",
										type:5,
										modal:true,
										url:'/RM/formula/formulaProcessActive/fomulaActiveEditzb.action?entityCode=RM_7.5.0.0_formula&activeId='+activeId,
										buttons:[{
										name:"${getText('foundation.common.save')}",
										handler:function(){
										CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form').submit();
										}
										},
									  {
												name:"${getText('foundation.common.closed')}",
												handler:function(){this.close()}
											}]
 									 });
  									fomulaActive.show();
        
			}else{
					 fomulaActive=new CUI.Dialog({
						title:"投配料活动设置",
				    formId:"RM_formula_formulaProcessActive_fomulaActiveEdit_form",
						type:5,
						modal:true,
						url:'/RM/formula/formulaProcessActive/fomulaActiveEdit.action?entityCode=RM_7.5.0.0_formula',
						buttons:[{
							name:"${getText('foundation.common.save')}",
							handler:function(){
							CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form').submit();
			  }
		    },
		    {
			       name:"${getText('foundation.common.closed')}",
			       handler:function(){this.close()}
		     }]
       });
         fomulaActive.show();
			
			}

}
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_otherActiveSet(event)
																{
		 var SelectedRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
     var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeType.id');
     var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');

			if(SelectedRow!=undefined){
			  var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeType.id');
        var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');
        if(activeType=='activeType/activeType4' || activeType=='activeType/activeType2'){
        		workbenchErrorBarWidget.showMessage('只有类型为常规、产出、检验、投料类型的活动才可以进行其他活动设置','f');
	  															return false;
        }
					otherEdit = new CUI.Dialog({
					title:"其他活动设置",
  				formId: "RM_formula_formulaProcessActive_otherActiveEdit_form",
 				  type:3,
          modal:true,
     		  url:'/RM/formula/formulaProcessActive/otherActiveEditzb.action?entityCode=RM_7.5.0.0_formula&activeId='+activeId,
          buttons:[
            { name:"${getText("foundation.common.save")}",
                handler:function(){
                $('input[name="formula.saveFlag"]').val(false);
                CUI('#RM_formula_formulaProcessActive_otherActiveEdit_form').submit();
           }
           },
           { name:"${getText("foundation.common.closed")}",
                handler:function(){this.close()}
           }
           ]
           });
otherEdit.show();
			}  else{
					otherEdit = new CUI.Dialog({
					title:"其他活动设置",
  				formId: "RM_formula_formulaProcessActive_otherActiveEdit_form",
 				  type:3,
          modal:true,
     		  url:'/RM/formula/formulaProcessActive/otherActiveEdit.action?entityCode=RM_7.5.0.0_formula',
          buttons:[
            { name:"${getText("foundation.common.save")}",
                handler:function(){
                $('input[name="formula.saveFlag"]').val(false);
                CUI('#RM_formula_formulaProcessActive_otherActiveEdit_form').submit();
           }
           },
           { name:"${getText("foundation.common.closed")}",
                handler:function(){this.close()}
           }
           ]
           });
otherEdit.show();
			}

 
}
							</script>
							<script type="text/javascript">
								function FormulaProcessActive_dg1487554913298_deleteRow(event)
																{
    DT_FormulaProcessActive_dg1487554913298_deldatagrid();
}
							</script>
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1487554913298.action?formulaProcess.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1487554913298.action?formulaProcess.id=${(formulaProcess.id)!-1}&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('RM.viewdisplayName.randon1487812919928')}\",handler:function(event){FormulaProcessActive_dg1487554913298_fomulaActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion148809957177323')}\",handler:function(event){FormulaProcessActive_dg1487554913298_otherActiveSet(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion148825979180432')}\",handler:function(event){FormulaProcessActive_dg1487554913298_deleteRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('RM.viewdisplayName.randon1487812919928')}\",handler:function(event){FormulaProcessActive_dg1487554913298_fomulaActive(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion148809957177323')}\",handler:function(event){FormulaProcessActive_dg1487554913298_otherActiveSet(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('RM.buttonPropertyshowName.radion148825979180432')}\",handler:function(event){FormulaProcessActive_dg1487554913298_deleteRow(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaProcessActive_dg1487554913298" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1487554913298_id" value="FormulaProcessActive_dg1487554913298" />
			
			<input type="hidden" id="dg1487554913298_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487330059541')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcess/data-dg1487554913298.action?operateType=export&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaProcessActive_dg1487554913298" />
			<@datagrid withoutConfigTable=true id="FormulaProcessActive_dg1487554913298" viewType="${viewType}" renderOverEvent="dg1487554913298RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcess_processActiveEdit_form" noPermissionKeys="name,activeType,occurTurn,exeOrder,longTime,batchSite,product.productName,isReplace,standardQuantity,ingredientsOrder,auto,exeBillName,activeHiddenId,meno" modelCode="RM_7.5.0.0_formula_FormulaProcessActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1487554913298" dtPage="dgPage"  hidekeyPrefix="dg1487554913298" hidekey="['id','version','product.id','product.productName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1487554913298PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('RM.dataGriddataGridName.radion1488181675391')}" activexButton="RM.viewdisplayName.randon1487812919928,fomulaActive;RM.buttonPropertyshowName.radion148809957177323,otherActiveSet;RM.buttonPropertyshowName.radion148825979180432,deleteRow" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										  
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487330156499')}" width=100 showFormatFunc=""/>
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue=''>
										<#assign activeType_defaultValue=''>
										 									<@systemCodeColumn code="activeType" textalign="left" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330759313')}" width=100  />
							<#assign occurTurn_displayDefaultType=''>
								<#assign occurTurn_defaultValue=''>
										<#assign occurTurn_defaultValue=''>
										 									<@systemCodeColumn code="occurTurn" textalign="center" defaultValue="${(occurTurn_defaultValue!)?string}" key="occurTurn.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330199423')}" width=100  />
							<#assign exeOrder_displayDefaultType=''>
								<#assign exeOrder_defaultValue=''>
										<#assign exeOrder_defaultValue=''>
										  
									<@datacolumn key="exeOrder"        showFormat="TEXT" defaultValue="${(exeOrder_defaultValue!)?string}" defaultDisplay="${(exeOrder_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487330171009')}" width=100 showFormatFunc=""/>
							<#assign longTime_displayDefaultType=''>
								<#assign longTime_defaultValue=''>
										<#assign longTime_defaultValue=''>
										  
									<@datacolumn key="longTime"        showFormat="TEXT" defaultValue="${(longTime_defaultValue!)?string}" defaultDisplay="${(longTime_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487330334270')}" width=100 showFormatFunc=""/>
							<#assign batchSite_displayDefaultType=''>
								<#assign batchSite_defaultValue=''>
										<#assign batchSite_defaultValue=''>
										 									<@systemCodeColumn code="batchSite" textalign="center" defaultValue="${(batchSite_defaultValue!)?string}" key="batchSite.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330829749')}" width=100  />
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

									<@datacolumn key="product.productName"        showFormat="SELECTCOMP" defaultValue="${(product_productName_defaultValue!)?string}" defaultDisplay="${(product_productName_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formulaProcess.processActiveEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('RM.propertydisplayName.radion141577274073723')}" width=100 showFormatFunc=""/>
							<#assign isReplace_displayDefaultType=''>
								<#assign isReplace_defaultValue=''>
										<#assign isReplace_defaultValue=''>
										  
									<@datacolumn key="isReplace"        showFormat="CHECKBOX" defaultValue="${(isReplace_defaultValue!)?string}" defaultDisplay="${(isReplace_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331060176')}" width=100 showFormatFunc=""/>
							<#assign standardQuantity_displayDefaultType=''>
								<#assign standardQuantity_defaultValue=''>
										<#assign standardQuantity_defaultValue=''>
										  
									<@datacolumn key="standardQuantity"        showFormat="TEXT" defaultValue="${(standardQuantity_defaultValue!)?string}" defaultDisplay="${(standardQuantity_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331086583')}" width=100 showFormatFunc=""/>
							<#assign ingredientsOrder_displayDefaultType=''>
								<#assign ingredientsOrder_defaultValue=''>
										<#assign ingredientsOrder_defaultValue=''>
										  
									<@datacolumn key="ingredientsOrder"        showFormat="TEXT" defaultValue="${(ingredientsOrder_defaultValue!)?string}" defaultDisplay="${(ingredientsOrder_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331110232')}" width=100 showFormatFunc=""/>
							<#assign auto_displayDefaultType=''>
								<#assign auto_defaultValue=''>
										<#assign auto_defaultValue=''>
										  
									<@datacolumn key="auto"        showFormat="CHECKBOX" defaultValue="${(auto_defaultValue!)?string}" defaultDisplay="${(auto_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331130107')}" width=100 showFormatFunc=""/>
							<#assign exeBillName_displayDefaultType=''>
								<#assign exeBillName_defaultValue=''>
										<#assign exeBillName_defaultValue=''>
										  
									<@datacolumn key="exeBillName"        showFormat="TEXT" defaultValue="${(exeBillName_defaultValue!)?string}" defaultDisplay="${(exeBillName_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331143778')}" width=100 showFormatFunc=""/>
							<#assign activeHiddenId_displayDefaultType=''>
								<#assign activeHiddenId_defaultValue=''>
										<#assign activeHiddenId_defaultValue=''>
										  
									<@datacolumn key="activeHiddenId"        showFormat="TEXT" defaultValue="${(activeHiddenId_defaultValue!)?string}" defaultDisplay="${(activeHiddenId_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488158485925')}" width=100 showFormatFunc=""/>
							<#assign meno_displayDefaultType=''>
								<#assign meno_defaultValue=''>
										<#assign meno_defaultValue=''>
										  
									<@datacolumn key="meno"        showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331194516')}" width=100 showFormatFunc=""/>
			
			</@datagrid>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
			
			<script type="text/javascript">
				function FormulaProcessActive_dg1487554913298_check_datagridvalid(){
					//
					var errorObj =FormulaProcessActive_dg1487554913298Widget._DT.testData();
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
				
				function savedg1487554913298DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaProcessActive_dg1487554913298Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaProcessActive_dg1487554913298Widget') > -1) {
						FormulaProcessActive_dg1487554913298Widget.setAllRowEdited();
					}
					var json = FormulaProcessActive_dg1487554913298Widget.parseEditedData();
					$('input[name="dg1487554913298ListJson"]').remove();
					$('input[name="dgLists[\'dg1487554913298\']"]').remove();
					$('input[name="dg1487554913298ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1487554913298\']">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					$('<input type="hidden" name="dg1487554913298ModelCode">').val('RM_7.5.0.0_formula_FormulaProcessActive').appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1487554913298ListJson">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
				}
				function DT_FormulaProcessActive_dg1487554913298_deldatagrid(){
					var deleteRows = FormulaProcessActive_dg1487554913298Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','formulaId.id','product.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487554913298DeletedIds").length>0){
							$("#dg1487554913298DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487554913298DeletedIds" name="dgDeletedIds[\'dg1487554913298\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487554913298DeletedIds['+CUI('input[name^="dg1487554913298DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
					});
				}
				function DT_FormulaProcessActive_dg1487554913298_delTreeNodes(){
					var deleteRows = FormulaProcessActive_dg1487554913298Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','formulaId.id','product.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487554913298DeletedIds").length>0){
							$("#dg1487554913298DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487554913298DeletedIds" name="dgDeletedIds[\'dg1487554913298\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487554913298DeletedIds['+CUI('input[name^="dg1487554913298DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids');
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
							if(datagrids[0][i] == 'FormulaProcessActive_dg1487554913298') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1487554913298';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'FormulaProcessActive_dg1487554913298';
					}
					$('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids', datagrids);
				});
				
				var FormulaProcessActive_dg1487554913298_importDialog = null;
				function FormulaProcessActive_dg1487554913298_showImportDialog(){
					try{
						if(FormulaProcessActive_dg1487554913298_importDialog!=null&&FormulaProcessActive_dg1487554913298_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcess/initImport.action?datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298&tid=${id!}&datagridName=dg1487554913298";
						FormulaProcessActive_dg1487554913298_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaProcessActive_dg1487554913298"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1487554913298_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcessActive_dg1487554913298_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaProcessActive_dg1487554913298_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaProcessActive_dg1487554913298_downLoadFile(){
					var url = "/RM/formula/formulaProcess/downLoad.action?datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298&templateRelatedModelCode=RM_7.5.0.0_formula_processActiveEditdg1487554913298&downloadType=template&fileName=dg1487554913298";
					window.open(url,"","");
				}
				function dg1487554913298RenderOverEvent(){
					var len =FormulaProcessActive_dg1487554913298Widget.getRowLength();
	for(var i=0;i<len;i++){
		var processID = FormulaProcessActive_dg1487554913298Widget.getCellValue(i,"id");
		if($("#dg1487555065561ListJson_"+processID).length==0){
			$("#PrecessStandards_dg1487555065561_tbody").append("<input type=\"hidden\" id=\"dg1487555065561ListJson_"+processID+"\">");
		}
		var id = $("#id").val();
		var url = "/RM/formula/formulaProcess/data-dg1487555065561.action?formulaProcess.id="+id+"&rt=json&processID="+processID;
		$.ajax({  
			url :url,  
			type : 'post',  
			async:false,  
			dataType:'json',    
			success :function(msg){
				var jsonarray = msg.result;
				var length = jsonarray.length;
				var json = JSON.stringify(jsonarray);
				$("#dg1487555065561ListJson_"+processID).val(json);
			}
		});
	}
var tableObj = document.getElementById("FormulaProcessActive_dg1487554913298_tbody");
alert(tableObj.rows.length);
for (var i = 0; i < tableObj.rows.length; i++) {    //遍历Table的所有Row 
alert(3333);
	tableObj.rows[i].onclick=function(){ setIndexData() };  						
}







//添加双击事件
$("#FormulaProcessActive_dg1487554913298_tbody tr").dblclick(function(){
     var SelectedRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
     var activeType=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeType.id')
     var activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'id');
     if(activeType=='activeType/activeType2'){
     		activeId=FormulaProcessActive_dg1487554913298Widget.getCellValue(SelectedRow,'activeHiddenId');
     }
     if(activeType!='activeType/activeType4' && activeType!='activeType/activeType2'){
     			var randgeEdit = new CUI.Dialog({
          title:"其他活动设置",
          formId: "RM_formula_formulaProcessActive_otherActiveEdit_form",
          type:3,
      		modal:true,
  				url:'/RM/formula/formulaProcessActive/otherActiveEditzb.action?entityCode=RM_7.5.0.0_formula&activeId='+activeId,
  				buttons:[
     						 { name:"${getText("foundation.common.save")}",
   											 handler:function(){
   											 CUI('#RM_formula_formulaProcessActive_otherActiveEdit_form').submit();
   					 }
   					 },
    								{ name:"${getText("foundation.common.closed")}",
     								handler:function(){this.close()}
    								}
 						 ]
									 });
							randgeEdit.show();
     }else{
     				var fomulaActive=new CUI.Dialog({
	         					title:"投配料活动设置",
	    							formId:"RM_formula_formulaProcessActive_fomulaActiveEdit_form",
										type:5,
										modal:true,
										url:'/RM/formula/formulaProcessActive/fomulaActiveEditzb.action?entityCode=RM_7.5.0.0_formula&activeId='+activeId,
										buttons:[{
										name:"${getText('foundation.common.save')}",
										handler:function(){
										CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form').submit();
										}
										},
									  {
												name:"${getText('foundation.common.closed')}",
												handler:function(){this.close()}
											}]
 									 });
  									fomulaActive.show();
     }
     
});
				}
				function dg1487554913298PageInitMethod(nTabIndex){
					RM.formula.formulaProcess.processActiveEdit.initSize(nTabIndex);
				}
			</script>
			
			
				
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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1487555065561.action?formulaProcess.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561">
			<#else>
				<#assign dUrl="/RM/formula/formulaProcess/data-dg1487555065561.action?formulaProcess.id=${(formulaProcess.id)!-1}&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_PrecessStandards_dg1487555065561_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_PrecessStandards_dg1487555065561_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_PrecessStandards_dg1487555065561" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1487555065561_id" value="PrecessStandards_dg1487555065561" />
			
			<input type="hidden" id="dg1487555065561_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487331249205')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formulaProcess/data-dg1487555065561.action?operateType=export&datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="PrecessStandards_dg1487555065561" />
			<@datagrid withoutConfigTable=true id="PrecessStandards_dg1487555065561" viewType="${viewType}" renderOverEvent="dg1487555065561RenderOverEvent" route="${routeFlag}" formId="RM_formula_formulaProcess_processActiveEdit_form" noPermissionKeys="quota,stValue,overrunFlag,limitInter,upperLimit,maxLimit,lowerLimit,loweMxLimit,fluctuateFlag,flucUpperLimit,flucLowerLimit" modelCode="RM_7.5.0.0_formula_PrecessStandards" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1487555065561" dtPage="dgPage"  hidekeyPrefix="dg1487555065561" hidekey="['id','version'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1487555065561PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('RM.dataGriddataGridName.radion148818169604023')}" activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
							<#assign quota_displayDefaultType=''>
								<#assign quota_defaultValue=''>
										<#assign quota_defaultValue=''>
										  
									<@datacolumn key="quota"        showFormat="TEXT" defaultValue="${(quota_defaultValue!)?string}" defaultDisplay="${(quota_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331350188')}" width=100 showFormatFunc=""/>
							<#assign stValue_displayDefaultType=''>
								<#assign stValue_defaultValue=''>
										<#assign stValue_defaultValue=''>
										  
									<@datacolumn key="stValue"        showFormat="TEXT" defaultValue="${(stValue_defaultValue!)?string}" defaultDisplay="${(stValue_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331365964')}" width=100 showFormatFunc=""/>
							<#assign overrunFlag_displayDefaultType=''>
								<#assign overrunFlag_defaultValue=''>
										<#assign overrunFlag_defaultValue=''>
										  
									<@datacolumn key="overrunFlag"        showFormat="CHECKBOX" defaultValue="${(overrunFlag_defaultValue!)?string}" defaultDisplay="${(overrunFlag_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331380816')}" width=100 showFormatFunc=""/>
							<#assign limitInter_displayDefaultType=''>
								<#assign limitInter_defaultValue=''>
										<#assign limitInter_defaultValue=''>
										  
									<@datacolumn key="limitInter"        showFormat="TEXT" defaultValue="${(limitInter_defaultValue!)?string}" defaultDisplay="${(limitInter_displayDefaultType!)?string}" decimal="" editable=true type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331398438')}" width=100 showFormatFunc=""/>
							<#assign upperLimit_displayDefaultType=''>
								<#assign upperLimit_defaultValue=''>
										<#assign upperLimit_defaultValue=''>
										  
									<@datacolumn key="upperLimit"        showFormat="TEXT" defaultValue="${(upperLimit_defaultValue!)?string}" defaultDisplay="${(upperLimit_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331419739')}" width=100 showFormatFunc=""/>
							<#assign maxLimit_displayDefaultType=''>
								<#assign maxLimit_defaultValue=''>
										<#assign maxLimit_defaultValue=''>
										  
									<@datacolumn key="maxLimit"        showFormat="TEXT" defaultValue="${(maxLimit_defaultValue!)?string}" defaultDisplay="${(maxLimit_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331435990')}" width=100 showFormatFunc=""/>
							<#assign lowerLimit_displayDefaultType=''>
								<#assign lowerLimit_defaultValue=''>
										<#assign lowerLimit_defaultValue=''>
										  
									<@datacolumn key="lowerLimit"        showFormat="TEXT" defaultValue="${(lowerLimit_defaultValue!)?string}" defaultDisplay="${(lowerLimit_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331461257')}" width=100 showFormatFunc=""/>
							<#assign loweMxLimit_displayDefaultType=''>
								<#assign loweMxLimit_defaultValue=''>
										<#assign loweMxLimit_defaultValue=''>
										  
									<@datacolumn key="loweMxLimit"        showFormat="TEXT" defaultValue="${(loweMxLimit_defaultValue!)?string}" defaultDisplay="${(loweMxLimit_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331479070')}" width=100 showFormatFunc=""/>
							<#assign fluctuateFlag_displayDefaultType=''>
								<#assign fluctuateFlag_defaultValue=''>
										<#assign fluctuateFlag_defaultValue=''>
										  
									<@datacolumn key="fluctuateFlag"        showFormat="CHECKBOX" defaultValue="${(fluctuateFlag_defaultValue!)?string}" defaultDisplay="${(fluctuateFlag_displayDefaultType!)?string}" decimal="" editable=true type="checkbox" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331497771')}" width=100 showFormatFunc=""/>
							<#assign flucUpperLimit_displayDefaultType=''>
								<#assign flucUpperLimit_defaultValue=''>
										<#assign flucUpperLimit_defaultValue=''>
										  
									<@datacolumn key="flucUpperLimit"        showFormat="TEXT" defaultValue="${(flucUpperLimit_defaultValue!)?string}" defaultDisplay="${(flucUpperLimit_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331533263')}" width=100 showFormatFunc=""/>
							<#assign flucLowerLimit_displayDefaultType=''>
								<#assign flucLowerLimit_defaultValue=''>
										<#assign flucLowerLimit_defaultValue=''>
										  
									<@datacolumn key="flucLowerLimit"        showFormat="TEXT" defaultValue="${(flucLowerLimit_defaultValue!)?string}" defaultDisplay="${(flucLowerLimit_displayDefaultType!)?string}" decimal="6" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487331551106')}" width=100 showFormatFunc=""/>
			
			</@datagrid>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
			
			<script type="text/javascript">
				function PrecessStandards_dg1487555065561_check_datagridvalid(){
					//
					var errorObj =PrecessStandards_dg1487555065561Widget._DT.testData();
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
				
				function savedg1487555065561DataGrid(){
					<#if  refId?? && (refId gt 0)>
					PrecessStandards_dg1487555065561Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('PrecessStandards_dg1487555065561Widget') > -1) {
						PrecessStandards_dg1487555065561Widget.setAllRowEdited();
					}
					var json = PrecessStandards_dg1487555065561Widget.parseEditedData();
					$('input[name="dg1487555065561ListJson"]').remove();
					$('input[name="dgLists[\'dg1487555065561\']"]').remove();
					$('input[name="dg1487555065561ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1487555065561\']">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					$('<input type="hidden" name="dg1487555065561ModelCode">').val('RM_7.5.0.0_formula_PrecessStandards').appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1487555065561ListJson">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
				}
				function DT_PrecessStandards_dg1487555065561_deldatagrid(){
					var deleteRows = PrecessStandards_dg1487555065561Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487555065561DeletedIds").length>0){
							$("#dg1487555065561DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487555065561DeletedIds" name="dgDeletedIds[\'dg1487555065561\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487555065561DeletedIds['+CUI('input[name^="dg1487555065561DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
					});
				}
				function DT_PrecessStandards_dg1487555065561_delTreeNodes(){
					var deleteRows = PrecessStandards_dg1487555065561Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1487555065561DeletedIds").length>0){
							$("#dg1487555065561DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1487555065561DeletedIds" name="dgDeletedIds[\'dg1487555065561\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1487555065561DeletedIds['+CUI('input[name^="dg1487555065561DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids');
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
							if(datagrids[0][i] == 'PrecessStandards_dg1487555065561') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'PrecessStandards_dg1487555065561';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'PrecessStandards_dg1487555065561';
					}
					$('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids', datagrids);
				});
				
				var PrecessStandards_dg1487555065561_importDialog = null;
				function PrecessStandards_dg1487555065561_showImportDialog(){
					try{
						if(PrecessStandards_dg1487555065561_importDialog!=null&&PrecessStandards_dg1487555065561_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formulaProcess/initImport.action?datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561&tid=${id!}&datagridName=dg1487555065561";
						PrecessStandards_dg1487555065561_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("PrecessStandards_dg1487555065561"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();PrecessStandards_dg1487555065561_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();PrecessStandards_dg1487555065561_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						PrecessStandards_dg1487555065561_importDialog.show();
					}catch(e){}
				}	
				
				function PrecessStandards_dg1487555065561_downLoadFile(){
					var url = "/RM/formula/formulaProcess/downLoad.action?datagridCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561&templateRelatedModelCode=RM_7.5.0.0_formula_processActiveEditdg1487555065561&downloadType=template&fileName=dg1487555065561";
					window.open(url,"","");
				}
				function dg1487555065561RenderOverEvent(){
				}
				function dg1487555065561PageInitMethod(nTabIndex){
					RM.formula.formulaProcess.processActiveEdit.initSize(nTabIndex);
				}
			</script>
			
			
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
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==2>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==3>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==4>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==5>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
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
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#elseif t.selectPeople==2>
										<#if t.userRangeFalg?? && t.userRangeFalg==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
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
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==2>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==3>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==4>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==5>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formulaProcess.processActiveEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" outcome="${pending.activityName}" selectPeople="${pending.loop}"/>
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
							<a class="cui-btn-blue" onclick="RM.formula.formulaProcess.processActiveEdit.save()"><span class='btn_r'>${getText('ec.flow.save')}</span></a>
							<a class="cui-btn-green" onclick="RM.formula.formulaProcess.processActiveEdit.submit()"><span class='btn_r'>${getText('ec.flow.submit')}</span></a>
						
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
     	
		<div id="RM_formula_formulaProcess_processActiveEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="RM.formula.formulaProcess.processActiveEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.formula.formulaProcess.processActiveEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="RM.formula.formulaProcess.processActiveEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		
		<!-- CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processActiveEdit,html,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) -->
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
						$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.formula.formulaProcess.processActiveEdit.initCount = 0;
			RM.formula.formulaProcess.processActiveEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-head").height()-$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-workflow").height()</#if>;
				$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_formula_formulaProcess_processActiveEdit_datagrids');
				var padding_bottom=16;
				$("#RM_formula_formulaProcess_processActiveEdit_main_div .pd_bottom,#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-panes-s").each(function(index){
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
									if(RM.formula.formulaProcess.processActiveEdit.initCount <= 2) {
										setTimeout(function(){RM.formula.formulaProcess.processActiveEdit.initSize();}, 200);
										RM.formula.formulaProcess.processActiveEdit.initCount++;
									}/* else {
										RM.formula.formulaProcess.processActiveEdit.initCount = 0;
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
							if(($("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-workflow").length > 0) && ($("#RM_formula_formulaProcess_processActiveEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				RM.formula.formulaProcess.processActiveEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.formula.formulaProcess.processActiveEdit.initSize();
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
						if(parseInt($("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width"),10)==650){
							$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.formula.formulaProcess.processActiveEdit.resizeLayout();
						//RM.formula.formulaProcess.processActiveEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width"),10)==800){
							$("#RM_formula_formulaProcess_processActiveEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.formula.formulaProcess.processActiveEdit.resizeLayout();
						//RM.formula.formulaProcess.processActiveEdit.initSize();
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
					RM.formula.formulaProcess.processActiveEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.formula.formulaProcess.processActiveEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.formula.formulaProcess.processActiveEdit.initSize();});
				/*
				RM.formula.formulaProcess.processActiveEdit.resizeLayout=function(){
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
			RM.formula.formulaProcess.processActiveEdit.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${formulaProcess.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/RM/formula/formulaProcess/dealInfo-list.action&enableSimpleDealInfo=false");
			</#if>
		});

		RM.formula.formulaProcess.processActiveEdit.validate = function(){
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
		RM.formula.formulaProcess.processActiveEdit.beforeSaveProcess = function(){
			try{eval("savedg1487555065561DataGrid()");}catch(e){}
			try{eval("savedg1487554913298DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#RM_formula_formulaProcess_processActiveEdit_form').trigger('beforeSubmit');
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
		}
		RM.formula.formulaProcess.processActiveEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#RM_formula_formulaProcess_processActiveEdit_form').append(FormulaProcessActive_dg1487554913298Widget._DT.createInputs('dg1487554913298List'));
										</#if>
										<#if false && isIE>
										$('#RM_formula_formulaProcess_processActiveEdit_form').append(PrecessStandards_dg1487555065561Widget._DT.createInputs('dg1487555065561List'));
										</#if>
		};
		RM.formula.formulaProcess.processActiveEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.formula.formulaProcess.processActiveEdit.validate()){return;}
			RM.formula.formulaProcess.processActiveEdit.beforeSaveProcess();

			//RM.formula.formulaProcess.processActiveEdit.processDataGrid();
			$('#RM_formula_formulaProcess_processActiveEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_formula_formulaProcess_processActiveEdit_form','RM_formula_formulaProcess_processActiveEdit_datagrids')) {      
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
		RM.formula.formulaProcess.processActiveEdit.print = function(){
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
		
		RM.formula.formulaProcess.processActiveEdit.saveSetting = function(){
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
		
		RM.formula.formulaProcess.processActiveEdit.printSetting = function(){
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
				RM.formula.formulaProcess.processActiveEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formulaProcess.processActiveEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.formula.formulaProcess.processActiveEdit.settingDialog.show();
			}
		}
		
		
		RM.formula.formulaProcess.processActiveEdit.submit = function(uncheck){
			$('#operateType').val("submit");
			if(uncheck){}
			else
			if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').val())){
				workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
				return;
			}
			if(!RM.formula.formulaProcess.processActiveEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			RM.formula.formulaProcess.processActiveEdit.beforeSaveProcess();
			
			//RM.formula.formulaProcess.processActiveEdit.processDataGrid();
			
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
			$('#RM_formula_formulaProcess_processActiveEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		RM.formula.formulaProcess.processActiveEdit.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/RM/formula/formulaProcess/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(formulaProcess.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(formulaProcess.tableInfoId)?default('')}&id=${(formulaProcess.id)?default('')}&entityCode=RM_7.5.0.0_formula";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.RM.formula.formulaProcess.editCallBackInfo(res); 						
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
		RM.formula.formulaProcess.processActiveEdit._callBackInfo = function(res){
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
 						window.opener.RM.formula.formulaProcess.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.location.reload();
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.formula.formulaProcess.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		<#if editNew>
		RM.formula.formulaProcess.processActiveEdit.setDepartment = function(){
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
				RM.formula.formulaProcess.processActiveEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.formula.formulaProcess.processActiveEdit._refViewCode_IE = viewCode;
			} else {
				RM.formula.formulaProcess.processActiveEdit._refViewCode_IE = '';
			}
			RM.formula.formulaProcess.processActiveEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.formula.formulaProcess.processActiveEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.formula.formulaProcess.processActiveEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.formula.formulaProcess.processActiveEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.formula.formulaProcess.processActiveEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.formula.formulaProcess.processActiveEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				RM.formula.formulaProcess.processActiveEdit.gridEventObj = gridEventObj;
				callbackName = "RM.formula.formulaProcess.processActiveEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.formula.formulaProcess.processActiveEdit.getMultiselectCallBackInfo_DG" : "RM.formula.formulaProcess.processActiveEdit.getcallBackInfo_DG";
				RM.formula.formulaProcess.processActiveEdit._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.formula.formulaProcess.processActiveEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.formula.formulaProcess.processActiveEdit._prefix = _prefix.substring(1);
			}
			
			RM.formula.formulaProcess.processActiveEdit._oGrid = oGrid;
			RM.formula.formulaProcess.processActiveEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.formula.formulaProcess.processActiveEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.formula.formulaProcess.processActiveEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.formula.formulaProcess.processActiveEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.formula.formulaProcess.processActiveEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.formula.formulaProcess.processActiveEdit._refViewCode = oColumn.viewCode;
				} else {
					RM.formula.formulaProcess.processActiveEdit._refViewCode = '';
				}
			} else {
				RM.formula.formulaProcess.processActiveEdit._isObjCustomProp = false;
				RM.formula.formulaProcess.processActiveEdit._objCustomPropNames = '';
				RM.formula.formulaProcess.processActiveEdit._refViewCode = '';
			}
			if (RM.formula.formulaProcess.processActiveEdit._isObjCustomProp == true && RM.formula.formulaProcess.processActiveEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.formula.formulaProcess.processActiveEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.formula.formulaProcess.processActiveEdit._customCallBack = customCallBack;
			}
			if(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.formula.formulaProcess.processActiveEdit._querycustomFuncN == "function") {
				refparam += RM.formula.formulaProcess.processActiveEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.formula.formulaProcess.processActiveEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formulaProcess.processActiveEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formulaProcess.processActiveEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.formula.formulaProcess.processActiveEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.formula.formulaProcess.processActiveEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formulaProcess.processActiveEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.formula.formulaProcess.processActiveEdit.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaProcess.processActiveEdit.query_'+obj+'()') : null;
			return str;
		};
		RM.formula.formulaProcess.processActiveEdit.getcallBackGroupInfo = function(obj){
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
			RM.formula.formulaProcess.processActiveEdit._dialog.close();
		}
		RM.formula.formulaProcess.processActiveEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_formula_formulaProcess_processActiveEdit_form',obj[0], RM.formula.formulaProcess.processActiveEdit._prefix, RM.formula.formulaProcess.processActiveEdit._sUrl);
			CUI.commonFills('RM_formula_formulaProcess_processActiveEdit_form',RM.formula.formulaProcess.processActiveEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.formula.formulaProcess.processActiveEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.formula.formulaProcess.processActiveEdit._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveEdit._customCallBack);
					RM.formula.formulaProcess.processActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.formula.formulaProcess.processActiveEdit.getcallBackInfo_DG_IE = function(obj){
			if(RM.formula.formulaProcess.processActiveEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formulaProcess.processActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.formula.formulaProcess.processActiveEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE == true && RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.formula.formulaProcess.processActiveEdit._sUrl,RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formulaProcess.processActiveEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.formula.formulaProcess.processActiveEdit._isObjCustomProp_IE == true && RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.formula.formulaProcess.processActiveEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.formula.formulaProcess.processActiveEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.formula.formulaProcess.processActiveEdit._refViewCode_IE + '&id=' + id,
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
				if(RM.formula.formulaProcess.processActiveEdit._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveEdit._customCallBack);
					RM.formula.formulaProcess.processActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveEdit._dialog.close();
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
		
		RM.formula.formulaProcess.processActiveEdit.getcallBackInfo_DG = function(obj){
			if(RM.formula.formulaProcess.processActiveEdit._customBeforeCallBack) {
				var flag = eval(RM.formula.formulaProcess.processActiveEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.formula.formulaProcess.processActiveEdit._currRow).next().length==0){
						RM.formula.formulaProcess.processActiveEdit._oGrid.addNewRow();
					}	
					RM.formula.formulaProcess.processActiveEdit._currRow = $(RM.formula.formulaProcess.processActiveEdit._currRow).next();
					$(RM.formula.formulaProcess.processActiveEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.formula.formulaProcess.processActiveEdit._currRow,obj[i], RM.formula.formulaProcess.processActiveEdit._prefix, RM.formula.formulaProcess.processActiveEdit._sUrl);
				if (RM.formula.formulaProcess.processActiveEdit._isObjCustomProp == true && RM.formula.formulaProcess.processActiveEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.formula.formulaProcess.processActiveEdit._currRow,RM.formula.formulaProcess.processActiveEdit._prefix,obj[i],RM.formula.formulaProcess.processActiveEdit._oGrid,RM.formula.formulaProcess.processActiveEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.formula.formulaProcess.processActiveEdit._currRow,RM.formula.formulaProcess.processActiveEdit._prefix,obj[i],RM.formula.formulaProcess.processActiveEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.formula.formulaProcess.processActiveEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.formula.formulaProcess.processActiveEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.formula.formulaProcess.processActiveEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.formula.formulaProcess.processActiveEdit._refViewCode + '&id=' + id,
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
									name = RM.formula.formulaProcess.processActiveEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.formula.formulaProcess.processActiveEdit._currRow, objs, RM.formula.formulaProcess.processActiveEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.formula.formulaProcess.processActiveEdit._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveEdit._customCallBack);
					RM.formula.formulaProcess.processActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.formula.formulaProcess.processActiveEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.formula.formulaProcess.processActiveEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.formula.formulaProcess.processActiveEdit._oGrid, RM.formula.formulaProcess.processActiveEdit._currRow, RM.formula.formulaProcess.processActiveEdit._key, RM.formula.formulaProcess.processActiveEdit._displayFieldName, obj[i])
			}
			try{
				if(RM.formula.formulaProcess.processActiveEdit._customCallBack) {
					eval(RM.formula.formulaProcess.processActiveEdit._customCallBack);
					RM.formula.formulaProcess.processActiveEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formulaProcess.processActiveEdit._dialog.close();
			} catch(e){}
		};
		
		RM.formula.formulaProcess.processActiveEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.formula.formulaProcess.processActiveEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formulaProcess_processActiveEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			RM.formula.formulaProcess.processActiveEdit.onloadForProduct();
			//隐藏提交按钮
$('#edit-submit-btn').hide();
//隐藏底部的保存、提交、填写意见
$('.edit-workflow').hide();

$('input[name="formulaProcess.formId"]').val(${id});
			
		});

		RM.formula.formulaProcess.processActiveEdit.beforeSubmitMethodSettingInPage = function(){
			RM.formula.formulaProcess.processActiveEdit.onsaveForProduct();
		};
		RM.formula.formulaProcess.processActiveEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.formula.formulaProcess.processActiveEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.formula.formulaProcess.processActiveEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").hide();
				},100);
				//CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.formula.formulaProcess.processActiveEdit.showThis = function(){
			if(!CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").is(':visible')) {
				CUI("#RM_formula_formulaProcess_processActiveEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.formula.formulaProcess.processActiveEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.formula.formulaProcess.processActiveEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_formula_formulaProcess_processActiveEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_formula_FormulaProcess&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formulaProcess.processActiveEdit.auditDialog.show();
			</#if>
		}
		
		
		RM.formula.formulaProcess.processActiveEdit.showInfoDialog=function(mode){
			
			RM.formula.formulaProcess.processActiveEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_formula_formulaProcess_processActiveEdit_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formulaProcess.processActiveEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.formula.formulaProcess.processActiveEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_formula");
			}
		}
		
		RM.formula.formulaProcess.processActiveEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/formula/formulaProcess/dealInfo-list.action&dlTableInfoId=${(formulaProcess.tableInfoId)?default('')}");
			}
		}
		RM.formula.formulaProcess.processActiveEdit.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=RM_7.5.0.0_formula_FormulaProcess&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(formulaProcess.tableInfoId)?default('')}");
			}
		}
		RM.formula.formulaProcess.processActiveEdit.supervision=function(){
			RM.formula.formulaProcess.processActiveEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(formulaProcess.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.formula.formulaProcess.processActiveEdit.modifyOwnerStaffDialog.show();
		}
		






		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processActiveEdit,js,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
        //其他活动界面
		var otherEdit = new CUI.Dialog({
  title:"其他活动设置",
  formId: "RM_formula_formulaProcessActive_otherActivaEdit_form",
  type:3,
  modal:true,
  url:'/RM/formula/formulaProcessActive/otherActiveEdit.action?entityCode=RM_7.5.0.0_formula',
  buttons:[
      { name:"${getText("foundation.common.save")}",
    handler:function(){
    CUI('#RM_formula_formulaProcessActive_otherActiveEdit_form').submit();
    }
    },
    { name:"${getText("foundation.common.closed")}",
     handler:function(){this.close()}
    }
  ]
 });
 
 
 //投配料活动的界面
  
    var fomulaActive=new CUI.Dialog({
		title:"投配料活动设置",
	    formId:"RM_formula_formulaProcessActive_fomulaActiveEdit_form",
		type:5,
		modal:true,
		url:'/RM/formula/formulaProcessActive/fomulaActiveEdit.action?entityCode=RM_7.5.0.0_formula',
		buttons:[{
			name:"${getText('foundation.common.save')}",
			handler:function(){
				CUI('#RM_formula_formulaProcessActive_fomulaActiveEdit_form').submit();
			}
		},
		{
			name:"${getText('foundation.common.closed')}",
			handler:function(){this.close()}
		}]
  });

  	RM.formula.formulaProcessActive = RM.formula.formulaProcess.processActiveEdit;
     RM.formula.formulaProcessActive.callBackInfo=function(){   
             CUI.Dialog.toggleAllButton(); 
       //关闭其他活动
           otherEdit.close();
       //关闭投配料活动
           fomulaActive.close();
       //页面重新加载
          FormulaProcessActive_dg1487554913298Widget._DT.setRequestDataUrl(FormulaProcessActive_dg1487554913298Widget._DT.requestUrl);  
            
        }
     
     
           //重写工序活动的callback函数
        RM.formula.formulaProcess.processActiveEdit._callBackInfo = function(res){
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
 						window.opener.RM.formula.formulaProcess.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.location.reload();
						}catch(e3){}
					}
				};
					var tableId=$('input[name="formulaProcess.processTableId"]').val();
					var activeId=$('input[name="formulaProcess.formId"]').val();
 				setTimeout(function(){
					location.replace("/RM/formula/formulaProcess/processActiveEdit.action?entityCode=material_1.0_operateProdPlace&${getPowerCode('opeProList_add_add_material_1.0_operateProdPlace_opeProList')}&id="+activeId+"&tableInfoId="+tableId);
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.formula.formulaProcess.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};


//工序活动行点击事件
	//工序活动行点击事件
	function setIndexData(){
		setTimeout(function(){
			var selRow = FormulaProcessActive_dg1487554913298Widget.getSelectedRow();
			var selID = FormulaProcessActive_dg1487554913298Widget.getCellValue(selRow,"id");
		var	checkItemID = selID;
			var jsonData = $("#dg1487555065561ListJson_"+selID).val();
			var processID = FormulaProcessActive_dg1487554913298Widget.getCellValue(selRow,"id");
			var id = $("#id").val();
			if(jsonData==undefined&&id!=undefined){
              alert(444444);
              	//编辑时，并且第一次点击
				PrecessStandards_dg1487555065561Widget._DT.setRequestDataUrl("/RM/formula/formulaProcess/data-dg1487555065561.action?formulaProcess.id="+id+"&rt=json&processID="+processID);
			} else{
              alert(55555);
              	if(jsonData==undefined) jsonData="";
              alert(6666);
              	jsonData = jsonData.replace(/\+/g,"%2b");
				PrecessStandards_dg1487555065561Widget._DT.setRequestDataUrl("/RM/formula/formulaProcess/ref-data-dg1487555065561.action?rt=json","dg1487555065561List_Json="+jsonData);	
			}
		},100);
	}

function savedg1487555065561DataGrid(){
					<#if  refId?? && (refId gt 0)>
					PrecessStandards_dg1487555065561Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('PrecessStandards_dg1487555065561Widget') > -1) {
						PrecessStandards_dg1487555065561Widget.setAllRowEdited();
					}
					var json = PrecessStandards_dg1487555065561Widget.parseEditedData();
					$('input[name="dg1487555065561List_Json"]').remove();
					$('input[name="dgLists[\'dg1487555065561\']"]').remove();
					$('input[name="dg1487555065561ModelCode"]').remove();
					//$('<input type="hidden" name="dgLists[\'dg1487555065561\']">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					$('<input type="hidden" name="dg1487555065561ModelCode">').val('RM_7.5.0.0_formula_PrecessStandards').appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1487555065561List_Json">').val(json).appendTo($('#RM_formula_formulaProcess_processActiveEdit_form'));
				}
/* CUSTOM CODE END */

		RM.formula.formulaProcess.processActiveEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processActiveEdit,onloadForProduct,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
		}

		RM.formula.formulaProcess.processActiveEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-RM_7.5.0.0_formula_processActiveEdit,onsaveForProduct,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="RM.formula.formulaProcess.processActiveEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.formula.formulaProcess.processActiveEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(formulaProcess.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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
</html>, package com.supcon.orchid.RM.actions;
import java.util.Date;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.HashMap;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Collections;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.StringTokenizer;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.net.URLEncoder;
import ognl.Ognl;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.osgi.framework.FrameworkUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import com.supcon.orchid.ec.entities.Sql;
import com.supcon.orchid.utils.DocumentUtils;
import com.supcon.orchid.utils.Inflector;
import com.supcon.orchid.utils.SerializeUitls;
import com.supcon.orchid.utils.OrchidUtils;
import com.supcon.orchid.utils.Param;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.Preparable;
import com.supcon.orchid.PropertyHolder;
import com.supcon.orchid.i18n.InternationalResource;
import com.supcon.orchid.container.mvc.struts2.support.BAPEntityConfGenericActionSupport;
import com.supcon.orchid.container.mvc.struts2.support.GenericActionSupport;
import com.supcon.orchid.container.mvc.struts2.utils.ResponseMsg;
import com.supcon.orchid.container.mvc.struts2.utils.Struts2Utils;
import com.supcon.orchid.container.mvc.struts2.utils.XmlUtils;
import com.supcon.orchid.ec.services.DataGridService;
import com.supcon.orchid.ec.entities.CreatorInfo;
import com.supcon.orchid.RM.entities.RMFormulaProcess;
import com.supcon.orchid.RM.services.RMFormulaProcessService;
import com.supcon.orchid.foundation.entities.Company;
import com.supcon.orchid.foundation.entities.Cookie;
import com.supcon.orchid.notification.NotificationService;
import com.supcon.orchid.orm.entities.ICookie;
import com.supcon.orchid.foundation.entities.Document;
import com.supcon.orchid.foundation.entities.Staff;
import com.supcon.orchid.foundation.entities.SystemCode;
import com.supcon.orchid.foundation.services.CompanyService;
import com.supcon.orchid.foundation.services.CookieService;
import com.supcon.orchid.foundation.services.StaffService;
import com.supcon.orchid.foundation.services.DocumentService;
import com.supcon.orchid.foundation.services.SystemCodeService;
import com.supcon.orchid.ec.services.ViewServiceFoundation;
import com.supcon.orchid.services.IViewServiceFoundation;
import com.supcon.orchid.ec.services.BusinessCenterService;
import com.supcon.orchid.ec.services.CreatorService;
import com.supcon.orchid.ec.services.ConditionService;
import com.supcon.orchid.ec.services.ModelServiceFoundation;
import com.supcon.orchid.ec.services.PrintService;
import com.supcon.orchid.ec.services.ViewServiceFoundation;
import com.supcon.orchid.ec.entities.AdvQueryCondition;
import com.supcon.orchid.ec.entities.CustomPropertyViewMapping;
import com.supcon.orchid.ec.entities.CustomerCondition;
import com.supcon.orchid.ec.entities.BusinessCenter;
import com.supcon.orchid.ec.entities.Model;
import com.supcon.orchid.ec.entities.Property;
import com.supcon.orchid.ec.entities.DataClassific;
import com.supcon.orchid.ec.entities.DataGrid;
import com.supcon.orchid.ec.entities.View;
import com.supcon.orchid.ec.enums.DbColumnType;
import com.supcon.orchid.ec.enums.ViewType;
import com.supcon.orchid.orm.enums.CompanyType;
import com.supcon.orchid.services.BAPException;
import com.supcon.orchid.services.BAPException.Code;
import com.supcon.orchid.services.ExportExcelAble;
import com.supcon.orchid.services.IUserFieldPermissionService;
import com.supcon.orchid.foundation.services.ImportService;
import com.supcon.orchid.services.Page;
import java.util.List;
import java.util.regex.Matcher;

import java.util.regex.Pattern;
import com.supcon.orchid.foundation.entities.UploadInfo;
import com.supcon.orchid.foundation.exceptions.ImportValidateException;
import com.supcon.orchid.foundation.exceptions.ImportSaveException;
import org.jbpm.api.model.Transition;
import org.jbpm.api.model.Activity;

import com.supcon.orchid.workflow.engine.entities.Deployment;
import com.supcon.orchid.workflow.engine.entities.Task;
import com.supcon.orchid.workflow.engine.entities.Pending;
import com.supcon.orchid.workflow.engine.services.ProcessService;
import com.supcon.orchid.workflow.engine.services.TaskService;
import com.supcon.orchid.workflow.engine.entities.WorkFlowVar;
import com.supcon.orchid.workflow.engine.exceptions.WorkFlowException;
import com.supcon.orchid.RM.entities.RMFormulaProcessActive;
import com.supcon.orchid.RM.services.RMFormulaProcessActiveService;
import com.supcon.orchid.MESBasic.entities.MESBasicProduct;
import com.supcon.orchid.MESBasic.services.MESBasicProductService;
import com.supcon.orchid.RM.entities.RMPrecessStandards;
import com.supcon.orchid.RM.services.RMPrecessStandardsService;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import java.util.Iterator;
import com.supcon.orchid.ec.enums.ShowType;
import com.supcon.orchid.ec.entities.DataGrid;

 
/* CUSTOM CODE START(action,import,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
import com.supcon.orchid.RM.entities.RMFormula;
import com.supcon.orchid.RM.services.RMFormulaService;
/* CUSTOM CODE END */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class RMFormulaProcessAction extends BAPEntityConfGenericActionSupport implements Preparable, ExportExcelAble<RMFormulaProcess> {
	private static final long serialVersionUID = 1L;
	@Resource
	protected SystemCodeService systemCodeService;
	@Resource
	ViewServiceFoundation viewServiceFoundation;
	@Resource
	ConditionService conditionService;
	@Resource
	private RMFormulaProcessService formulaProcessService;
	@Resource
	private CreatorService creatorService;
	@Resource
	private CookieService cookieService;
    @Resource
	private StaffService _staffService;
	@Resource
	private SessionFactory sessionFactory;
	private IUserFieldPermissionService userFieldPermissionService;
	@Resource
	private RMFormulaProcessActiveService formulaProcessActiveService;
	@Resource
	private MESBasicProductService productService;
	@Resource
	private RMPrecessStandardsService precessStandardsService;
	
	@Resource
	private ImportService importService;
	@Resource
	private NotificationService notificationService;

	private Long id;
	private String exportFetchDataMethod;
	private String dealInfoGroup;
	private String ids;
	private String retJson;
	private String includes;
	private String callBackFuncName;
	private String condition;
	private RMFormulaProcess formulaProcess;
	private CreatorInfo creatorInfo;
	private String tableProcessKey;
	private String refUrl;
	private String classifyCodes;
	private String workFlowVarStatus;
	private String scriptCode;
	private String rt;//return type;
	private int currentSqlType = Sql.TYPE_LIST_PENDING;
	private String viewCode = null;
	private String permissionCode = null;
	private String layoutViewCode = null;
	private String pendingIds;
	private String outcomeStr;
	private Boolean flowBulkFlag = false;
	private Boolean hasAttachment = false;
	private Boolean hasSupervision = false;
	private Boolean hasPayCloseAttention = false;
	private List<Param> params = null;
	private int showNumber;
	private String pendingBeginDate;
	private String pendingEndDate;
	private Boolean dealFlag;
	private Integer dealSet;
	private String datagridCode;
	private String datagridName;
	private File dataFile;
	private String xlsResult;
	private String fileName;
	private InputStream inputStream;
	private String tid;
	private String xlsSize;
	private Long refId;
	private String time;
	private String downloadType;
	private String orgName;
	private String viewShowType;
	private String useInBusiness;
	//文件类型
	private String fileType;
	
	private String listCustomCondition;
	private String listFirstCustomCond;
	
	private Boolean mainContent;
	private Boolean attachmentInfo;
	private Boolean dealInfo;
	
	private String propertyCode;
	
	private Long treeId;
	
	//用于office控件
	private String sign;
	private String handSign;
	private String signMark;
	private String handSignMark;
	private String officeDeal;
	private String officeDate;
	
	private long treecid;
	private long pid;
	private int cindex;
	private String uploadDocIds;//附件ID
	
	private Boolean isReplace = false;
	private Boolean isIgnore = false;
	private Boolean isBatch = false;
	
	private String sortResult;
	
	private Boolean graduallyReject;
	
	
	//导出的sql
	private String  exportSql="";
	
	//是否生成标志
	private  Boolean  generateFlag=false;
	
	//查询配置
	private String  queryConfig;
	
	//导入时必须的数据
	private List<Map<String, String>> data = new ArrayList<Map<String, String>>();
	
	//导出数据包装的map
	private Map<String, Object> map = new HashMap<String, Object>();
	

	//取出该类所有属性标志位
	private Boolean getAllProperties = false;
	
	//查询标志
	private Boolean noQueryFlag=false;
	
	//是否用于导入的标志
	private Boolean useForImportFlag=false;
	
	//模型编码或者datagridCode
	private  String  templateRelatedModelCode;
	//传入导入模板中用于生成自定义字段相关信息
	private Map<String,Object> customPropData;
	
	private static final String LISTSHOWTYPE="LISTPT";
	
	private static final String DATAGRIDSHOWTYPE="DATAGRID";
	
	//视图显示的自定义字段的属性信息
	private Map<String,List>  showCustomProps;
	//是否导出辅模型的标志
	private Boolean exportAuxiliaryModelFlag=false;
	
	//excel字段的style
	List<Map> styleFormats = new ArrayList<Map>();
	//导出excel时,主模型内容
	List<RMFormulaProcess> queryResults = new ArrayList<RMFormulaProcess>();
	
	
	
	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	
	
	public Boolean getGetAllProperties() {
		return getAllProperties;
	}

	public void setGetAllProperties(Boolean getAllProperties) {
		this.getAllProperties = getAllProperties;
	}
	
	
	public String getQueryConfig() {
		return queryConfig;
	}

	public void setQueryConfig(String queryConfig) {
		this.queryConfig = queryConfig;
	}
	
	
	public Boolean getNoQueryFlag() {
		return noQueryFlag;
	}

	public void setNoQueryFlag(Boolean noQueryFlag) {
		this.noQueryFlag = noQueryFlag;
	}
	
	public String getTemplateRelatedModelCode() {
		return templateRelatedModelCode;
	}

	public void setTemplateRelatedModelCode(String templateRelatedModelCode) {
		this.templateRelatedModelCode = templateRelatedModelCode;
	}
	
	public Map<String, Object> getCustomPropData() {
		return customPropData;
	}

	public void setCustomPropData(Map<String, Object> customPropData) {
		this.customPropData = customPropData;
	}

	public Boolean getExportAuxiliaryModelFlag() {
		return exportAuxiliaryModelFlag;
	}

	public void setExportAuxiliaryModelFlag(Boolean exportAuxiliaryModelFlag) {
		this.exportAuxiliaryModelFlag = exportAuxiliaryModelFlag;
	}
	
	public Boolean getUseForImportFlag() {
		return useForImportFlag;
	}

	public void setUseForImportFlag(Boolean useForImportFlag) {
		this.useForImportFlag = useForImportFlag;
	}
	
	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
			
	public Boolean getIsReplace() {
		return isReplace;
	}

	public void setIsReplace(Boolean isReplace) {
		this.isReplace = isReplace;
	}
	
	public Boolean getIsIgnore() {
		return isIgnore;
	}
	
	public void setIsIgnore(Boolean isIgnore) {
		this.isIgnore = isIgnore;
	}
	
	public Boolean getIsBatch() {
		return isBatch;
	}
	
	public void setIsBatch(Boolean isBatch) {
		this.isBatch = isBatch;
	}
	
	public Boolean getGraduallyReject() {
		return graduallyReject;
	}

	public void setGraduallyReject(Boolean graduallyReject) {
		this.graduallyReject = graduallyReject;
	}
	
	public void setSortResult(String sortResult){
		this.sortResult = sortResult;
	}
	
	public String getSortResult(){
		return this.sortResult;
	}
	public String getDealInfoGroup(){
		return this.dealInfoGroup;
	}
	
	public void setDealInfoGroup(String dealInfoGroup){
		this.dealInfoGroup = dealInfoGroup;
	}

	private Object[] importServices;
	
	private Object[] searchObjects;
	
	public Object[] getSearchObjects() {
		return searchObjects;
	}

	public void setSearchObjects(Object[] searchObjects) {
		this.searchObjects = searchObjects;
	}
	
	public String getUploadDocIds() {
		return uploadDocIds;
	}

	public void setUploadDocIds(String uploadDocIds) {
		this.uploadDocIds = uploadDocIds;
	}
	
	public long getTreecid() {
		return treecid;
	}

	public void setTreecid(long treecid) {
		this.treecid = treecid;
	}

	public Boolean getHasSupervision(){
		return this.hasSupervision;
	}

	public Boolean getHasPayCloseAttention() {
		return this.hasPayCloseAttention;
	}

	public long getPid() {
		return pid;
	}

	public void setPid(long pid) {
		this.pid = pid;
	}
	
	public int getCindex() {
		return cindex;
	}

	public void setCindex(int cindex) {
		this.cindex = cindex;
	}
	
	public String getPermissionCode(){
		return permissionCode;
	}
	
	public void setPermissionCode(String permissionCode){
		this.permissionCode = permissionCode;
	}
	
	public String getLayoutViewCode() {
		return layoutViewCode;
	}

	public void setLayoutViewCode(String layoutViewCode) {
		this.layoutViewCode = layoutViewCode;
	}
	
	/**
	 * @return the officeDate
	 */
	public String getOfficeDate() {
		return officeDate;
	}

	/**
	 * @param officeDate the officeDate to set
	 */
	public void setOfficeDate(String officeDate) {
		this.officeDate = officeDate;
	}
	
	/**
	 * @return the officeDeal
	 */
	public String getOfficeDeal() {
		return officeDeal;
	}

	/**
	 * @param officeDeal the officeDeal to set
	 */
	public void setOfficeDeal(String officeDeal) {
		this.officeDeal = officeDeal;
	}
	
	/**
	 * @return the sign
	 */
	public String getSign() {
		return sign;
	}

	/**
	 * @param sign the sign to set
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * @return the handSign
	 */
	public String getHandSign() {
		return handSign;
	}

	/**
	 * @param handSign the handSign to set
	 */
	public void setHandSign(String handSign) {
		this.handSign = handSign;
	}

	/**
	 * @return the signMark
	 */
	public String getSignMark() {
		return signMark;
	}

	/**
	 * @param signMark the signMark to set
	 */
	public void setSignMark(String signMark) {
		this.signMark = signMark;
	}

	/**
	 * @return the handSignMark
	 */
	public String getHandSignMark() {
		return handSignMark;
	}

	/**
	 * @param handSignMark the handSignMark to set
	 */
	public void setHandSignMark(String handSignMark) {
		this.handSignMark = handSignMark;
	}
	
	public Long getTreeId() {
		return treeId;
	}
	
	public void setTreeId(Long treeId) {
		this.treeId = treeId;
	}
	
	public String getPropertyCode() {
		return propertyCode;
	}

	public void setPropertyCode(String propertyCode) {
		this.propertyCode = propertyCode;
	}
		
	public String getUseInBusiness() {
		return useInBusiness;
	}

	public void setUseInBusiness(String useInBusiness) {
		this.useInBusiness = useInBusiness;
	}
	
	public String getListCustomCondition() {
		return listCustomCondition;
	}

	public void setListCustomCondition(String listCustomCondition) {
		this.listCustomCondition = listCustomCondition;
	}
	
	public String getListFirstCustomCond() {
		return listFirstCustomCond;
	}

	public void setListFirstCustomCond(String listFirstCustomCond) {
		this.listFirstCustomCond = listFirstCustomCond;
	}
	
	public String getViewShowType() {
		return viewShowType;
	}

	public void setViewShowType(String viewShowType) {
		this.viewShowType = viewShowType;
	}
	
	public void setViewCode(String viewCode) {
		this.viewCode = viewCode;
	}

	public String getViewCode() {
		return viewCode;
	}
	
	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	public String getDownloadType() {
		return downloadType;
	}

	public void setDownloadType(String downloadType) {
		this.downloadType = downloadType;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	public Long getRefId() {
		return refId;
	}

	public void setRefId(Long refId) {
		this.refId = refId;
	}
	
	public String getXlsSize() {
		return xlsSize;
	}

	public void setXlsSize(String xlsSize) {
		this.xlsSize = xlsSize;
	}
	
	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}
	
	public InputStream getInputStream() throws Exception {
		if("template".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "template/views/RM/formula/formulaProcess/" + getFileName()));
		}else if("mainTemplate".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "template/views/RM/formula/formulaProcess/" + getFileName()));
		}else if("mainError".equals(downloadType)){
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "error/RM_7.5.0.0_formula_FormulaProcess" + File.separator + viewCode + File.separator + time + File.separator + getFileName()));
		}else{
			inputStream = new FileInputStream(new File(PropertyHolder.get().getWorkspacePath() + File.separator + "error/" + datagridCode + File.separator + time + File.separator + getFileName()));
			orgName = URLEncoder.encode(orgName, "utf-8");
		}
		return inputStream;
	}
	
	public String getFileName() {
		String returnName = null;
		if("template".equals(downloadType)){
			returnName = "importExcel-" + fileName + ".xls";
		}else if("mainTemplate".equals(downloadType)){
			returnName = fileName;
		}else if("customizeExport".equals(downloadType)){
			returnName = fileName + ".xls";
		}else{
			returnName = orgName;
		}
		return returnName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getXlsResult() {
		return xlsResult;
	}

	public void setXlsResult(String xlsResult) {
		this.xlsResult = xlsResult;
	}
	
	public File getDataFile() {
		return dataFile;
	}

	public void setDataFile(File dataFile) {
		this.dataFile = dataFile;
	}
	
	public String getDatagridName(){
		return datagridName;
	}
	
	public void setDatagridName(String datagridName){
		this.datagridName = datagridName;
	}
	
	public String getDatagridCode() {
		return datagridCode;
	}

	public void setDatagridCode(String datagridCode) {
		this.datagridCode = datagridCode;
	}

	public Boolean getDealFlag() {
		return dealFlag;
	}

	public void setDealSet(Integer dealSet) {
		this.dealSet = dealSet;
	}
	public Integer getDealSet() {
		return dealSet;
	}

	public void setDealFlag(Boolean dealFlag) {
		this.dealFlag = dealFlag;
	}
	
	public Boolean getMainContent() {
		return mainContent;
	}

	public void setMainContent(Boolean mainContent) {
		this.mainContent = mainContent;
	}
	
	public Boolean getAttachmentInfo() {
		return attachmentInfo;
	}

	public void setAttachmentInfo(Boolean attachmentInfo) {
		this.attachmentInfo = attachmentInfo;
	}
	
	public Boolean getDealInfo() {
		return dealInfo;
	}

	public void setDealInfo(Boolean dealInfo) {
		this.dealInfo = dealInfo;
	}

	@Autowired
	public void setUserFieldPermissionService(IUserFieldPermissionService userFieldPermissionService) {
		this.userFieldPermissionService = userFieldPermissionService;
	}

	public void setPendingBeginDate(String pendingBeginDate) {
		this.pendingBeginDate = pendingBeginDate;
	}
	
	public String getPendingBeginDate() {
		return pendingBeginDate;
	}
	
	public void setPendingEndDate(String pendingEndDate) {
		this.pendingEndDate = pendingEndDate;
	}
	
	public String getPendingEndDate() {
		return pendingEndDate;
	}
	
	public void setShowNumber(int showNumber) {
		this.showNumber = showNumber;
	}
	
	private String dataTableSortColKey;
	private String dataTableSortColName;
	private String dataTableSortColOrder;
	
	public String getDataTableSortColKey() {
		return dataTableSortColKey;
	}
	
	public void setDataTableSortColKey(String dataTableSortColKey) {
		this.dataTableSortColKey = dataTableSortColKey;
	}
	
	public String getDataTableSortColName() {
		return dataTableSortColName;
	}
	
	public void setDataTableSortColName(String dataTableSortColName) {
		this.dataTableSortColName = dataTableSortColName;
	}
	
	public String getDataTableSortColOrder() {
		return dataTableSortColOrder;
	}
	
	public void setDataTableSortColOrder(String dataTableSortColOrder) {
		this.dataTableSortColOrder = dataTableSortColOrder;
	}
	
	public Boolean getFlowBulkFlag() {
		return flowBulkFlag;
	}
	public void setFlowBulkFlag(Boolean flowBulkFlag) {
		this.flowBulkFlag = flowBulkFlag;
	}
	
	public String getPendingIds() {
		return pendingIds;
	}
	public void setPendingIds(String pendingIds) {
		this.pendingIds = pendingIds;
	}
	public String getOutcomeStr() {
		return outcomeStr;
	}
	public void setOutcomeStr(String outcomeStr) {
		this.outcomeStr = outcomeStr;
	}
	
	public void setRt(String rt) {
		this.rt = rt;
	}
	public String getScriptCode() {
		return scriptCode;
	}

	public void setScriptCode(String scriptCode) {
		this.scriptCode = scriptCode;
	}
	
	public String getTableProcessKey() {
		return tableProcessKey;
	}

	public void setTableProcessKey(String tableProcessKey) {
		this.tableProcessKey = tableProcessKey;
	}

	public String getWorkFlowVarStatus() {
		return workFlowVarStatus;
	}


	public void setWorkFlowVarStatus(String workFlowVarStatus) {
		this.workFlowVarStatus = workFlowVarStatus;
	}

	private String workFlowMenuCode;
	
	public String getWorkFlowMenuCode() {
		return workFlowMenuCode;
	}

	public void setWorkFlowMenuCode(String workFlowMenuCode) {
		this.workFlowMenuCode = workFlowMenuCode;
	}
	private String entityCode;
	private List<RMFormulaProcess> formulaProcesss;
	
	public List<RMFormulaProcess> getFormulaProcesss() {
		return formulaProcesss;
	}
	public String getEntityCode() {
		return entityCode;
	}
	public void setEntityCode(String entityCode) {
		this.entityCode = entityCode;
	}
	private String viewselect;
	public void setViewselect(String viewselect) {
		this.viewselect = viewselect;
	}
	public String getViewselect() {
		return viewselect;
	}
	public String getRefUrl() {
		return refUrl;
	}

	public void setRefUrl(String refUrl) {
		this.refUrl = refUrl;
	}
	
	public String getClassifyCodes() {
		return classifyCodes;
	}

	public void setClassifyCodes(String classifyCodes) {
		this.classifyCodes = classifyCodes;
	}
	
	public void setCallBackFuncName(String callBackFuncName) {
		this.callBackFuncName = callBackFuncName;
	}
	public String getCallBackFuncName() {
		return this.callBackFuncName;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getCondition() {
		return this.condition;
	}
	public String getRetJson() {
		return retJson;
	}
	public void setIncludes(String includes) {
		this.includes = includes;
	}

	private Page<RMFormulaProcess> page;
	
	private Long tableInfoId;
	private Integer dealDefaulCount=50;
	
	private Boolean expandDealInof=true;
	
	 @Resource
	 private BusinessCenterService businessCenterService;
	 
	 @Resource
	 private ModelServiceFoundation modelServiceFoundation;
	 
	 @Resource
	 private ViewServiceFoundation ViewServiceFoundation;
	 
	 @Resource
	 private  IViewServiceFoundation iViewServiceFoundation;
	 
	 private List<BusinessCenter> businessCenterList;
	 
	 public List<BusinessCenter> getBusinessCenterList() {
			return businessCenterList;
	}
	public void setBusinessCenterList(List<BusinessCenter> businessCenterList) {
		this.businessCenterList = businessCenterList;
	}
	public  BusinessCenter businessCenter;
	private Long mainBusinessId;
	private String businessCenterCode;
	private String businessParam;
	
	public String getBusinessParam() {
		return businessParam;
	}
	public void setBusinessParam(String businessParam) {
		this.businessParam = businessParam;
	}
	public String getBusinessCenterCode() {
		return businessCenterCode;
	}
	public void setBusinessCenterCode(String businessCenterCode) {
		this.businessCenterCode = businessCenterCode;
	}
	public Long getMainBusinessId() {
		return mainBusinessId;
	}
	public void setMainBusinessId(Long mainBusinessId) {
		this.mainBusinessId = mainBusinessId;
	}
	public BusinessCenter getBusinessCenter() {
		return businessCenter;
	}
	public void setBusinessCenter(BusinessCenter businessCenter) {
		this.businessCenter = businessCenter;
	}
	
	private List<Object[]> dealInfoData;
	
	private Boolean groupByTask = false;
	private Map<String, List<Object[]>> dealInfoDataMap;
	
	/**
	 * @return the dealInfoDataMap
	 */
	public Map<String, List<Object[]>> getDealInfoDataMap() {
		return dealInfoDataMap;
	}

	/**
	 * @param dealInfoDataMap the dealInfoDataMap to set
	 */
	public void setDealInfoDataMap(Map<String, List<Object[]>> dealInfoDataMap) {
		this.dealInfoDataMap = dealInfoDataMap;
	}
	
	/**
	 * @return the groupByTask
	 */
	public Boolean getGroupByTask() {
		return groupByTask;
	}

	/**
	 * @param groupByTask the groupByTask to set
	 */
	public void setGroupByTask(Boolean groupByTask) {
		this.groupByTask = groupByTask;
	}
	
	public List<Object[]> getDealInfoData() {
		return dealInfoData;
	}

	public void setDealInfoData(List<Object[]> dealInfoData) {
		this.dealInfoData = dealInfoData;
	}
	
	public Integer getDealDefaulCount() {
		return dealDefaulCount;
	}

	public void setDealDefaulCount(Integer dealDefaulCount) {
		this.dealDefaulCount = dealDefaulCount;
	}
	
	public Boolean getExpandDealInof() {
		return expandDealInof;
	}

	public void setExpandDealInof(Boolean expandDealInof) {
		this.expandDealInof = expandDealInof;
	}
	
	@Override
	public void prepare() throws Exception {
		if (null == id) {
			formulaProcess = new RMFormulaProcess();
		} else {
			if(id > 0){
				formulaProcess = formulaProcessService.getFormulaProcess(id, viewCode);
			}
		}
		if(null!=businessCenterCode){
			businessCenter=businessCenterService.getBusinessCenter(businessCenterCode);
		}
		
	}
	
	public Page<RMFormulaProcess> getPage() {
		if (null == page) {
			page = new Page<RMFormulaProcess>(1, (getIsMobile() ? 10 : 20));
		}
		return page;
	}
	public Long getTableInfoId(){return this.tableInfoId;}
	public void setTableInfoId(Long tableInfoId){this.tableInfoId = tableInfoId;}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getExportFetchDataMethod() {
		return exportFetchDataMethod;
	}
	public void setExportFetchDataMethod(String exportFetchDataMethod) {
		this.exportFetchDataMethod = exportFetchDataMethod;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public RMFormulaProcess getFormulaProcess() {
		return formulaProcess;
	}		

	public void setFormulaProcess(RMFormulaProcess formulaProcess) {
		this.formulaProcess = formulaProcess;
	}

	public boolean getNotifyEnabled() {
		return notificationService.notifyEnabled();
	}

	/**
	 * 根据ID，返回需要的内容
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
	@Action(value = "/RM/formula/formulaProcess/get", results = { @Result(type = JSON_PLAIN, params = { "root", "retJson" }) })
	public String _get() throws Exception{
		if(id == null) {
			return SUCCESS;
		}
		retJson = formulaProcessService.getFormulaProcessAsJSON(id, includes);
		return SUCCESS;
	}
	/**
	 * 根据ID，返回大字段内容
	 * 
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
	@Action(value = "/RM/formula/formulaProcess/edit-extra-col")
	public String _editExtraCol() throws Exception{
		Struts2Utils.renderXml("");
	
		return null;
	}
	
	@Resource
	private CompanyService _companyService;
	/** 部门公选页面，公司切换列表 */
	private List<Company> companyList = new ArrayList<Company>();
	/** 部门公选页面，进行公司切换时，传递公司id */
	private Long companyId;
	
	/**
	 * @return the companyId
	 */
	public Long getCompanyId() {
		return companyId;
	}

	/**
	 * @param companyId the companyId to set
	 */
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	/**
	 * @return the companyList
	 */
	public List<Company> getCompanyList() {
		return companyList;
	}

	/**
	 * @param companyList the companyList to set
	 */
	public void setCompanyList(List<Company> companyList) {
		this.companyList = companyList;
	}
	/**
	 * RM.modelname.randon1487140927408
	 *
	 * @return Dispatcher Result
	 * @throws Exception
	 */
		public String formulaProcessReferenceCopy() throws Exception{
			RMFormulaProcess oldFormulaProcess = null;
			if(isEditNew()){
				this.creatorInfo = creatorService.getCurrent();
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						bc.setUrl("");
						bc.setCount(0);
					}
				}
				oldFormulaProcess = new RMFormulaProcess();
			}else{
			if(null!=entityCode){
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						//String url=businessCenterService.getBusinessUrl(bc,formulaProcess.getId().toString());
						String url = bc.getAssview().getUrl();
						int count=businessCenterService.getBusinessCount(bc, formulaProcess.getId());
						//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
						bc.setViewCode(bc.getAssview().getCode());
						bc.setUrl(url);
						bc.setCount(count);
					}
				}
				}
				oldFormulaProcess = formulaProcessService.getFormulaProcess(id);
			}
			
			
			formulaProcess = formulaProcessService.getFormulaProcess(refId);
			Model model = modelServiceFoundation.getModel("RM_7.5.0.0_formula_FormulaProcess");
			List<Property> pros = modelServiceFoundation.findProperties(model);
			for(Property p : pros){
				if((p.getIsBussinessKey()!=null&&p.getIsBussinessKey())||(p.getIsInherent()!=null&&p.getIsInherent())){
					String setMethod = "set" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					String getMethod = "get" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					try{
						Method getValue = RMFormulaProcess.class.getMethod(getMethod, null);
						Class returnType = getValue.getReturnType();
						Object gValue = getValue.invoke(oldFormulaProcess, null);
						Method setValue = RMFormulaProcess.class.getMethod(setMethod, new Class[]{returnType});
						setValue.invoke(formulaProcess, gValue);
					}catch(Exception e){
						logger.debug(e.getMessage());
					}
				}
			}
			bapAfterCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "referenceCopy");
			return SUCCESS;
		}
	
	
	/**
	 *  编辑视图公用主方法
	 */
	@Actions({
		
		@Action(value = "/RM/formula/formulaProcess/processActiveEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "processActiveEdit.ftl") }),
		@Action(value = "/RM/formula/formulaProcess/processActiveEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "processActiveEditPrint.ftl")})
		,
		@Action(value = "/RM/formula/formulaProcess/processEdit",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "processEdit.ftl") }),
		@Action(value = "/RM/formula/formulaProcess/processEditPrint",interceptorRefs={@InterceptorRef(value="orchidFullStack")},results = { @Result(type = FREEMARKER, location = "processEditPrint.ftl")})
	})
	public String viewEdit() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		View printView = viewServiceFoundation.getView(viewCode);
		String printName=request.getRequestURI().replaceAll("^.*/"+printView.getName(),"").replaceAll(".action$", "");
		bapBeforeCustomMethod(viewCode, viewName);
		bap_validate_datagrids=formulaProcessService.findValidateDatagrids(getDgClassMap());
		if (null != entityCode) {
			businessCenterList = businessCenterService.getBusinessCenters(entityCode);
		}
		if(refId !=null && refId > 0){
			return formulaProcessReferenceCopy();
		}
		if(isEditNew()){
			this.creatorInfo = creatorService.getCurrent();
			if (null != businessCenterList && !businessCenterList.isEmpty()) {
				for(BusinessCenter bc:businessCenterList){
					bc.setUrl("");
					bc.setCount(0);
				}
			}
		} else {
			formulaProcess = formulaProcessService.getFormulaProcess(this.formulaProcess.getId(), viewCode);
			if(null!=entityCode){
				if (null != businessCenterList && !businessCenterList.isEmpty()) {
					for(BusinessCenter bc:businessCenterList){
						//String url=businessCenterService.getBusinessUrl(bc,formulaProcess.getId().toString());
						String url = bc.getAssview().getUrl();
						int count=businessCenterService.getBusinessCount(bc, formulaProcess.getId());
						//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
						bc.setViewCode(bc.getAssview().getCode());
						bc.setUrl(url);
						bc.setCount(count);
					}
				}
			}
			
		}
		bapAfterCustomMethod(viewCode, viewName);
		if(null != printName && !printName.equals("")){
			formulaProcessService.print(0);
		}
		return SUCCESS;
	}
	
	
	/**
	 *  查看视图公用主方法
	 */
	public String viewView() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		View printView = viewServiceFoundation.getView(viewCode);
		String printName=request.getRequestURI().replaceAll("^.*/"+printView.getName(),"").replaceAll(".action$", "");
		bapBeforeCustomMethod(viewCode, viewName);
		bap_validate_datagrids=formulaProcessService.findValidateDatagrids(getDgClassMap());
		if(null!=entityCode){
			businessCenterList = businessCenterService.getBusinessCenters(entityCode);
			for(BusinessCenter bc:businessCenterList){
				//String url=businessCenterService.getBusinessUrl(bc,formulaProcess.getId().toString());
				String url = bc.getAssview().getUrl();
				int count=businessCenterService.getBusinessCount(bc, formulaProcess.getId());
				//bc.setViewCode(ViewServiceFoundation.getViewByUrl(url).getCode());
				bc.setViewCode(bc.getAssview().getCode());
				bc.setUrl(url);
				bc.setCount(count);
			}
		}
		bapAfterCustomMethod(viewCode, viewName);
		if(null != printName && !printName.equals("")){
			formulaProcessService.print(0);
		}
		return SUCCESS;
	}
	
	/**
	 *  列表视图公用主方法
	 */
	public String viewList() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		bapBeforeCustomMethod(viewCode, viewName);
		bap_validate_datagrids=formulaProcessService.findValidateDatagrids(getDgClassMap());
		if(null!=mainBusinessId&&null!=businessCenterCode){
			businessParam=businessCenterService.getBusinessParamUrl(businessCenterCode, mainBusinessId.toString());
		}
		bapAfterCustomMethod(viewCode, viewName);
		return SUCCESS;
	}
	
	/**
	 *  布局视图公用主方法
	 */
	public String viewLayout() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		bapBeforeCustomMethod(viewCode, viewName);
		View layoutView = ViewServiceFoundation.getView(viewCode);
		Map confMap = layoutView.getExtraView().getConfigMap();
		if (confMap != null) {
			Map layoutMap = (Map) confMap.get("layout");
			if (layoutMap != null) {
				for (Object key : layoutMap.keySet()) {
					Map lay = (Map) layoutMap.get(key);
					if (lay.get("ctype") != null
							&& lay.get("ctype").equals("tree")) {
						if (lay.get("tree_model") != null
								&& (lay.get("tree_model")
										.equals("sysbase_1.0_department_base_department")
									|| lay.get("tree_model")
										.equals("sysbase_1.0_position_base_position"))) {
							if (lay.get("tree_crossCompanyFlag") != null
									&& lay.get("tree_crossCompanyFlag").equals("yes")) {
								companyList = new ArrayList<Company>();
								Company currentCompany;
								if (companyId == null || companyId.equals("")) {
									currentCompany = (Company) session.get("company");
								} else {
									currentCompany = _companyService.load(companyId);
								}
								List<Company> list = _companyService.getAllUnitCompanies();
								if (currentCompany.getType().equals(CompanyType.GROUP)) {
									companyList.add(0, (Company) _companyService.getGroupCompany());
								}
								companyList.addAll(list);
							}
						}
					}
				}
			}
		}
		bapAfterCustomMethod(viewCode, viewName);
		return SUCCESS;
	}
	
	/**
	 *  助记码视图公用主方法
	 */

	public String mneClient() throws Exception {
		if(request.getAttribute("ViewCode")==null){
			return null;
		}
		String mneViewCode = request.getAttribute("ViewCode").toString();
		this.params = new ArrayList<Param>();
		bapBeforeCustomMethod(mneViewCode, "mneClient");
		String searchContent = null;
		String isCrossCompany = "";
		StringBuilder conditionStr = new StringBuilder();
		Map mnecodeset=null;
		StringBuffer sb = new StringBuffer("id");
		View MneView=ViewServiceFoundation.getView(mneViewCode);
		Map confMap=MneView.getExtraView().getConfigMap();
		Map layoutMap = (Map) confMap.get("layout");
		List<Map> ls = (List<Map>) layoutMap.get("sections");
		for(Map lm:ls){
			List<Map> lc = (List<Map>) lm.get("cells");
			for(Map lk:lc){
				sb.append(",").append(lk.get("key"));
			}
			mnecodeset=(Map)lm.get("mnecodeset");
		}
		if(showNumber <= 0&&mnecodeset!=null&&mnecodeset.get("showNumber")!=null) {
			showNumber = Integer.valueOf(mnecodeset.get("showNumber").toString());
		}
		String[] params,columns;
		columns = sb.toString().split(",");
		String[] searchContents = request.getParameterValues("searchContent");
		boolean customerRule = false;
		if (null != searchContents && searchContents.length > 0) {
			searchContent = searchContents[0];
			if(searchContent.contains("*")){
				customerRule = true;
			}
			searchContent = com.supcon.orchid.utils.StringUtils.escape(searchContent);
		}
		Object[] oparams = new Object[2];
		//如输入字符串中包含 * 则不自动添加%
		if(customerRule){
			oparams[0] = searchContent;
		} else {
			oparams[0] = searchContent + '%';
		}
		params = request.getParameterValues("conditionParams");
		if(null != params && params.length > 0) {
			if(!"".equals(params[0]) && params[0].trim().length() > 0) {
				conditionStr.append(" AND (").append(params[0]).append(")");
			}
		}
		Boolean cross = false;
		String[] isCrossCompanys = request.getParameterValues("isCrossCompany");
		if (null != isCrossCompanys && isCrossCompanys.length > 0) {
			isCrossCompany = isCrossCompanys[0];
			if(null != isCrossCompany && "true".equals(isCrossCompany)) {
				cross = true;
			}
		}
		String refViewCode=request.getParameter("refViewCode");
		String currentViewCode=request.getParameter("currentViewCode");
		if (refViewCode != null && refViewCode.trim().length() > 0) {
			View refView = ViewServiceFoundation.getView(refViewCode);
		    if(null!=refView&&ShowType.LAYOUT2.equals(refView.getShowType()))  {
		    	//布局视图取其中的片段的自定义条件,但权限还是根据布局视图
				Map configMap = ViewServiceFoundation.getExtraViewFullConfigMap(refView);
				Map layout = (Map) configMap.get("layout");
				if (layout != null && !layout.isEmpty()) {
					Map center = (Map) layout.get("center");
					if (center != null && !center.isEmpty()) {
					    if(null!=center.get("vcode"))  {
							String listCode = center.get("vcode").toString();
							if (null != listCode && !listCode.isEmpty()) {
								generateCustomerCondition(listCode);
							}
						}
					}
				}
			}else {
				generateCustomerCondition(refViewCode);
			}
		} else if (currentViewCode != null && currentViewCode.trim().length() > 0) {
			generateCustomerCondition(currentViewCode);
		} else {
			generateCustomerCondition(mneViewCode);
		}
		String currentSqlType=request.getParameter("currentSqlType");
		String realPermissionCode=request.getParameter("realPermissionCode");
		this.params.add(new Param("mneValues", oparams[0]));
		
		if (mnecodeset != null
				&& "true".equals(mnecodeset.get("isTransCondition").toString())
				&& mnecodeset.get("conditionContent") != null
				&& !"".equals(mnecodeset.get("conditionContent").toString()
						.trim())) {
			conditionStr.append(" AND ("+mnecodeset.get("conditionContent").toString()+")");
		}
		try {
			List<Object[]> list = formulaProcessService.mneCodeSearch(mneViewCode,showNumber,cross,this.params,refViewCode,currentViewCode,currentSqlType,realPermissionCode);
			if (!list.isEmpty()) {
				StringBuilder json = new StringBuilder();
				json.append('[');
				for (int i = 0; i < list.size(); i++) {
					if (i > 0) {
						json.append(',');
					}
					json.append('"');
					int count = 0;
					for (int j = 0; j < list.get(i).length; j++) {
						if(userFieldPermissionService.findFieldPermission("RM_7.5.0.0_formula_FormulaProcess", columns[j], null) != 0) {
							if (count++ > 0) {
								json.append("$$BAP$$");
							}
							json.append(columns[j]);
							json.append("@@BAP@@");
							json.append(list.get(i)[j]);
						}	
					}
					json.append('"');
				}
				json.append(']');
				bapAfterCustomMethod(mneViewCode, "mneClient");
				Struts2Utils.render(Struts2Utils.JSON_TYPE, json.toString());
				return null;
			}
			bapAfterCustomMethod(mneViewCode, "mneClient");
			Struts2Utils.render(Struts2Utils.JSON_TYPE, "null");
			return null;
		} finally {
			showNumber = 5;
			searchContent = null;
			params = null;
		}
	}
	
	/**
	 *  参照视图、树视图、树参照视图、摘要视图公用主方法
	 */
	@Actions({
		
		@Action(value = "/RM/formula/formulaProcess/processRef", results = { @Result(type = FREEMARKER, location = "processRef.ftl") })
	})
	public String viewOther() throws Exception{
		String viewCode=request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		bapBeforeCustomMethod(viewCode, viewName);
		bapAfterCustomMethod(viewCode, viewName);
		return SUCCESS;
	}
	
	
	
	
	/**
	 *  列表视图公用数据查询方法
	 */
	public String viewListQuery() throws Exception{
		viewCode = request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		View listView = ViewServiceFoundation.getView(viewCode);
		params = new ArrayList<Param>();
		params.add(new Param("\"formulaProcess\".VALID", true, Param.LIKE_UNSUPPORT, "BOOLEAN"));
		bapBeforeCustomMethod(viewCode, viewName+"Query");
		setFieldPermissionModelCode(listView.getAssModel().getCode());
		Map<String,String> oneToManyParams = new HashMap<String,String>();
		if (null != request.getParameter("advQueryCond") && request.getParameter("advQueryCond").trim().length() > 0) {
			params.add(new Param("advQueryCond", request.getParameter("advQueryCond"), Param.LIKE_ALL));
		}
		if (null != request.getParameter("classifyCodes") && request.getParameter("classifyCodes").trim().length() > 0) {
			params.add(new Param("classifyCodes", request.getParameter("classifyCodes")));
		}
		if (null != getDataTableSortColKey() && getDataTableSortColKey().length() > 0) {
			String sortColKey = getDataTableSortColKey();
			if (null != getDataTableSortColName() && getDataTableSortColName().length() > 0) {
				sortColKey += "::" + getDataTableSortColName();
			}
			params.add(new Param("dataTable-sortColKey", sortColKey));
		}
		if (null != getDataTableSortColOrder() && getDataTableSortColOrder().length() > 0) {
			params.add(new Param("dataTable-sortColOrder", getDataTableSortColOrder()));
		}
					if (null != request.getParameter("fastQueryCond") && request.getParameter("fastQueryCond").trim().length() > 0) {
				params.add(new Param("fastQueryCond", request.getParameter("fastQueryCond"), Param.LIKE_ALL));
			}
		if(null!=mainBusinessId&&null!=businessCenterCode){
			Param pm=businessCenterService.businessSql("\"formulaProcess\"",businessCenterCode, mainBusinessId);
			params.add(pm);
		}
		if(null != oneToManyParams && !oneToManyParams.isEmpty()) {
			params.add(new Param("extraQueryCond", oneToManyParams, Param.LIKE_ALL));
		}
		Model assmodel= modelServiceFoundation.getModel(listView.getAssModel().getCode());
		Set<Property> properties = assmodel.getProperties();
		Map<String,String> fieldMap=new HashMap<String, String>();
		for (Property p : properties) {
			fieldMap.put(p.getName(), p.getColumnName());
		}
		if(listView.getUsedForTree()&&listView.getAssTreeModelCode()!=null){
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".id") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".id").trim().length() > 0) {
				params.add(new Param("\"tree-id-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("id"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".id"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec").trim().length() > 0) {
				if(listView.getIncludeChildren()){
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.EQUAL_LIKELEFT));
				}else{
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.LIKE_UNSUPPORT));
				}
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo").trim().length() > 0) {
				params.add(new Param("\"tree-layNo-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layNo"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId").trim().length() > 0) {
				params.add(new Param("\"tree-"+listView.getAssTreeModelCode()+"\"."+Inflector.getInstance().columnize("parentId"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId"),Param.LIKE_UNSUPPORT,"LONG"));
			}
		}
		if(listView.getAssModel().getDataType()== 2){
			if (null != request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec") && request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec").trim().length() > 0) {
				params.add(new Param("\""+firstLatterToLowerCase(listView.getAssModel().getModelName())+"\"."+fieldMap.get("layRec"), request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec"), Param.EQUAL_LIKELEFT));
			}
		}
		currentSqlType = Sql.TYPE_LIST_QUERY;
		hasAttachment = listView.getHasAttachment();
		generateCustomerCondition(viewCode);
		generateClassificCondition();
		//fieldFlag 暂定为zzsqd的内容
		//fieldFlag = ",*,dsyj,requestPerson.name,requestDept.name,name,createStaff.name,zzry.testSysCode,zzry.testEnum,";
		//fieldFlag = ",*,";
		if(getPage().isExportFlag()) {
			exportAuxiliaryModelFlag = page.isExportAuxiliaryModel();
			bapAfterCustomMethod(viewCode, viewName+"Query");
			formulaProcessService.excelExport();
			return "excel";
		} else {
			if(listView.getOnlyForQuery()){
				searchObjects = new Object[1];
				searchObjects[0] = 1;
			}
			findExportDataInfos(getPage());
			bapAfterCustomMethod(viewCode, viewName+"Query");
			if(listView.getDataGridType()==1){
				response.setContentType("text/xml;charset=UTF-8");
				if (null != rt && rt.length() > 0){if("json".equals(rt)) return SUCCESS; return rt;}
				return "xml";
			}else{
				return SUCCESS;
			}
		}
		
	}
	
	/**
	 *  列表视图公用GetRequireData方法
	 */
	public String viewListGetRequireData() throws Exception{
		viewCode = request.getAttribute("ViewCode").toString();
		data = ViewServiceFoundation.getRequireData(viewCode,getAllProperties);
		map.put("data", data);
		return  SUCCESS;
	}
	
	/**
	 *  参照视图公用数据查询方法
	 */
	@Actions({
	
		@Action(value = "/RM/formula/formulaProcess/processRef-query", results = { @Result(type = JSON, params = { "root", "page", "excludes", "*", "includes",
			"first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,treeToSurfaceMode,result.pending.id,result.pending.taskDescription,result.pending.openUrl,result.pending.userId,result.tableInfoId,result.id,result.version,result.layRec,result.status,result.tableNo,result.name,result.processType.name,result.longTime,result.meno,result.processType.id,result.attrMap.*"})
			,@Result(name="excel",type="excel",location="processRef-xmlexport.ftl", params = { "root", "page", "defaultAmount", "50000", "defaultSize", "1000" })
			})
	})
	public String viewReferenceQuery() throws Exception{
		viewCode = request.getAttribute("ViewCode").toString();
		String viewName=request.getAttribute("ViewName").toString();
		params = new ArrayList<Param>();
		View listView = ViewServiceFoundation.getView(viewCode);
		boolean crossCompanyFlag = false;
		if(null != request.getParameter("crossCompanyFlag")){
			crossCompanyFlag = Boolean.parseBoolean(request.getParameter("crossCompanyFlag"));
		}
		params.add(new Param("crossCompanyFlag", crossCompanyFlag, Param.EQUAL_LIKELEFT, "BOOLEAN"));
		params.add(new Param("\"formulaProcess\".VALID", true, Param.LIKE_UNSUPPORT, "BOOLEAN"));
		bapBeforeCustomMethod(viewCode, viewName+"Query");
		setFieldPermissionModelCode(listView.getAssModel().getCode());
		Map<String,String> oneToManyParams = new HashMap<String,String>();
		if (null != request.getParameter("advQueryCond") && request.getParameter("advQueryCond").trim().length() > 0) {
			params.add(new Param("advQueryCond", request.getParameter("advQueryCond"), Param.LIKE_ALL));
		}
		if (null != request.getParameter("classifyCodes") && request.getParameter("classifyCodes").trim().length() > 0) {
			params.add(new Param("classifyCodes", request.getParameter("classifyCodes")));
		}
		if (null != getDataTableSortColKey() && getDataTableSortColKey().length() > 0) {
			String sortColKey = getDataTableSortColKey();
			if (null != getDataTableSortColName() && getDataTableSortColName().length() > 0) {
				sortColKey += "::" + getDataTableSortColName();
			}
			params.add(new Param("dataTable-sortColKey", sortColKey));
		}
		if (null != getDataTableSortColOrder() && getDataTableSortColOrder().length() > 0) {
			params.add(new Param("dataTable-sortColOrder", getDataTableSortColOrder()));
		}
					if (null != request.getParameter("fastQueryCond") && request.getParameter("fastQueryCond").trim().length() > 0) {
				params.add(new Param("fastQueryCond", request.getParameter("fastQueryCond"), Param.LIKE_ALL));
			}
		if(null!=mainBusinessId&&null!=businessCenterCode){
			Param pm=businessCenterService.businessSql("\"formulaProcess\"",businessCenterCode, mainBusinessId);
			params.add(pm);
		}
		if(null != oneToManyParams && !oneToManyParams.isEmpty()) {
			params.add(new Param("extraQueryCond", oneToManyParams, Param.LIKE_ALL));
		}
		Model assmodel= modelServiceFoundation.getModel(listView.getAssModel().getCode());
		Set<Property> properties = assmodel.getProperties();
		Map<String,String> fieldMap=new HashMap<String, String>();
		for (Property p : properties) {
			fieldMap.put(p.getName(), p.getColumnName());
		}
		if(listView.getUsedForTree()&&listView.getAssTreeModelCode()!=null){
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".id") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".id").trim().length() > 0) {
				params.add(new Param("\"tree-id-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("id"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".id"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec").trim().length() > 0) {
				if(listView.getIncludeChildren()){
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.EQUAL_LIKELEFT));
				}else{
					params.add(new Param("\"tree-layRec-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layRec"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layRec"),Param.LIKE_UNSUPPORT));
				}
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo").trim().length() > 0) {
				params.add(new Param("\"tree-layNo-"+listView.getAssTreeModelCode()+"\"."+fieldMap.get("layNo"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".layNo"),Param.LIKE_UNSUPPORT,"LONG"));
			}
			if (null != request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId") && request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId").trim().length() > 0) {
				params.add(new Param("\"tree-"+listView.getAssTreeModelCode()+"\"."+Inflector.getInstance().columnize("parentId"),request.getParameter("tree-"+listView.getAssTreeModelCode()+".parentId"),Param.LIKE_UNSUPPORT,"LONG"));
			}
		}
		if(listView.getAssModel().getDataType()== 2){
			if (null != request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec") && request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec").trim().length() > 0) {
				params.add(new Param("\""+firstLatterToLowerCase(listView.getAssModel().getModelName())+"\"."+fieldMap.get("layRec"), request.getParameter(fLTL(listView.getAssModel().getModelName())+".layRec"), Param.EQUAL_LIKELEFT));
			}
		}
		Map confMap=null;
		if(listView.getIsShadow()){
			confMap=listView.getShadowView().getExtraView().getConfigMap();
		}else{
			confMap=listView.getExtraView().getConfigMap();
		}
		if(confMap!=null){
			Map listProperty=(Map)confMap.get("listProperty");
			if(listProperty!=null&&listProperty.get("isTransCondition")!=null&&listProperty.get("isTransCondition").equals("true")){
				if(listProperty.get("conditionContent")!=null&&!listProperty.get("conditionContent").equals("")){
					params.add(new Param("referenceCondition",listProperty.get("conditionContent").toString(), Param.LIKE_ALL));
				}
			}
		}
		hasAttachment = listView.getHasAttachment();
		generateCustomerCondition(viewCode);
		generateClassificCondition();
		currentSqlType = Sql.TYPE_LIST_REFERENCE;
		if(getPage().isExportFlag()) {
			exportAuxiliaryModelFlag = page.isExportAuxiliaryModel();
			bapAfterCustomMethod(viewCode, viewName+"Query");
			formulaProcessService.excelExport();
			return "excel";
		} else {
			findExportDataInfos(getPage());
			bapAfterCustomMethod(viewCode, viewName+"Query");
			return SUCCESS;
		}
	}	
	
	
	private String parseSqlCondition(String sql, List<Object> list){
		Pattern p = Pattern.compile("\\$\\{(.+?),(.+?)\\}");
		Matcher m =	p.matcher(sql);
		while(m.find()){
			String str = m.group();
			String value = request.getParameter(m.group(1));
			String type = m.group(2);
			if("int".equals(type)){
				Integer integer = new Integer(value);
				list.add(integer);
			}else if("date".equals(type)){
				Date date = new Date(value);
				list.add(date);
			}else if("double".equals(type)){
				Double doubles = new Double(value);
				list.add(doubles);
			}else if("long".equals(type)){
				Long longs = new Long(value);
				list.add(longs);
			}else if("string".equals(type)){
				list.add(value);
			}else if("method".equals(type)){
				value = m.group(1);
				try {
					list.add(Ognl.getValue(value, this));
				} catch (Exception e) {
					logger.info(e.getMessage());
				}
			}else{
				list.add(value);
			}
			sql = sql.replace(str, "?");
		}
		return sql;
	}
	
	private AdvQueryCondition parseJsonCondition(String jsonString){
		Pattern p = Pattern.compile("\\$\\{(.*?)\\}");
		Matcher m =	p.matcher(jsonString);
		while(m.find()){
			String str = m.group();
			String value = request.getParameter(m.group(1)); //request.getParameter(str.substring(2, str.length()-1));
			if(value != null){
				jsonString = jsonString.replace(str, value);
			}else{
				jsonString = jsonString.replace(str, "");
			}
		}
		return conditionService.toSql(jsonString);
	}
	
	
	private void generateCustomerCondition(String viewCode){
		View v = viewServiceFoundation.getView(viewCode);
		if(v!= null && v.getIsShadow()!=null && v.getIsShadow()){
			View shadow = v.getShadowView();
			if(shadow != null){
				viewCode = shadow.getCode();
			}
		}
		CustomerCondition ccon = viewServiceFoundation.findCustomerConditionByViewCode(viewCode);
		if(ccon!=null && ccon.getSql()!=null && ccon.getSql().length()>0){
			String customerSql = ccon.getSql();
			List<Object> list = new ArrayList<Object>();
			customerSql = parseSqlCondition(customerSql, list);
			params.add(new Param("customerSql", customerSql));
			params.add(new Param("customerSqlValues", list));
		}else if(ccon!=null && ccon.getJsonCondition()!=null && ccon.getJsonCondition().length()>0){
			String jsonString = ccon.getJsonCondition();
			AdvQueryCondition acon = parseJsonCondition(jsonString);
			String customer = acon.getSql();
			List<Object> customerValue = acon.getValues();
			params.add(new Param("customerCondition", customer));
			params.add(new Param("customerValues", customerValue));
		}
	}
	
	private void generateClassificCondition(){
		if (null != getClassifyCodes()) {
			String classifyCodes = getClassifyCodes();
			String[] classifyCodeArray = classifyCodes.split(",");
			Map<String, List<Map<String, List<Object>>>> groupMap = new HashMap<String, List<Map<String, List<Object>>>>();
			//Map<String, List<Object>> classifyMap = new HashMap<String, List<Object>>();
			AdvQueryCondition advCondition = null;
			for(int i = 0; i < classifyCodeArray.length; i++){
				if(!classifyCodeArray[i].startsWith("bap:adv:classific:")) {
					CustomerCondition cuscon = viewServiceFoundation.findCustomerConditionByClassificCode(classifyCodeArray[i]);
					DataClassific dc = viewServiceFoundation.getDataClassific(classifyCodeArray[i]);
					Map<String, List<Object>> classifyMap = new HashMap<String, List<Object>>();
					boolean flag = false;
					if(cuscon != null && cuscon.getSql() !=null && cuscon.getSql().length() > 0){
						flag = true;
						String customerSql = cuscon.getSql();
						List<Object> list = new ArrayList<Object>();
						customerSql = parseSqlCondition(customerSql, list);
						classifyMap.put(customerSql, list);
						
					}else if(cuscon != null && cuscon.getJsonCondition() != null && cuscon.getJsonCondition().length() > 0){
						flag = true;
						String jsonString = cuscon.getJsonCondition();
						AdvQueryCondition acon = parseJsonCondition(jsonString);
						String customer = acon.getSql();
						if(customer!=null){
							List<Object> customerValue = acon.getValues();
							classifyMap.put(customer, customerValue);
						}
					}
					if(flag){
						if(groupMap.containsKey(dc.getDataGroup().getCode())){
							List<Map<String, List<Object>>> temp = groupMap.get(dc.getDataGroup().getCode());
							temp.add(classifyMap);
						}else{
							List<Map<String, List<Object>>> temp = new ArrayList<Map<String, List<Object>>>();
							temp.add(classifyMap);
							groupMap.put(dc.getDataGroup().getCode(), temp);
						}
					}
				} else {
					String idStr = classifyCodeArray[i].substring(classifyCodeArray[i].lastIndexOf(":") + 1);
					advCondition = conditionService.getAdvQueryConditionAndSubs(Long.parseLong(idStr));
					advCondition = conditionService.toSql(advCondition);
				}
			}
			
			String totalClassifySql = "";
			List<Object> classObjs = new ArrayList<Object>();
			if(groupMap != null && groupMap.size() > 0){
				for(Map.Entry<String, List<Map<String, List<Object>>>> bentry : groupMap.entrySet()){
					if(bentry.getValue()!=null){
						for(Map<String, List<Object>> classifyMap : bentry.getValue()){
							if(classifyMap!=null && classifyMap.size()>0){
								if(totalClassifySql.length() > 0){
									totalClassifySql += " AND ";
								}
								if(classifyMap.size() > 1) {
									totalClassifySql += " ( ";
								}
								String classifySql = "";
								for(Map.Entry<String, List<Object>> entry : classifyMap.entrySet()){
									classifySql = classifySql + " OR " + entry.getKey();
									if(entry.getValue()!=null && entry.getValue().size() > 0){
										classObjs.addAll(entry.getValue());
									}
								}
								classifySql = classifySql.substring(3);
								totalClassifySql += classifySql;
								if(classifyMap.size() > 1) {
									totalClassifySql += " ) ";
								}
							}
						}
					}
				}
			}
			if(null != advCondition) {
				StringBuilder advSql = new StringBuilder();
				List<Object> advValue = new ArrayList<Object>();
				if(null != advCondition.getValues() && !advCondition.getValues().isEmpty()) {
					if(totalClassifySql.length() > 0){
						advSql.append(" AND ");
					}
					advSql.append(advCondition.getSql());
					advValue.addAll(advCondition.getValues());
					totalClassifySql += advSql;
					classObjs.addAll(advValue);
				}
			}
			params.add(new Param("classifySql", totalClassifySql));
			params.add(new Param("classifySqlValues", classObjs));
		}
	}
	
	@Override
	public int findFieldPermission(String modelCode, String propertyKey) {
		return userFieldPermissionService.findFieldPermission(modelCode, propertyKey, null);
	}	
	
	private String bap_validate_datagrids;
		
	public String getBap_validate_datagrids() {
		return bap_validate_datagrids;
	}
	
	// DataGrid 修改后公用方法 Start 
	
	private String fLTU(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToUpper(str);
	}
	
	private String fLTL(String str){
		return com.supcon.orchid.utils.StringUtils.firstLetterToLower(str);
	}
	
	private Page dgPage;
	public Page getDgPage(){
		if(null == dgPage){
			dgPage = new Page(1,20);
		}
		return dgPage;
	}
	
	private Map<String,Class> dgClassMap;
	
	public Map<String, Class> getDgClassMap() {
		if(null==dgClassMap){
			dgClassMap=new HashMap<String, Class>();
		}
		return dgClassMap;
	}
	
	public String dataGridRefCopy(DataGrid dg) throws Exception{
		Model model = dg.getTargetModel();
		String artifact=model.getEntity().getModule().getArtifact();
		Class dgclass=Class.forName("com.supcon.orchid."+artifact+".entities."+model.getJpaName());
		setFieldPermissionModelCode(model.getCode());
		List<Property> pros = modelServiceFoundation.findProperties(model);
		formulaProcessService.findDataGridPage(dg,dgclass,getDgPage(),formulaProcess,"", null);
		if(model.getDataType()==2){
			Class thisclass=this.getClass();
			Field serviceField=thisclass.getDeclaredField(fLTL(model.getModelName())+"Service");
			Class serviceType=serviceField.getType();
			serviceType.getMethod("convertTree",java.util.List.class).invoke(serviceField.get(this), getDgPage().getResult());
		}
		List newList = new ArrayList();
		for(int i = 0; i < dgPage.getResult().size(); i++){
			Object oRecord = dgPage.getResult().get(i);
			Object emptyRecord = dgclass.newInstance();
			for(Property p : pros){
				if (!((p.getIsBussinessKey() != null && p.getIsBussinessKey()) || (p.getIsInherent() != null && p.getIsInherent()))) {
					String setMethod = "set" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					String getMethod = "get" + p.getName().replaceFirst(p.getName().substring(0, 1), p.getName().substring(0, 1).toUpperCase());
					try{
						Method getValue = dgclass.getMethod(getMethod, null);
						Class returnType = getValue.getReturnType();
						Object gValue = getValue.invoke(oRecord, null);
						Method setValue = null;
						setValue = dgclass.getMethod(setMethod, new Class[]{returnType});
						setValue.invoke(emptyRecord, gValue);
					}catch(Exception e){
						logger.debug(e.getMessage());
					}
				}
			}
			if(model.getDataType()==2){
				dgclass.getMethod("setLayRec",String.class).invoke(emptyRecord,dgclass.getMethod("getLayRec",null).invoke(oRecord,null).toString());
				dgclass.getMethod("setFullPathName",String.class).invoke(emptyRecord,OrchidUtils.getMainDisplayValue(oRecord).toString());
				dgclass.getMethod("setLayNo",Integer.class).invoke(emptyRecord,Integer.valueOf(dgclass.getMethod("getLayNo",null).invoke(oRecord,null).toString()));
				dgclass.getMethod("set_code",String.class).invoke(emptyRecord,dgclass.getMethod("getId",null).invoke(oRecord,null).toString());
				dgclass.getMethod("set_parentCode",String.class).invoke(emptyRecord,dgclass.getMethod("getParentId",null).invoke(oRecord,null).toString());
				dgclass.getMethod("setIsParent",Boolean.class).invoke(emptyRecord,Boolean.valueOf(dgclass.getMethod("getIsParent",null).invoke(oRecord,null).toString()));
				dgclass.getMethod("setLeaf",Boolean.class).invoke(emptyRecord,Boolean.valueOf(dgclass.getMethod("isLeaf",null).invoke(oRecord,null).toString()));
			}
			List<String> multiKey =new ArrayList<String>();
			Map confMap=dg.getConfigMap();
			Map layoutMap = (Map) confMap.get("layout");
			List<Map> ls = (List<Map>) layoutMap.get("sections");
			for(Map lm:ls){
				if(lm.get("regionType").equals("DATAGRID")){
					List<Map> lc = (List<Map>) lm.get("cells");
					for(Map lk:lc){
						if("MULTSELECT".equals(lk.get("showType"))&&lk.get("key")!=null){
							multiKey.add(lk.get("key").toString());
						}
					}
				}
			}
			if(multiKey.size()>0){
				for(String key:multiKey){
					dgclass.getMethod("set"+fLTU(key)+"multiselectIDs", String.class).invoke(emptyRecord, dgclass.getMethod("get"+fLTU(key)+"multiselectIDs",null).invoke(oRecord,null).toString());
					dgclass.getMethod("set"+fLTU(key)+"multiselectNames", String.class).invoke(emptyRecord, dgclass.getMethod("get"+fLTU(key)+"multiselectNames",null).invoke(oRecord,null).toString());
				}
			}
			newList.add(emptyRecord);
		}
		dgPage.setResult(newList);
		if (null != rt && rt.length() > 0){if("json".equals(rt)) return SUCCESS; return rt;}
		if(dg.getEx()){
			return "xml";
		}else{
			return SUCCESS;
		}
	}
	
	private Map<String,String> dgDeletedIds;
	
	public Map<String, String> getDgDeletedIds() {
		if(null==dgDeletedIds){
			dgDeletedIds=new HashMap<String, String>();
		}
		return dgDeletedIds;
	}
	
	private Map<String,String> dgLists;
	
	public Map<String, String> getDgLists() {
		if(null==dgLists){
			dgLists=new HashMap<String, String>();
		}
		return dgLists;
	}
	
	// DataGrid 修改后公用方法  End 
	
	
	private Page<RMFormulaProcessActive> dg1487554913298Page;
	public Page<RMFormulaProcessActive> getDg1487554913298Page(){
		if(null == dg1487554913298Page){
			dg1487554913298Page = new Page<RMFormulaProcessActive>(1,20);
		}
		return dg1487554913298Page;
	}
	
	private Class dg1487554913298Clazz = RMFormulaProcessActive.class;
	
	public Class getDg1487554913298Clazz() {
		return dg1487554913298Clazz;
	}
	
	private List<RMFormulaProcessActive> dg1487554913298List;
	public List<RMFormulaProcessActive> getDg1487554913298List(){
		if(null == dg1487554913298List){
			dg1487554913298List = new ArrayList<RMFormulaProcessActive>();
		}
		return dg1487554913298List;
	}
	public void setDg1487554913298ListJson(String json) {
		//dg1487554913298List = (List<RMFormulaProcessActive>) formulaProcessService.generateObjectFromJson(json, RMFormulaProcessActive.class);
	}
	
	private List<Long> dg1487554913298DeletedIds;
	public List<Long> getDg1487554913298DeletedIds(){
		if(null == dg1487554913298DeletedIds){
			dg1487554913298DeletedIds = new ArrayList<Long>();
		}
		return dg1487554913298DeletedIds;
	}

	private Page<RMPrecessStandards> dg1487555065561Page;
	public Page<RMPrecessStandards> getDg1487555065561Page(){
		if(null == dg1487555065561Page){
			dg1487555065561Page = new Page<RMPrecessStandards>(1,20);
		}
		return dg1487555065561Page;
	}
	
	private Class dg1487555065561Clazz = RMPrecessStandards.class;
	
	public Class getDg1487555065561Clazz() {
		return dg1487555065561Clazz;
	}
	
	private List<RMPrecessStandards> dg1487555065561List;
	public List<RMPrecessStandards> getDg1487555065561List(){
		if(null == dg1487555065561List){
			dg1487555065561List = new ArrayList<RMPrecessStandards>();
		}
		return dg1487555065561List;
	}
	public void setDg1487555065561ListJson(String json) {
		//dg1487555065561List = (List<RMPrecessStandards>) formulaProcessService.generateObjectFromJson(json, RMPrecessStandards.class);
	}
	
	private List<Long> dg1487555065561DeletedIds;
	public List<Long> getDg1487555065561DeletedIds(){
		if(null == dg1487555065561DeletedIds){
			dg1487555065561DeletedIds = new ArrayList<Long>();
		}
		return dg1487555065561DeletedIds;
	}

	@Actions({
		
		@Action(value = "/RM/formula/formulaProcess/data-dg1487554913298", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.name,result.activeType.id,result.activeType.value,result.occurTurn.id,result.occurTurn.value,result.exeOrder,result.longTime,result.batchSite.id,result.batchSite.value,result.product.productName,result.isReplace,result.standardQuantity,result.ingredientsOrder,result.auto,result.exeBillName,result.activeHiddenId,result.meno,result.id,result.version,result.processId.id,result.qualityStandard.id,result.formulaId.id,result.testProduct.id,result.product.id" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1487554913298-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1487554913298.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		,
		@Action(value = "/RM/formula/formulaProcess/data-dg1487555065561", results = { 
		@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.quota,result.stValue,result.overrunFlag,result.limitInter,result.upperLimit,result.maxLimit,result.lowerLimit,result.loweMxLimit,result.fluctuateFlag,result.flucUpperLimit,result.flucLowerLimit,result.id,result.version,result.processId.id,result.activeId.id" }),
		@Result(name="xml",type = "freemarkerXml",location="data-dg1487555065561-xml.ftl"),
		@Result(name="excel",type="excel",location="export-dg1487555065561.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
	})
	public String dataGridData() throws Exception{
		DataGrid dg=null;
		if(datagridCode!=null&&!"".equals(datagridCode)){
			dg=ViewServiceFoundation.getDataGrid(datagridCode, "runtime");
		}else{
			String dataGridName=request.getRequestURI().replaceAll("^.*/data-","").replaceAll(".action$", "");
			dg=ViewServiceFoundation.getDataGridByName(dataGridName, "runtime");
			datagridCode=dg.getCode();
		}
		Model model=dg.getTargetModel();
		bapBeforeCustomMethod(datagridCode,dg.getName());
		if(refId!=null&&refId>0){
			dataGridRefCopy(dg);
		}else{
			setFieldPermissionModelCode(model.getCode());
			String searchCondition = "";
			List<Object> params = new ArrayList<Object>();
			CustomerCondition ccon = viewServiceFoundation.findCustomerConditionByDatagridCode(datagridCode);
			if(null != ccon && ccon.getSql()!=null && ccon.getSql().length()>0){
				String customerSql = ccon.getSql();
				Pattern p = Pattern.compile("\\$\\{(.+?),(.+?)\\}");
				Matcher m =	p.matcher(customerSql);
				List<Object> list = new ArrayList<Object>();
				while(m.find()){
					String str = m.group();
					//String[] strs = str.substring(2, str.length()-1).split(",");
					String value = request.getParameter(m.group(1)); //request.getParameter(str.substring(2, str.length()-1));
					String type = m.group(2);
					if("int".equals(type)){
						Integer integer = new Integer(value);
						list.add(integer);
					}else if("date".equals(type)){
						Date date = new Date(value);
						list.add(date);
					}else if("double".equals(type)){
						Double doubles = new Double(value);
						list.add(doubles);
					}else if("long".equals(type)){
						Long longs = new Long(value);
						list.add(longs);
					}else if("string".equals(type)){
						list.add(value);
					}else if("method".equals(type)){
						value = m.group(1);
						try {
							list.add(Ognl.getValue(value, this));
						} catch (Exception e) {
							logger.info(e.getMessage());
						}
					}else{
						list.add(value);
					}
					customerSql = customerSql.replace(str, "?");
				}
				searchCondition += customerSql;
				params.addAll(list);
			}else if(null != ccon && ccon.getJsonCondition()!=null && ccon.getJsonCondition().length()>0){
				String jsonString = ccon.getJsonCondition();
				Pattern p = Pattern.compile("\\$\\{(.*?)\\}");
				Matcher m =	p.matcher(jsonString);
				while(m.find()){
					String str = m.group();
					String value = request.getParameter(m.group(1));
					if(value != null){
						jsonString = jsonString.replace(str, value);
					}else{
						jsonString = jsonString.replace(str, "");
					}
				}
				AdvQueryCondition advQuery = conditionService.toSql(jsonString);
				String s = advQuery.getSql();
				if(advQuery.getSql()!=null){
					searchCondition += advQuery.getSql();
				}
				params.addAll(advQuery.getValues());
			}
			String artifact=model.getEntity().getModule().getArtifact();
			Class dgclass=Class.forName("com.supcon.orchid."+artifact+".entities."+model.getJpaName());
			formulaProcessService.findDataGridPage(dg,dgclass,getDgPage(),formulaProcess,searchCondition,params);
			if(null != dgPage && null != dgPage.getResult() && !dgPage.getResult().isEmpty()){
				List<String> attachKey =new ArrayList<String>();
				Map confMap=dg.getConfigMap();
				Map layoutMap = (Map) confMap.get("layout");
				List<Map> ls = (List<Map>) layoutMap.get("sections");
				for(Map lm:ls){
					if(lm.get("regionType").equals("DATAGRID")){
						List<Map> lc = (List<Map>) lm.get("cells");
						for(Map lk:lc){
							if("PROPERTYATTACHMENT".equals(lk.get("columnType"))&&lk.get("key")!=null){
								attachKey.add(lk.get("key").toString());
							}
						}
					}
				}
				if(attachKey.size()>0){
					Map<String,String> param=new HashMap<String, String>();
					for(Object item : dgPage.getResult()){
						String docType=dgclass.getDeclaredField("DOC_TYPE").get(null).toString();
						Long itemid=(Long)dgclass.getMethod("getId").invoke(item);
						List<Document> documents = documentService.getByLinkIdAndType(itemid, docType);
						if(null != documents){
							for(String key:attachKey){
								Object orgIds=dgclass.getMethod("get"+fLTU(key)+"MultiFileIds").invoke(item);
								Object orgNames=dgclass.getMethod("get"+fLTU(key)+"MultiFileNames").invoke(item);
								if(orgIds==null){
									param.put(key+"MultiFileIds",null);
								}else{
									param.put(key+"MultiFileIds",orgIds.toString());
								}
								if(orgNames==null){
									param.put(key+"MultiFileNames",null);
								}else{
									param.put(key+"MultiFileNames",orgNames.toString());
								}
							}
							for(Document doc : documents){
								for(String key:attachKey){
									if(null != doc.getPropertyCode()){
										if(dgclass.getDeclaredField(key.toUpperCase()+"_PROPERTY_CODE").get(null).equals(doc.getPropertyCode())){
											if(null == param.get(key+"MultiFileIds")){
												param.put(key+"MultiFileIds",doc.getId().toString());
												param.put(key+"MultiFileNames",doc.getName());
											} else {
												param.put(key+"MultiFileIds",param.get(key+"MultiFileIds")+","+doc.getId().toString());
												param.put(key+"MultiFileNames",param.get(key+"MultiFileNames")+","+doc.getName());
											}
										}
									}
								}
							}
							for(String key:attachKey){
								dgclass.getDeclaredMethod("set"+fLTU(key)+"MultiFileIds", String.class).invoke(item, param.get(key+"MultiFileIds"));
								dgclass.getDeclaredMethod("set"+fLTU(key)+"MultiFileNames", String.class).invoke(item, param.get(key+"MultiFileNames"));
							}
						}
					}
				}
			}
		}
		Field[] fields = this.getClass().getDeclaredFields();
		for (Field f : fields) {
			if (f.getName().equals(dg.getName() + "Page")) {
				f.set(this, getDgPage());
			}
		}
		bapAfterCustomMethod(datagridCode, dg.getName());
		if (null != rt && rt.length() > 0){if("json".equals(rt)) return SUCCESS; return rt;}
		if(getDgPage().isExportFlag()) {
			getDgPage().setShowCusProps(generateShowCusPros(DATAGRIDSHOWTYPE,datagridCode));
			formulaProcessService.excelExport();
			return "excel";
		}else{
			if(dg.getEx()){
				return "xml";
			}else{
				return SUCCESS;
			}
		}
	}
	// =============================================================================================
	private String operateType;
	public String getOperateType() {
		return operateType;
	}
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	private void save() throws Exception {
		if(null == formulaProcess.getId()) {
			responseMap.put("operate", "add");
		} else {
			responseMap.put("operate", "edit");
		}
		formulaProcessService.saveFormulaProcess(formulaProcess,dgLists,dgDeletedIds,(Map<String, Object>)request.getAttribute("__orchid_ass_fileuploads__"),viewCode,null);
		
		
		responseMap.put("dealSuccessFlag", true);
		responseMap.put("operateType", "save");
		responseMap.put("viewselect", viewselect);
	}
	@Actions({
		@Action(value = "/RM/formula/formulaProcess/processActiveEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
		,@Action(value = "/RM/formula/formulaProcess/processEdit/submit", results = { @Result(type = "text", params = { "root", "responseMap" }) })
	})
	public String submit() throws Exception{
		bapBeforeCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "submit");
		bap_validate_datagrids=formulaProcessService.findValidateDatagrids(getDgClassMap());
			save();
			responseMap.put("id", formulaProcess.getId());

		Map<String, Object> fileuploads = (Map<String, Object>) request.getAttribute("__orchid_fileuploads__");
		if(null == fileuploads){
			fileuploads = new HashMap<String, Object>();
		}
		fileuploads.put("linkId", formulaProcess.getId());
		bapAfterCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "submit");
		return SUCCESS;
	}
	@Action(value = "/RM/formula/formulaProcess/delete", results = { @Result(type = JSON, params = { "root", "msg" }) })
	public String delete() throws Exception {
		bapBeforeCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "delete");
		formulaProcessService.deleteFormulaProcess(ids);
		msg = new ResponseMsg(true);
		bapAfterCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "delete");
		return SUCCESS;
	}
	
	

	Integer findExportDataInfosCount = 1;//findExportDataInfos执行次数，导出时，只有第一次需要添加样式
	@Override
	public Page<RMFormulaProcess> findExportDataInfos(Page<RMFormulaProcess> page) {
		if(page.isExportFlag())  {
			View view=viewServiceFoundation.getView(viewCode);
			if(queryConfig.trim().isEmpty())  {
				return getPage();
			}
			if(!generateFlag)  {
				List<Map> exportMaps =new ArrayList<Map>();
				
				String supplyConfig = "";
				if(useForImportFlag){//主模型没有选中导出的必填字段一定导出
					List<Property> properties = modelServiceFoundation.findProperties(view.getAssModel());
			       	List<String> runningCustomPropertyCode = formulaProcessService.getRunningCustomProperties(view.getAssModel().getCode());//已启用的自定义字段
			       	for(Property p : properties){
			       		if(!p.getNullable() && (p.getIsCustom() && runningCustomPropertyCode.contains(p.getCode())) && !queryConfig.contains(p.getCode()) ){
			       			if(p.getType() != null && !p.getType().toString().equals("OBJECT")){
			       				supplyConfig += generteAuxXml(p);
							}
			       			if(p.getType() != null && p.getType().toString().equals("OBJECT")){
								String assProperty = formulaProcessService.getAssProperty(p.getCode());	
								//assProperty = assProperty.substring(0, assProperty.lastIndexOf("_"));
								String assModelCode = formulaProcessService.getPropertyModelCode(assProperty);
								Model assModel = modelServiceFoundation.getModel(assModelCode);
								List<Property> assProperties = modelServiceFoundation.findProperties(assModel);
								
								//获取模型中Id对应的数据库列名
								String idColumnName = "ID";
								for(Property ap : assProperties){
									if(ap.getName()!=null && ap.getName().equals("id")){
										idColumnName = ap.getColumnName();
									}
								}
								
								for(Property ap : assProperties){
									if((ap.getIsMainDisplay() && !ap.getName().equals("id")) || ap.getIsBussinessKey()){
										supplyConfig += generteAuxObjXml(p, ap, assModel, idColumnName, view.getAssModel());
									}
								}
							}
			       		}
			       	}
		       	}
				if(supplyConfig.length()>0){
					queryConfig = queryConfig.substring(0, queryConfig.lastIndexOf("</list>")) + supplyConfig + "</list>";
				}
				
				//解析xml
				exportMaps=parseXml(queryConfig);
				//存储cookie
				if(exportMaps.size()>0)  {
					page.setCustomerExport(true);
				}else {
					page.setCustomerExport(false);
				}
				page.setUseForImportFlag(useForImportFlag);
				page.setExportAuxiliaryModelFlag(exportAuxiliaryModelFlag);
				saveExportCookie(viewCode,queryConfig);
				page.setProperties(exportMaps);
				for(Map m : exportMaps){
					Property p = modelServiceFoundation.findPropertyByCode(m.get("propertyCode").toString(),null);
					if(p !=null && p.getDecimalNum() != null && p.getDecimalNum() > 0){
						m.put("decimalNum", p.getDecimalNum());
					}else{
						m.put("decimalNum", 0);
					}
				}
				List<Map> thisStyleFormats = generateStyleFormats(exportMaps,null);
				if(findExportDataInfosCount == 1){
					styleFormats.addAll(thisStyleFormats);
				}
				page.setStyleFormats(styleFormats);
				exportSql=generteCustomerSql(view,exportMaps);
			}
		}
		if(exportAuxiliaryModelFlag){
			this.generateFlag = false;
		}
		if(null != searchObjects && searchObjects.length > 0) {
			formulaProcessService.findFormulaProcesss(getPage(), viewCode, currentSqlType, tableProcessKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql, searchObjects);
		} else {
			formulaProcessService.findFormulaProcesss(getPage(), viewCode, currentSqlType, tableProcessKey, flowBulkFlag, hasAttachment, params, permissionCode, noQueryFlag, exportSql);
		}
		if(getPage().isExportFlag() && getPage().getResult() != null && getPage().getResult().size() > 0) {//主模型查询结果存到一个list中，用于辅模型的过滤
			List<RMFormulaProcess> results = getPage().getResult(); 
			if(results != null && results.size()>0){
				for(RMFormulaProcess result : results){
					this.queryResults.add(result);
				}
			}
		}
		this.findExportDataInfosCount++;
		return getPage();
	}
	
	/**
	 * 生成用于导出的自定义区域信息
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, List> generateShowCusPros(String showType, String... datagridCode) {
		String dgCode = null;
		boolean isDatagird = false;
		DataGrid datagrid = null;
		View view = null;
		if (null != datagridCode && datagridCode.length > 0) {
			dgCode = datagridCode[0].toString();
			isDatagird = true;
		}
		if (!isDatagird) {
			view = viewServiceFoundation.getView(viewCode, true);
		} else {
			datagrid = viewServiceFoundation.getDataGrid(dgCode);
		}
		Map<String, List> cusShowProps = new HashMap<String, List>();
		if (null != view && !showType.isEmpty() & !isDatagird) {
			if (view.getExtraView() != null) {
				Map<String, Object> configMap = (Map<String, Object>) SerializeUitls.deserialize(view.getExtraView().getConfig());
				if (null != configMap) {
					cusShowProps = generateDetailCusShowProp(showType, view.getCode(), configMap);
				}
			}
		} else if (null != datagrid && !showType.isEmpty() & isDatagird) {
			Map<String, Object> configMap = datagrid.getConfigMap();
			if (null != configMap) {
				cusShowProps = generateDetailCusShowProp(showType, dgCode, configMap);
			}
		}
		return cusShowProps;
	}
	
	
	/**
	 * 生成用于导出的自定义区域的详细信息
	 * @param showType   datagird or listpt
	 * @param associateCode		viewCode  or  dgCode
	 * @param configMap			the config map of  the  view Or  the conif map of  the datagird
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	private Map<String, List> generateDetailCusShowProp(String showType, String associateCode,Map<String, Object> configMap) {
		Map<String, List> cusShowProps = new HashMap<String, List>();
		Map<String, Object> layOutConfig = (Map<String, Object>) configMap.get("layout");
		if (null != layOutConfig) {
			List<Map<String, Object>> sections = (ArrayList<Map<String, Object>>) layOutConfig.get("sections");
			for (Map<String, Object> section : sections) {
				if (null != section) {
					if (null != section.get("regionType") && showType.equals(section.get("regionType").toString())) {
						if (null != section.get("cells")) {
							List<Map<String, Object>> cells = (ArrayList<Map<String, Object>>) section.get("cells");
							for (Map<String, Object> cell : cells) {
								if (null != cell.get("customSection") && "true".equals(cell.get("customSection").toString())) {
									String propRec = null;
									String customModelCode = null;
									List<String> argList = new ArrayList<String>();
									if (null != cell.get("customModelCode")) {
										customModelCode = cell.get("customModelCode").toString();
										argList.add(customModelCode);
									}
									if (null != cell.get("propertyLayRec")) {
										propRec = cell.get("propertyLayRec").toString();
										argList.add(propRec);
									}
									String viewType = showType;
									argList.add(viewType);
									argList.add(associateCode);
									if (argList.size() >= 3) {
										List<CustomPropertyViewMapping> rs = new ArrayList<CustomPropertyViewMapping>();
										rs = iViewServiceFoundation.findShowedCustomProps(customModelCode, associateCode, viewType, propRec);
										cusShowProps.put(propRec, rs);
									}
								}
							}
							return cusShowProps;
						}
					}
				}
			}
		}
		return Collections.EMPTY_MAP;
	}
	
	/**
	 * 生成excel导出中字段的样式
	 * @param exportMaps
	 * @return
	 */
	public List<Map>  generateStyleFormats(List<Map> exportMaps, String modelName)  {
		List<Map> columns = new ArrayList<Map>();
		for(Map<String, Object> fieldMap:exportMaps)   {
			Map<String, Object> formatMap = new HashMap<String, Object>();
			if (fieldMap != null && !fieldMap.isEmpty() && fieldMap.get("propertyCode") != null
					&& fieldMap.get("propertyCode").toString().length() > 0) {
				if ("DECIMAL".equals(fieldMap.get("columntype"))) {
					String decimalNum = null;
					if (fieldMap.get("decimalNum") != null) {
						decimalNum = (fieldMap.get("decimalNum")).toString();
					}
					int number = 2;
					if (decimalNum != null && decimalNum.length() > 0) {
						try {
							number = Integer.parseInt(decimalNum);
						} catch (NumberFormatException e) {
							log.warn(e.getMessage());
							number = 2;
						}
					}
					String showFormat = (String) fieldMap.get("propshowformat");
					if ("PERCENT".equals(showFormat)) {
						number = number - 2;
					}
	
					StringBuffer sb = new StringBuffer();
					if (number == 0) {
						sb.append("0");
					} else if (number > 0) {
						sb.append("0.");
					} else if (number < 0) {
						sb.append("0");
					}
					for (int i = 0; i < number; i++) {
						sb.append("0");
					}
					if ("PERCENT".equals(showFormat)) {
						sb.append("%");
					} else {
						sb.append("");
					}
					formatMap.put("format", sb.toString());
					formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
				}else if("DATETIME".equals(fieldMap.get("columntype"))||"DATE".equals(fieldMap.get("columntype")))  {
					if(fieldMap.get("propshowformat")!=null)  {
						String dateFormat=fieldMap.get("propshowformat").toString();
						String  sb =new String();
						switch(dateFormat)  {
							case "Y":
							{
								sb="yyyy";
								break;
							}
							case "YM":{
								sb="yyyy-mm";
								break;
							}
							case "YMD":{
								sb="yyyy-mm-dd";
								break;
							}
							case "YMD_H":{
								sb="yyyy-mm-dd\\ HH";
								break;
							}
							case "YMD_HM":{
								sb="yyyy-mm-dd\\ HH:mm";
								break;
							}case "YMD_HMS":{
								sb="yyyy-mm-dd\\ HH:mm:ss";
								break;
							}default:{
								sb="yyyy-mm-dd\\ HH:mm:ss";
								break;
							}
						}
						formatMap.put("format", sb.toString());
						formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
					}
					
				}else if ("INTEGER".equals(fieldMap.get("columntype"))) {
					String showFormat = (String) fieldMap.get("propshowformat");
					formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
					if ("PERCENT".equals(showFormat)) {
						formatMap.put("format", "0%");
					}
				} else if ("MONEY".equals(fieldMap.get("columntype"))) {
					String decimalNum = null;
					if (fieldMap.get("propPrecision") != null) {
						decimalNum = (fieldMap.get("propPrecision")).toString();
					}
					int number = 2;
					if (decimalNum != null && decimalNum.length() > 0) {
						try {
							number = Integer.parseInt(decimalNum);
						} catch (NumberFormatException e) {
							log.warn(e.getMessage());
							number = 2;
						}
					}
	
					String showFormat = (String) fieldMap.get("propshowformat");
					StringBuffer sb = new StringBuffer();
					if ("THOUSAND".equals(showFormat)) {
						sb.append("#,##");
					}
					sb.append("0");
					if (number > 0) {
						sb.append(".");
					}
					for (int i = 0; i < number; i++) {
						sb.append("0");
					}
					formatMap.put("format", sb.toString());
					formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
				} else {
					formatMap.put("key", modelName!=null?modelName+"."+fieldMap.get("name"):fieldMap.get("name"));
				}
	
				columns.add(formatMap);
			}
		}
		return columns;
	}
	
	
	
	
	/**
	 * 保存cookie
	 * @param p
	 * @return
	 */
	public void saveExportCookie(String viewCode,String queryConfig)  {
		String  cookieType="EXPORT_" + viewCode;
		Cookie cookie = null;
		cookie = (Cookie) cookieService.getCookie(cookieType, getCurrentUser().getId(), getCurrentCompany());
	    if(cookie!=null)  {
			cookie.setValue(queryConfig);
			cookieService.update(cookie);
		}else {
			cookie = new Cookie();
			cookie.setType("EXPORT_" + viewCode);
			cookie.setUser(getCurrentUser());
			cookie.setValue(queryConfig);
			cookieService.save(cookie);
		}
	}
	
	
	public List<Map>   parseXml(String xmlSource)  {
		 List<Map>  maps=new ArrayList<Map>();
		 try {  
             org.dom4j.Document doc=(org.dom4j.Document)DocumentHelper.parseText(xmlSource);  
             Element root = doc.getRootElement();  
             Iterator elements=root.elementIterator();
             for (Iterator iterator = elements; iterator.hasNext();) {
            	 Element element=(Element) iterator.next();
            	 Iterator   innerIntertor=element.elementIterator();
            	 Map map = new HashMap();
            	 for(Iterator iterator2=innerIntertor;innerIntertor.hasNext();)  {
            		 Element type2 = (Element) iterator2.next();
            		 map.put(type2.getName(), type2.getText());
            	 }
            	 maps.add(map);		
			}
            this.generateFlag=true;
            
         } catch (Exception e) {  
             e.printStackTrace();  
         } 
		 return maps;
	}
	
	public static String firstLatterToLowerCase(String key) {
		char fl = ((String) key).charAt(0);
		return Character.toLowerCase(fl) + ((String) key).substring(1);
	}
	
	/**
	 * 
	 * @param view  相关视图
	 * @param mapDatas		参数
	 * @return
	 */
	public String  generteCustomerSql(View view,List<Map> mapDatas)   {
		//是否表单类型
		Boolean isFormObject=view.getAssModel().getEntity().getWorkflowEnabled();
		Model  model = view.getAssModel();
		StringBuilder sb=new StringBuilder();
		StringBuilder join =  new StringBuilder();
		if(mapDatas==null||mapDatas.size()==0)  {
			return "";
		}
		sb.append("SELECT ");
		if(isFormObject) {
			if(currentSqlType==Sql.TYPE_LIST_PENDING)  {
				sb.append("\"p\".ID AS \"pending.id\",\"p\".PROCESS_KEY AS \"pending.processKey\",\"p\".PROCESS_VERSION AS \"pending.processVersion\",\"p\".TABLE_INFO_ID AS \"pending.tableInfoId\",\"p\".ACTIVITY_NAME AS \"pending.activityName\",\"p\".PROCESS_ID AS \"pending.processId\",\"p\".ACTIVITY_TYPE AS \"pending.activityType\",\"p\".DEPLOYMENT_ID AS \"pending.deploymentId\",\"p\".USER_ID AS \"pending.userId\",\"p\".OPEN_URL AS \"pending.openUrl\",\"p\".TASK_DESCRIPTION AS \"pending.taskDescription\",\"p\".PROCESS_NAME AS \"pending.processName\",\"p\".PROCESS_DESCRIPTION AS \"pending.processDescription\",\"p\".PROXY_SOURCE AS \"pending.proxySource\",\"p\".SOURCE_STAFF AS \"pending.sourceStaff\",\"p\".MOBILE_APPROVE AS \"pending.mobileApprove\"");
				sb.append(",");
			}
		}
		//组合map
		//实体简称
		String modelAlias = "\"" + firstLatterToLowerCase(view.getAssModel().getModelName()) + "\"";
		String idColName = "ID";
		List<Property> properties = modelServiceFoundation.findProperties(model);
		for(Property property: properties){
			if(property.getName().equals("id")){
				idColName = property.getColumnName();
			}
		}
		sb.append(modelAlias + "." + idColName + " AS \"id\", ");
		join.append(viewServiceFoundation.joinSQL(view, sb, modelAlias,mapDatas));
		if(isFormObject) {
			sb.append(",");
			String pendingTableInfoId=modelAlias+".TABLE_INFO_ID AS \"tableInfoId\"";
			if(sb.indexOf(pendingTableInfoId)==-1)  {
				if(!sb.toString().endsWith(","))  {
					sb.append(",");
				}
				sb.append(pendingTableInfoId).append(",");
			}
			if(null!=model.getIsMain()&&model.getIsMain())  {
				String pendingStatus=modelAlias+".STATUS AS \"status\"";
				String pendingTableNo=modelAlias+".TABLE_NO AS \"tableNo\"";
				if(sb.indexOf(pendingStatus)==-1)  {
					if(!sb.toString().endsWith(","))  {
						sb.append(",");
					}
					sb.append(pendingStatus).append(",");
				}
				if(sb.indexOf(pendingTableNo)==-1)  {
					if(!sb.toString().endsWith(","))  {
						sb.append(",");
					}
					sb.append(pendingTableNo).append(",");
				}
			}
			if(sb.toString().endsWith(","))  {
				sb=sb.deleteCharAt(sb.length()-1);
			}
			if(currentSqlType==Sql.TYPE_LIST_PENDING) {
				sb.append(" FROM WF_PENDING \"p\"  INNER JOIN ");
				sb.append(view.getAssModel().getTableName()).append(" ").append(modelAlias);
				sb.append(" ON \"p\".TABLE_INFO_ID=");
				sb.append(modelAlias).append(".").append("TABLE_INFO_ID");
				sb.append(" ").append(join);		
			}else if(currentSqlType==Sql.TYPE_LIST_QUERY)  {
				sb.append(" FROM ").append(view.getAssModel().getTableName()).append(" ").append(modelAlias);
				sb.append(join);
			}
		}else {
			sb.append(" FROM ").append(view.getAssModel().getTableName()).append(" ").append(modelAlias);
			sb.append(join);
		}
		return sb.toString();
	}


	public boolean isEditNew(){
		//return null == this.formulaProcess || null == this.formulaProcess.getId();
		return null == this.id;
	}
	public CreatorInfo getCreatorInfo(){
		return this.creatorInfo;
	}
	
	
	
	@Resource
	private DocumentService documentService;
	
	private String linkId;
	private String type;
	private Page<Document> attachments;

	public String getLinkId() {
		return linkId;
	}

	public void setLinkId(String linkId) {
		this.linkId = linkId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Page<Document> getAttachments() {
		if(attachments == null) {
			attachments = new Page<Document>(Integer.MAX_VALUE);
		}
		return attachments;
	}

	public void setAttachments(Page<Document> attachments) {
		this.attachments = attachments;
	}
	
	@Action(value = "/RM/formula/formulaProcess/attachment-init", interceptorRefs = { @InterceptorRef("fileUpload"), @InterceptorRef("orchidStack") }, results = { @Result(location = "list-attachment.ftl", type = FREEMARKER) })
	public String attachmentInit() throws Exception {
		bapBeforeCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "attachmentInit");
		if (linkId != null && linkId.length() > 0 && type != null && type.length() > 0) {
			if(propertyCode != null && propertyCode.length() > 0){
				documentService.getByLinkIdAndTypePage(getAttachments(), Long.valueOf(linkId), type, propertyCode);
			}else{
				documentService.getByLinkIdAndTypePage(getAttachments(), Long.valueOf(linkId), type);
			}
			if (attachments.getResult() != null) {
				for (Document doc : attachments.getResult()) {
					doc.setSizeDis(DocumentUtils.sizeConversion(doc.getSize()));
				}
			}
		}
		bapAfterCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "attachmentInit");
		return SUCCESS;
	}
	
	/**
	 * excel导入页面
	 * @return
	 * @throws Exception
	 */
	@Action(value="/RM/formula/formulaProcess/initImport",results={@Result(name="success",type=FREEMARKER,location="excelImport.ftl")})
	public String initImport() throws Exception{
		bapBeforeCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "initImport");
		return SUCCESS;
	}
	
	@Action(value="/RM/formula/formulaProcess/initMainImport",results={@Result(name="success",type=FREEMARKER,location="mainImportDialog.ftl")})
	public String initMainImport() throws Exception{
		return SUCCESS;
	}
	
	@Action(value = "/RM/formula/formulaProcess/importxls", interceptorRefs = { @InterceptorRef("orchidStack") }, results = { @Result(location = "response.ftl", type = FREEMARKER) })
	public String imports() throws Exception {
		importServices = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid.RM.services.RMFormulaProcessService"
						, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"      
						, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"
						, "com.supcon.orchid.MESBasic.services.MESBasicProductService"
						, "com.supcon.orchid.RM.services.RMPrecessStandardsService"
					, "com.supcon.orchid.RM.services.RMFormulaService"
					, "com.supcon.orchid.RM.services.RMFormulaService"
					, "com.supcon.orchid.RM.services.RMFormulaService"
					, "com.supcon.orchid.RM.services.RMFormulaBomService"
					, "com.supcon.orchid.RM.services.RMFormulaBomService"
					, "com.supcon.orchid.RM.services.RMFormulaBomService"
					, "com.supcon.orchid.RM.services.RMFormulaBeforeProcessService"
					, "com.supcon.orchid.RM.services.RMFormulaBeforeProcessService"
					, "com.supcon.orchid.RM.services.RMFormulaBeforeProcessService"
					, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"
					, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"
					, "com.supcon.orchid.RM.services.RMPrecessStandardsService"
					, "com.supcon.orchid.RM.services.RMPrecessStandardsService"
					, "com.supcon.orchid.RM.services.RMFormulaMixtureActiveService"
					, "com.supcon.orchid.RM.services.RMFormulaMixtureActiveService"
					, "com.supcon.orchid.RM.services.RMFormulaMixtureActiveService"
		};
		bapBeforeCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "imports");
		long startTime = System.currentTimeMillis();
		try {
			if(dataFile != null && datagridCode != null && datagridCode.length() > 0){
			
			
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS"); 
				time = sdFormat.format(new Date());
				String[] name = (String[]) ActionContext.getContext().getParameters().get("dataFileFileName");
				if(name == null || name.length == 0){
					name = new String[]{"default"};
				}
				orgName = name[0];
				xlsResult = importService.imports(tid, dataFile, datagridCode, time, name[0], fileType, importServices);
				if(null != xlsResult && xlsResult.trim().length() > 0 && xlsResult.startsWith("repeat")){
					isReplace = true;
					isIgnore = false;
					xlsResult = xlsResult.substring(7);
				} else {
					isReplace = false;
					isIgnore = false;
				}
			}
		} catch (Exception e) {
			xlsResult = "exception|" + getText("import.error.failure") + e.getMessage();
			for(StackTraceElement ele : e.getStackTrace()){
				xlsResult += ele.toString();
				logger.warn(ele.toString());
			}
			return SUCCESS;
		}
		long endTime = System.currentTimeMillis();
		logger.info("action upload cast {} ms", (endTime - startTime));
		bapAfterCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "imports");
		return SUCCESS;
	}
	
	@Action(value = "/RM/formula/formulaProcess/importMainXls", interceptorRefs = { @InterceptorRef("orchidStack") }, results = { @Result(location = "mainImportResponse.ftl", type = FREEMARKER) })
	public String importMainXls() throws Exception {
		importServices = new Object[]{FrameworkUtil.getBundle(getClass()).getBundleContext(), "com.supcon.orchid.RM.services.RMFormulaProcessService"
						, "com.supcon.orchid.RM.services.RMFormulaService"       
						, "com.supcon.orchid.RM.services.RMProcessTypeService"       
						, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"      
						, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"
						, "com.supcon.orchid.MESBasic.services.MESBasicProductService"
						, "com.supcon.orchid.RM.services.RMPrecessStandardsService"
					, "com.supcon.orchid.RM.services.RMFormulaService"
					, "com.supcon.orchid.RM.services.RMFormulaService"
					, "com.supcon.orchid.RM.services.RMFormulaService"
					, "com.supcon.orchid.RM.services.RMFormulaBomService"
					, "com.supcon.orchid.RM.services.RMFormulaBomService"
					, "com.supcon.orchid.RM.services.RMFormulaBomService"
					, "com.supcon.orchid.RM.services.RMFormulaBeforeProcessService"
					, "com.supcon.orchid.RM.services.RMFormulaBeforeProcessService"
					, "com.supcon.orchid.RM.services.RMFormulaBeforeProcessService"
					, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"
					, "com.supcon.orchid.RM.services.RMFormulaProcessActiveService"
					, "com.supcon.orchid.RM.services.RMPrecessStandardsService"
					, "com.supcon.orchid.RM.services.RMPrecessStandardsService"
					, "com.supcon.orchid.RM.services.RMFormulaMixtureActiveService"
					, "com.supcon.orchid.RM.services.RMFormulaMixtureActiveService"
					, "com.supcon.orchid.RM.services.RMFormulaMixtureActiveService"
		};
		long startTime = System.currentTimeMillis();
		try {
			if(dataFile != null){
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS"); 
				time = sdFormat.format(new Date());
				String[] name = (String[]) ActionContext.getContext().getParameters().get("dataFileFileName");
				if(name == null || name.length == 0){
					name = new String[]{"default"};
				}
				orgName = name[0];
				//xlsResult = importService.imports(viewCode, "RM_7.5.0.0_formula_FormulaProcess", dataFile, time, name[0], isReplace, isIgnore, fileType, importServices);
				xlsResult = importService.batchImports(viewCode, "RM_7.5.0.0_formula_FormulaProcess", dataFile, time, name[0], isReplace, isIgnore, isBatch, fileType, importServices);
				if(null != xlsResult && xlsResult.trim().length() > 0 && xlsResult.startsWith("repeat")){
					isReplace = true;
					isIgnore = false;
					xlsResult = xlsResult.substring(7);
					viewCode = getViewCode();
				} else {
					isReplace = false;
					isIgnore = false;
					viewCode = getViewCode();
				}
			}
		} catch (Exception e) {
			xlsResult = "exception|" + getText("import.error.failure") + e.getMessage();
			for(StackTraceElement ele : e.getStackTrace()){
				xlsResult += ele.toString();
				logger.warn(ele.toString());
			}
			return SUCCESS;
		}
		long endTime = System.currentTimeMillis();
		logger.info("action upload cast {} ms", (endTime - startTime));
		return SUCCESS;
	}
	
	
	
	@Action(value = "/RM/formula/formulaProcess/downLoad",  results = { 
		@Result(name="templateExcel",type="templateExcel",location="${fileName}", params = { "root", "templateRelatedModelCode", "defaultAmount", "50000", "defaultSize", "1000" }),
		@Result(type = "stream", params = {"contentType", "application/excel", "inputName", "inputStream","contentDisposition", "attachment;filename=\"${fileName}\"", "bufferSize", "4096" }) 
		})
	public String downLoadXls() throws Exception {
		bapBeforeCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "downLoadXls");
		if ("template".equals(downloadType)) {
			if (null == templateRelatedModelCode || templateRelatedModelCode.isEmpty()) {
				DataGrid dg = viewServiceFoundation.getDataGrid(datagridCode);
				if (null != dg) {
					templateRelatedModelCode = dg.getCode();
				}
			}
			this.customPropData = findCustomPropData(templateRelatedModelCode,false);
			return "templateExcel";
		}  else if ("mainError".equals(downloadType)) {
			return SUCCESS;
		} else {
			return SUCCESS;
		}
	}
	
	@Action(value = "/RM/formula/formulaProcess/templateDownLoad",  results = { @Result(name="templateExcel",type="templateExcel",location="${fileName}", params = { "root", "templateRelatedModelCode", "defaultAmount", "50000", "defaultSize", "1000" }) })
	public String templateDownLoad() throws Exception {
		templateRelatedModelCode="RM_7.5.0.0_formula_FormulaProcess";
		this.customPropData = findCustomPropData(templateRelatedModelCode,true);
		bapBeforeCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "templateDownLoad");
		return "templateExcel";
	}
	
	
	public Map<String,Object>  findCustomPropData(String modelCode,Boolean isModelRelated)  {
		Map<String, Object> customDataInfo = new HashMap<String, Object>();
		List<Property> props = new ArrayList<Property>();
		if (isModelRelated != null && isModelRelated) {
			//列表视图的自定义字段
			props = viewServiceFoundation.getEnabledCustomProps(modelCode);
		} else {
			//datgrid关联的列表视图中自定义字段
			props = viewServiceFoundation.getEnabledCustomPropsByDatagirdCode(modelCode);
		}
		if (null != props && props.size() > 0) {
			List<String> styleCodes = new ArrayList<String>();
			List<Map> styleFormates = new ArrayList<Map>();
			List<Map<String, Object>> importMaps = new ArrayList<Map<String, Object>>();
			for (Property p : props) {
				styleCodes.add(p.getCode());
				styleFormates.add(modelServiceFoundation.generateStyle(p));
				Map<String, Object> item = new HashMap<String, Object>();
				item.put("nullAble", p.getNullable());
				item.put("columnName", InternationalResource.get(p.getDisplayName(), getLocale().toString()));
				if (DbColumnType.OBJECT.equals(p.getType())) {
					Property bussiness = modelServiceFoundation.getBussinessProperty(p.getAssociatedProperty().getModel().getCode());
					item.put("propertyCode", p.getCode() + "||" + bussiness.getCode());
				} else {
					item.put("propertyCode", p.getCode());
				}
				importMaps.add(item);
			}
			customDataInfo.put("styleFormats", styleFormates);
			customDataInfo.put("styleCodes", styleCodes);
			customDataInfo.put("properties", importMaps);
			return customDataInfo;
		}
		return Collections.EMPTY_MAP;
	}
	
	public String getContentDisposition() {
		String retStr = "attachment;filename=error.xls";
		try {
			retStr = "attachment;filename=" + encode(getFileName(), Struts2Utils.getRequest());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retStr;
	}
	private String encode(String fileName, HttpServletRequest request)
			throws Exception {
		String agent = request.getHeader("User-Agent");
		String returnFileName = fileName;
		if (null != agent) {
			if (agent.indexOf("MSIE") > -1) { // is IE browser
				returnFileName = StringUtils.replace(URLEncoder.encode(
						fileName, "UTF-8"), "+", "%20");
				if (returnFileName.length() > 150) {// 处理超长文件名，IE的bug。
					//%E9%87%8D%E5%91%BD%E5%90%8D
					returnFileName = new String(fileName
							.getBytes(getClientCharacterEncoding(request)),
							"ISO8859_1");
					returnFileName = StringUtils.replace(returnFileName, " ",
							"%20");
				}
			} else if (agent.indexOf("Firefox") > -1 || agent.indexOf("AppleWebKit") > -1) { // is Firefox
				returnFileName = new String(fileName.getBytes(request
						.getCharacterEncoding()), "ISO8859_1");
			}
		}
		return returnFileName;
	}
	
	private String getClientCharacterEncoding(HttpServletRequest request) {
		String language = request.getHeader("Accept-Language");
		if (language != null) {
			if (language.toLowerCase().indexOf("zh-cn") > -1) {
				return "GBK";
			} else if (language.toLowerCase().indexOf("zh-tw") > -1) {
				return "BIG5";
			}
		}
		return "ISO8859_1";
	}
	
	@Autowired
	private PrintService printService;
	
	private Map<String, Object> printXmlInfo = new HashMap<String, Object>();
	
	/**
	 * @return the printXmlInfo
	 */
	public Map<String, Object> getPrintXmlInfo() {
		return printXmlInfo;
	}

	/**
	 * @param printXmlInfo
	 *            the printXmlInfo to set
	 */
	public void setPrintXmlInfo(Map<String, Object> printXmlInfo) {
		this.printXmlInfo = printXmlInfo;
	}

	@Action(value = "/RM/formula/formulaProcess/loadXMLRefOrData", results = { @Result(name = SUCCESS, type = "json", params = { "root",
			"printXmlInfo" }) })
	public String loadXMLRefOrData() throws Exception {
		String xmlRefernece = null, xmlData = null;
		RMFormulaProcess formulaProcess = null;
		if(null != id) {
			formulaProcess = formulaProcessService.getFormulaProcess(id);
		}
		xmlRefernece = printService.buildPrintXmlRef(viewCode, formulaProcess, null, null, false, this);
		xmlData = printService.buildPrintXmlRef(viewCode, formulaProcess, null, null, true, this);
		printXmlInfo.put("xmlRefernece", xmlRefernece);
		printXmlInfo.put("xmlData", xmlData);
		formulaProcessService.print(1);
		return SUCCESS;
	}
	
	private Map<String, Object>  batchPrintXmlInfo;
	
	public void setBatchPrintXmlInfo(Map<String, Object> batchPrintXmlInfo){
		this.batchPrintXmlInfo = batchPrintXmlInfo;
	}
	
	public Map<String, Object> getBatchPrintXmlInfo(){
		return batchPrintXmlInfo;
	}
	
	@Action(value = "/RM/formula/formulaProcess/loadBatchXmlRefer",
			results = {@Result(name = SUCCESS, type = JSON, params = {"root", "batchPrintXmlInfo"})})
	public String loadBatchXmlRefer() throws Exception{
		batchPrintXmlInfo = new HashMap<String, Object>();
		String xmlRefer = printService.buildPrintXmlRef(viewCode, null, null, null, false, null);
		batchPrintXmlInfo.put("xmlRefer", xmlRefer);
		return SUCCESS;
	}
	
	@Action(value = "/RM/formula/formulaProcess/loadBatchXmlRefAndData",
			results = {@Result(name = SUCCESS, type = JSON, params = {"root", "batchPrintXmlInfo", "excludes", "*", "includes", "xmlRefer,xmlDataList"})})
	public String loadBatchXmlRefAndData() throws Exception{
		batchPrintXmlInfo = new HashMap<String, Object>();
		String xmlRefer = printService.buildPrintXmlRef(viewCode, null, null, null, false, null);
		batchPrintXmlInfo.put("xmlRefer", xmlRefer);
		List<String> xmlDataList = new ArrayList<String>();
		if(ids != null && ids.length() > 0){
			String[] arrId = ids.split(",");
			for(String id : arrId){
				formulaProcess = formulaProcessService.getFormulaProcess(Integer.parseInt(id));
				if(formulaProcess != null){
					String xmlData = printService.buildPrintXmlRef(viewCode, formulaProcess, null, null, true, this);
					xmlDataList.add(xmlData);
				}
			}
		}
		batchPrintXmlInfo.put("xmlDataList", xmlDataList);
		formulaProcessService.print(1);
		return SUCCESS;
	}
	
	/**
	 * 查询DataGrid时，获取JsonResult需要include的自定义字段
	 * @param dataGridCode
	 * @return
	 */
	public String getCustomPropertyIncludes(String dataGridCode) {
		String includes = "";
		List<CustomPropertyViewMapping> viewMappings = ViewServiceFoundation.getCustomPropertyViewMappings(dataGridCode);
		if (viewMappings != null && viewMappings.size() > 0) {
			StringBuilder sb = new StringBuilder();
			for (CustomPropertyViewMapping vm : viewMappings) {
				if (vm.getPropertyLayRec() != null) {
					String propLayRec = vm.getPropertyLayRec().split("\\|\\|")[0];
					if (!propLayRec.contains(".")) {
						sb.append(",result.").append(vm.getProperty().getName());
						if (DbColumnType.OBJECT.equals(vm.getProperty().getType()) || DbColumnType.SYSTEMCODE.equals(vm.getProperty().getType())) {
							sb.append(",result.").append(vm.getProperty().getName()).append("MainDisplay");
						}
					} else {
						propLayRec = propLayRec.substring(propLayRec.indexOf("."));
						sb.append(",result").append(propLayRec).append(".").append(vm.getProperty().getName());
						if (DbColumnType.OBJECT.equals(vm.getProperty().getType()) || DbColumnType.SYSTEMCODE.equals(vm.getProperty().getType())) {
							sb.append(",result").append(propLayRec).append(".").append(vm.getProperty().getName()).append("MainDisplay");
						}
					}
				}
			}
			if (sb.length() > 0) {
				includes = sb.substring(1);
			}
		}
		return includes;
	}
	
	
	
	/**
	 * 获取主模型每页
	 * @return
	 */
	public Integer getMainPageNum(){
		return getPage().getPageSize();
	}
	
	/**
	 * 获取主模型Sheet的名称
	 * @return
	 */
	public String getMainSheetName(){		
		Model model = modelServiceFoundation.getModel("RM_7.5.0.0_formula_FormulaProcess");
		String sheetName = InternationalResource.get(model.getName(), getCurrentUser().getLanguage());
		return sheetName;
    }
	
	//获取系统编码的value
	public String getSystemCodeValue(String code){
		Property p = modelServiceFoundation.findPropertyByCode(code, null);
		String selectValue = "";
		String fillContent = p.getFillcontent();
		if(fillContent != null){
			String[] str = fillContent.split(",");
			String[] str2 = str[2].split(":");
			String scEntityCode = str2[1].substring(1, str2[1].length()-2);
			List<String> values = formulaProcessService.getSystemCodeFullPathNameByEntityCode(scEntityCode);
			
			if(values!=null && values.size()>0){
				for(String value : values){
					selectValue += value + ",";
				}
				if(selectValue.length()>0){
					selectValue = selectValue.substring(0, selectValue.length()-1);
				}
			}
		}	
		return selectValue;
	}
	
	/**
	 * 拼接用于生产sql的xml
	 * @return
	 */
	private String generteAuxXml(Property p)   {
		String queryConfigAux = "<list-item>";
		queryConfigAux += "<name><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "]]></name>";
		queryConfigAux += "<dispalyName><![CDATA[" + (p.getDisplayName()!=null?p.getDisplayName():"undefined") + "]]></dispalyName>";
		queryConfigAux += "<propertyCode><![CDATA[" + (p.getCode()!=null?p.getCode():"undefined") + "]]></propertyCode>";
		queryConfigAux += "<namekey><![CDATA[" + (p.getDisplayName()!=null?p.getDisplayName():"undefined") + "]]></namekey>";
		if(p.getMultable()){
			queryConfigAux += "<multable><![CDATA[true]]></multable>";
		}else{
			queryConfigAux += "<multable><![CDATA[false]]></multable>";
		}
		if(p.getSeniorSystemCode()){
			queryConfigAux += "<seniorsystemcode><![CDATA[true]]></seniorsystemcode>";
		}else{
			queryConfigAux += "<seniorsystemcode><![CDATA[false]]></seniorsystemcode>";
		}
		queryConfigAux += "<propshowformat><![CDATA[" + (p.getFormat()!=null?p.getFormat():"undefined") + "]]></propshowformat>";
		queryConfigAux += "<assPropertyName><![CDATA[undefined]]></assPropertyName>";
		queryConfigAux += "<modelCode><![CDATA[undefined]]></modelCode>";
		queryConfigAux += "<columnName><![CDATA[" + (p.getColumnName()!=null?p.getColumnName():"undefined") + "]]></columnName>";
		queryConfigAux += "<layRec><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "]]></layRec>";
		queryConfigAux += "<key><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "]]></key>";
		if(p.getNullable()){
			queryConfigAux += "<nullable><![CDATA[true]]></nullable>";
		}else{
			queryConfigAux += "<nullable><![CDATA[false]]></nullable>";
		}
		queryConfigAux += "<columntype><![CDATA[" + (p.getType()!=null?p.getType():"undefined") + "]]></columntype>";
		if(p.getDecimalNum()!=null && p.getDecimalNum()>0){
			queryConfigAux += "<decimalNum><![CDATA[" + p.getDecimalNum().toString() + "]]></decimalNum>";
		}else{
			queryConfigAux += "<decimalNum><![CDATA[0]]></decimalNum>";
		}
		queryConfigAux += "</list-item>";
		return queryConfigAux;
	}
	private String generteAuxObjXml(Property p, Property ap, Model assModel, String idColumnName, Model realmodel){
		String queryConfigAuxObj = "<list-item>";
		queryConfigAuxObj += "<name><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "." +
				(ap.getName()!=null?ap.getName():"undefined") + "]]></name>";
		queryConfigAuxObj += "<dispalyName><![CDATA[" + (p.getDisplayName()!=null?p.getDisplayName():"undefined") + "," +
				(ap.getDisplayName()!=null?ap.getDisplayName():"undefined") + "]]></dispalyName>";
		queryConfigAuxObj += "<propertyCode><![CDATA[" + (p.getCode()!=null?p.getCode():"undefined") + "||" +
				(ap.getCode()!=null?ap.getCode():"undefined") + "]]></propertyCode>";
		queryConfigAuxObj += "<namekey><![CDATA[" + (p.getDisplayName()!=null?p.getDisplayName():"undefined") + "," +
				(ap.getDisplayName()!=null?ap.getDisplayName():"undefined") + "]]></namekey>";
		if(p.getMultable()){
			queryConfigAuxObj += "<multable><![CDATA[true]]></multable>";
		}else{
			queryConfigAuxObj += "<multable><![CDATA[false]]></multable>";
		}
		if(p.getSeniorSystemCode()){
			queryConfigAuxObj += "<seniorsystemcode><![CDATA[true]]></seniorsystemcode>";
		}else{
			queryConfigAuxObj += "<seniorsystemcode><![CDATA[false]]></seniorsystemcode>";
		}
		queryConfigAuxObj += "<propshowformat><![CDATA[" + (ap.getFormat()!=null?ap.getFormat():"undefined") + "]]></propshowformat>";
		queryConfigAuxObj += "<assPropertyName><![CDATA[" + (ap.getName()!=null?ap.getName():"undefined") + "]]></assPropertyName>";
		queryConfigAuxObj += "<modelCode><![CDATA["+ assModel.getCode() +"]]></modelCode>";
		queryConfigAuxObj += "<columnName><![CDATA[" + (ap.getColumnName()!=null?ap.getColumnName():"undefined") + "]]></columnName>";
		queryConfigAuxObj += "<layRec><![CDATA[" + assModel.getTableName() + "," + idColumnName + "," + realmodel.getTableName() + "," + p.getColumnName() + "-" +
				(ap.getName()!=null?ap.getName():"undefined") + "]]></layRec>";
		queryConfigAuxObj += "<key><![CDATA[" + (p.getName()!=null?p.getName():"undefined") + "." +
				(ap.getName()!=null?ap.getName():"undefined") + "]]></key>";
		//queryConfigAuxObj += "<key><![CDATA[" + assModel.getModelName().substring(0, 1).toLowerCase() + assModel.getModelName().substring(1) + "." +
		//		(ap.getName()!=null?ap.getName():"undefined") + "]]></key>";
		if(p.getNullable()){
			queryConfigAuxObj += "<nullable><![CDATA[true]]></nullable>";
		}else{
			queryConfigAuxObj += "<nullable><![CDATA[false]]></nullable>";
		}
		queryConfigAuxObj += "<columntype><![CDATA[" + (ap.getType()!=null?ap.getType():"undefined") + "]]></columntype>";
		if(ap.getDecimalNum()!=null && ap.getDecimalNum()>0){//如果是小数类型，记录小数的位数
			queryConfigAuxObj += "<decimalNum><![CDATA[" + ap.getDecimalNum().toString() + "]]></decimalNum>";
		}else{
			queryConfigAuxObj += "<decimalNum><![CDATA[0]]></decimalNum>";
		}
		queryConfigAuxObj += "</list-item>";
		return queryConfigAuxObj;
	}
	
	
	
	private void bapBeforeCustomMethod(String code, String methodName) throws Exception {
	/* CUSTOM CODE START(action,beforeMethods,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
      //bapAfterCustomMethod("RM_7.5.0.0_formula_FormulaProcess", "submit");
			if("RM_7.5.0.0_formula_FormulaProcess".equals(code)  &&  "submit".equals(methodName)){
				formulaProcess.setTableInfoId(formulaProcess.getProcessTableId());
				if(formulaProcess.getFormulaHideId()!=null){
					RMFormula formula=formulaService.getFormula(formulaProcess.getFormulaHideId());
					formulaProcess.setFormulaId(formula);
				}
			}
/* CUSTOM CODE END */
	}
	
	private void bapAfterCustomMethod(String code, String methodName) throws Exception {
	/* CUSTOM CODE START(action,methods,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
/* CUSTOM CODE END */
	}
	
	/* CUSTOM CODE START(action,functions,RM_7.5.0.0_formula_FormulaProcess,RM_7.5.0.0) */
// 自定义代码
         @Resource
		private RMFormulaService formulaService;
        
        private String processIds;
        
        public String getProcessIds() {
			return processIds;
		}

		public void setProcessIds(String processIds) {
			this.processIds = processIds;
		}

		public void setDg1487555065561List_Json(String json) {
			dg1487555065561List = (List<RMPrecessStandards>) formulaProcessService.generateObjectFromJson(json, RMPrecessStandards.class);
		}

		@Action(value = "/RM/formula/formulaProcess/checkBeforeProcess", results = { @Result(type = JSON, params = {
    			"root", "responseMap" }) })
    	public String checkBeforeProcess() {
    	Boolean batchControl=formulaProcessService.checkBeforeProcess(processIds);
    	responseMap.put("result", batchControl);
    	return SUCCESS;
    	}
                
         @Actions({
			
			@Action(value = "/RM/formula/formulaProcess/ref-data-dg1487555065561", results = { 
			@Result(type = JSON, params = { "root", "dgPage", "excludes", "*", "includes", "first,hasNext,hasPre,nextPage,pageSize,pageNo,pageNos,prePage,totalCount,totalPages,result.quota,result.stValue,result.overrunFlag,result.limitInter,result.upperLimit,result.maxLimit,result.lowerLimit,result.loweMxLimit,result.fluctuateFlag,result.flucUpperLimit,result.flucLowerLimit,result.id,result.version,result.processId.id,result.activeId.id" }),
			@Result(name="xml",type = "freemarkerXml",location="data-dg1487555065561-xml.ftl"),
			@Result(name="excel",type="excel",location="export-dg1487555065561.ftl", params = { "root", "dgPage", "defaultAmount", "50000", "defaultSize", "1000" }) })
		})
		public String refdataGridDg1487555065561() throws Exception{
			dg1487555065561Page = getDg1487555065561Page();
			if(dg1487555065561List!=null&&dg1487555065561List.size()>0){
				dg1487555065561Page.setResult(dg1487555065561List);
			}
			if (null != rt && rt.length() > 0){if("json".equals(rt)) return SUCCESS; return rt;}
			if(getDg1487555065561Page().isExportFlag()) {
				return "excel";
			}else{
				return SUCCESS;
			}
		}
/* CUSTOM CODE END */
}