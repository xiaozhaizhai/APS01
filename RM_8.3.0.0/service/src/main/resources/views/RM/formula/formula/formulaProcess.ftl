<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = formula.tableInfoId!>
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
<#assign viewType = "readonly">
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=8,9,10" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('RM.viewtitle.randon1489295499272')>
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
		#RM_formula_formula_formulaProcess_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		</style>
		<script type="text/javascript">
			CUI.ns('RM.formula.formula.formulaProcess');
			RM.formula.formula.formulaProcess.currentUser = ${userJson};
			RM.formula.formula.formulaProcess.currentStaff = ${staffJson};
			RM.formula.formula.formulaProcess.currentDepartment = ${deptJson};
			RM.formula.formula.formulaProcess.currentPosition = ${postJson};
			RM.formula.formula.formulaProcess.currentCompany = ${compJson};
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
		<@s.form errorBarId="workbenchErrorBar" hiddenField="formula.mainMetarial.id,formula.product.id," onsubmitMethod="RM.formula.formula.formulaProcess.beforeSubmitMethod()" id="RM_formula_formula_formulaProcess_form" namespace="/RM/formula/formula/formulaProcess" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=RM_7.5.0.0_formula_Formula&_bapFieldPermissonModelName_=Formula&superEdit=${(superEdit!false)?string}" callback="RM.formula.formula.formulaProcess._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="RM_formula_formula_formulaProcess_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl" id="top_buttonbar">
									<#if !((formula.status)?? && formula.status == 77)>
									<#if ((formula.effectiveState)!0) == 0>
									<#if !(superEdit!false) && id??>
									</#if>
									</#if>
									
									<#if (superEdit!false) || pendingId??>
									<a class='cui-btn-new' id="edit-save-btn" onclick="RM.formula.formula.formulaProcess.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
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
												RM.formula.formula.formulaProcess.submit(true);
											});
										});
									</script>
											</#if>
											<#break>
										</#if>
									</#list>
									</#if>

									</#if>
									
									<#if !(superEdit!false)>
									<#if pendingId??>
									<a class='cui-btn-new' id="edit-submit-btn" onclick="RM.formula.formula.formulaProcess.submit()"><span class="submit"></span>${getHtmlText("ec.flow.submit")}</a>
									</#if>
									<#if formula??&&formula.status??&&formula.status!=0&&formula.status!=99>
									<#if notifyEnabled?? && notifyEnabled>
									<!-- 系统启用通知功能时，才能崔办 -->
									<a class='cui-btn-new'  id="edit-remind-btn" onclick="ec.common.remind(${formula.tableInfoId!},${formula.id!})"><span class="edit-press"></span>${getHtmlText("ec.flow.remind")}</a>
									</#if>
				
									<#if recallAble && formula??&&formula.status??&&formula.status!=77>
									<a class='cui-btn-new'  id="edit-recall-btn" onclick="RM.formula.formula.formulaProcess.recall()"><span class="edit-cancel"></span>${getHtmlText("ec.flow.recall")}</a>
								
									</#if>
									<#if hasSupervision>
									<a class='cui-btn-new' id="edit-supervision-btn" onclick="RM.formula.formula.formulaProcess.supervision()"><span class="edit-person"></span>${getHtmlText("ec.flow.supervision.modifyPending")}</a>

									</#if>
									</#if>
									<#if pendingId??>
									<a class='cui-btn-new' id="edit-proxyPending-btn" onclick="ec.common.proxyPending(${pendingId})"><span class="edit-entrust"></span>${getHtmlText("ec.pending.proxyPending")}</a>
									</#if>
									<#if (formula.processKey)?? && formula.status == 99 && checkUserPermisition('RM_7.5.0.0_formula_retrial')>
									<a class='cui-btn-new' id="edit-retrialThisTable-btn" onclick="RM.formula.formula.formulaProcess.retrialThisTable()"><span class="edit-giveup"></span>${getHtmlText("ec.flow.retrial")}</a>
			
									</#if>
									</#if>
									</#if>
									
									<a class='cui-btn-new' id="edit-close-btn" onclick="window.close()"><span class="close"></span>${getHtmlText("foundation.common.closeWindow")}</a>
			
								</div>
								
								<div class="fr">
									<ul>
										<#if ((formula.effectiveState)!0) == 0>
										<#if !(superEdit!false)>
										<li id="fr_flow"><a title='${getText("ec.flow.flowImage")}' onclick="RM.formula.formula.formulaProcess.showInfoDialog('flow')"><span class='icon_prograss' ></span></a></li>
										</#if>
										</#if>
										<#if auditCheck('RM_7.5.0.0_formula_formulaProcess') == '1'>
										<li id="fr_audit" ><a title='${getText("foundation.base.audit")}' onclick="RM.formula.formula.formulaProcess.showAudit()">
										<span class='icon_audit' ></span>
										</a></li>
										</#if>
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="RM.formula.formula.formulaProcess.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="RM_formula_formula_formulaProcess_form_attcount"></em></i></span>
										</a></li>
										<li id="fr_dealInfo"><a title='${getText("ec.view.dealadvice")}'  onclick="RM.formula.formula.formulaProcess.showInfoDialog('dealInfo')"><span class='icon_handle'></span></a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
								<span class="tableNo"><#if formula.tableNo??> &nbsp;&nbsp;${formula.tableNo}</#if></span>
								<span class="staff">${getText('ec.common.left.bracket')}${(creatorInfo.staff.name)!}
									<#if !editNew>
									<input type="hidden" name="formula.createStaffId" value="${editNew?string((creatorInfo.staff.id)!'\'\'',(formula.createStaffId)!'\'\'')}" />
									</#if>
									<#if !editNew>
									<input type="hidden" name="formula.createTime" value="${(formula.createTime?datetime)!}" />
									</#if>
									
									${editNew?string(datetime(),(formula.createTime?datetime)!)} 
								</span>
								
								<span class="position">
									<input id="positionLayRec" type="hidden" name="formula.positionLayRec" value="<#if editNew>${(creatorInfo.positions[0].layRec)!}<#else>${(formula.positionLayRec)!}</#if>" />
										<#if editNew>
											<#if creatorInfo.positions?size == 1>
											${(creatorInfo.positions[0].name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="formula.createPositionId" value="${creatorInfo.positions[0].id}" />
											<input type="hidden" name="formula.createDepartmentId" value="${(creatorInfo.positions[0].department.id)!}" />
										
											<#else>
											<#list creatorInfo.positions as p>
												<#if !(p.isVirtual?? && p.isVirtual)>
													<#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>
												<input type="hidden" id="creatorDepartmentId" name="formula.createDepartmentId" value="${p.department.id}" />
													</#if>
												</#if>
											</#list>
											<select id="creatorPosition" name="formula.createPositionId" onchange="RM.formula.formula.formulaProcess.setDepartment()">
												<#list creatorInfo.positions as p>
													<#if !(p.isVirtual?? && p.isVirtual)>
													<option value="${p.id}" <#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>selected</#if> layRec="${(p.layRec)!}" departmentId="${p.department.id}" departmentName="${p.department.name}">${p.name}</option>
													</#if>
												</#list>
											</select>${getText('ec.common.right.bracket')}
											</#if>
										<#else>
											${(creatorInfo.position.name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="formula.createPositionId" value="${(formula.createPositionId)!}" />
										</#if>
								</span>
								
								
								<span class="status">
									${getText('ec.workflow.status')}${getText('ec.common.validate.colon')}
									<a href="#" onclick="javascript:void(0)">
										${getText((formula.pending.taskDescription)!)}
									</a>
								</span>
							</div>
    					</div>
    					
    					<div class="edit-main" id="RM_formula_formula_formulaProcess">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="formulaProcess">
								<input type="hidden" name="datagridKey" value="RM_formula_formula_formulaProcess_datagrids">
								<input type="hidden" name="viewCode" value="RM_7.5.0.0_formula_formulaProcess">
								<input type="hidden" name="modelName" value="Formula">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="formula.version" value="${(formula.version)!0}" />
								<input type="hidden" name="formula.extraCol" value='' />
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
										<input type="hidden" name="formula.mainMetarial.id" value="${(formula.mainMetarial.id)!""}" originalvalue="${(formula.mainMetarial.id)!""}"/>
										<input type="hidden" name="formula.product.id" value="${(formula.product.id)!""}" originalvalue="${(formula.product.id)!""}"/>

		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('RM.tabname.radion1489296214797')}</li>
			<li>${getText('RM.tabname.radion14892962320362324')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "RM_formula_formula_formulaProcess_form"+"_attcount";
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

									<div class="clearfix pd_bottom">
										<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<#if !RM_7_5_0_0_formula_Formula_code_permit??>
					<#assign RM_7_5_0_0_formula_Formula_code_permit = checkFieldPermission('formula.code','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_code')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_code_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_code_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1488246312092')}" >${getText('RM.propertydisplayName.randon1488246312092')}</label>
				</td>
				
						<#assign formula_code_defaultValue  = ''>
							 							<#assign formula_code_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_code_permit??>
					<#assign RM_7_5_0_0_formula_Formula_code_permit = checkFieldPermission('formula.code','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_code')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_code_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_code_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="BAPCODE" name="formula.code" id="formula_code"  style=";" originalvalue="<#if !newObj || (formula.code)?has_content>${(formula.code?html)!}<#else>${formula_code_defaultValue!}</#if>" value="<#if !newObj || (formula.code)?has_content>${(formula.code?html)!}<#else>${formula_code_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_Formula_name_permit??>
					<#assign RM_7_5_0_0_formula_Formula_name_permit = checkFieldPermission('formula.name','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487075823790')}" >${getText('RM.propertydisplayName.randon1487075823790')}</label>
				</td>
				
						<#assign formula_name_defaultValue  = ''>
							 							<#assign formula_name_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_name_permit??>
					<#assign RM_7_5_0_0_formula_Formula_name_permit = checkFieldPermission('formula.name','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_name')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_name_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.name" id="formula_name"  style=";" originalvalue="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" value="<#if !newObj || (formula.name)?has_content>${(formula.name?html)!}<#else>${formula_name_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_Formula_edition_permit??>
					<#assign RM_7_5_0_0_formula_Formula_edition_permit = checkFieldPermission('formula.edition','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_edition')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_edition_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_edition_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487139592239')}" >${getText('RM.propertydisplayName.randon1487139592239')}</label>
				</td>
				
						<#assign formula_edition_defaultValue  = ''>
							 							<#assign formula_edition_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_edition_permit??>
					<#assign RM_7_5_0_0_formula_Formula_edition_permit = checkFieldPermission('formula.edition','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_edition')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_edition_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_edition_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
									<input name="formula.edition" id="formula_edition"  style=";" originalvalue="<#if newObj&& !(formula.edition)?has_content>${formula_edition_defaultValue!}<#elseif (formula.edition)?has_content>#{(formula.edition)!; m2M2}</#if>" value="<#if newObj&& !(formula.edition)?has_content>${formula_edition_defaultValue!}<#elseif (formula.edition)?has_content>#{(formula.edition)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							</#if>
				</td>
				</tr><tr >
												<#if !RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productCode_permit??>
					<#assign RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('formula.product.productCode','RM_7.5.0.0_formula_Formula','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.radion14157726448332323')}" >${getText('RM.propertydisplayName.radion14157726448332323')}</label>
				</td>
				
						<#assign formula_product_productCode_defaultValue  = ''>
														<#assign formula_product_productCode_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productCode_permit??>
					<#assign RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('formula.product.productCode','RM_7.5.0.0_formula_Formula','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productCode_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('formula_product_productCode')" view=true value="${(formula.product.productCode)!}" displayFieldName="productCode" name="formula.product.productCode" id="formula_product_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_formulaProcess_form" editCustomCallback=";" onkeyupfuncname=";_callback_formula_product_productCode(obj);" cssStyle="" isEdit=true   refViewCode="MESBasic_1_product_productRefNew"  isCrossCompany=false />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="${viewType!}" deValue="${formula_product_productCode_defaultValue!}" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('formula_product_productCode')" view=true  value="${(formula.product.productCode)!}" displayFieldName="productCode" name="formula.product.productCode" id="formula_product_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_formulaProcess_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_formula_product_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_formulaProcess_form',obj, 'formula.product', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('RM_formula_formula_formulaProcess_form', 'formula.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				
												<#if !RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productName_permit??>
					<#assign RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productName_permit = checkFieldPermission('formula.product.productName','RM_7.5.0.0_formula_Formula','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.radion1415772740737234')}" >${getText('RM.propertydisplayName.radion1415772740737234')}</label>
				</td>
				
						<#assign formula_product_productName_defaultValue  = ''>
														<#assign formula_product_productName_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productName_permit??>
					<#assign RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productName_permit = checkFieldPermission('formula.product.productName','RM_7.5.0.0_formula_Formula','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_product_MESBasic_1_product_Product_productName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.product.productName" id="formula_product_productName"  style=";" originalvalue="<#if !newObj || (formula.product.productName)?has_content>${(formula.product.productName?html)!}<#else>${formula_product_productName_defaultValue!}</#if>" value="<#if !newObj || (formula.product.productName)?has_content>${(formula.product.productName?html)!}<#else>${formula_product_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_Formula_produceType_permit??>
					<#assign RM_7_5_0_0_formula_Formula_produceType_permit = checkFieldPermission('formula.produceType','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_produceType')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_produceType_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_produceType_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076555894')}" >${getText('RM.propertydisplayName.randon1487076555894')}</label>
				</td>
				
						<#assign formula_produceType_defaultValue  = ''>
							 							<#assign formula_produceType_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_produceType_permit??>
					<#assign RM_7_5_0_0_formula_Formula_produceType_permit = checkFieldPermission('formula.produceType','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_produceType')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_produceType_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_produceType_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if RM_7_5_0_0_formula_Formula_produceType_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="" viewType="${viewType!}" deValue="${formula_produceType_defaultValue!}" formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.produceType.id" code="produceType" value="${(formula.produceType.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_produceType_defaultValue!}" formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.produceType.id" code="produceType" value="${(formula.produceType.id)!}"  />
									</#if>
								<#else>
									<#if RM_7_5_0_0_formula_Formula_produceType_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.produceType.id" code="produceType" value="${(formula.produceType.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.produceType.id" code="produceType" value="${(formula.produceType.id)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				</tr><tr >
							 					<#if !RM_7_5_0_0_formula_Formula_usedFor_permit??>
					<#assign RM_7_5_0_0_formula_Formula_usedFor_permit = checkFieldPermission('formula.usedFor','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_usedFor')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_usedFor_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_usedFor_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076506987')}" >${getText('RM.propertydisplayName.randon1487076506987')}</label>
				</td>
				
						<#assign formula_usedFor_defaultValue  = ''>
							 							<#assign formula_usedFor_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_usedFor_permit??>
					<#assign RM_7_5_0_0_formula_Formula_usedFor_permit = checkFieldPermission('formula.usedFor','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_usedFor')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_usedFor_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_usedFor_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if RM_7_5_0_0_formula_Formula_usedFor_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="" viewType="${viewType!}" deValue="${formula_usedFor_defaultValue!}" formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.usedFor.id" code="usedFor" value="${(formula.usedFor.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_usedFor_defaultValue!}" formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.usedFor.id" code="usedFor" value="${(formula.usedFor.id)!}"  />
									</#if>
								<#else>
									<#if RM_7_5_0_0_formula_Formula_usedFor_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.usedFor.id" code="usedFor" value="${(formula.usedFor.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.usedFor.id" code="usedFor" value="${(formula.usedFor.id)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_Formula_isForProduct_permit??>
					<#assign RM_7_5_0_0_formula_Formula_isForProduct_permit = checkFieldPermission('formula.isForProduct','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_isForProduct')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_isForProduct_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_isForProduct_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon148707652853934')}" >${getText('RM.propertydisplayName.randon148707652853934')}</label>
				</td>
				
						<#assign formula_isForProduct_defaultValue  = ''>
							 							<#assign formula_isForProduct_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_isForProduct_permit??>
					<#assign RM_7_5_0_0_formula_Formula_isForProduct_permit = checkFieldPermission('formula.isForProduct','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_isForProduct')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_isForProduct_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_isForProduct_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if RM_7_5_0_0_formula_Formula_isForProduct_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.isForProduct_check" originalvalue="<#if !newObj || (formula.isForProduct)?has_content>${(formula.isForProduct!false)?string('true','false')}<#elseif formula_isForProduct_defaultValue?has_content>${(formula_isForProduct_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (formula.isForProduct)?has_content>${(formula.isForProduct!false)?string('true','false')}<#else>${(formula_isForProduct_defaultValue!true)?string}</#if>"  disabled=true/>
								</#if>
								<input property_type="BOOLEAN" type="hidden" name="formula.isForProduct" originalvalue="<#if ((formula.isForProduct)?? &&  formula.isForProduct)||(formula_isForProduct_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.isForProduct)?? &&  formula.isForProduct)||(formula_isForProduct_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.isForProduct_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.isForProduct"]');
												CUI('input[name="formula.isForProduct_check"]').each(function(){
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
				
							 					<#if !RM_7_5_0_0_formula_Formula_state_permit??>
					<#assign RM_7_5_0_0_formula_Formula_state_permit = checkFieldPermission('formula.state','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_state')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_state_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_state_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076473255')}" >${getText('RM.propertydisplayName.randon1487076473255')}</label>
				</td>
				
						<#assign formula_state_defaultValue  = ''>
							 							<#assign formula_state_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_state_permit??>
					<#assign RM_7_5_0_0_formula_Formula_state_permit = checkFieldPermission('formula.state','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_state')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_state_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_state_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if newObj>
									<#if RM_7_5_0_0_formula_Formula_state_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange="" viewType="${viewType!}" deValue="${formula_state_defaultValue!}" formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.state.id" code="state" value="${(formula.state.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${formula_state_defaultValue!}" formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.state.id" code="state" value="${(formula.state.id)!}"  />
									</#if>
								<#else>
									<#if RM_7_5_0_0_formula_Formula_state_permit == 1>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.state.id" code="state" value="${(formula.state.id)!}"  />
									<#else>
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="RM_formula_formula_formulaProcess_form" classStyle="cui-noborder-input" ecFlag=true multable=false view=true cssStyle="" name="formula.state.id" code="state" value="${(formula.state.id)!}"  />
									</#if>
								</#if>
							</#if>
				</td>
				</tr><tr >
							 					<#if !RM_7_5_0_0_formula_Formula_longTime_permit??>
					<#assign RM_7_5_0_0_formula_Formula_longTime_permit = checkFieldPermission('formula.longTime','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_longTime')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_longTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_longTime_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076739963')}" >${getText('RM.propertydisplayName.randon1487076739963')}</label>
				</td>
				
						<#assign formula_longTime_defaultValue  = ''>
							 							<#assign formula_longTime_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_longTime_permit??>
					<#assign RM_7_5_0_0_formula_Formula_longTime_permit = checkFieldPermission('formula.longTime','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_longTime')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_longTime_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_longTime_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
									<input name="formula.longTime" id="formula_longTime"  style=";" originalvalue="<#if newObj&& !(formula.longTime)?has_content>${formula_longTime_defaultValue!}<#elseif (formula.longTime)?has_content>#{(formula.longTime)!; m2M2}</#if>" value="<#if newObj&& !(formula.longTime)?has_content>${formula_longTime_defaultValue!}<#elseif (formula.longTime)?has_content>#{(formula.longTime)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
								});
							</script>
							</#if>
				</td>
				
												<#if !RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productCode_permit??>
					<#assign RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('formula.mainMetarial.productCode','RM_7.5.0.0_formula_Formula','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.radion14157726448332324')}" >${getText('RM.propertydisplayName.radion14157726448332324')}</label>
				</td>
				
						<#assign formula_mainMetarial_productCode_defaultValue  = ''>
														<#assign formula_mainMetarial_productCode_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productCode_permit??>
					<#assign RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('formula.mainMetarial.productCode','RM_7.5.0.0_formula_Formula','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productCode_permit == 1>
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('formula_mainMetarial_productCode')" view=true value="${(formula.mainMetarial.productCode)!}" displayFieldName="productCode" name="formula.mainMetarial.productCode" id="formula_mainMetarial_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_formulaProcess_form" editCustomCallback=";" onkeyupfuncname=";_callback_formula_mainMetarial_productCode(obj);" cssStyle="" isEdit=true   refViewCode="MESBasic_1_product_productRefNew"  isCrossCompany=false />
								<#else>
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.randon1475137145215')}" viewType="${viewType!}" deValue="${formula_mainMetarial_productCode_defaultValue!}" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('formula_mainMetarial_productCode')" view=true  value="${(formula.mainMetarial.productCode)!}" displayFieldName="productCode" name="formula.mainMetarial.productCode" id="formula_mainMetarial_productCode" type="other" url="/MESBasic/product/product/productRefNew.action" clicked=true multiple=false mnewidth=260 formId="RM_formula_formula_formulaProcess_form" editCustomCallback=";" refViewCode="MESBasic_1_product_productRefNew" onkeyupfuncname=";_callback_formula_mainMetarial_productCode(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								</#if>
								
								
								<script type="text/javascript">
								<#if !(formula.id)?? && (formula.mainMetarial.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${formula.mainMetarial.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('RM_formula_formula_formulaProcess_form',obj, 'formula.mainMetarial', '/MESBasic/product/product/productRefNew.action');
												CUI.commonFills('RM_formula_formula_formulaProcess_form', 'formula.mainMetarial',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				
												<#if !RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productName_permit??>
					<#assign RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productName_permit = checkFieldPermission('formula.mainMetarial.productName','RM_7.5.0.0_formula_Formula','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.radion141577274073723')}" >${getText('RM.propertydisplayName.radion141577274073723')}</label>
				</td>
				
						<#assign formula_mainMetarial_productName_defaultValue  = ''>
														<#assign formula_mainMetarial_productName_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productName_permit??>
					<#assign RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productName_permit = checkFieldPermission('formula.mainMetarial.productName','RM_7.5.0.0_formula_Formula','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_mainMetarial_MESBasic_1_product_Product_productName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.mainMetarial.productName" id="formula_mainMetarial_productName"  style=";" originalvalue="<#if !newObj || (formula.mainMetarial.productName)?has_content>${(formula.mainMetarial.productName?html)!}<#else>${formula_mainMetarial_productName_defaultValue!}</#if>" value="<#if !newObj || (formula.mainMetarial.productName)?has_content>${(formula.mainMetarial.productName?html)!}<#else>${formula_mainMetarial_productName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr >
							 					<#if !RM_7_5_0_0_formula_Formula_theoreYield_permit??>
					<#assign RM_7_5_0_0_formula_Formula_theoreYield_permit = checkFieldPermission('formula.theoreYield','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_theoreYield')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_theoreYield_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_theoreYield_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076820454')}" >${getText('RM.propertydisplayName.randon1487076820454')}</label>
				</td>
				
						<#assign formula_theoreYield_defaultValue  = ''>
							 							<#assign formula_theoreYield_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_theoreYield_permit??>
					<#assign RM_7_5_0_0_formula_Formula_theoreYield_permit = checkFieldPermission('formula.theoreYield','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_theoreYield')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_theoreYield_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_theoreYield_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.theoreYield" id="formula_theoreYield"  style=";" originalvalue="<#if !newObj || (formula.theoreYield)?has_content>${(formula.theoreYield?html)!}<#else>${formula_theoreYield_defaultValue!}</#if>" value="<#if !newObj || (formula.theoreYield)?has_content>${(formula.theoreYield?html)!}<#else>${formula_theoreYield_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !RM_7_5_0_0_formula_Formula_batchContral_permit??>
					<#assign RM_7_5_0_0_formula_Formula_batchContral_permit = checkFieldPermission('formula.batchContral','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_batchContral')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_batchContral_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_batchContral_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076619868')}" >${getText('RM.propertydisplayName.randon1487076619868')}</label>
				</td>
				
						<#assign formula_batchContral_defaultValue  = ''>
							 							<#assign formula_batchContral_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_batchContral_permit??>
					<#assign RM_7_5_0_0_formula_Formula_batchContral_permit = checkFieldPermission('formula.batchContral','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_batchContral')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_batchContral_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_batchContral_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if RM_7_5_0_0_formula_Formula_batchContral_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.batchContral_check" originalvalue="<#if !newObj || (formula.batchContral)?has_content>${(formula.batchContral!false)?string('true','false')}<#elseif formula_batchContral_defaultValue?has_content>${(formula_batchContral_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (formula.batchContral)?has_content>${(formula.batchContral!false)?string('true','false')}<#else>${(formula_batchContral_defaultValue!true)?string}</#if>"  disabled=true/>
								</#if>
								<input property_type="BOOLEAN" type="hidden" name="formula.batchContral" originalvalue="<#if ((formula.batchContral)?? &&  formula.batchContral)||(formula_batchContral_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.batchContral)?? &&  formula.batchContral)||(formula_batchContral_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.batchContral_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.batchContral"]');
												CUI('input[name="formula.batchContral_check"]').each(function(){
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
				
							 					<#if !RM_7_5_0_0_formula_Formula_supportEbr_permit??>
					<#assign RM_7_5_0_0_formula_Formula_supportEbr_permit = checkFieldPermission('formula.supportEbr','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_supportEbr')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_supportEbr_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_supportEbr_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076720187')}" >${getText('RM.propertydisplayName.randon1487076720187')}</label>
				</td>
				
						<#assign formula_supportEbr_defaultValue  = ''>
							 							<#assign formula_supportEbr_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_supportEbr_permit??>
					<#assign RM_7_5_0_0_formula_Formula_supportEbr_permit = checkFieldPermission('formula.supportEbr','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_supportEbr')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_supportEbr_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_supportEbr_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								<#if RM_7_5_0_0_formula_Formula_supportEbr_permit == 0>
								<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
								<#else>
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="formula.supportEbr_check" originalvalue="<#if !newObj || (formula.supportEbr)?has_content>${(formula.supportEbr!false)?string('true','false')}<#elseif formula_supportEbr_defaultValue?has_content>${(formula_supportEbr_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj || (formula.supportEbr)?has_content>${(formula.supportEbr!false)?string('true','false')}<#else>${(formula_supportEbr_defaultValue!true)?string}</#if>"  disabled=true/>
								</#if>
								<input property_type="BOOLEAN" type="hidden" name="formula.supportEbr" originalvalue="<#if ((formula.supportEbr)?? &&  formula.supportEbr)||(formula_supportEbr_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((formula.supportEbr)?? &&  formula.supportEbr)||(formula_supportEbr_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="formula.supportEbr_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="formula.supportEbr"]');
												CUI('input[name="formula.supportEbr_check"]').each(function(){
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
							 					<#if !RM_7_5_0_0_formula_Formula_yieldFormula_permit??>
					<#assign RM_7_5_0_0_formula_Formula_yieldFormula_permit = checkFieldPermission('formula.yieldFormula','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_yieldFormula')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_yieldFormula_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_yieldFormula_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076796673')}" >${getText('RM.propertydisplayName.randon1487076796673')}</label>
				</td>
				
						<#assign formula_yieldFormula_defaultValue  = ''>
							 							<#assign formula_yieldFormula_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_yieldFormula_permit??>
					<#assign RM_7_5_0_0_formula_Formula_yieldFormula_permit = checkFieldPermission('formula.yieldFormula','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_yieldFormula')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_yieldFormula_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_yieldFormula_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="formula.yieldFormula" id="formula_yieldFormula"  style=";" originalvalue="<#if !newObj || (formula.yieldFormula)?has_content>${(formula.yieldFormula?html)!}<#else>${formula_yieldFormula_defaultValue!}</#if>" value="<#if !newObj || (formula.yieldFormula)?has_content>${(formula.yieldFormula?html)!}<#else>${formula_yieldFormula_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
				<td class="edit-table-symbol" colspan="4">&nbsp;</td>
				</tr><tr >
							 					<#if !RM_7_5_0_0_formula_Formula_description_permit??>
					<#assign RM_7_5_0_0_formula_Formula_description_permit = checkFieldPermission('formula.description','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_description')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_description_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if RM_7_5_0_0_formula_Formula_description_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('RM.propertydisplayName.randon1487076858348')}" >${getText('RM.propertydisplayName.randon1487076858348')}</label>
				</td>
				
						<#assign formula_description_defaultValue  = ''>
							 							<#assign formula_description_defaultValue  = ''>
					<#if !RM_7_5_0_0_formula_Formula_description_permit??>
					<#assign RM_7_5_0_0_formula_Formula_description_permit = checkFieldPermission('formula.description','RM_7.5.0.0_formula_Formula','RM_7.5.0.0_formula_Formula_description')>
					</#if>
					<td <#if RM_7_5_0_0_formula_Formula_description_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
							<#if RM_7_5_0_0_formula_Formula_description_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="formula_description" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="formula_description" originalvalue="<#if !newObj || (formula.description)?has_content>${(formula.description?html)!}<#else>${formula_description_defaultValue?html}</#if>"  name="formula.description" class="cui-noborder-textarea cui-textarea-auto" readonly="readonly" style=";" ><#if !newObj || (formula.description)?has_content>${(formula.description)!}<#else>${formula_description_defaultValue}</#if></textarea></div>
							</#if>
				</td>
		</tr>
	</table>
</div>										</div>
										<div class="edit-datatable">	
										</div>
									</div>
									<div class="clearfix pd_bottom">
										<div class="cui-elements pd-top">

<div class="edit-panes-s" >
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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formula/data-dg1489296259250.action?formula.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296259250">
			<#else>
				<#assign dUrl="/RM/formula/formula/data-dg1489296259250.action?formula.id=${(formula.id)!-1}&datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296259250">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_FormulaProcess_dg1489296259250_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_FormulaProcess_dg1489296259250_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaProcess_dg1489296259250" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1489296259250_id" value="FormulaProcess_dg1489296259250" />
			
			<input type="hidden" id="dg1489296259250_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487140927408')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formula/data-dg1489296259250.action?operateType=export&datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296259250"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaProcess_dg1489296259250" />
			<@datagrid withoutConfigTable=true id="FormulaProcess_dg1489296259250" viewType="${viewType}" renderOverEvent="dg1489296259250RenderOverEvent" route="${routeFlag}" formId="RM_formula_formula_formulaProcess_form" noPermissionKeys="name,processType.name,longTime,processIdBeforeProcessID,meno" modelCode="RM_7.5.0.0_formula_FormulaProcess" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1489296259250" dtPage="dgPage"  hidekeyPrefix="dg1489296259250" hidekey="['id','version','processType.id','processType.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  noPadding=true isEdit=true tabViewIndex=1 pageInitMethod="dg1489296259250PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										 
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487295011793')}" width=100 showFormatFunc=""/>
							<#assign processType_name_displayDefaultType=''>
								<#assign processType_name_defaultValue=''>
										<#assign processType_name_defaultValue=''>
																	<#if (processType_name_defaultValue!)?string=="currentUser">
								<#assign processType_name_defaultValue='${staffJson!}'>
							<#elseif (processType_name_defaultValue!)?string=="currentPost">
								<#assign processType_name_defaultValue='${postJson!}'>
							<#elseif (processType_name_defaultValue!)?string=="currentDepart">
								<#assign processType_name_defaultValue='${deptJson!}'>
							<#elseif (processType_name_defaultValue!)?string=="currentComp">
								<#assign processType_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="processType.name"        showFormat="SELECTCOMP" defaultValue="${(processType_name_defaultValue!)?string}" defaultDisplay="${(processType_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formula.formulaProcess"  textalign="left"  viewUrl="/RM/processType/processType/processTypeRef.action" viewCode="RM_7.5.0.0_processType_processTypeRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487220867598')}"  label="${getText('RM.propertydisplayName.randon1487074387497233234')}" width=100 showFormatFunc=""/>
							<#assign longTime_displayDefaultType=''>
								<#assign longTime_defaultValue=''>
										<#assign longTime_defaultValue=''>
										 
									<@datacolumn key="longTime"        showFormat="TEXT" defaultValue="${(longTime_defaultValue!)?string}" defaultDisplay="${(longTime_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487292241411')}" width=100 showFormatFunc=""/>
							<#assign processIdBeforeProcessID_displayDefaultType=''>
								<#assign processIdBeforeProcessID_defaultValue=''>
							<#if (processIdBeforeProcessID_defaultValue!)?string=="currentUser">
								<#assign processIdBeforeProcessID_defaultValue='${staffJson!}'>
							<#elseif (processIdBeforeProcessID_defaultValue!)?string=="currentPost">
								<#assign processIdBeforeProcessID_defaultValue='${postJson!}'>
							<#elseif (processIdBeforeProcessID_defaultValue!)?string=="currentDepart">
								<#assign processIdBeforeProcessID_defaultValue='${deptJson!}'>
							<#elseif (processIdBeforeProcessID_defaultValue!)?string=="currentComp">
								<#assign processIdBeforeProcessID_defaultValue='${compJson!}'>
							</#if>
									<@datacolumn key="processIdBeforeProcessID"  multiselect=true displayFieldName="name"      showFormat="TEXT" defaultValue="${(processIdBeforeProcessID_defaultValue!)?string}" defaultDisplay="${(processIdBeforeProcessID_displayDefaultType!)?string}" decimal="" editable=false type="multselect" showType="multselect" notnull=false   selectCompName="RM.formula.formula.formulaProcess"  textalign="right"  viewUrl="/RM/formula/formulaProcess/processReference.action?multiSelect=true" viewCode="RM_7.5.0.0_formula_processReference" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488596828660')}" mneenable=false  label="${getText('RM.propertydisplayName.randon1487307483490')}" width=200 showFormatFunc=""/>
							<#assign meno_displayDefaultType=''>
								<#assign meno_defaultValue=''>
										<#assign meno_defaultValue=''>
										 
									<@datacolumn key="meno"        showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487292273721')}" width=100 showFormatFunc=""/>
			
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
				function FormulaProcess_dg1489296259250_check_datagridvalid(){
					//
					var errorObj =FormulaProcess_dg1489296259250Widget._DT.testData();
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
				
				function savedg1489296259250DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaProcess_dg1489296259250Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaProcess_dg1489296259250Widget') > -1) {
						FormulaProcess_dg1489296259250Widget.setAllRowEdited();
					}
					var json = FormulaProcess_dg1489296259250Widget.parseEditedData();
					$('input[name="dg1489296259250ListJson"]').remove();
					$('input[name="dgLists[\'dg1489296259250\']"]').remove();
					$('input[name="dg1489296259250ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1489296259250\']">').val(json).appendTo($('#RM_formula_formula_formulaProcess_form'));
					$('<input type="hidden" name="dg1489296259250ModelCode">').val('RM_7.5.0.0_formula_FormulaProcess').appendTo($('#RM_formula_formula_formulaProcess_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1489296259250ListJson">').val(json).appendTo($('#RM_formula_formula_formulaProcess_form'));
				}
				function DT_FormulaProcess_dg1489296259250_deldatagrid(){
					var deleteRows = FormulaProcess_dg1489296259250Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processType.id','formulaId.id','id.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1489296259250DeletedIds").length>0){
							$("#dg1489296259250DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489296259250DeletedIds" name="dgDeletedIds[\'dg1489296259250\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaProcess_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489296259250DeletedIds['+CUI('input[name^="dg1489296259250DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaProcess_form'));
					});
				}
				function DT_FormulaProcess_dg1489296259250_delTreeNodes(){
					var deleteRows = FormulaProcess_dg1489296259250Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processType.id','formulaId.id','id.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1489296259250DeletedIds").length>0){
							$("#dg1489296259250DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489296259250DeletedIds" name="dgDeletedIds[\'dg1489296259250\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaProcess_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489296259250DeletedIds['+CUI('input[name^="dg1489296259250DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaProcess_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formula_formulaProcess_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<3;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[1].length>0) {
						for(var i=0;i<datagrids[1].length;i++) {
							if(datagrids[1][i] == 'FormulaProcess_dg1489296259250') {
								break;
							}
							if(i==datagrids[1].length-1) {
								datagrids[1][datagrids[1].length] = 'FormulaProcess_dg1489296259250';
							}
						}
					} else {
						datagrids[1][datagrids[1].length] = 'FormulaProcess_dg1489296259250';
					}
					$('body').data('RM_formula_formula_formulaProcess_datagrids', datagrids);
				});
				
				var FormulaProcess_dg1489296259250_importDialog = null;
				function FormulaProcess_dg1489296259250_showImportDialog(){
					try{
						if(FormulaProcess_dg1489296259250_importDialog!=null&&FormulaProcess_dg1489296259250_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formula/initImport.action?datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296259250&tid=${id!}&datagridName=dg1489296259250";
						FormulaProcess_dg1489296259250_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaProcess_dg1489296259250"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcess_dg1489296259250_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaProcess_dg1489296259250_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaProcess_dg1489296259250_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaProcess_dg1489296259250_downLoadFile(){
					var url = "/RM/formula/formula/downLoad.action?datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296259250&templateRelatedModelCode=RM_7.5.0.0_formula_formulaProcessdg1489296259250&downloadType=template&fileName=dg1489296259250";
					window.open(url,"","");
				}
				function dg1489296259250RenderOverEvent(){
					$("#FormulaProcess_dg1489296259250 .paginatorbar").append('<div class="paginatorbar-operatebar"><a href="###"><span id="activeSet" class="buttonbar-button cui-btn-add"><p id="sssdd">活动设置</p></span></a></div>');
$('#activeSet').click(function(){ 
		var selectRow=FormulaProcess_dg1489296259250Widget.getSelectedRow();
		if(selectRow==undefined){
				CUI.Dialog.alert("请先选择工序！");
		}else{
				 var processId=FormulaProcess_dg1489296259250Widget.getCellValue(FormulaProcess_dg1489296259250Widget.getSelectedRow(),'id');
       var tableInfoId=decodeURI(window.location.search.substr(1).match(new RegExp("(^|&)tableInfoId=([^&]*)(&|$)"))[2]);
         var formulaId=$('#id').val();
	      url = "/RM/formula/formulaProcess/processActiveView.action?__pc__=${(Parameters.__pc__)!}&workFlowMenuCode=RM_7.5.0.0_formula_formulaProcess_processActiveView&openType=page&id="+processId+"&tableInfoId="+tableInfoId+"&formulaId="+formulaId;
 
        if(url!=""){
               openFullScreen(url);
         }
		
		}
		



 })
				}
				function dg1489296259250PageInitMethod(nTabIndex){
					RM.formula.formula.formulaProcess.initSize(nTabIndex);
				}
			</script>
			
			
										</div>
									</div>
									<div class="clearfix pd_bottom">
										<div class="cui-elements pd-top">

<div class="edit-panes-s" >
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
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/RM/formula/formula/data-dg1489296435612.action?formula.id=${refId!-1}&refId=${refId!-1}&datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296435612">
			<#else>
				<#assign dUrl="/RM/formula/formula/data-dg1489296435612.action?formula.id=${(formula.id)!-1}&datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296435612">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_FormulaBom_dg1489296435612_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_FormulaBom_dg1489296435612_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_FormulaBom_dg1489296435612" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1489296435612_id" value="FormulaBom_dg1489296435612" />
			
			<input type="hidden" id="dg1489296435612_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('RM.modelname.randon1487243065955')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/RM/formula/formula/data-dg1489296435612.action?operateType=export&datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296435612"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="FormulaBom_dg1489296435612" />
			<@datagrid withoutConfigTable=true id="FormulaBom_dg1489296435612" viewType="${viewType}" renderOverEvent="dg1489296435612RenderOverEvent" route="${routeFlag}" formId="RM_formula_formula_formulaProcess_form" noPermissionKeys="property,productId.productCode,productId.productName,isMixQuality,unitQuality,minQuality,maxQuality,meno" modelCode="RM_7.5.0.0_formula_FormulaBom" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1489296435612" dtPage="dgPage"  hidekeyPrefix="dg1489296435612" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  noPadding=true isEdit=true tabViewIndex=2 pageInitMethod="dg1489296435612PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
							<#assign property_displayDefaultType=''>
								<#assign property_defaultValue=''>
										<#assign property_defaultValue=''>
										 									<@systemCodeColumn code="property" textalign="center" defaultValue="${(property_defaultValue!)?string}" key="property.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1488852224246')}" width=100  />
							<#assign productId_productCode_displayDefaultType=''>
								<#assign productId_productCode_defaultValue=''>
										<#assign productId_productCode_defaultValue=''>
																	<#if (productId_productCode_defaultValue!)?string=="currentUser">
								<#assign productId_productCode_defaultValue='${staffJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentPost">
								<#assign productId_productCode_defaultValue='${postJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentDepart">
								<#assign productId_productCode_defaultValue='${deptJson!}'>
							<#elseif (productId_productCode_defaultValue!)?string=="currentComp">
								<#assign productId_productCode_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="RM.formula.formula.formulaProcess"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""/>
							<#assign productId_productName_displayDefaultType=''>
								<#assign productId_productName_defaultValue=''>
										<#assign productId_productName_defaultValue=''>
																	<#if (productId_productName_defaultValue!)?string=="currentUser">
								<#assign productId_productName_defaultValue='${staffJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentPost">
								<#assign productId_productName_defaultValue='${postJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentDepart">
								<#assign productId_productName_defaultValue='${deptJson!}'>
							<#elseif (productId_productName_defaultValue!)?string=="currentComp">
								<#assign productId_productName_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="RM.formula.formula.formulaProcess"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""/>
							<#assign isMixQuality_displayDefaultType=''>
								<#assign isMixQuality_defaultValue=''>
										<#assign isMixQuality_defaultValue=''>
										 
									<@datacolumn key="isMixQuality"        showFormat="CHECKBOX" defaultValue="${(isMixQuality_defaultValue!)?string}" defaultDisplay="${(isMixQuality_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852241781')}" width=100 showFormatFunc=""/>
							<#assign unitQuality_displayDefaultType=''>
								<#assign unitQuality_defaultValue=''>
										<#assign unitQuality_defaultValue=''>
										 
									<@datacolumn key="unitQuality"        showFormat="TEXT" defaultValue="${(unitQuality_defaultValue!)?string}" defaultDisplay="${(unitQuality_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1487243139091')}" width=100 showFormatFunc=""/>
							<#assign minQuality_displayDefaultType=''>
								<#assign minQuality_defaultValue=''>
										<#assign minQuality_defaultValue=''>
										 
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852437576')}" width=100 showFormatFunc=""/>
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										 
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852460357')}" width=100 showFormatFunc=""/>
							<#assign meno_displayDefaultType=''>
								<#assign meno_defaultValue=''>
										<#assign meno_defaultValue=''>
										 
									<@datacolumn key="meno"        showFormat="TEXT" defaultValue="${(meno_defaultValue!)?string}" defaultDisplay="${(meno_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('RM.propertydisplayName.randon1488852483896')}" width=100 showFormatFunc=""/>
			
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
				function FormulaBom_dg1489296435612_check_datagridvalid(){
					//
					var errorObj =FormulaBom_dg1489296435612Widget._DT.testData();
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
				
				function savedg1489296435612DataGrid(){
					<#if  refId?? && (refId gt 0)>
					FormulaBom_dg1489296435612Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('FormulaBom_dg1489296435612Widget') > -1) {
						FormulaBom_dg1489296435612Widget.setAllRowEdited();
					}
					var json = FormulaBom_dg1489296435612Widget.parseEditedData();
					$('input[name="dg1489296435612ListJson"]').remove();
					$('input[name="dgLists[\'dg1489296435612\']"]').remove();
					$('input[name="dg1489296435612ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1489296435612\']">').val(json).appendTo($('#RM_formula_formula_formulaProcess_form'));
					$('<input type="hidden" name="dg1489296435612ModelCode">').val('RM_7.5.0.0_formula_FormulaBom').appendTo($('#RM_formula_formula_formulaProcess_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1489296435612ListJson">').val(json).appendTo($('#RM_formula_formula_formulaProcess_form'));
				}
				function DT_FormulaBom_dg1489296435612_deldatagrid(){
					var deleteRows = FormulaBom_dg1489296435612Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1489296435612DeletedIds").length>0){
							$("#dg1489296435612DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489296435612DeletedIds" name="dgDeletedIds[\'dg1489296435612\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaProcess_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489296435612DeletedIds['+CUI('input[name^="dg1489296435612DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaProcess_form'));
					});
				}
				function DT_FormulaBom_dg1489296435612_delTreeNodes(){
					var deleteRows = FormulaBom_dg1489296435612Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1489296435612DeletedIds").length>0){
							$("#dg1489296435612DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1489296435612DeletedIds" name="dgDeletedIds[\'dg1489296435612\']" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaProcess_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1489296435612DeletedIds['+CUI('input[name^="dg1489296435612DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#RM_formula_formula_formulaProcess_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('RM_formula_formula_formulaProcess_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<3;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[2].length>0) {
						for(var i=0;i<datagrids[2].length;i++) {
							if(datagrids[2][i] == 'FormulaBom_dg1489296435612') {
								break;
							}
							if(i==datagrids[2].length-1) {
								datagrids[2][datagrids[2].length] = 'FormulaBom_dg1489296435612';
							}
						}
					} else {
						datagrids[2][datagrids[2].length] = 'FormulaBom_dg1489296435612';
					}
					$('body').data('RM_formula_formula_formulaProcess_datagrids', datagrids);
				});
				
				var FormulaBom_dg1489296435612_importDialog = null;
				function FormulaBom_dg1489296435612_showImportDialog(){
					try{
						if(FormulaBom_dg1489296435612_importDialog!=null&&FormulaBom_dg1489296435612_importDialog.isShow==1){
							return false;
						}
						var url = "/RM/formula/formula/initImport.action?datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296435612&tid=${id!}&datagridName=dg1489296435612";
						FormulaBom_dg1489296435612_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("FormulaBom_dg1489296435612"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaBom_dg1489296435612_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();FormulaBom_dg1489296435612_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						FormulaBom_dg1489296435612_importDialog.show();
					}catch(e){}
				}	
				
				function FormulaBom_dg1489296435612_downLoadFile(){
					var url = "/RM/formula/formula/downLoad.action?datagridCode=RM_7.5.0.0_formula_formulaProcessdg1489296435612&templateRelatedModelCode=RM_7.5.0.0_formula_formulaProcessdg1489296435612&downloadType=template&fileName=dg1489296435612";
					window.open(url,"","");
				}
				function dg1489296435612RenderOverEvent(){
				}
				function dg1489296435612PageInitMethod(nTabIndex){
					RM.formula.formula.formulaProcess.initSize(nTabIndex);
				}
			</script>
			
			
										</div>
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
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==2>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==3>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==4>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==5>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
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
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#elseif t.selectPeople==2>
										<#if t.userRangeFalg?? && t.userRangeFalg==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
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
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==2>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==3>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==4>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==5>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="RM.formula.formula.formulaProcess._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" outcome="${pending.activityName}" selectPeople="${pending.loop}"/>
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
							<#if pendingId??>
							<a class="cui-btn-blue" onclick="RM.formula.formula.formulaProcess.save()"><span class='btn_r'>${getText('ec.flow.save')}</span></a>
							</#if>
							<#if pendingId??>
							<a class="cui-btn-green" onclick="RM.formula.formula.formulaProcess.submit()"><span class='btn_r'>${getText('ec.flow.submit')}</span></a>
						
							</#if>
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
     	
		<div id="RM_formula_formula_formulaProcess_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if ((formula.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="RM.formula.formula.formulaProcess.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="RM.formula.formula.formulaProcess.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="RM.formula.formula.formulaProcess.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if ((formula.effectiveState)!0) == 0>
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		
		<!-- CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_formulaProcess,html,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) -->
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
						$("#RM_formula_formula_formulaProcess_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#RM_formula_formula_formulaProcess_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#RM_formula_formula_formulaProcess_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#RM_formula_formula_formulaProcess_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			RM.formula.formula.formulaProcess.initCount = 0;
			RM.formula.formula.formulaProcess.initSize = function(nTabIndex){
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
				var conHeight = h-$("#RM_formula_formula_formulaProcess_main_div .edit-head").height()-$("#RM_formula_formula_formulaProcess_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#RM_formula_formula_formulaProcess_main_div .edit-workflow").height()</#if>;
				$("#RM_formula_formula_formulaProcess_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('RM_formula_formula_formulaProcess_datagrids');
				var padding_bottom=16;
				$("#RM_formula_formula_formulaProcess_main_div .pd_bottom,#RM_formula_formula_formulaProcess_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#RM_formula_formula_formulaProcess_main_div .edit-panes-s").each(function(index){
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
									if(RM.formula.formula.formulaProcess.initCount <= 2) {
										setTimeout(function(){RM.formula.formula.formulaProcess.initSize();}, 200);
										RM.formula.formula.formulaProcess.initCount++;
									}/* else {
										RM.formula.formula.formulaProcess.initCount = 0;
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
							if(($("#RM_formula_formula_formulaProcess_main_div .edit-workflow").length > 0) && ($("#RM_formula_formula_formulaProcess_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				RM.formula.formula.formulaProcess.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				RM.formula.formula.formulaProcess.initSize();
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
						if(parseInt($("#RM_formula_formula_formulaProcess_main_div").css("width"),10)==650){
							$("#RM_formula_formula_formulaProcess_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//RM.formula.formula.formulaProcess.resizeLayout();
						//RM.formula.formula.formulaProcess.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#RM_formula_formula_formulaProcess_main_div").css("width"),10)==800){
							$("#RM_formula_formula_formulaProcess_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//RM.formula.formula.formulaProcess.resizeLayout();
						//RM.formula.formula.formulaProcess.initSize();
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
					RM.formula.formula.formulaProcess.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					RM.formula.formula.formulaProcess.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){RM.formula.formula.formulaProcess.initSize();});
				/*
				RM.formula.formula.formulaProcess.resizeLayout=function(){
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
			RM.formula.formula.formulaProcess.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${formula.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/RM/formula/formula/dealInfo-list.action&enableSimpleDealInfo=false");
			</#if>
		});

		RM.formula.formula.formulaProcess.validate = function(){
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
		RM.formula.formula.formulaProcess.beforeSaveProcess = function(){
			$('input[name="formula.extraCol"]').remove();
		}
		RM.formula.formula.formulaProcess.processDataGrid = function(){
										<#if false && isIE>
										$('#RM_formula_formula_formulaProcess_form').append(FormulaProcess_dg1489296259250Widget._DT.createInputs('dg1489296259250List'));
										</#if>
										<#if false && isIE>
										$('#RM_formula_formula_formulaProcess_form').append(FormulaBom_dg1489296435612Widget._DT.createInputs('dg1489296435612List'));
										</#if>
		};
		RM.formula.formula.formulaProcess.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!RM.formula.formula.formulaProcess.validate()){return;}
			RM.formula.formula.formulaProcess.beforeSaveProcess();

			//RM.formula.formula.formulaProcess.processDataGrid();
			$('#RM_formula_formula_formulaProcess_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('RM_formula_formula_formulaProcess_form','RM_formula_formula_formulaProcess_datagrids')) {      
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
		RM.formula.formula.formulaProcess.print = function(){
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
		
		RM.formula.formula.formulaProcess.saveSetting = function(){
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
		
		RM.formula.formula.formulaProcess.printSetting = function(){
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
				RM.formula.formula.formulaProcess.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(RM.formula.formula.formulaProcess.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				RM.formula.formula.formulaProcess.settingDialog.show();
			}
		}
		
		
		RM.formula.formula.formulaProcess.submit = function(uncheck){
			$('#operateType').val("submit");
			if(uncheck){}
			else
			if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').val())){
				workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
				return;
			}
			if(!RM.formula.formula.formulaProcess.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			RM.formula.formula.formulaProcess.beforeSaveProcess();
			
			//RM.formula.formula.formulaProcess.processDataGrid();
			
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
			$('#RM_formula_formula_formulaProcess_form').submit();
			//$(".wfcancel").remove();
			
		}
		RM.formula.formula.formulaProcess.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/RM/formula/formula/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(formula.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(formula.tableInfoId)?default('')}&id=${(formula.id)?default('')}&entityCode=RM_7.5.0.0_formula";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.RM.formula.formula.editCallBackInfo(res); 						
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
		RM.formula.formula.formulaProcess._callBackInfo = function(res){
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
 						window.opener.RM.formula.formula.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.formula.formula.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		<#if editNew>
		RM.formula.formula.formulaProcess.setDepartment = function(){
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
				RM.formula.formula.formulaProcess._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				RM.formula.formula.formulaProcess._isObjCustomProp_IE = isObjCustomProp;
			} else {
				RM.formula.formula.formulaProcess._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				RM.formula.formula.formulaProcess._objCustomPropNames_IE = objCustomPropNames;
			} else {
				RM.formula.formula.formulaProcess._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				RM.formula.formula.formulaProcess._refViewCode_IE = viewCode;
			} else {
				RM.formula.formula.formulaProcess._refViewCode_IE = '';
			}
			RM.formula.formula.formulaProcess._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		RM.formula.formula.formulaProcess.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			RM.formula.formula.formulaProcess._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			RM.formula.formula.formulaProcess._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			RM.formula.formula.formulaProcess.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			RM.formula.formula.formulaProcess._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				RM.formula.formula.formulaProcess._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		RM.formula.formula.formulaProcess._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				RM.formula.formula.formulaProcess.gridEventObj = gridEventObj;
				callbackName = "RM.formula.formula.formulaProcess.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "RM.formula.formula.formulaProcess.getMultiselectCallBackInfo_DG" : "RM.formula.formula.formulaProcess.getcallBackInfo_DG";
				RM.formula.formula.formulaProcess._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="RM.formula.formula.formulaProcess.getcallBackInfo";
			}

			if(_prefix!=''){
				RM.formula.formula.formulaProcess._prefix = _prefix.substring(1);
			}
			
			RM.formula.formula.formulaProcess._oGrid = oGrid;
			RM.formula.formula.formulaProcess._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					RM.formula.formula.formulaProcess._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					RM.formula.formula.formulaProcess._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					RM.formula.formula.formulaProcess._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					RM.formula.formula.formulaProcess._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					RM.formula.formula.formulaProcess._refViewCode = oColumn.viewCode;
				} else {
					RM.formula.formula.formulaProcess._refViewCode = '';
				}
			} else {
				RM.formula.formula.formulaProcess._isObjCustomProp = false;
				RM.formula.formula.formulaProcess._objCustomPropNames = '';
				RM.formula.formula.formulaProcess._refViewCode = '';
			}
			if (RM.formula.formula.formulaProcess._isObjCustomProp == true && RM.formula.formula.formulaProcess._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				RM.formula.formula.formulaProcess._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				RM.formula.formula.formulaProcess._customCallBack = customCallBack;
			}
			if(RM.formula.formula.formulaProcess._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formula.formulaProcess._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof RM.formula.formula.formulaProcess._querycustomFuncN == "function") {
				refparam += RM.formula.formula.formulaProcess._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			RM.formula.formula.formulaProcess._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formula.formulaProcess._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(RM.formula.formula.formulaProcess._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(RM.formula.formula.formulaProcess._querycustomFunc(objName.replace(/\./g, '_')));
			}
			RM.formula.formula.formulaProcess._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'RM.formula.formula.formulaProcess.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		RM.formula.formula.formulaProcess._querycustomFunc = function(obj) {
			var str = eval("typeof(RM.formula.formula.formulaProcess.query_"+obj+")!='undefined'") ? eval('RM.formula.formula.formulaProcess.query_'+obj+'()') : null;
			return str;
		};
		RM.formula.formula.formulaProcess.getcallBackGroupInfo = function(obj){
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
			RM.formula.formula.formulaProcess._dialog.close();
		}
		RM.formula.formula.formulaProcess.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('RM_formula_formula_formulaProcess_form',obj[0], RM.formula.formula.formulaProcess._prefix, RM.formula.formula.formulaProcess._sUrl);
			CUI.commonFills('RM_formula_formula_formulaProcess_form',RM.formula.formula.formulaProcess._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (RM.formula.formula.formulaProcess._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(RM.formula.formula.formulaProcess._customCallBack) {
					eval(RM.formula.formula.formulaProcess._customCallBack);
					RM.formula.formula.formulaProcess._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.formulaProcess._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		RM.formula.formula.formulaProcess.getcallBackInfo_DG_IE = function(obj){
			if(RM.formula.formula.formulaProcess._customBeforeCallBack) {
				var flag = eval(RM.formula.formula.formulaProcess._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = RM.formula.formula.formulaProcess.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( RM.formula.formula.formulaProcess._isObjCustomProp_IE == true && RM.formula.formula.formulaProcess._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,RM.formula.formula.formulaProcess._sUrl,RM.formula.formula.formulaProcess._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,RM.formula.formula.formulaProcess._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (RM.formula.formula.formulaProcess._isObjCustomProp_IE == true && RM.formula.formula.formulaProcess._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = RM.formula.formula.formulaProcess._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = RM.formula.formula.formulaProcess._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && RM.formula.formula.formulaProcess._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + RM.formula.formula.formulaProcess._refViewCode_IE + '&id=' + id,
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
				if(RM.formula.formula.formulaProcess._customCallBack) {
					eval(RM.formula.formula.formulaProcess._customCallBack);
					RM.formula.formula.formulaProcess._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.formulaProcess._dialog.close();
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
		
		RM.formula.formula.formulaProcess.getcallBackInfo_DG = function(obj){
			if(RM.formula.formula.formulaProcess._customBeforeCallBack) {
				var flag = eval(RM.formula.formula.formulaProcess._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(RM.formula.formula.formulaProcess._currRow).next().length==0){
						RM.formula.formula.formulaProcess._oGrid.addNewRow();
					}	
					RM.formula.formula.formulaProcess._currRow = $(RM.formula.formula.formulaProcess._currRow).next();
					$(RM.formula.formula.formulaProcess._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(RM.formula.formula.formulaProcess._currRow,obj[i], RM.formula.formula.formulaProcess._prefix, RM.formula.formula.formulaProcess._sUrl);
				if (RM.formula.formula.formulaProcess._isObjCustomProp == true && RM.formula.formula.formulaProcess._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(RM.formula.formula.formulaProcess._currRow,RM.formula.formula.formulaProcess._prefix,obj[i],RM.formula.formula.formulaProcess._oGrid,RM.formula.formula.formulaProcess._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(RM.formula.formula.formulaProcess._currRow,RM.formula.formula.formulaProcess._prefix,obj[i],RM.formula.formula.formulaProcess._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + RM.formula.formula.formulaProcess._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + RM.formula.formula.formulaProcess._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && RM.formula.formula.formulaProcess._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + RM.formula.formula.formulaProcess._refViewCode + '&id=' + id,
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
									name = RM.formula.formula.formulaProcess._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(RM.formula.formula.formulaProcess._currRow, objs, RM.formula.formula.formulaProcess._oGrid);
							}
						}
					}
				}
			}
			try{
				if(RM.formula.formula.formulaProcess._customCallBack) {
					eval(RM.formula.formula.formulaProcess._customCallBack);
					RM.formula.formula.formulaProcess._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.formulaProcess._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + RM.formula.formula.formulaProcess._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		RM.formula.formula.formulaProcess.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(RM.formula.formula.formulaProcess._oGrid, RM.formula.formula.formulaProcess._currRow, RM.formula.formula.formulaProcess._key, RM.formula.formula.formulaProcess._displayFieldName, obj[i])
			}
			try{
				if(RM.formula.formula.formulaProcess._customCallBack) {
					eval(RM.formula.formula.formulaProcess._customCallBack);
					RM.formula.formula.formulaProcess._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				RM.formula.formula.formulaProcess._dialog.close();
			} catch(e){}
		};
		
		RM.formula.formula.formulaProcess.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						RM.formula.formula.formulaProcess.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#RM_formula_formula_formulaProcess_form'));
						}
					}
				}
			});
		};
		RM.formula.formula.formulaProcess.retrialThisTable=function(){
			<#if (formula.processKey)?? && formula.processKey == "excelImport">
			workbenchErrorBarWidget.showMessage("该单据由excel导入，不能弃审");//若表单为excel导入，不可弃审
			<#else>
			if(!confirm("${getText("ec.pending.retrial.checked")}？")){
				return ;
			}
			CUI("#RM_formula_formula_retrial_form").submit();
			</#if>
		}
		RM.formula.formula.formulaProcess.retrial_callBackInfo=function(res){
			if(res.dealSuccessFlag){
				//弃审成功之后的提示信息样式和提交成功的样式保持一致
				if(containerLoadPanelWidget && containerLoadPanelWidget.loading && YUD.get("loading_wrap")){
					YUD.get("loading_wrap").innerHTML = "<div class='success-middle'></div>" ;
				}
				setTimeout(function(){
					try{
						window.opener.RM.formula.formula.editCallBackInfo();
					}catch(e){
						try{
							window.opener.location.reload();
						}catch(e2){
						}
					}
					window.close();
				},1000);
				/*
					var showMsg  = "${getText("ec.common.saveandclosesuccessful")}";
					workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.RM.formula.formula.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
				*/
			} else {
				CUI.showErrorInfos(res);
			}
		}

		$(function(){
			RM.formula.formula.formulaProcess.onloadForProduct();
			
		});

		RM.formula.formula.formulaProcess.beforeSubmitMethodSettingInPage = function(){
			RM.formula.formula.formulaProcess.onsaveForProduct();
		};
		RM.formula.formula.formulaProcess.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  RM.formula.formula.formulaProcess.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		RM.formula.formula.formulaProcess.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#RM_formula_formula_formulaProcess_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#RM_formula_formula_formulaProcess_main_div").hide();
				},100);
				//CUI("#RM_formula_formula_formulaProcess_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		RM.formula.formula.formulaProcess.showThis = function(){
			if(!CUI("#RM_formula_formula_formulaProcess_main_div").is(':visible')) {
				CUI("#RM_formula_formula_formulaProcess_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		RM.formula.formula.formulaProcess.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			RM.formula.formula.formulaProcess.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "RM_formula_formula_formulaProcess_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=RM&modelName=RM_7.5.0.0_formula_Formula&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formula.formulaProcess.auditDialog.show();
			</#if>
		}
		
		
		RM.formula.formula.formulaProcess.showInfoDialog=function(mode){
			
			RM.formula.formula.formulaProcess.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "RM_formula_formula_formulaProcess_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			RM.formula.formula.formulaProcess.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		RM.formula.formula.formulaProcess.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			<#if pendingId??>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_formula");
			<#else>
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?readOnlyFlag=true&linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=RM_7.5.0.0_formula");
			</#if>
			}
		}
		
		RM.formula.formula.formulaProcess.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/RM/formula/formula/dealInfo-list.action&dlTableInfoId=${(formula.tableInfoId)?default('')}");
			}
		}
		RM.formula.formula.formulaProcess.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=RM_7.5.0.0_formula_Formula&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(formula.tableInfoId)?default('')}");
			}
		}
		RM.formula.formula.formulaProcess.supervision=function(){
			RM.formula.formula.formulaProcess.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(formula.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				RM.formula.formula.formulaProcess.modifyOwnerStaffDialog.show();
		}
		






		/* CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_formulaProcess,js,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

		RM.formula.formula.formulaProcess.onloadForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_formulaProcess,onloadForProduct,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		RM.formula.formula.formulaProcess.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-VIEW-RM_7.5.0.0_formula_formulaProcess,onsaveForProduct,RM_7.5.0.0_formula_Formula,RM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="RM.formula.formula.formulaProcess.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="RM.formula.formula.formulaProcess.showBusinessList('${l.relatingModel.code.replace('.','')}',${(formula.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
							</#if>
						</li>
					    </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
		<@s.form errorBarId="workbenchErrorBar"  id="RM_formula_formula_retrial_form" namespace="/RM/formula/formula" action="retrial?scriptCode=&tableInfoId=${formula.tableInfoId!}&id=${id!}&${getPowerCode('RM_7.5.0.0_formula_retrial')}" callback="RM.formula.formula.formulaProcess.retrial_callBackInfo" retrialform="true">
		</@s.form>
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