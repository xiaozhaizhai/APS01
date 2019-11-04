<#assign isWorkflow = true> 
<#assign isAttachment = false> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = batchingMaterial.tableInfoId!>
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
        <#assign configTitle = getText('WOM.viewtitle.randon1505808791959')>
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
		#WOM_batchingMaterial_batchingMaterial_batchMaterialArrEdit_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit');
			WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.currentUser = ${userJson};
			WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.currentStaff = ${staffJson};
			WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.currentDepartment = ${deptJson};
			WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.currentPosition = ${postJson};
			WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.currentCompany = ${compJson};
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
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.beforeSubmitMethod()" id="WOM_batchingMaterial_batchingMaterial_batchMaterialArrEdit_form" namespace="/WOM/batchingMaterial/batchingMaterial/batchMaterialArrEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_batchingMaterial_BatchingMaterial&_bapFieldPermissonModelName_=BatchingMaterial&superEdit=${(superEdit!false)?string}" callback="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_batchingMaterial_batchingMaterial_batchMaterialArrEdit_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl" id="top_buttonbar">
									<#if !((batchingMaterial.status)?? && batchingMaterial.status == 77)>
									<#if !(superEdit!false) && id??>
									<#if checkUserPermisition('WOM_7.5.0.0_batchingMaterial_batchMaterialArrEdit_controlPrintSetting')>
									<a class='cui-btn-new' id="edit-controlPrintSetting-btn" onclick="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.controlPrintSetting()"><span class="edit-active-print-setting"></span>${getHtmlText("WOM.viewcontrolSetingName.randon1505808905604")}</a>
									</#if>
									<#if checkUserPermisition('WOM_7.5.0.0_batchingMaterial_batchMaterialArrEdit_controlPrint')>
									<a class='cui-btn-new' id="edit-controlPrint-btn" onclick="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.controlPrint()"><span class="edit-active-print"></span>${getHtmlText("WOM.viewcontrolName.randon1505808905604")}</a>
									</#if>
									</#if>
									
									<a class='cui-btn-new' id="edit-save-btn" onclick="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
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
												WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.submit(true);
											});
										});
									</script>
											</#if>
											<#break>
										</#if>
									</#list>
									</#if>

									
									<#if !(superEdit!false)>
									<a class='cui-btn-new' id="edit-submit-btn" onclick="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.submit()"><span class="submit"></span>${getHtmlText("ec.flow.submit")}</a>
									<#if batchingMaterial??&&batchingMaterial.status??&&batchingMaterial.status!=0&&batchingMaterial.status!=99>
									<#if notifyEnabled?? && notifyEnabled>
									<!-- 系统启用通知功能时，才能崔办 -->
									<a class='cui-btn-new'  id="edit-remind-btn" onclick="ec.common.remind(${batchingMaterial.tableInfoId!},${batchingMaterial.id!})"><span class="edit-press"></span>${getHtmlText("ec.flow.remind")}</a>
									</#if>
				
									<#if recallAble && batchingMaterial??&&batchingMaterial.status??&&batchingMaterial.status!=77>
									<a class='cui-btn-new'  id="edit-recall-btn" onclick="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.recall()"><span class="edit-cancel"></span>${getHtmlText("ec.flow.recall")}</a>
								
									</#if>
									<#if hasSupervision>
									<a class='cui-btn-new' id="edit-supervision-btn" onclick="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.supervision()"><span class="edit-person"></span>${getHtmlText("ec.flow.supervision.modifyPending")}</a>

									</#if>
									</#if>
									<#if pendingId?? && isAllowProxy?? && isAllowProxy>
									<a class='cui-btn-new' id="edit-proxyPending-btn" onclick="ec.common.proxyPending(${pendingId})"><span class="edit-entrust"></span>${getHtmlText("ec.pending.proxyPending")}</a>
									</#if>
									</#if>
									</#if>
									
									<a class='cui-btn-new' id="edit-close-btn" onclick="window.close()"><span class="close"></span>${getHtmlText("foundation.common.closeWindow")}</a>
			
								</div>
								
								<div class="fr">
									<ul>
										<#if !(superEdit!false)>
										<li id="fr_flow"><a title='${getText("ec.flow.flowImage")}' onclick="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.showInfoDialog('flow')"><span class='icon_prograss' ></span></a></li>
										</#if>
										<#if auditCheck('WOM_7.5.0.0_batchingMaterial_batchMaterialArrEdit') == '1'>
										<li id="fr_audit" ><a title='${getText("foundation.base.audit")}' onclick="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.showAudit()">
										<span class='icon_audit' ></span>
										</a></li>
										</#if>
										<li id="fr_dealInfo"><a title='${getText("ec.view.dealadvice")}'  onclick="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.showInfoDialog('dealInfo')"><span class='icon_handle'></span></a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
								<span class="tableNo"><#if batchingMaterial.tableNo??> &nbsp;&nbsp;${batchingMaterial.tableNo}</#if></span>
								<span class="staff">${getText('ec.common.left.bracket')}${(creatorInfo.staff.name)!}
									<#if !editNew>
									<input type="hidden" name="batchingMaterial.createStaffId" value="${editNew?string((creatorInfo.staff.id)!'\'\'',(batchingMaterial.createStaffId)!'\'\'')}" />
									</#if>
									<#if !editNew>
									<input type="hidden" name="batchingMaterial.createTime" value="${(batchingMaterial.createTime?datetime)!}" />
									</#if>
									
									${editNew?string(datetime(),(batchingMaterial.createTime?datetime)!)} 
								</span>
								
								<span class="position">
									<input id="positionLayRec" type="hidden" name="batchingMaterial.positionLayRec" value="<#if editNew>${(creatorInfo.positions[0].layRec)!}<#else>${(batchingMaterial.positionLayRec)!}</#if>" />
										<#if editNew>
											<#if creatorInfo.positions?size == 1>
											${(creatorInfo.positions[0].name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="batchingMaterial.createPositionId" value="${creatorInfo.positions[0].id}" />
											<input type="hidden" name="batchingMaterial.createDepartmentId" value="${(creatorInfo.positions[0].department.id)!}" />
										
											<#else>
											<#list creatorInfo.positions as p>
												<#if !(p.isVirtual?? && p.isVirtual)>
													<#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>
												<input type="hidden" id="creatorDepartmentId" name="batchingMaterial.createDepartmentId" value="${p.department.id}" />
													</#if>
												</#if>
											</#list>
											<select id="creatorPosition" name="batchingMaterial.createPositionId" onchange="WOM.batchingMaterial.batchingMaterial.batchMaterialArrEdit.setDepartment()">
												<#list creatorInfo.positions as p>
													<#if !(p.isVirtual?? && p.isVirtual)>
													<option value="${p.id}" <#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>selected</#if> layRec="${(p.layRec)!}" departmentId="${p.department.id}" departmentName="${p.department.name}">${p.name}</option>
													</#if>
												</#list>
											</select>${getText('ec.common.right.bracket')}
											</#if>
										<#else>
											${(creatorInfo.position.name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="batchingMaterial.createPositionId" value="${(batchingMaterial.createPositionId)!}" />
										</#if>
								</span>
								
								
								<span class="status">
									${getText('ec.workflow.status')}${getText('ec.common.validate.colon')}
									<a href="#" onclick="javascript:void(0)">
										${getText((batchingMaterial.pending.taskDescription)!)}
									</a>
								</span>
							</div>
    					</div>
    					
    					<div class="edit-main" id="WOM_batchingMaterial_batchingMaterial_batchMaterialArrEdit">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="batchMaterialArrEdit">
								<input type="hidden" name="datagridKey" value="WOM_batchingMaterial_batchingMaterial_batchMaterialArrEdit_datagrids">
								<input type="hidden" name="viewCode" value="WOM_7.5.0.0_batchingMaterial_batchMaterialArrEdit">
								<input type="hidden" name="modelName" value="BatchingMaterial">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="batchingMaterial.version" value="${(batchingMaterial.version)!0}" />
								<input type="hidden" name="batchingMaterial.extraCol" value='' />
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
var attcountid = "WOM_batchingMaterial_batchingMaterial_batchMaterialArrEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_batchingMaterial', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>								<div class="edit-panes edit-panes-w edit-container clearfix">

										<div class="cui-elements pd-top">

<div class="edit-panes-s" >
</div>											<@printJs route="0" id="WOM_7_5_0_0_batchingMaterial_batchMaterialArrEdit" menuOperateCodes="WOM_7.5.0.0_batchingMaterial_batchMaterialArrEdit_controlPrintSetting,WOM_7.5.0.0_batchingMaterial_batchMaterialArrEdit_controlPrint" deploymentId="${deploymentId!}" tableInfoId="${(batchingMaterial.tableInfoId)!''}" isWorkflow=isWorkflow />
										</div>
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
								<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart", "WOM_7.5.0.0_batchingMaterial_batchMaterialArrEditdg1505885399414", "DATAGRID", "batchingMaterialPart")>
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
			
FreeMarker template error (DEBUG mode; use RETHROW in production!):
The following has evaluated to null or missing:
==> c.funcbody  [in template "view-edit-datagrid-section.ftl" at line 193, column 79]

----
Tip: It's the step after the last dot that caused this error, not those before it.
----
Tip: If the failing expression is known to be legally refer to something that's null or missing, either specify a default value like myOptionalVar!myDefault, or use <#if myOptionalVar??>when-present<#else>when-missing</#if>. (These only cover the last step of the expression; to cover the whole expression, use parenthesis: (myOptionalVar.foo)!myDefault, (myOptionalVar.foo)??
----

----
FTL stack trace ("~" means nesting-related):
	- Failed at: #assign startIndex = c.funcbody?index...  [in template "view-edit-datagrid-section.ftl" at line 193, column 57]
	- Reached through: #include "view-edit-datagrid-section...  [in template "view-edit-datagrid.ftl" at line 2, column 9]
	- Reached through: #include "view-edit-datagrid.ftl"  [in template "view-edit.ftl" at line 515, column 89]
----

Java stack trace (for programmers):
----
freemarker.core.InvalidReferenceException: [... Exception message was already printed; see it above ...]
	at freemarker.core.InvalidReferenceException.getInstance(InvalidReferenceException.java:116)
	at freemarker.core.EvalUtil.coerceModelToString(EvalUtil.java:346)
	at freemarker.core.Expression.evalAndCoerceToString(Expression.java:89)
	at freemarker.core.BuiltInsForStringsBasic$index_ofBI._eval(BuiltInsForStringsBasic.java:208)
	at freemarker.core.Expression.eval(Expression.java:78)
	at freemarker.core.MethodCall._eval(MethodCall.java:55)
	at freemarker.core.Expression.eval(Expression.java:78)
	at freemarker.core.AddConcatExpression._eval(AddConcatExpression.java:54)
	at freemarker.core.Expression.eval(Expression.java:78)
	at freemarker.core.Assignment.accept(Assignment.java:70)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.IfBlock.accept(IfBlock.java:48)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.IteratorBlock$Context.runLoop(IteratorBlock.java:159)
	at freemarker.core.Environment.visitIteratorBlock(Environment.java:559)
	at freemarker.core.IteratorBlock.accept(IteratorBlock.java:67)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.ConditionalBlock.accept(ConditionalBlock.java:48)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.IteratorBlock$Context.runLoop(IteratorBlock.java:159)
	at freemarker.core.Environment.visitIteratorBlock(Environment.java:559)
	at freemarker.core.IteratorBlock.accept(IteratorBlock.java:67)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.ConditionalBlock.accept(ConditionalBlock.java:48)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.ConditionalBlock.accept(ConditionalBlock.java:48)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.ConditionalBlock.accept(ConditionalBlock.java:48)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.ConditionalBlock.accept(ConditionalBlock.java:48)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.ConditionalBlock.accept(ConditionalBlock.java:48)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.IteratorBlock$Context.runLoop(IteratorBlock.java:159)
	at freemarker.core.Environment.visitIteratorBlock(Environment.java:559)
	at freemarker.core.IteratorBlock.accept(IteratorBlock.java:67)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.ConditionalBlock.accept(ConditionalBlock.java:48)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.Environment.include(Environment.java:2074)
	at freemarker.core.Include.accept(Include.java:165)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.IteratorBlock$Context.runLoop(IteratorBlock.java:159)
	at freemarker.core.Environment.visitIteratorBlock(Environment.java:559)
	at freemarker.core.IteratorBlock.accept(IteratorBlock.java:67)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.Environment.include(Environment.java:2074)
	at freemarker.core.Include.accept(Include.java:165)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.IteratorBlock$Context.runLoop(IteratorBlock.java:159)
	at freemarker.core.Environment.visitIteratorBlock(Environment.java:559)
	at freemarker.core.IteratorBlock.accept(IteratorBlock.java:67)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visitByHiddingParent(Environment.java:333)
	at freemarker.core.IfBlock.accept(IfBlock.java:48)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.MixedContent.accept(MixedContent.java:62)
	at freemarker.core.Environment.visit(Environment.java:312)
	at freemarker.core.Environment.process(Environment.java:290)
	at freemarker.template.Template.process(Template.java:312)
	at com.supcon.orchid.entityconf.services.impl.BAPSingleEntityGenerateServiceImpl.renderFtl(BAPSingleEntityGenerateServiceImpl.java:3001)
	at com.supcon.orchid.entityconf.services.impl.BAPSingleEntityGenerateServiceImpl.buildTpl(BAPSingleEntityGenerateServiceImpl.java:2989)
	at com.supcon.orchid.entityconf.services.impl.BAPSingleEntityGenerateServiceImpl.generateEditView(BAPSingleEntityGenerateServiceImpl.java:2199)
	at com.supcon.orchid.entityconf.services.impl.BAPSingleEntityGenerateServiceImpl.buildView(BAPSingleEntityGenerateServiceImpl.java:812)
	at com.supcon.orchid.entityconf.services.impl.BAPSingleEntityGenerateServiceImpl.generateViews(BAPSingleEntityGenerateServiceImpl.java:729)
	at com.supcon.orchid.entityconf.services.impl.BAPSingleEntityGenerateServiceImpl.generateEntity(BAPSingleEntityGenerateServiceImpl.java:181)
	at sun.reflect.GeneratedMethodAccessor1763.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:606)
	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:309)
	at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:183)
	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150)
	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:110)
	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172)
	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:202)
	at com.sun.proxy.$Proxy828.generateEntity(Unknown Source)
	at com.supcon.orchid.entityconf.services.impl.BAPGenerateServiceImpl$GenerateTask.run(BAPGenerateServiceImpl.java:7953)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
	at java.lang.Thread.run(Thread.java:745)
