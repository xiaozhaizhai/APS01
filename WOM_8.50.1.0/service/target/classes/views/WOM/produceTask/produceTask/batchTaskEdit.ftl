<#assign isWorkflow = true> 
<#assign isAttachment = true> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = produceTask.tableInfoId!>
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
        <#assign configTitle = getText('WOM.viewtitle.randon1496209221519')>
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
		#WOM_produceTask_produceTask_batchTaskEdit_form{float:left;width:100%;}
		.pd-top{padding-top:0px}    /*紧贴头部，取消10px的空隙*/
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.produceTask.produceTask.batchTaskEdit');
			WOM.produceTask.produceTask.batchTaskEdit.currentUser = ${userJson};
			WOM.produceTask.produceTask.batchTaskEdit.currentStaff = ${staffJson};
			WOM.produceTask.produceTask.batchTaskEdit.currentDepartment = ${deptJson};
			WOM.produceTask.produceTask.batchTaskEdit.currentPosition = ${postJson};
			WOM.produceTask.produceTask.batchTaskEdit.currentCompany = ${compJson};
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
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="WOM.produceTask.produceTask.batchTaskEdit.beforeSubmitMethod()" id="WOM_produceTask_produceTask_batchTaskEdit_form" namespace="/WOM/produceTask/produceTask/batchTaskEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_produceTask_ProduceTask&_bapFieldPermissonModelName_=ProduceTask&superEdit=${(superEdit!false)?string}" callback="WOM.produceTask.produceTask.batchTaskEdit._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_produceTask_produceTask_batchTaskEdit_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl" id="top_buttonbar">
									<#if !((produceTask.status)?? && produceTask.status == 77)>
									<#if !(superEdit!false) && id??>
									</#if>
									
									<a class='cui-btn-new' id="edit-save-btn" onclick="WOM.produceTask.produceTask.batchTaskEdit.save()"><span class="save"></span>${getHtmlText("ec.flow.save")}</a>
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
												WOM.produceTask.produceTask.batchTaskEdit.submit(true);
											});
										});
									</script>
											</#if>
											<#break>
										</#if>
									</#list>
									</#if>

									
									<#if !(superEdit!false)>
									<a class='cui-btn-new' id="edit-submit-btn" onclick="WOM.produceTask.produceTask.batchTaskEdit.submit()"><span class="submit"></span>${getHtmlText("ec.flow.submit")}</a>
									<#if produceTask??&&produceTask.status??&&produceTask.status!=0&&produceTask.status!=99>
									<#if notifyEnabled?? && notifyEnabled>
									<!-- 系统启用通知功能时，才能崔办 -->
									<a class='cui-btn-new'  id="edit-remind-btn" onclick="ec.common.remind(${produceTask.tableInfoId!},${produceTask.id!})"><span class="edit-press"></span>${getHtmlText("ec.flow.remind")}</a>
									</#if>
				
									<#if recallAble && produceTask??&&produceTask.status??&&produceTask.status!=77>
									<a class='cui-btn-new'  id="edit-recall-btn" onclick="WOM.produceTask.produceTask.batchTaskEdit.recall()"><span class="edit-cancel"></span>${getHtmlText("ec.flow.recall")}</a>
								
									</#if>
									<#if hasSupervision>
									<a class='cui-btn-new' id="edit-supervision-btn" onclick="WOM.produceTask.produceTask.batchTaskEdit.supervision()"><span class="edit-person"></span>${getHtmlText("ec.flow.supervision.modifyPending")}</a>

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
										<li id="fr_flow"><a title='${getText("ec.flow.flowImage")}' onclick="WOM.produceTask.produceTask.batchTaskEdit.showInfoDialog('flow')"><span class='icon_prograss' ></span></a></li>
										</#if>
										<#if auditCheck('WOM_7.5.0.0_produceTask_batchTaskEdit') == '1'>
										<li id="fr_audit" ><a title='${getText("foundation.base.audit")}' onclick="WOM.produceTask.produceTask.batchTaskEdit.showAudit()">
										<span class='icon_audit' ></span>
										</a></li>
										</#if>
										<li id="fr_fileUpload" onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a title='${getText("foundation.upload.attachment")}' onclick="WOM.produceTask.produceTask.batchTaskEdit.showInfoDialog('fileUpload')">
										
										<span class='icon_file' ><i class='total'><em id="WOM_produceTask_produceTask_batchTaskEdit_form_attcount"></em></i></span>
										</a></li>
										<li id="fr_dealInfo"><a title='${getText("ec.view.dealadvice")}'  onclick="WOM.produceTask.produceTask.batchTaskEdit.showInfoDialog('dealInfo')"><span class='icon_handle'></span></a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">
								<h1><span class="edit-title-icon"></span>${configTitle}</h1>
								<span class="tableNo"><#if produceTask.tableNo??> &nbsp;&nbsp;${produceTask.tableNo}</#if></span>
								<span class="staff">${getText('ec.common.left.bracket')}${(creatorInfo.staff.name)!}
									<#if !editNew>
									<input type="hidden" name="produceTask.createStaffId" value="${editNew?string((creatorInfo.staff.id)!'\'\'',(produceTask.createStaffId)!'\'\'')}" />
									</#if>
									<#if !editNew>
									<input type="hidden" name="produceTask.createTime" value="${(produceTask.createTime?datetime)!}" />
									</#if>
									
									${editNew?string(datetime(),(produceTask.createTime?datetime)!)} 
								</span>
								
								<span class="position">
									<input id="positionLayRec" type="hidden" name="produceTask.positionLayRec" value="<#if editNew>${(creatorInfo.positions[0].layRec)!}<#else>${(produceTask.positionLayRec)!}</#if>" />
										<#if editNew>
											<#if creatorInfo.positions?size == 1>
											${(creatorInfo.positions[0].name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="produceTask.createPositionId" value="${creatorInfo.positions[0].id}" />
											<input type="hidden" name="produceTask.createDepartmentId" value="${(creatorInfo.positions[0].department.id)!}" />
										
											<#else>
											<#list creatorInfo.positions as p>
												<#if !(p.isVirtual?? && p.isVirtual)>
													<#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>
												<input type="hidden" id="creatorDepartmentId" name="produceTask.createDepartmentId" value="${p.department.id}" />
													</#if>
												</#if>
											</#list>
											<select id="creatorPosition" name="produceTask.createPositionId" onchange="WOM.produceTask.produceTask.batchTaskEdit.setDepartment()">
												<#list creatorInfo.positions as p>
													<#if !(p.isVirtual?? && p.isVirtual)>
													<option value="${p.id}" <#if (Session.staff.mainPosition.id)?? && p.id == Session.staff.mainPosition.id>selected</#if> layRec="${(p.layRec)!}" departmentId="${p.department.id}" departmentName="${p.department.name}">${p.name}</option>
													</#if>
												</#list>
											</select>${getText('ec.common.right.bracket')}
											</#if>
										<#else>
											${(creatorInfo.position.name)!}${getText('ec.common.right.bracket')}
											<input type="hidden" name="produceTask.createPositionId" value="${(produceTask.createPositionId)!}" />
										</#if>
								</span>
								
								
								<span class="status">
									${getText('ec.workflow.status')}${getText('ec.common.validate.colon')}
									<a href="#" onclick="javascript:void(0)">
										${getText((produceTask.pending.taskDescription)!)}
									</a>
								</span>
							</div>
    					</div>
    					
    					<div class="edit-main" id="WOM_produceTask_produceTask_batchTaskEdit">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="batchTaskEdit">
								<input type="hidden" name="datagridKey" value="WOM_produceTask_produceTask_batchTaskEdit_datagrids">
								<input type="hidden" name="viewCode" value="WOM_7.5.0.0_produceTask_batchTaskEdit">
								<input type="hidden" name="modelName" value="ProduceTask">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="produceTask.version" value="${(produceTask.version)!0}" />
								<input type="hidden" name="produceTask.extraCol" value='' />
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

		 <ul class="edit-tabs">
			<li>${getText('ec.view.commoninfo')}</li>
			<li>${getText('WOM.tabname.radion1489731893211')}</li>
		</ul>
<script type="text/javascript">
var attcountid = "WOM_produceTask_produceTask_batchTaskEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_produceTask', null, function(){
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
				
							 					<#if !WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit = checkFieldPermission('produceTask.productBatchNum','WOM_7.5.0.0_produceTask_ProduceTask','WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum')>
					</#if>
					<td <#if WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('WOM.propertydisplayName.randon1489668325364')}" >${getText('WOM.propertydisplayName.randon1489668325364')}</label>
				</td>
				
						<#assign produceTask_productBatchNum_defaultValue  = ''>
							 							<#assign produceTask_productBatchNum_defaultValue  = ''>
					<#if !WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit = checkFieldPermission('produceTask.productBatchNum','WOM_7.5.0.0_produceTask_ProduceTask','WOM_7.5.0.0_produceTask_ProduceTask_productBatchNum')>
					</#if>
					<td <#if WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit == 1>-readonly</#if>">
								<input property_type="BAPCODE" name="produceTask.productBatchNum" id="produceTask_productBatchNum"  style=";" originalvalue="<#if !newObj || (produceTask.productBatchNum)?has_content>${(produceTask.productBatchNum?html)!}<#else>${produceTask_productBatchNum_defaultValue!}</#if>" value="<#if !newObj || (produceTask.productBatchNum)?has_content>${(produceTask.productBatchNum?html)!}<#else>${produceTask_productBatchNum_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if WOM_7_5_0_0_produceTask_ProduceTask_productBatchNum_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
		<#assign cpvmInfo = ''>
			<#assign customPropList = getShowCustomProps("WOM_7.5.0.0_produceTask_ProduceTask", "WOM_7.5.0.0_produceTask_batchTaskEdit", 'EDIT')>
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
					<#assign elementName = 'produceTask' + "." + columnName>
					<#assign elementId = 'produceTask' + "_" + columnName>
					<#if cpvmInfo?? && c.relatedKey?has_content>
					<#assign cpvmInfo = cpvmInfo + ',' + c.relatedKey + "||" + elementName>
					</#if>
					<#assign fieldType = c.fieldType>
					<#if fieldType == 'TEXTFIELD'>
					<div class="fix-input">
					<#if columnType == 'DECIMAL'>
						<@s.hidden property_type="${columnType}" id="${elementName?replace('.', '_')}_hide" name="${elementName}" />
						<input property_type="${columnType}" type="text" id="${elementName?replace('.', '_')}" name="${elementName?replace('.', '_')}" class="cui-noborder-input numberField"  />
					<#elseif columnType == 'INTEGER'>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input numberField"  />
					<#else>
						<@s.textfield id="${elementName?replace('.', '_')}" name="${elementName}" cssClass="cui-noborder-input"  />
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
							<@s.textarea property_type="${columnType}" id="${elementName?replace('.', '_')}" name="${elementName}" rows="${c.textareaRow!3}" cssClass="cui-textarea-wh" cssStyle="border:0;line-height:16px;padding-left:2px;"  onpropertychange="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" oninput="setTimeout(function(){autoTextarea('${elementName?replace('.', '_')}',null,null,true);}, 100);" onkeyup="autoTextarea('${elementName?replace('.', '_')}',null,null,true);" />
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
					<#elseif fieldType == 'DATETIME'>
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
						<#if produceTask[columnName]??>
							<#assign dateVal = (produceTask[columnName])?string('yyyy-MM-dd HH:mm:ss')>
						</#if>
						<@datepicker property_type="${columnType}" cssClass="cui-noborder-input" name="${elementName}" id="${elementName?replace('.', '_')}" value=dateVal type="${dateType}"  />
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
							<@systemcode property_type="${columnType}" iscustom=true showType="${fieldType}" viewType=viewType formId="WOM_produceTask_produceTask_batchTaskEdit_form" classStyle="cui-noborder-input"  cssStyle="" ecFlag=true multable=isMultable name="${elementName}" code="${(c.property.fillcontentMap.fillContent)!}" value="${produceTask[columnName]!}" seniorSystemCode=isS2 />
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
							<input type="hidden" iscustom="true" name="${elementName}" value="${produceTask[columnName]!}" />
							<input type="hidden" name="${elementName}.${pkName!'id'}" value="${produceTask[columnName]!}" />
							<@mneclient iframe=false property_type="${columnType}" mneenable=false reftitle="${getText('${viewTitle!}')}" viewType=viewType  value="${produceTask[displayColumnName]!}" name="${elementName}.${mainDisplayName!'name'}" id="${elementName?replace('.', '_')}_${mainDisplayName!'name'}" type="${mneType}" url="${viewUrl!}" clicked=true multiple=false isEdit=true mnewidth=260 formId="WOM_produceTask_produceTask_batchTaskEdit_form" editCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}()" delCustomCallback="callback_obj_cp_${elementName?replace('.', '_')}_delete()" />
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
								function ProduceTaskActive_dg1496209262624_setMaterialNum(event)
																{	
    var row=ProduceTaskActive_dg1489730796226Widget.getSelectedRow();
	if(row==undefined){
		workbenchErrorBarWidget.showMessage("${getText('ec.business.view.choose.one')}","f");
		return;
	}
	var id=ProduceTaskActive_dg1489730796226Widget._DT.getSelectedRow()[0].id;
	var widget = ProduceTaskActive_dg1489730796226Widget;	
	var goodID = widget.getCellValue(row,"productId.id");
	testEdit=new CUI.Dialog({
		  title:"${getText('WOM.buttonPropertyshowName.radion1490347860034')}",
		  formId:"WOM_produceTask_produceTaskActive_batchNumEdit_form",
		  type:4,
		  modal:true,
		  url:'/WOM/produceTask/produceTaskActive/batchNumEdit.action?entityCode=WOM_7.5.0.0_produceTask&id='+id+'&goodID='+goodID,
		  buttons:[{
		   name:"${getText('foundation.common.save')}",
		   handler:function(){
		   	//回填总数	
		   	var sum=0;  
		   	for(var i = 0 ; i < MaterialBatchNums_dg1490347341669Widget.getRowLength();i++){
		   		if(MaterialBatchNums_dg1490347341669Widget.getCellValue(i,"planNum")!=""){
		   			sum += parseInt(MaterialBatchNums_dg1490347341669Widget.getCellValue(i,"planNum"));
		   		}
		   	}
		   	widget.setCellValue(row,"planNum",sum);
			CUI('#WOM_produceTask_produceTaskActive_batchNumEdit_form').submit();
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
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1496209262624.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262624">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1496209262624.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262624">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1490347860034')}\",handler:function(event){ProduceTaskActive_dg1496209262624_setMaterialNum(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('WOM.buttonPropertyshowName.radion1490347860034')}\",handler:function(event){ProduceTaskActive_dg1496209262624_setMaterialNum(event)},iconClass:\"cui-btn-add\",useInMore:\"false\"}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProduceTaskActive_dg1496209262624" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1496209262624_id" value="ProduceTaskActive_dg1496209262624" />
			
			<input type="hidden" id="dg1496209262624_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1489671093316')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1496209262624.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262624"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProduceTaskActive_dg1496209262624" />
			<@datagrid withoutConfigTable=true id="ProduceTaskActive_dg1496209262624" viewType="${viewType}" renderOverEvent="dg1496209262624RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_batchTaskEdit_form" noPermissionKeys="productId.productCode,productId.id,productId.productName,productId.productBaseUnit.name,orderProcessId.name,name,actOrder,exeSystem,isReplace,isMixQuality,standardNum,minQuality,maxQuality,planNum,lossRate,remark" modelCode="WOM_7.5.0.0_produceTask_ProduceTaskActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1496209262624" dtPage="dgPage"  hidekeyPrefix="dg1496209262624" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.id','productId.id','productId.productName','productId.id','productId.productBaseUnit.name','orderProcessId.id','orderProcessId.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1496209262624PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1490443916302')}" activexButton="WOM.buttonPropertyshowName.radion1490347860034,setMaterialNum" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
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

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/refProductLayout.action" viewCode="MESBasic_1_product_refProductLayout" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1450085069587')}"  label="${getText('WOM.propertydisplayName.radion14157726448331')}" width=100 showFormatFunc=""/>
							<#assign productId_id_displayDefaultType=''>
								<#assign productId_id_defaultValue=''>
										<#assign productId_id_defaultValue=''>
																	<#if (productId_id_defaultValue!)?string=="currentUser">
								<#assign productId_id_defaultValue='${staffJson!}'>
							<#elseif (productId_id_defaultValue!)?string=="currentPost">
								<#assign productId_id_defaultValue='${postJson!}'>
							<#elseif (productId_id_defaultValue!)?string=="currentDepart">
								<#assign productId_id_defaultValue='${deptJson!}'>
							<#elseif (productId_id_defaultValue!)?string=="currentComp">
								<#assign productId_id_defaultValue='${compJson!}'>
							</#if>
 
									<@datacolumn key="productId.id"        showFormat="TEXT" defaultValue="${(productId_id_defaultValue!)?string}" defaultDisplay="${(productId_id_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="center" hiddenCol=true viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.randon1449796384550')}" width=100 showFormatFunc=""/>
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
 
									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737455')}" width=100 showFormatFunc=""/>
							<#assign productId_productBaseUnit_name_displayDefaultType=''>
								<#assign productId_productBaseUnit_name_defaultValue=''>
										<#assign productId_productBaseUnit_name_defaultValue=''>
																	<#if (productId_productBaseUnit_name_defaultValue!)?string=="currentUser">
								<#assign productId_productBaseUnit_name_defaultValue='${staffJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentPost">
								<#assign productId_productBaseUnit_name_defaultValue='${postJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentDepart">
								<#assign productId_productBaseUnit_name_defaultValue='${deptJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentComp">
								<#assign productId_productBaseUnit_name_defaultValue='${compJson!}'>
							</#if>
 
									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1398235640483')}" width=60 showFormatFunc=""/>
							<#assign orderProcessId_name_displayDefaultType=''>
								<#assign orderProcessId_name_defaultValue=''>
										<#assign orderProcessId_name_defaultValue=''>
																	<#if (orderProcessId_name_defaultValue!)?string=="currentUser">
								<#assign orderProcessId_name_defaultValue='${staffJson!}'>
							<#elseif (orderProcessId_name_defaultValue!)?string=="currentPost">
								<#assign orderProcessId_name_defaultValue='${postJson!}'>
							<#elseif (orderProcessId_name_defaultValue!)?string=="currentDepart">
								<#assign orderProcessId_name_defaultValue='${deptJson!}'>
							<#elseif (orderProcessId_name_defaultValue!)?string=="currentComp">
								<#assign orderProcessId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="orderProcessId.name"        showFormat="SELECTCOMP" defaultValue="${(orderProcessId_name_defaultValue!)?string}" defaultDisplay="${(orderProcessId_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489720649125')}" width=70 showFormatFunc=""/>
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										  
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1490683872072')}" width=70 showFormatFunc=""/>
							<#assign actOrder_displayDefaultType=''>
								<#assign actOrder_defaultValue=''>
										<#assign actOrder_defaultValue=''>
										  
									<@datacolumn key="actOrder"        showFormat="TEXT" defaultValue="${(actOrder_defaultValue!)?string}" defaultDisplay="${(actOrder_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489726473525')}" width=80 showFormatFunc=""/>
							<#assign exeSystem_displayDefaultType=''>
								<#assign exeSystem_defaultValue=''>
										<#assign exeSystem_defaultValue=''>
										 									<@systemCodeColumn code="RMsystem" textalign="left" defaultValue="${(exeSystem_defaultValue!)?string}" key="exeSystem.id" editable=true type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1490923729119')}" width=80  />
							<#assign isReplace_displayDefaultType=''>
								<#assign isReplace_defaultValue=''>
										<#assign isReplace_defaultValue=''>
										  
									<@datacolumn key="isReplace"        showFormat="CHECKBOX" defaultValue="${(isReplace_defaultValue!)?string}" defaultDisplay="${(isReplace_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489726453862')}" width=40 showFormatFunc=""/>
							<#assign isMixQuality_displayDefaultType=''>
								<#assign isMixQuality_defaultValue=''>
										<#assign isMixQuality_defaultValue=''>
										  
									<@datacolumn key="isMixQuality"        showFormat="CHECKBOX" defaultValue="${(isMixQuality_defaultValue!)?string}" defaultDisplay="${(isMixQuality_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729935738')}" width=80 showFormatFunc=""/>
							<#assign standardNum_displayDefaultType=''>
								<#assign standardNum_defaultValue=''>
										<#assign standardNum_defaultValue=''>
										  
									<@datacolumn key="standardNum"        showFormat="TEXT" defaultValue="${(standardNum_defaultValue!)?string}" defaultDisplay="${(standardNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730105405')}" width=80 showFormatFunc=""/>
							<#assign minQuality_displayDefaultType=''>
								<#assign minQuality_defaultValue=''>
										<#assign minQuality_defaultValue=''>
										  
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729953842')}" width=80 showFormatFunc=""/>
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										  
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729974625')}" width=80 showFormatFunc=""/>
							<#assign planNum_displayDefaultType=''>
								<#assign planNum_defaultValue=''>
										<#assign planNum_defaultValue=''>
										  
									<@datacolumn key="planNum"        showFormat="TEXT" defaultValue="${(planNum_defaultValue!)?string}" defaultDisplay="${(planNum_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730174515')}" width=60 showFormatFunc=""/>
							<#assign lossRate_displayDefaultType=''>
								<#assign lossRate_defaultValue=''>
										<#assign lossRate_defaultValue=''>
										  
									<@datacolumn key="lossRate"        showFormat="TEXT" defaultValue="${(lossRate_defaultValue!)?string}" defaultDisplay="${(lossRate_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730189645')}" width=60 showFormatFunc=""/>
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										  
									<@datacolumn key="remark"  popView=true      showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730249805')}" width=200 showFormatFunc=""/>
			
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
					
				</script>
				<script type="text/javascript">
					
				</script>
			
			<script type="text/javascript">
				function ProduceTaskActive_dg1496209262624_check_datagridvalid(){
					//
					var errorObj =ProduceTaskActive_dg1496209262624Widget._DT.testData();
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
				
				function savedg1496209262624DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProduceTaskActive_dg1496209262624Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProduceTaskActive_dg1496209262624Widget') > -1) {
						ProduceTaskActive_dg1496209262624Widget.setAllRowEdited();
					}
					var json = ProduceTaskActive_dg1496209262624Widget.parseEditedData();
					$('input[name="dg1496209262624ListJson"]').remove();
					$('input[name="dgLists[\'dg1496209262624\']"]').remove();
					$('input[name="dg1496209262624ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1496209262624\']">').val(json).appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					$('<input type="hidden" name="dg1496209262624ModelCode">').val('WOM_7.5.0.0_produceTask_ProduceTaskActive').appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1496209262624ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
				}
				function DT_ProduceTaskActive_dg1496209262624_deldatagrid(){
					var deleteRows = ProduceTaskActive_dg1496209262624Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id','headID.id','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496209262624DeletedIds").length>0){
							$("#dg1496209262624DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496209262624DeletedIds" name="dgDeletedIds[\'dg1496209262624\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496209262624DeletedIds['+CUI('input[name^="dg1496209262624DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					});
				}
				function DT_ProduceTaskActive_dg1496209262624_delTreeNodes(){
					var deleteRows = ProduceTaskActive_dg1496209262624Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id','headID.id','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496209262624DeletedIds").length>0){
							$("#dg1496209262624DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496209262624DeletedIds" name="dgDeletedIds[\'dg1496209262624\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496209262624DeletedIds['+CUI('input[name^="dg1496209262624DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_batchTaskEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<2;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'ProduceTaskActive_dg1496209262624') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProduceTaskActive_dg1496209262624';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProduceTaskActive_dg1496209262624';
					}
					$('body').data('WOM_produceTask_produceTask_batchTaskEdit_datagrids', datagrids);
				});
				
				var ProduceTaskActive_dg1496209262624_importDialog = null;
				function ProduceTaskActive_dg1496209262624_showImportDialog(){
					try{
						if(ProduceTaskActive_dg1496209262624_importDialog!=null&&ProduceTaskActive_dg1496209262624_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262624&tid=${id!}&datagridName=dg1496209262624";
						ProduceTaskActive_dg1496209262624_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProduceTaskActive_dg1496209262624"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskActive_dg1496209262624_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskActive_dg1496209262624_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProduceTaskActive_dg1496209262624_importDialog.show();
					}catch(e){}
				}	
				
				function ProduceTaskActive_dg1496209262624_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262624&templateRelatedModelCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262624&downloadType=template&fileName=dg1496209262624";
					window.open(url,"","");
				}
				function dg1496209262624RenderOverEvent(){
					//判断是否启用配置项
	var url="/WOM/produceTask/produceTask/getIsProBatch.action";
    var isProBatch="";
    $.ajax({
        type:'POST',
        url:url,
        async : false,
        success:function(msg){
            if(msg!=null){
	            isProBatch=msg.result;
            }
        }
    });
	//启用物料批次
    if(isProBatch==true){
    	//将按钮隐藏
    	$(".paginatorbar :eq(7)").show();
    	ProduceTaskActive_dg1489730796226Widget._DT.configs.checkEditCondition = function( key, nRow){
			if(key=="lossRate"){
		    	return true;//返回false不可编辑，返回true可编辑
		 	}
		 	if(key=="remark"){
		    	return true;//返回false不可编辑，返回true可编辑
		 	}
		 	if(key=="planNum"){
		    	return false;//返回false不可编辑，返回true可编辑
		 	}
		 	return false;
		}
    }else{
    	//停用物料批次
    	$(".paginatorbar :eq(7)").hide();
    	    	ProduceTaskActive_dg1489730796226Widget._DT.configs.checkEditCondition = function( key, nRow){
			if(key=="lossRate"){
		    	return true;//返回false不可编辑，返回true可编辑
		 	}
		 	if(key=="remark"){
		    	return true;//返回false不可编辑，返回true可编辑
		 	}
		 	if(key=="planNum"){
		    	return true;//返回false不可编辑，返回true可编辑
		 	}
		 	return false;
		}
    }
    //根据有无表体禁用产品、配方、生产线、生产数量
    if(ProduceTaskActive_dg1489730796226Widget.getRowLength()>0){
    	//禁用生产数量
    	$("[name='produceTask.productNum']").attr("readonly",true);
    	//禁用产品
    	$("#produceTask_productId_productCodediv").removeAttr("onmouseenter");
		$("#produceTask_productId_productCodediv").unbind('mouseenter');
		$("[name='produceTask.productId.productCode']").attr("readonly",true);
		$("#produceTask_productId_productCode_click_button").remove();
		//禁用配方
    	$("#produceTask_formularId_codediv").removeAttr("onmouseenter");
		$("#produceTask_formularId_codediv").unbind('mouseenter');
		$("[name='produceTask.formularId.code']").attr("readonly",true);
		$("#produceTask_formularId_code_click_button").remove();
		//禁用生产线
    	$("#produceTask_factoryId_namediv").removeAttr("onmouseenter");
		$("#produceTask_factoryId_namediv").unbind('mouseenter');
		$("[name='produceTask.factoryId.name']").attr("readonly",true);
		$("#produceTask_factoryId_name_click_button").remove();
		//禁用计划
    	$("#produceTask_planParId_dayPlanInfo_tableNodiv").removeAttr("onmouseenter");
		$("#produceTask_planParId_dayPlanInfo_tableNodiv").unbind('mouseenter');
		$("[name='produceTask.planParId.dayPlanInfo.tableNo']").attr("readonly",true);
		$("#produceTask_planParId_dayPlanInfo_tableNo_click_button").remove();
    }
	
	//获取未删前的html
	lableHtme = $(".dg-hd-tr").html();

	//界面新增打开，隐藏工序、活动、顺序、备料系统、替代料列
	if($("#id").val()==""){
		easyFormulahide();
	}
	//修改打开时
	else{
		//配方为简易配方时.隐藏工序、活动、顺序、备料系统、替代料列
		if($("[name='produceTask.formularId.setProcess.id']").val()=="formulaProperty/formulaProperty2"){
			easyFormulahide();
			if(isProBatch==true){
				$(".edit-tabs li:eq(2)").show();
			}
		}
		//配方为完整配方时.
		else if($("[name='produceTask.formularId.setProcess.id']").val()=="formulaProperty/formulaProperty1"){
			// TODO
		}
		//配方为空时.隐藏工序、活动、顺序、备料系统、替代料列
		else if($("[name='produceTask.formularId.setProcess.id']").val()==""){
			easyFormulahide();
		}
	}
				}
				function dg1496209262624PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.batchTaskEdit.initSize(nTabIndex);
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
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1496209382613.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209382613">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1496209382613.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209382613">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceMaterialSum_dg1496209382613_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceMaterialSum_dg1496209382613_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProduceMaterialSum_dg1496209382613" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1496209382613_id" value="ProduceMaterialSum_dg1496209382613" />
			
			<input type="hidden" id="dg1496209382613_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1489671141506')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1496209382613.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209382613"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProduceMaterialSum_dg1496209382613" />
			<@datagrid withoutConfigTable=true id="ProduceMaterialSum_dg1496209382613" viewType="${viewType}" renderOverEvent="dg1496209382613RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_batchTaskEdit_form" noPermissionKeys="productId.productCode,productId.productName,productId.productBaseUnit.name,isMixQuality,standardNum,maxQuality,minQuality,planNum" modelCode="WOM_7.5.0.0_produceTask_ProduceMaterialSum" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1496209382613" dtPage="dgPage"  hidekeyPrefix="dg1496209382613" hidekey="['id','version','productId.id','productId.productCode','productId.id','productId.productName','productId.id','productId.productBaseUnit.name'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1496209382613PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
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

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="center"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew"  crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""/>
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

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="center"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew"  crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""/>
							<#assign productId_productBaseUnit_name_displayDefaultType=''>
								<#assign productId_productBaseUnit_name_defaultValue=''>
										<#assign productId_productBaseUnit_name_defaultValue=''>
																	<#if (productId_productBaseUnit_name_defaultValue!)?string=="currentUser">
								<#assign productId_productBaseUnit_name_defaultValue='${staffJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentPost">
								<#assign productId_productBaseUnit_name_defaultValue='${postJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentDepart">
								<#assign productId_productBaseUnit_name_defaultValue='${deptJson!}'>
							<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentComp">
								<#assign productId_productBaseUnit_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="productId.productBaseUnit.name"        showFormat="TEXT" defaultValue="${(productId_productBaseUnit_name_defaultValue!)?string}" defaultDisplay="${(productId_productBaseUnit_name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="center"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew"  crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('X6Basic.propertydisplayName.radion1398235640483')}" width=100 showFormatFunc=""/>
							<#assign isMixQuality_displayDefaultType=''>
								<#assign isMixQuality_defaultValue='true'>
										<#assign isMixQuality_defaultValue='true'>
										 
									<@datacolumn key="isMixQuality"        showFormat="CHECKBOX" defaultValue="${(isMixQuality_defaultValue!)?string}" defaultDisplay="${(isMixQuality_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489671348109')}" width=100 showFormatFunc=""/>
							<#assign standardNum_displayDefaultType=''>
								<#assign standardNum_defaultValue=''>
										<#assign standardNum_defaultValue=''>
										 
									<@datacolumn key="standardNum"        showFormat="TEXT" defaultValue="${(standardNum_defaultValue!)?string}" defaultDisplay="${(standardNum_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489671310089')}" width=100 showFormatFunc=""/>
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										 
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489671392054')}" width=100 showFormatFunc=""/>
							<#assign minQuality_displayDefaultType=''>
								<#assign minQuality_defaultValue=''>
										<#assign minQuality_defaultValue=''>
										 
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489671375386')}" width=100 showFormatFunc=""/>
							<#assign planNum_displayDefaultType=''>
								<#assign planNum_defaultValue=''>
										<#assign planNum_defaultValue=''>
										 
									<@datacolumn key="planNum"        showFormat="TEXT" defaultValue="${(planNum_defaultValue!)?string}" defaultDisplay="${(planNum_displayDefaultType!)?string}" decimal="6" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489671332695')}" width=100 showFormatFunc=""/>
			
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
				function ProduceMaterialSum_dg1496209382613_check_datagridvalid(){
					//
					var errorObj =ProduceMaterialSum_dg1496209382613Widget._DT.testData();
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
				
				function savedg1496209382613DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProduceMaterialSum_dg1496209382613Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProduceMaterialSum_dg1496209382613Widget') > -1) {
						ProduceMaterialSum_dg1496209382613Widget.setAllRowEdited();
					}
					var json = ProduceMaterialSum_dg1496209382613Widget.parseEditedData();
					$('input[name="dg1496209382613ListJson"]').remove();
					$('input[name="dgLists[\'dg1496209382613\']"]').remove();
					$('input[name="dg1496209382613ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1496209382613\']">').val(json).appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					$('<input type="hidden" name="dg1496209382613ModelCode">').val('WOM_7.5.0.0_produceTask_ProduceMaterialSum').appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1496209382613ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
				}
				function DT_ProduceMaterialSum_dg1496209382613_deldatagrid(){
					var deleteRows = ProduceMaterialSum_dg1496209382613Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','productId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496209382613DeletedIds").length>0){
							$("#dg1496209382613DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496209382613DeletedIds" name="dgDeletedIds[\'dg1496209382613\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496209382613DeletedIds['+CUI('input[name^="dg1496209382613DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					});
				}
				function DT_ProduceMaterialSum_dg1496209382613_delTreeNodes(){
					var deleteRows = ProduceMaterialSum_dg1496209382613Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','productId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496209382613DeletedIds").length>0){
							$("#dg1496209382613DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496209382613DeletedIds" name="dgDeletedIds[\'dg1496209382613\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496209382613DeletedIds['+CUI('input[name^="dg1496209382613DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_batchTaskEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<2;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'ProduceMaterialSum_dg1496209382613') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProduceMaterialSum_dg1496209382613';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProduceMaterialSum_dg1496209382613';
					}
					$('body').data('WOM_produceTask_produceTask_batchTaskEdit_datagrids', datagrids);
				});
				
				var ProduceMaterialSum_dg1496209382613_importDialog = null;
				function ProduceMaterialSum_dg1496209382613_showImportDialog(){
					try{
						if(ProduceMaterialSum_dg1496209382613_importDialog!=null&&ProduceMaterialSum_dg1496209382613_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209382613&tid=${id!}&datagridName=dg1496209382613";
						ProduceMaterialSum_dg1496209382613_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProduceMaterialSum_dg1496209382613"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceMaterialSum_dg1496209382613_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceMaterialSum_dg1496209382613_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProduceMaterialSum_dg1496209382613_importDialog.show();
					}catch(e){}
				}	
				
				function ProduceMaterialSum_dg1496209382613_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209382613&templateRelatedModelCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209382613&downloadType=template&fileName=dg1496209382613";
					window.open(url,"","");
				}
				function dg1496209382613RenderOverEvent(){
				}
				function dg1496209382613PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.batchTaskEdit.initSize(nTabIndex);
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
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1496209262808.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262808">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1496209262808.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262808">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProduceTaskProcess_dg1496209262808" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1496209262808_id" value="ProduceTaskProcess_dg1496209262808" />
			
			<input type="hidden" id="dg1496209262808_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1489671052624')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1496209262808.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262808"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProduceTaskProcess_dg1496209262808" />
			<@datagrid withoutConfigTable=true id="ProduceTaskProcess_dg1496209262808" viewType="${viewType}" renderOverEvent="dg1496209262808RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_batchTaskEdit_form" noPermissionKeys="name,processType.name,longTime,factoryId.name,remark,formularProcess.id" modelCode="WOM_7.5.0.0_produceTask_ProduceTaskProcess" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1496209262808" dtPage="dgPage"  hidekeyPrefix="dg1496209262808" hidekey="['id','version','processType.id','processType.name','factoryId.id','factoryId.name','formularProcess.id','formularProcess.id'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=1 pageInitMethod="dg1496209262808PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1490443951798')}" activexButton="" exportExcel=exportExcel addNewRow=false   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										  
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489720649125')}" width=150 showFormatFunc=""/>
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

									<@datacolumn key="processType.name"        showFormat="SELECTCOMP" defaultValue="${(processType_name_defaultValue!)?string}" defaultDisplay="${(processType_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="left"  viewUrl="/RM/processType/processType/processTypeRef.action" viewCode="RM_7.5.0.0_processType_processTypeRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1487220867598')}"  label="${getText('WOM.propertydisplayName.randon1487074387497')}" width=150 showFormatFunc=""/>
							<#assign longTime_displayDefaultType=''>
								<#assign longTime_defaultValue=''>
										<#assign longTime_defaultValue=''>
										  
									<@datacolumn key="longTime"        showFormat="TEXT" defaultValue="${(longTime_defaultValue!)?string}" defaultDisplay="${(longTime_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489720689233')}" width=150 showFormatFunc=""/>
							<#assign factoryId_name_displayDefaultType=''>
								<#assign factoryId_name_defaultValue=''>
										<#assign factoryId_name_defaultValue=''>
																	<#if (factoryId_name_defaultValue!)?string=="currentUser">
								<#assign factoryId_name_defaultValue='${staffJson!}'>
							<#elseif (factoryId_name_defaultValue!)?string=="currentPost">
								<#assign factoryId_name_defaultValue='${postJson!}'>
							<#elseif (factoryId_name_defaultValue!)?string=="currentDepart">
								<#assign factoryId_name_defaultValue='${deptJson!}'>
							<#elseif (factoryId_name_defaultValue!)?string=="currentComp">
								<#assign factoryId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="factoryId.name"        showFormat="SELECTCOMP" defaultValue="${(factoryId_name_defaultValue!)?string}" defaultDisplay="${(factoryId_name_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="left"  viewUrl="/MESBasic/factoryModel/factoryModel/factroyRef1.action" viewCode="MESBasic_1_factoryModel_factroyRef1" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.radion1419491307826')}"  label="${getText('WOM.propertydisplayName.radion14192323937823455')}" width=150 showFormatFunc=""/>
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										  
									<@datacolumn key="remark"  popView=true      showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=true type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489720730887')}" width=200 showFormatFunc=""/>
							<#assign formularProcess_id_displayDefaultType=''>
								<#assign formularProcess_id_defaultValue=''>
										<#assign formularProcess_id_defaultValue=''>
																	<#if (formularProcess_id_defaultValue!)?string=="currentUser">
								<#assign formularProcess_id_defaultValue='${staffJson!}'>
							<#elseif (formularProcess_id_defaultValue!)?string=="currentPost">
								<#assign formularProcess_id_defaultValue='${postJson!}'>
							<#elseif (formularProcess_id_defaultValue!)?string=="currentDepart">
								<#assign formularProcess_id_defaultValue='${deptJson!}'>
							<#elseif (formularProcess_id_defaultValue!)?string=="currentComp">
								<#assign formularProcess_id_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="formularProcess.id"        showFormat="SELECTCOMP" defaultValue="${(formularProcess_id_defaultValue!)?string}" defaultDisplay="${(formularProcess_id_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="center" hiddenCol=true viewUrl="/RM/formula/formulaProcess/processReference.action" viewCode="RM_7.5.0.0_formula_processReference" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1488596828660')}"  label="${getText('WOM.common.ID46676777')}" width=100 showFormatFunc=""/>
			
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
				function ProduceTaskProcess_dg1496209262808_check_datagridvalid(){
					//
					var errorObj =ProduceTaskProcess_dg1496209262808Widget._DT.testData();
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
				
				function savedg1496209262808DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProduceTaskProcess_dg1496209262808Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProduceTaskProcess_dg1496209262808Widget') > -1) {
						ProduceTaskProcess_dg1496209262808Widget.setAllRowEdited();
					}
					var json = ProduceTaskProcess_dg1496209262808Widget.parseEditedData();
					$('input[name="dg1496209262808ListJson"]').remove();
					$('input[name="dgLists[\'dg1496209262808\']"]').remove();
					$('input[name="dg1496209262808ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1496209262808\']">').val(json).appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					$('<input type="hidden" name="dg1496209262808ModelCode">').val('WOM_7.5.0.0_produceTask_ProduceTaskProcess').appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1496209262808ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
				}
				function DT_ProduceTaskProcess_dg1496209262808_deldatagrid(){
					var deleteRows = ProduceTaskProcess_dg1496209262808Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processType.id','formulaId.id','factoryId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496209262808DeletedIds").length>0){
							$("#dg1496209262808DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496209262808DeletedIds" name="dgDeletedIds[\'dg1496209262808\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496209262808DeletedIds['+CUI('input[name^="dg1496209262808DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					});
				}
				function DT_ProduceTaskProcess_dg1496209262808_delTreeNodes(){
					var deleteRows = ProduceTaskProcess_dg1496209262808Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processType.id','formulaId.id','factoryId.id','headId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496209262808DeletedIds").length>0){
							$("#dg1496209262808DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496209262808DeletedIds" name="dgDeletedIds[\'dg1496209262808\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496209262808DeletedIds['+CUI('input[name^="dg1496209262808DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_batchTaskEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<2;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[1].length>0) {
						for(var i=0;i<datagrids[1].length;i++) {
							if(datagrids[1][i] == 'ProduceTaskProcess_dg1496209262808') {
								break;
							}
							if(i==datagrids[1].length-1) {
								datagrids[1][datagrids[1].length] = 'ProduceTaskProcess_dg1496209262808';
							}
						}
					} else {
						datagrids[1][datagrids[1].length] = 'ProduceTaskProcess_dg1496209262808';
					}
					$('body').data('WOM_produceTask_produceTask_batchTaskEdit_datagrids', datagrids);
				});
				
				var ProduceTaskProcess_dg1496209262808_importDialog = null;
				function ProduceTaskProcess_dg1496209262808_showImportDialog(){
					try{
						if(ProduceTaskProcess_dg1496209262808_importDialog!=null&&ProduceTaskProcess_dg1496209262808_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262808&tid=${id!}&datagridName=dg1496209262808";
						ProduceTaskProcess_dg1496209262808_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProduceTaskProcess_dg1496209262808"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskProcess_dg1496209262808_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskProcess_dg1496209262808_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProduceTaskProcess_dg1496209262808_importDialog.show();
					}catch(e){}
				}	
				
				function ProduceTaskProcess_dg1496209262808_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262808&templateRelatedModelCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262808&downloadType=template&fileName=dg1496209262808";
					window.open(url,"","");
				}
				function dg1496209262808RenderOverEvent(){
					var produceTaskId=$('#id').val();
    var tableObj = document.getElementById("ProduceTaskProcess_dg1489731937175_tbody");
	for (var i = 0; i < tableObj.rows.length; i++) {    //遍历Table的所有Row 
		tableObj.rows[i].onclick=function(){ 
		    var selRow = $(this).index();
			var processID = ProduceTaskProcess_dg1489731937175Widget.getCellValue(selRow,"formularProcess.id");
			var id = $("#id").val();
			ProduceTaskActive_dg1489736028416Widget._DT.setRequestDataUrl("/WOM/produceTask/produceTask/data-dg1489736028416.action?produceTask.id="+produceTaskId+"&rt=json&processID="+processID);
		
		};  						
	}
				}
				function dg1496209262808PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.batchTaskEdit.initSize(nTabIndex);
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
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1496209262749.action?produceTask.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262749">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTask/data-dg1496209262749.action?produceTask.id=${(produceTask.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262749">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceTaskActive_dg1496209262749_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProduceTaskActive_dg1496209262749_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProduceTaskActive_dg1496209262749" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1496209262749_id" value="ProduceTaskActive_dg1496209262749" />
			
			<input type="hidden" id="dg1496209262749_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1489671093316')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTask/data-dg1496209262749.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262749"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProduceTaskActive_dg1496209262749" />
			<@datagrid withoutConfigTable=true id="ProduceTaskActive_dg1496209262749" viewType="${viewType}" renderOverEvent="dg1496209262749RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTask_batchTaskEdit_form" noPermissionKeys="orderProcessId.name,name,activeType,activeId.batchSite,activeId.fromContainer,activeId.container,activeId.occurTurn,activeId.auto,exeSystem,activeId.longTime,productId.productCode,productId.productName,isReplace,isMixQuality,standardNum,minQuality,maxQuality,planNum,lossRate,remark" modelCode="WOM_7.5.0.0_produceTask_ProduceTaskActive" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1496209262749" dtPage="dgPage"  hidekeyPrefix="dg1496209262749" hidekey="['id','version','orderProcessId.id','orderProcessId.name','activeId.id','activeId.batchSite.id','activeId.id','activeId.fromContainer.id','activeId.id','activeId.container','activeId.id','activeId.occurTurn.id','activeId.id','activeId.auto','activeId.id','activeId.longTime','productId.id','productId.productCode','productId.id','productId.productName'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  noPadding=true isEdit=true tabViewIndex=1 pageInitMethod="dg1496209262749PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName dgTitle="${getText('WOM.dataGriddataGridName.radion1490443976015')}" activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
							<#assign orderProcessId_name_displayDefaultType=''>
								<#assign orderProcessId_name_defaultValue=''>
										<#assign orderProcessId_name_defaultValue=''>
																	<#if (orderProcessId_name_defaultValue!)?string=="currentUser">
								<#assign orderProcessId_name_defaultValue='${staffJson!}'>
							<#elseif (orderProcessId_name_defaultValue!)?string=="currentPost">
								<#assign orderProcessId_name_defaultValue='${postJson!}'>
							<#elseif (orderProcessId_name_defaultValue!)?string=="currentDepart">
								<#assign orderProcessId_name_defaultValue='${deptJson!}'>
							<#elseif (orderProcessId_name_defaultValue!)?string=="currentComp">
								<#assign orderProcessId_name_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="orderProcessId.name"        showFormat="SELECTCOMP" defaultValue="${(orderProcessId_name_defaultValue!)?string}" defaultDisplay="${(orderProcessId_name_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489720649125')}" width=100 showFormatFunc=""/>
							<#assign name_displayDefaultType=''>
								<#assign name_defaultValue=''>
										<#assign name_defaultValue=''>
										 
									<@datacolumn key="name"        showFormat="TEXT" defaultValue="${(name_defaultValue!)?string}" defaultDisplay="${(name_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1490683872072')}" width=100 showFormatFunc=""/>
							<#assign activeType_displayDefaultType=''>
								<#assign activeType_defaultValue=''>
										<#assign activeType_defaultValue=''>
										 									<@systemCodeColumn code="activeType" textalign="left" defaultValue="${(activeType_defaultValue!)?string}" key="activeType.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1489726359628')}" width=100  />
							<#assign activeId_batchSite_displayDefaultType=''>
								<#assign activeId_batchSite_defaultValue=''>
										<#assign activeId_batchSite_defaultValue=''>
																	<#if (activeId_batchSite_defaultValue!)?string=="currentUser">
								<#assign activeId_batchSite_defaultValue='${staffJson!}'>
							<#elseif (activeId_batchSite_defaultValue!)?string=="currentPost">
								<#assign activeId_batchSite_defaultValue='${postJson!}'>
							<#elseif (activeId_batchSite_defaultValue!)?string=="currentDepart">
								<#assign activeId_batchSite_defaultValue='${deptJson!}'>
							<#elseif (activeId_batchSite_defaultValue!)?string=="currentComp">
								<#assign activeId_batchSite_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="batchSite" textalign="left" defaultValue="${(activeId_batchSite_defaultValue!)?string}" key="activeId.batchSite.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon148733082974922')}" width=100  />
							<#assign activeId_fromContainer_displayDefaultType=''>
								<#assign activeId_fromContainer_defaultValue=''>
										<#assign activeId_fromContainer_defaultValue=''>
																	<#if (activeId_fromContainer_defaultValue!)?string=="currentUser">
								<#assign activeId_fromContainer_defaultValue='${staffJson!}'>
							<#elseif (activeId_fromContainer_defaultValue!)?string=="currentPost">
								<#assign activeId_fromContainer_defaultValue='${postJson!}'>
							<#elseif (activeId_fromContainer_defaultValue!)?string=="currentDepart">
								<#assign activeId_fromContainer_defaultValue='${deptJson!}'>
							<#elseif (activeId_fromContainer_defaultValue!)?string=="currentComp">
								<#assign activeId_fromContainer_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="fromContainer" textalign="center" defaultValue="${(activeId_fromContainer_defaultValue!)?string}" key="activeId.fromContainer.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1488697524885')}" width=100  />
							<#assign activeId_container_displayDefaultType=''>
								<#assign activeId_container_defaultValue=''>
										<#assign activeId_container_defaultValue=''>
																	<#if (activeId_container_defaultValue!)?string=="currentUser">
								<#assign activeId_container_defaultValue='${staffJson!}'>
							<#elseif (activeId_container_defaultValue!)?string=="currentPost">
								<#assign activeId_container_defaultValue='${postJson!}'>
							<#elseif (activeId_container_defaultValue!)?string=="currentDepart">
								<#assign activeId_container_defaultValue='${deptJson!}'>
							<#elseif (activeId_container_defaultValue!)?string=="currentComp">
								<#assign activeId_container_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="activeId.container"        showFormat="TEXT" defaultValue="${(activeId_container_defaultValue!)?string}" defaultDisplay="${(activeId_container_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="left"  viewUrl="/RM/formula/formulaProcessActive/activeRef.action" viewCode="RM_7.5.0.0_formula_activeRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1489564694469')}"  label="${getText('RM.propertydisplayName.randon1488696547250')}" width=100 showFormatFunc=""/>
							<#assign activeId_occurTurn_displayDefaultType=''>
								<#assign activeId_occurTurn_defaultValue=''>
										<#assign activeId_occurTurn_defaultValue=''>
																	<#if (activeId_occurTurn_defaultValue!)?string=="currentUser">
								<#assign activeId_occurTurn_defaultValue='${staffJson!}'>
							<#elseif (activeId_occurTurn_defaultValue!)?string=="currentPost">
								<#assign activeId_occurTurn_defaultValue='${postJson!}'>
							<#elseif (activeId_occurTurn_defaultValue!)?string=="currentDepart">
								<#assign activeId_occurTurn_defaultValue='${deptJson!}'>
							<#elseif (activeId_occurTurn_defaultValue!)?string=="currentComp">
								<#assign activeId_occurTurn_defaultValue='${compJson!}'>
							</#if>
									<@systemCodeColumn code="occurTurn" textalign="center" defaultValue="${(activeId_occurTurn_defaultValue!)?string}" key="activeId.occurTurn.id" editable=false type="selectcomp" notnull=false     label="${getText('RM.propertydisplayName.randon1487330199423')}" width=100  />
							<#assign activeId_auto_displayDefaultType=''>
								<#assign activeId_auto_defaultValue=''>
										<#assign activeId_auto_defaultValue=''>
																	<#if (activeId_auto_defaultValue!)?string=="currentUser">
								<#assign activeId_auto_defaultValue='${staffJson!}'>
							<#elseif (activeId_auto_defaultValue!)?string=="currentPost">
								<#assign activeId_auto_defaultValue='${postJson!}'>
							<#elseif (activeId_auto_defaultValue!)?string=="currentDepart">
								<#assign activeId_auto_defaultValue='${deptJson!}'>
							<#elseif (activeId_auto_defaultValue!)?string=="currentComp">
								<#assign activeId_auto_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="activeId.auto"        showFormat="CHECKBOX" defaultValue="${(activeId_auto_defaultValue!)?string}" defaultDisplay="${(activeId_auto_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="center"  viewUrl="/RM/formula/formulaProcessActive/activeRef.action" viewCode="RM_7.5.0.0_formula_activeRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1489564694469')}"  label="${getText('WOM.propertydisplayName.randon1487331130107')}" width=100 showFormatFunc=""/>
							<#assign exeSystem_displayDefaultType=''>
								<#assign exeSystem_defaultValue=''>
										<#assign exeSystem_defaultValue=''>
										 									<@systemCodeColumn code="RMsystem" textalign="left" defaultValue="${(exeSystem_defaultValue!)?string}" key="exeSystem.id" editable=false type="selectcomp" notnull=false     label="${getText('WOM.propertydisplayName.randon1490923729119')}" width=80  />
							<#assign activeId_longTime_displayDefaultType=''>
								<#assign activeId_longTime_defaultValue=''>
										<#assign activeId_longTime_defaultValue=''>
																	<#if (activeId_longTime_defaultValue!)?string=="currentUser">
								<#assign activeId_longTime_defaultValue='${staffJson!}'>
							<#elseif (activeId_longTime_defaultValue!)?string=="currentPost">
								<#assign activeId_longTime_defaultValue='${postJson!}'>
							<#elseif (activeId_longTime_defaultValue!)?string=="currentDepart">
								<#assign activeId_longTime_defaultValue='${deptJson!}'>
							<#elseif (activeId_longTime_defaultValue!)?string=="currentComp">
								<#assign activeId_longTime_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="activeId.longTime"        showFormat="TEXT" defaultValue="${(activeId_longTime_defaultValue!)?string}" defaultDisplay="${(activeId_longTime_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="right"  viewUrl="/RM/formula/formulaProcessActive/activeRef.action" viewCode="RM_7.5.0.0_formula_activeRef" mneenable=false crossCompany=false viewTitle="${getText('RM.viewtitle.randon1489564694469')}"  label="${getText('RM.propertydisplayName.randon1487330334270')}" width=100 showFormatFunc=""/>
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

									<@datacolumn key="productId.productCode"        showFormat="SELECTCOMP" defaultValue="${(productId_productCode_defaultValue!)?string}" defaultDisplay="${(productId_productCode_displayDefaultType!)?string}" decimal="" editable=false type="selectcomp" showType="selectcomp" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772644833222')}" width=100 showFormatFunc=""/>
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

									<@datacolumn key="productId.productName"        showFormat="TEXT" defaultValue="${(productId_productName_defaultValue!)?string}" defaultDisplay="${(productId_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTask.batchTaskEdit"  textalign="left"  viewUrl="/MESBasic/product/product/productRefNew.action" viewCode="MESBasic_1_product_productRefNew" mneenable=false crossCompany=false viewTitle="${getText('MESBasic.viewtitle.randon1475137145215')}"  label="${getText('WOM.propertydisplayName.radion1415772740737334')}" width=100 showFormatFunc=""/>
							<#assign isReplace_displayDefaultType=''>
								<#assign isReplace_defaultValue=''>
										<#assign isReplace_defaultValue=''>
										 
									<@datacolumn key="isReplace"        showFormat="CHECKBOX" defaultValue="${(isReplace_defaultValue!)?string}" defaultDisplay="${(isReplace_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489726453862')}" width=100 showFormatFunc=""/>
							<#assign isMixQuality_displayDefaultType=''>
								<#assign isMixQuality_defaultValue=''>
										<#assign isMixQuality_defaultValue=''>
										 
									<@datacolumn key="isMixQuality"        showFormat="CHECKBOX" defaultValue="${(isMixQuality_defaultValue!)?string}" defaultDisplay="${(isMixQuality_displayDefaultType!)?string}" decimal="" editable=false type="boolean" showType="checkbox" notnull=false     textalign="center"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729935738')}" width=100 showFormatFunc=""/>
							<#assign standardNum_displayDefaultType=''>
								<#assign standardNum_defaultValue=''>
										<#assign standardNum_defaultValue=''>
										 
									<@datacolumn key="standardNum"        showFormat="TEXT" defaultValue="${(standardNum_defaultValue!)?string}" defaultDisplay="${(standardNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730105405')}" width=100 showFormatFunc=""/>
							<#assign minQuality_displayDefaultType=''>
								<#assign minQuality_defaultValue=''>
										<#assign minQuality_defaultValue=''>
										 
									<@datacolumn key="minQuality"        showFormat="TEXT" defaultValue="${(minQuality_defaultValue!)?string}" defaultDisplay="${(minQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729953842')}" width=100 showFormatFunc=""/>
							<#assign maxQuality_displayDefaultType=''>
								<#assign maxQuality_defaultValue=''>
										<#assign maxQuality_defaultValue=''>
										 
									<@datacolumn key="maxQuality"        showFormat="TEXT" defaultValue="${(maxQuality_defaultValue!)?string}" defaultDisplay="${(maxQuality_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489729974625')}" width=100 showFormatFunc=""/>
							<#assign planNum_displayDefaultType=''>
								<#assign planNum_defaultValue=''>
										<#assign planNum_defaultValue=''>
										 
									<@datacolumn key="planNum"        showFormat="TEXT" defaultValue="${(planNum_defaultValue!)?string}" defaultDisplay="${(planNum_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730174515')}" width=100 showFormatFunc=""/>
							<#assign lossRate_displayDefaultType=''>
								<#assign lossRate_defaultValue=''>
										<#assign lossRate_defaultValue=''>
										 
									<@datacolumn key="lossRate"        showFormat="TEXT" defaultValue="${(lossRate_defaultValue!)?string}" defaultDisplay="${(lossRate_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730189645')}" width=100 showFormatFunc=""/>
							<#assign remark_displayDefaultType=''>
								<#assign remark_defaultValue=''>
										<#assign remark_defaultValue=''>
										 
									<@datacolumn key="remark"        showFormat="TEXT" defaultValue="${(remark_defaultValue!)?string}" defaultDisplay="${(remark_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false     textalign="left"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1489730249805')}" width=100 showFormatFunc=""/>
			
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
				function ProduceTaskActive_dg1496209262749_check_datagridvalid(){
					//
					var errorObj =ProduceTaskActive_dg1496209262749Widget._DT.testData();
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
				
				function savedg1496209262749DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProduceTaskActive_dg1496209262749Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProduceTaskActive_dg1496209262749Widget') > -1) {
						ProduceTaskActive_dg1496209262749Widget.setAllRowEdited();
					}
					var json = ProduceTaskActive_dg1496209262749Widget.parseEditedData();
					$('input[name="dg1496209262749ListJson"]').remove();
					$('input[name="dgLists[\'dg1496209262749\']"]').remove();
					$('input[name="dg1496209262749ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1496209262749\']">').val(json).appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					$('<input type="hidden" name="dg1496209262749ModelCode">').val('WOM_7.5.0.0_produceTask_ProduceTaskActive').appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1496209262749ListJson">').val(json).appendTo($('#WOM_produceTask_produceTask_batchTaskEdit_form'));
				}
				function DT_ProduceTaskActive_dg1496209262749_deldatagrid(){
					var deleteRows = ProduceTaskActive_dg1496209262749Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id','headID.id','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496209262749DeletedIds").length>0){
							$("#dg1496209262749DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496209262749DeletedIds" name="dgDeletedIds[\'dg1496209262749\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496209262749DeletedIds['+CUI('input[name^="dg1496209262749DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					});
				}
				function DT_ProduceTaskActive_dg1496209262749_delTreeNodes(){
					var deleteRows = ProduceTaskActive_dg1496209262749Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','processId.id','activeId.id','headID.id','formulaId.id','productId.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1496209262749DeletedIds").length>0){
							$("#dg1496209262749DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1496209262749DeletedIds" name="dgDeletedIds[\'dg1496209262749\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1496209262749DeletedIds['+CUI('input[name^="dg1496209262749DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTask_batchTaskEdit_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<2;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[1].length>0) {
						for(var i=0;i<datagrids[1].length;i++) {
							if(datagrids[1][i] == 'ProduceTaskActive_dg1496209262749') {
								break;
							}
							if(i==datagrids[1].length-1) {
								datagrids[1][datagrids[1].length] = 'ProduceTaskActive_dg1496209262749';
							}
						}
					} else {
						datagrids[1][datagrids[1].length] = 'ProduceTaskActive_dg1496209262749';
					}
					$('body').data('WOM_produceTask_produceTask_batchTaskEdit_datagrids', datagrids);
				});
				
				var ProduceTaskActive_dg1496209262749_importDialog = null;
				function ProduceTaskActive_dg1496209262749_showImportDialog(){
					try{
						if(ProduceTaskActive_dg1496209262749_importDialog!=null&&ProduceTaskActive_dg1496209262749_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTask/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262749&tid=${id!}&datagridName=dg1496209262749";
						ProduceTaskActive_dg1496209262749_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProduceTaskActive_dg1496209262749"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskActive_dg1496209262749_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProduceTaskActive_dg1496209262749_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProduceTaskActive_dg1496209262749_importDialog.show();
					}catch(e){}
				}	
				
				function ProduceTaskActive_dg1496209262749_downLoadFile(){
					var url = "/WOM/produceTask/produceTask/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262749&templateRelatedModelCode=WOM_7.5.0.0_produceTask_batchTaskEditdg1496209262749&downloadType=template&fileName=dg1496209262749";
					window.open(url,"","");
				}
				function dg1496209262749RenderOverEvent(){
				}
				function dg1496209262749PageInitMethod(nTabIndex){
					WOM.produceTask.produceTask.batchTaskEdit.initSize(nTabIndex);
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
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==2>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										<#elseif t.selectPeople==3>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==4>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true&sourceStaff=${(pending.sourceStaff)!''}" sourceStaff="${(pending.sourceStaff)!''}" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${t.selectPeople}" outcome="${t.name}"/>
										<#elseif t.selectPeople==5>
											<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids=defaultSelectIds names=defaultSelectNames  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" selectPeople="${t.selectPeople}" outcome="${t.name}"/>
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
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#elseif t.selectPeople==2>
										<#if t.userRangeFalg?? && t.userRangeFalg==1>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="userRange" url="/foundation/user/common/userListFramesetRange.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}"/>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
										</#if>
										<#else>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.assignStaff')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('assignStaffSelect_${t.name}')"  name="assignStaffSelect_${t.name}" id="assignStaffSelect_${t.name}" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getassignStaffSelect_${t.name}MultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
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
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==2>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isCrossCompany=true isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="User" url="/foundation/user/common/userListFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="crossCompanyFlag=true&unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true />
									<#elseif pending.loop==3>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==4>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/userListGroupFrameset.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true selectPeople="${pending.loop}"/>
									<#elseif pending.loop==5>
										<@mneclient reftitle="${getText('ec.edit.refStaff')}" mneTip="${getText('ec.edit.countersign')}" isWrap=true multiDivStyle="height:25px;overflow:hidden;" conditionfunc="WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc('countersignUsers')"  name="countersignUsers" id="countersignUsers" type="userRange" url="/foundation/user/common/groupUserList.action" displayFieldName="staffname"  ids="" names=""  onkeyupfuncname="getcountersignUsersMultiInfo()" funcparam="unassignUserSupport=true&multiSelect=true" clicked=true multiple=true mnewidth=260 isEdit=true deploymentId="${deploymentId!''}" outcome="${pending.activityName}" selectPeople="${pending.loop}"/>
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
							<a class="cui-btn-blue" onclick="WOM.produceTask.produceTask.batchTaskEdit.save()"><span class='btn_r'>${getText('ec.flow.save')}</span></a>
							<a class="cui-btn-green" onclick="WOM.produceTask.produceTask.batchTaskEdit.submit()"><span class='btn_r'>${getText('ec.flow.submit')}</span></a>
						
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
     	
		<div id="WOM_produceTask_produceTask_batchTaskEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<#if !(superEdit!false)>
				<li id="flowHead" onclick="WOM.produceTask.produceTask.batchTaskEdit.showFlowInfo('flow')"><span class="icon_prograss"></span>${getText("ec.flow.flowImage")}</li>
				</#if>
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.produceTask.produceTask.batchTaskEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
				<li id="dealInfoHead" class="bar" onclick="WOM.produceTask.produceTask.batchTaskEdit.showDealInfo('dealInfo')"><span class="icon_handle"></span>${getText("ec.view.dealadvice")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<#if !(superEdit!false)>
				<div class="flow-height wid" id="flowDiv"></div>
				</#if>
				<div id="fileUploadDiv" class="wid-hei"></div>
				<div style="padding:1px 0px 0px 0px;" id="dealInfoDiv" class="wid-hei"></div>
			</div>
		</div>
		
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_batchTaskEdit,html,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) -->
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
						$("#WOM_produceTask_produceTask_batchTaskEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_produceTask_produceTask_batchTaskEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_produceTask_produceTask_batchTaskEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_produceTask_produceTask_batchTaskEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.produceTask.produceTask.batchTaskEdit.initCount = 0;
			WOM.produceTask.produceTask.batchTaskEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_produceTask_produceTask_batchTaskEdit_main_div .edit-head").height()-$("#WOM_produceTask_produceTask_batchTaskEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_produceTask_produceTask_batchTaskEdit_main_div .edit-workflow").height()</#if>;
				$("#WOM_produceTask_produceTask_batchTaskEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_produceTask_produceTask_batchTaskEdit_datagrids');
				var padding_bottom=16;
				$("#WOM_produceTask_produceTask_batchTaskEdit_main_div .pd_bottom,#WOM_produceTask_produceTask_batchTaskEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_produceTask_produceTask_batchTaskEdit_main_div .edit-panes-s").each(function(index){
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
									if(WOM.produceTask.produceTask.batchTaskEdit.initCount <= 2) {
										setTimeout(function(){WOM.produceTask.produceTask.batchTaskEdit.initSize();}, 200);
										WOM.produceTask.produceTask.batchTaskEdit.initCount++;
									}/* else {
										WOM.produceTask.produceTask.batchTaskEdit.initCount = 0;
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
							if(($("#WOM_produceTask_produceTask_batchTaskEdit_main_div .edit-workflow").length > 0) && ($("#WOM_produceTask_produceTask_batchTaskEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				WOM.produceTask.produceTask.batchTaskEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.produceTask.produceTask.batchTaskEdit.initSize();
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
						if(parseInt($("#WOM_produceTask_produceTask_batchTaskEdit_main_div").css("width"),10)==650){
							$("#WOM_produceTask_produceTask_batchTaskEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.produceTask.produceTask.batchTaskEdit.resizeLayout();
						//WOM.produceTask.produceTask.batchTaskEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_produceTask_produceTask_batchTaskEdit_main_div").css("width"),10)==800){
							$("#WOM_produceTask_produceTask_batchTaskEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.produceTask.produceTask.batchTaskEdit.resizeLayout();
						//WOM.produceTask.produceTask.batchTaskEdit.initSize();
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
					WOM.produceTask.produceTask.batchTaskEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.produceTask.produceTask.batchTaskEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.produceTask.produceTask.batchTaskEdit.initSize();});
				/*
				WOM.produceTask.produceTask.batchTaskEdit.resizeLayout=function(){
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
			WOM.produceTask.produceTask.batchTaskEdit.setDepartment();
			<#else>
			CUI("#dealInfoContain").load("/ec/workflow/dealInfo.action?dlTableInfoId=${produceTask.tableInfoId!}&dealInfoGroup=byTime&preName=mainFrame&dealDataUrl=/WOM/produceTask/produceTask/dealInfo-list.action&enableSimpleDealInfo=false");
			</#if>
		});

		WOM.produceTask.produceTask.batchTaskEdit.validate = function(){
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
		WOM.produceTask.produceTask.batchTaskEdit.beforeSaveProcess = function(){
			try{eval("savedg1496209262749DataGrid()");}catch(e){}
			try{eval("savedg1496209262808DataGrid()");}catch(e){}
			try{eval("savedg1496209382613DataGrid()");}catch(e){}
			try{eval("savedg1496209262624DataGrid()");}catch(e){}

			var extraCol = '<extra-data>';
			$('#WOM_produceTask_produceTask_batchTaskEdit_form').trigger('beforeSubmit');
			//produceTask.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="produceTask.extraCol"]').val(extraCol);
		}
		WOM.produceTask.produceTask.batchTaskEdit.processDataGrid = function(){
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_batchTaskEdit_form').append(ProduceTaskActive_dg1496209262624Widget._DT.createInputs('dg1496209262624List'));
										</#if>
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_batchTaskEdit_form').append(ProduceMaterialSum_dg1496209382613Widget._DT.createInputs('dg1496209382613List'));
										</#if>
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_batchTaskEdit_form').append(ProduceTaskProcess_dg1496209262808Widget._DT.createInputs('dg1496209262808List'));
										</#if>
										<#if false && isIE>
										$('#WOM_produceTask_produceTask_batchTaskEdit_form').append(ProduceTaskActive_dg1496209262749Widget._DT.createInputs('dg1496209262749List'));
										</#if>
		};
		WOM.produceTask.produceTask.batchTaskEdit.save = function(){
			<#if !(superEdit!false)>
			$('#operateType').val("save");
			<#else>
			$('#operateType').val("submit");
			</#if>
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.produceTask.produceTask.batchTaskEdit.validate()){return;}
			WOM.produceTask.produceTask.batchTaskEdit.beforeSaveProcess();

			//WOM.produceTask.produceTask.batchTaskEdit.processDataGrid();
			$('#WOM_produceTask_produceTask_batchTaskEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_produceTask_produceTask_batchTaskEdit_form','WOM_produceTask_produceTask_batchTaskEdit_datagrids')) {      
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
		WOM.produceTask.produceTask.batchTaskEdit.print = function(){
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
		
		WOM.produceTask.produceTask.batchTaskEdit.saveSetting = function(){
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
		
		WOM.produceTask.produceTask.batchTaskEdit.printSetting = function(){
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
				WOM.produceTask.produceTask.batchTaskEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.produceTask.produceTask.batchTaskEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.produceTask.produceTask.batchTaskEdit.settingDialog.show();
			}
		}
		
		
		WOM.produceTask.produceTask.batchTaskEdit.submit = function(uncheck){
			$('#operateType').val("submit");
			if(uncheck){}
			else
			if(!($('#__workflow_outcome_countersign').prop("checked")||$('input[name="workFlowVar.outcome"]:checked').val())){
				workbenchErrorBarWidget.showMessage("${getText('ec.flow.outcome.select')}");
				return;
			}
			if(!WOM.produceTask.produceTask.batchTaskEdit.validate()){return;}
			
			//$('#__workflow_outcomeDes').val($('input[name="workFlowVar.outcome"]:checked').attr('des'));
			
			WOM.produceTask.produceTask.batchTaskEdit.beforeSaveProcess();
			
			//WOM.produceTask.produceTask.batchTaskEdit.processDataGrid();
			
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
			$('#WOM_produceTask_produceTask_batchTaskEdit_form').submit();
			//$(".wfcancel").remove();
			
		}
		WOM.produceTask.produceTask.batchTaskEdit.recall = function(){
			CUI.Dialog.confirm("${getText('ec.recall.checkrecall')}", function(){
					$.ajax({
					url : "/WOM/produceTask/produceTask/common/recall.action",
					type : 'post',
					async : false,
					data:{"tableInfoId": "${(produceTask.tableInfoId)?default('')}"},
					success : function(msg) {
						if(msg && msg.success){
							workbenchErrorBarWidget.showMessage("${getText('ec.recall.success')}", 's');
		 					var url = "/foundation/user/open-pending.action?pendingId=" + msg.data.id + "&tableInfoId=${(produceTask.tableInfoId)?default('')}&id=${(produceTask.id)?default('')}&entityCode=WOM_7.5.0.0_produceTask";

			 				try{
								window.opener.refreshPortal('workflow');
								window.opener.timeData();
							}catch(e){
								try{
			 						window.opener.WOM.produceTask.produceTask.editCallBackInfo(res); 						
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
		WOM.produceTask.produceTask.batchTaskEdit._callBackInfo = function(res){
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
 						window.opener.WOM.produceTask.produceTask.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.location.reload();
						}catch(e3){}
					}
				};
				<#if !(superEdit!false)>
 				if(res.operateType == 'save'){
 					var url = "/foundation/user/open-pending.action?pendingId=" + res.pendingId + "&tableInfoId=" + res.tableInfoId + "&id=" + res.id + "&entityCode=WOM_7.5.0.0_produceTask";
 					setTimeout(function(){
						document.location.href=url;
 					}, 1000);
					return;
 				}
 				</#if>

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.produceTask.produceTask.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		<#if editNew>
		WOM.produceTask.produceTask.batchTaskEdit.setDepartment = function(){
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
				WOM.produceTask.produceTask.batchTaskEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.produceTask.produceTask.batchTaskEdit._refViewCode_IE = viewCode;
			} else {
				WOM.produceTask.produceTask.batchTaskEdit._refViewCode_IE = '';
			}
			WOM.produceTask.produceTask.batchTaskEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.produceTask.produceTask.batchTaskEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.produceTask.produceTask.batchTaskEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.produceTask.produceTask.batchTaskEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.produceTask.produceTask.batchTaskEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.produceTask.produceTask.batchTaskEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				WOM.produceTask.produceTask.batchTaskEdit.gridEventObj = gridEventObj;
				callbackName = "WOM.produceTask.produceTask.batchTaskEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.produceTask.produceTask.batchTaskEdit.getMultiselectCallBackInfo_DG" : "WOM.produceTask.produceTask.batchTaskEdit.getcallBackInfo_DG";
				WOM.produceTask.produceTask.batchTaskEdit._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.produceTask.produceTask.batchTaskEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.produceTask.produceTask.batchTaskEdit._prefix = _prefix.substring(1);
			}
			
			WOM.produceTask.produceTask.batchTaskEdit._oGrid = oGrid;
			WOM.produceTask.produceTask.batchTaskEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.produceTask.produceTask.batchTaskEdit._refViewCode = oColumn.viewCode;
				} else {
					WOM.produceTask.produceTask.batchTaskEdit._refViewCode = '';
				}
			} else {
				WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp = false;
				WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames = '';
				WOM.produceTask.produceTask.batchTaskEdit._refViewCode = '';
			}
			if (WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp == true && WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.produceTask.produceTask.batchTaskEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.produceTask.produceTask.batchTaskEdit._customCallBack = customCallBack;
			}
			if(WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.produceTask.produceTask.batchTaskEdit._querycustomFuncN == "function") {
				refparam += WOM.produceTask.produceTask.batchTaskEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.produceTask.produceTask.batchTaskEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.batchTaskEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.produceTask.produceTask.batchTaskEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.produceTask.produceTask.batchTaskEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.produceTask.produceTask.batchTaskEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.produceTask.produceTask.batchTaskEdit.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.produceTask.batchTaskEdit.query_'+obj+'()') : null;
			return str;
		};
		WOM.produceTask.produceTask.batchTaskEdit.getcallBackGroupInfo = function(obj){
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
			WOM.produceTask.produceTask.batchTaskEdit._dialog.close();
		}
		WOM.produceTask.produceTask.batchTaskEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_produceTask_produceTask_batchTaskEdit_form',obj[0], WOM.produceTask.produceTask.batchTaskEdit._prefix, WOM.produceTask.produceTask.batchTaskEdit._sUrl);
			CUI.commonFills('WOM_produceTask_produceTask_batchTaskEdit_form',WOM.produceTask.produceTask.batchTaskEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.produceTask.produceTask.batchTaskEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.produceTask.produceTask.batchTaskEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.batchTaskEdit._customCallBack);
					WOM.produceTask.produceTask.batchTaskEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.batchTaskEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.produceTask.produceTask.batchTaskEdit.getcallBackInfo_DG_IE = function(obj){
			if(WOM.produceTask.produceTask.batchTaskEdit._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.batchTaskEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.produceTask.produceTask.batchTaskEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp_IE == true && WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.batchTaskEdit._sUrl,WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTask.batchTaskEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp_IE == true && WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.produceTask.produceTask.batchTaskEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.produceTask.produceTask.batchTaskEdit._refViewCode_IE + '&id=' + id,
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
				if(WOM.produceTask.produceTask.batchTaskEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.batchTaskEdit._customCallBack);
					WOM.produceTask.produceTask.batchTaskEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.batchTaskEdit._dialog.close();
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
		
		WOM.produceTask.produceTask.batchTaskEdit.getcallBackInfo_DG = function(obj){
			if(WOM.produceTask.produceTask.batchTaskEdit._customBeforeCallBack) {
				var flag = eval(WOM.produceTask.produceTask.batchTaskEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.produceTask.produceTask.batchTaskEdit._currRow).next().length==0){
						WOM.produceTask.produceTask.batchTaskEdit._oGrid.addNewRow();
					}	
					WOM.produceTask.produceTask.batchTaskEdit._currRow = $(WOM.produceTask.produceTask.batchTaskEdit._currRow).next();
					$(WOM.produceTask.produceTask.batchTaskEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.produceTask.produceTask.batchTaskEdit._currRow,obj[i], WOM.produceTask.produceTask.batchTaskEdit._prefix, WOM.produceTask.produceTask.batchTaskEdit._sUrl);
				if (WOM.produceTask.produceTask.batchTaskEdit._isObjCustomProp == true && WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.produceTask.produceTask.batchTaskEdit._currRow,WOM.produceTask.produceTask.batchTaskEdit._prefix,obj[i],WOM.produceTask.produceTask.batchTaskEdit._oGrid,WOM.produceTask.produceTask.batchTaskEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.produceTask.produceTask.batchTaskEdit._currRow,WOM.produceTask.produceTask.batchTaskEdit._prefix,obj[i],WOM.produceTask.produceTask.batchTaskEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.produceTask.produceTask.batchTaskEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.produceTask.produceTask.batchTaskEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.produceTask.produceTask.batchTaskEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.produceTask.produceTask.batchTaskEdit._refViewCode + '&id=' + id,
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
									name = WOM.produceTask.produceTask.batchTaskEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.produceTask.produceTask.batchTaskEdit._currRow, objs, WOM.produceTask.produceTask.batchTaskEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.produceTask.produceTask.batchTaskEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.batchTaskEdit._customCallBack);
					WOM.produceTask.produceTask.batchTaskEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.batchTaskEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.produceTask.produceTask.batchTaskEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.produceTask.produceTask.batchTaskEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.produceTask.produceTask.batchTaskEdit._oGrid, WOM.produceTask.produceTask.batchTaskEdit._currRow, WOM.produceTask.produceTask.batchTaskEdit._key, WOM.produceTask.produceTask.batchTaskEdit._displayFieldName, obj[i])
			}
			try{
				if(WOM.produceTask.produceTask.batchTaskEdit._customCallBack) {
					eval(WOM.produceTask.produceTask.batchTaskEdit._customCallBack);
					WOM.produceTask.produceTask.batchTaskEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.produceTask.produceTask.batchTaskEdit._dialog.close();
			} catch(e){}
		};
		
		WOM.produceTask.produceTask.batchTaskEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.produceTask.produceTask.batchTaskEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_produceTask_produceTask_batchTaskEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.produceTask.produceTask.batchTaskEdit.onloadForProduct();
			
		});

		WOM.produceTask.produceTask.batchTaskEdit.beforeSubmitMethodSettingInPage = function(){
			WOM.produceTask.produceTask.batchTaskEdit.onsaveForProduct();
		};
		WOM.produceTask.produceTask.batchTaskEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.produceTask.produceTask.batchTaskEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.produceTask.produceTask.batchTaskEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_produceTask_produceTask_batchTaskEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_produceTask_produceTask_batchTaskEdit_main_div").hide();
				},100);
				//CUI("#WOM_produceTask_produceTask_batchTaskEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.produceTask.produceTask.batchTaskEdit.showThis = function(){
			if(!CUI("#WOM_produceTask_produceTask_batchTaskEdit_main_div").is(':visible')) {
				CUI("#WOM_produceTask_produceTask_batchTaskEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.produceTask.produceTask.batchTaskEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.produceTask.produceTask.batchTaskEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_produceTask_produceTask_batchTaskEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_produceTask_ProduceTask&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.batchTaskEdit.auditDialog.show();
			</#if>
		}
		
		
		WOM.produceTask.produceTask.batchTaskEdit.showInfoDialog=function(mode){
			
			WOM.produceTask.produceTask.batchTaskEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_produceTask_produceTask_batchTaskEdit_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.produceTask.produceTask.batchTaskEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.produceTask.produceTask.batchTaskEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_produceTask");
			}
		}
		
		WOM.produceTask.produceTask.batchTaskEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/produceTask/produceTask/dealInfo-list.action&dlTableInfoId=${(produceTask.tableInfoId)?default('')}");
			}
		}
		WOM.produceTask.produceTask.batchTaskEdit.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_produceTask_ProduceTask&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(produceTask.tableInfoId)?default('')}");
			}
		}
		WOM.produceTask.produceTask.batchTaskEdit.supervision=function(){
			WOM.produceTask.produceTask.batchTaskEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(produceTask.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.produceTask.produceTask.batchTaskEdit.modifyOwnerStaffDialog.show();
		}
		










		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_batchTaskEdit,js,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */

		WOM.produceTask.produceTask.batchTaskEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_batchTaskEdit,onloadForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.produceTask.produceTask.batchTaskEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_batchTaskEdit,onsaveForProduct,WOM_7.5.0.0_produceTask_ProduceTask,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.produceTask.produceTask.batchTaskEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.produceTask.produceTask.batchTaskEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(produceTask.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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